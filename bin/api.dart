import 'dart:io';

import 'package:dio/dio.dart';

import 'models/repo.dart';
import 'models/user.dart';

/// Unified GitHub API interaction class built on Dio
class Api {
  static final Map<String, String> headers = {
    HttpHeaders.accessControlAllowCredentialsHeader: 'true',
    HttpHeaders.accessControlAllowHeadersHeader:
        'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token',
    HttpHeaders.accessControlAllowMethodsHeader:
        'GET, POST, OPTIONS, PUT, PATCH, DELETE',
    HttpHeaders.accessControlAllowOriginHeader: '*',
  };

  /// Fetch user directly from GitHub
  static Future<User> fetchUser(String username) async {
    var response = await Dio().get('${Endpoints.users}/$username');
    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    } else {
      throw Exception(
          'Response code ${response.statusCode} with message ${response.statusMessage}');
    }
  }

  static Future<Repo> fetchRepo(String username, String repoName) async {
    var response = await Dio().get('${Endpoints.repos}/$username/$repoName');
    if (response.statusCode == 200) {
      print(response.data);
      return Repo.fromJson(response.data);
    } else {
      throw Exception(
          'Response code ${response.statusCode} with message ${response.statusMessage}');
    }
  }
}

/// Static class providing endpoints for REST requests
class Endpoints {
  /// Base url for github api, postpend relevant request
  static final String githubBase = 'https://api.github.com';

  /// Base for all users, postpend {user} for specific user
  static final String users = githubBase + '/users';

  /// Base for repos, postpend {user}/{repo} for specific repo
  static final String repos = githubBase + '/repos';

  static String contributorsUrl(String owner, String repo) =>
      '$repos/$owner/$repo/contributors';
}
