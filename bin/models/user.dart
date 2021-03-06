
import '../api.dart';

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
  late int? publicRepos;
  late int? publicGists;
  late int? followers;
  late int? following;
  late String? createdAt;
  late String? updatedAt;

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
      this.publicRepos,
      this.publicGists,
      this.followers,
      this.following,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['recieved_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
    name = json['name'];
    company = json['company'];
    blog = json['blog'];
    location = json['location'];
    email = json['email'];
    hireable = json['hireable'];
    bio = json['bio'];
    twitterUsername = json['twitter_username'];
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
    return await Api.fetchUser(username);
  }
}
