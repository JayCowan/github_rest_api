import 'package:flutter/widgets.dart';

import 'repo.dart';

class User {
  String login;
  String? name;
  String? location;
  String? bio;
  String? githubUrl;
  String? twitterHandle;
  NetworkImage avatar;
  List<Repo> repos = <Repo>[];

  User({required this.login, required this.avatar});

  User.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        name = json['name'],
        bio = json['bio'],
        githubUrl = json['html_url'],
        twitterHandle = json['twitter_username'],
        location = json['location'],
        avatar = NetworkImage(json['avatar_url']);
}
