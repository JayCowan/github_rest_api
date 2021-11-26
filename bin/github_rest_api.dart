// Copyright (c) 2021, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

// Note: avoid importing dio without specifying in show to avoid conflicting
// class names with dart:io
import 'package:dio/dio.dart' show DioError;
import 'package:dotenv/dotenv.dart' show load, clean, isEveryDefined, env;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:shelf_static/shelf_static.dart' as shelf_static;

import 'api.dart';
import 'models/user.dart';

Future main() async {
  load();
  // If the "PORT" environment variable is set, listen to it. Otherwise, 8080.
  // https://cloud.google.com/run/docs/reference/container-contract#port
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  // See https://pub.dev/documentation/shelf/latest/shelf/Cascade-class.html
  final cascade = Cascade()
      // First, serve files from the 'public' directory
      .add(_staticHandler)
      // If a corresponding file is not found, send requests to a `Router`
      .add(_router);

  // See https://pub.dev/documentation/shelf/latest/shelf_io/serve.html
  final server = await shelf_io.serve(
    // See https://pub.dev/documentation/shelf/latest/shelf/logRequests.html
    logRequests()
        // See https://pub.dev/documentation/shelf/latest/shelf/MiddlewareExtensions/addHandler.html
        .addHandler(cascade.handler),
    InternetAddress.anyIPv4, // Allows external connections
    port,
  );

  print('Serving at http://${server.address.host}:${server.port}');
}

// Serve files from the file system.
final _staticHandler = shelf_static.createStaticHandler('build/web',
    defaultDocument: 'index.html');

// Router instance to handler requests.
final _router = shelf_router.Router()
  ..get('/rank=<userList>', _rankHandler)
  ..get('/user/<username>', _userHandler)
  ..get('/repo/<owner>/<repoName>', _repoHandler);

Future<Response> _userHandler(request, String username) async {
  final githubResponse = await Api.fetchUser(username);
  var headers = {'content-type': 'application/json'};
  headers.addAll(Api.headers);
  return Response.ok(
    JsonEncoder.withIndent(' ').convert(githubResponse.toJson()),
    headers: headers,
  );
}

Future<Response> _repoHandler(request, String owner, String repoName) async {
  try {
    final githubResponse = await Api.fetchRepo(owner, repoName);
    var headers = {'content-type': 'application/json'};
    headers.addAll(Api.headers);
    return Response.ok(
      JsonEncoder.withIndent(' ').convert(githubResponse.toJson()),
      headers: headers,
    );
  } on DioError catch (e, s) {
    stderr.addError(e, s);
    return Response.internalServerError();
  }
}

Future<Response> _rankHandler(Request request, String userList) async {
  try {
    var users = userList.trim().split(',');
    List<User> ranks = <User>[];
    for (String user in users) {
      ranks.add(await User.fromUsername(user.trim()));
    }
    ranks.sort((User a, User b) {
      a.publicRepos = a.publicRepos is int ? a.publicRepos as int : 0;
      b.publicRepos = b.publicRepos is int ? b.publicRepos as int : 0;
      a.followers = a.followers is int ? a.followers as int : 0;
      b.followers = b.followers is int ? b.followers as int : 0;
      a.createdAt = a.createdAt is String
          ? a.createdAt as String
          : DateTime.now().toString();
      b.createdAt = b.createdAt is String
          ? b.createdAt as String
          : DateTime.now().toString();

      return -1 *
          (a.publicRepos! * (a.followers! + 1) +
                  (-5 *
                      DateTime.tryParse(a.createdAt!)!
                          .compareTo(DateTime.tryParse(b.createdAt!)!)))
              .compareTo(b.publicRepos! * (b.followers! + 1) +
                  (-5 *
                      DateTime.tryParse(b.createdAt!)!
                          .compareTo(DateTime.tryParse(a.createdAt!)!)));
    });
    print(jsonEncode(ranks));
    var headers = {'content-type': 'application/json'};
    headers.addAll(Api.headers);
    return Response.ok(
      jsonEncode(ranks),
      headers: headers,
    );
  } on DioError catch (e, s) {
    stderr.addError(e, s);
    return Response.internalServerError();
  }
}
