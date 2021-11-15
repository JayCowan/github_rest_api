import 'dart:io';

import 'package:dio/dio.dart';

/// Raw user data model pulled from GitHub /users/{user}
class User {
  late String login;
  late int id;
  late String nodeId;
  late String? avatarUrl;
  late String? gravatarId;
  late String url;
  late String? htmlUrl;
  late String? followersUrl;
  late String? followingUrl;
  late String? gistsUrl;
  late String? starredUrl;
  late String? subscriptionsUrl;
  late String? organizationsUrl;
  late String reposUrl;
  late String? eventsUrl;
  late String? receivedEventsUrl;
  late String type;
  late bool siteAdmin;
  late String? name;
  late String? company;
  late String? blog;
  late String? location;
  late String? email;
  late bool? hireable;
  late String? bio;
  late String? twitterUsername;
  late int publicRepos;
  late int publicGists;
  late int followers;
  late int following;
  late String createdAt;
  late String updatedAt;

  User(
      {required this.login,
      required this.id,
      required this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      required this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      required this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      required this.type,
      required this.siteAdmin,
      this.name,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.hireable,
      this.bio,
      this.twitterUsername,
      required this.publicRepos,
      required this.publicGists,
      required this.followers,
      required this.following,
      required this.createdAt,
      required this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    json['avatar_url'] == 'null' ? null : avatarUrl = json['avatar_url'];
    json['gravatar_id'] == 'null' ? null : gravatarId = json['gravatar_id'];
    url = json['url'];
    json['html_url'] == 'null' ? null : htmlUrl = json['html_url'];
    json['followers_url'] == 'null'
        ? null
        : followersUrl = json['followers_url'];
    json['following_url'] == 'null'
        ? null
        : followingUrl = json['following_url'];
    json['gists_url'] == 'null' ? null : gistsUrl = json['gists_url'];
    json['starred_url'] == 'null' ? null : starredUrl = json['starred_url'];
    json['subscriptions_url'] == 'null'
        ? null
        : subscriptionsUrl = json['subscriptions_url'];
    json['organizations_url'] == 'null'
        ? null
        : organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    json['events_url'] == 'null' ? null : eventsUrl = json['events_url'];
    json['received_events_url'] == 'null'
        ? null
        : receivedEventsUrl = json['recieved_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
    json['name'] == 'null' ? null : name = json['name'];
    json['company'] == 'null' ? null : company = json['company'];
    json['blog'] == 'null' ? null : blog = json['blog'];
    json['location'] == 'null' ? null : location = json['location'];
    json['email'] == 'null' ? null : email = json['email'];
    // assume that null == false
    json['hireable'] == 'null' ? false : hireable = json['hireable'];
    json['bio'] == 'null' ? null : bio = json['bio'];
    json['twitter_username'] == 'null'
        ? null
        : twitterUsername = json['twitter_username'];
    publicRepos = json['public_repos'];
    publicGists = json['public_gists'];
    followers = json['followers'];
    following = json['following'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['avatar_url'] = avatarUrl;
    data['gravatar_id'] = gravatarId;
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['followers_url'] = followersUrl;
    data['following_url'] = followingUrl;
    data['gists_url'] = gistsUrl;
    data['starred_url'] = starredUrl;
    data['subscriptions_url'] = subscriptionsUrl;
    data['organizations_url'] = organizationsUrl;
    data['repos_url'] = reposUrl;
    data['events_url'] = eventsUrl;
    data['received_events_url'] = receivedEventsUrl;
    data['type'] = type;
    data['site_admin'] = siteAdmin;
    data['name'] = name;
    data['company'] = company;
    data['blog'] = blog;
    data['location'] = location;
    data['email'] = email;
    data['hireable'] = hireable;
    data['bio'] = bio;
    data['twitter_username'] = twitterUsername;
    data['public_repos'] = publicRepos;
    data['public_gists'] = publicGists;
    data['followers'] = followers;
    data['following'] = following;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  /// Pulls a username directly from github and returns the Future<User> of the 
  /// response
  static Future<User> fromUsername(String username) async {
    var response = await Dio().get('api.github.com/users/$username');
    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    } else {
      throw Exception(
        'Response code ${response.statusCode} with message ${response.statusMessage}');
    }
  }
}
