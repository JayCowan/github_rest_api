import 'package:flutter/widgets.dart';

class User {
  String login;
  NetworkImage avatar;

  User({required this.login, required this.avatar});

  User.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        avatar = NetworkImage(json['avatar_url']);
}
