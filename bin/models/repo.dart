import 'user.dart';

/// raw Repo response from /repos/{user}/{repo}

class Repo {
  late int id;
  late String nodeId;
  late String name;
  late String? fullName;
  late bool private;
  late User owner;
  late String? htmlUrl;
  late String? description;
  late bool fork;
  late String url;
  late String? forksUrl;
  late String? keysUrl;
  late String? collaboratorsUrl;
  late String? teamsUrl;
  late String? hooksUrl;
  late String? issueEventsUrl;
  late String? eventsUrl;
  late String? assigneesUrl;
  late String? branchesUrl;
  late String? tagsUrl;
  late String? blobsUrl;
  late String? gitTagsUrl;
  late String? gitRefsUrl;
  late String? treesUrl;
  late String? statusesUrl;
  late String languagesUrl;
  late String? stargazersUrl;
  late String contributorsUrl;
  late String? subscribersUrl;
  late String? subscriptionUrl;
  late String commitsUrl;
  late String gitCommitsUrl;
  late String? commentsUrl;
  late String? issueCommentUrl;
  late String? contentsUrl;
  late String? compareUrl;
  late String? mergesUrl;
  late String? archiveUrl;
  late String? downloadsUrl;
  late String? issuesUrl;
  late String? pullsUrl;
  late String? milestonesUrl;
  late String? notificationsUrl;
  late String? labelsUrl;
  late String? releasesUrl;
  late String? deploymentsUrl;
  late String createdAt;
  late String updatedAt;
  late String? pushedAt;
  late String gitUrl;
  late String? sshUrl;
  late String? cloneUrl;
  late String? svnUrl;
  late String? homepage;
  late int size;
  late int? stargazersCount;
  late int watchersCount;
  late String? language;
  late bool hasIssues;
  late bool hasProjects;
  late bool hasDownloads;
  late bool hasWiki;
  late bool hasPages;
  late int forksCount;
  late String? mirrorUrl;
  late bool archived;
  late bool disabled;
  late int openIssuesCount;
  late String? license;
  late bool allowForking;
  late bool isTemplate;
  late List<String>? topics;
  late String visibility;
  late int forks;
  late int openIssues;
  late int watchers;
  late String defaultBranch;
  late String? tempCloneToken;
  late int? networkCount;
  late int? subscribersCount;

  Repo(
      {required this.id,
      required this.nodeId,
      required this.name,
      this.fullName,
      required this.private,
      required this.owner,
      this.htmlUrl,
      this.description,
      required this.fork,
      required this.url,
      this.forksUrl,
      this.keysUrl,
      this.collaboratorsUrl,
      this.teamsUrl,
      this.hooksUrl,
      this.issueEventsUrl,
      this.eventsUrl,
      this.assigneesUrl,
      this.branchesUrl,
      this.tagsUrl,
      this.blobsUrl,
      this.gitTagsUrl,
      this.gitRefsUrl,
      this.treesUrl,
      this.statusesUrl,
      required this.languagesUrl,
      this.stargazersUrl,
      required this.contributorsUrl,
      this.subscribersUrl,
      this.subscriptionUrl,
      required this.commitsUrl,
      required this.gitCommitsUrl,
      this.commentsUrl,
      this.issueCommentUrl,
      this.contentsUrl,
      this.compareUrl,
      this.mergesUrl,
      this.archiveUrl,
      this.downloadsUrl,
      this.issuesUrl,
      this.pullsUrl,
      this.milestonesUrl,
      this.notificationsUrl,
      this.labelsUrl,
      this.releasesUrl,
      this.deploymentsUrl,
      required this.createdAt,
      required this.updatedAt,
      this.pushedAt,
      required this.gitUrl,
      this.sshUrl,
      this.cloneUrl,
      this.svnUrl,
      this.homepage,
      required this.size,
      this.stargazersCount,
      required this.watchersCount,
      this.language,
      required this.hasIssues,
      required this.hasProjects,
      required this.hasDownloads,
      required this.hasWiki,
      required this.hasPages,
      required this.forksCount,
      this.mirrorUrl,
      required this.archived,
      required this.disabled,
      required this.openIssuesCount,
      this.license,
      required this.allowForking,
      required this.isTemplate,
      this.topics,
      required this.visibility,
      required this.forks,
      required this.openIssues,
      required this.watchers,
      required this.defaultBranch,
      this.tempCloneToken,
      this.networkCount,
      this.subscribersCount});

  Repo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    owner = (json['owner'] != null ? User.fromJson(json['owner']) : null)!;
    htmlUrl = json['html_url'];
    description = json['description'];
    fork = json['fork'];
    url = json['url'];
    forksUrl = json['forks_url'];
    keysUrl = json['keys_url'];
    collaboratorsUrl = json['collaborators_url'];
    teamsUrl = json['teams_url'];
    hooksUrl = json['hooks_url'];
    issueEventsUrl = json['issue_events_url'];
    eventsUrl = json['events_url'];
    assigneesUrl = json['assignees_url'];
    branchesUrl = json['branches_url'];
    tagsUrl = json['tags_url'];
    blobsUrl = json['blobs_url'];
    gitTagsUrl = json['git_tags_url'];
    gitRefsUrl = json['git_refs_url'];
    treesUrl = json['trees_url'];
    statusesUrl = json['statuses_url'];
    languagesUrl = json['languages_url'];
    stargazersUrl = json['stargazers_url'];
    contributorsUrl = json['contributors_url'];
    subscribersUrl = json['subscribers_url'];
    subscriptionUrl = json['subscription_url'];
    commitsUrl = json['commits_url'];
    gitCommitsUrl = json['git_commits_url'];
    commentsUrl = json['comments_url'];
    issueCommentUrl = json['issue_comment_url'];
    contentsUrl = json['contents_url'];
    compareUrl = json['compare_url'];
    mergesUrl = json['merges_url'];
    archiveUrl = json['archive_url'];
    downloadsUrl = json['downloads_url'];
    issuesUrl = json['issues_url'];
    pullsUrl = json['pulls_url'];
    milestonesUrl = json['milestones_url'];
    notificationsUrl = json['notifications_url'];
    labelsUrl = json['labels_url'];
    releasesUrl = json['releases_url'];
    deploymentsUrl = json['deployments_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pushedAt = json['pushed_at'];
    gitUrl = json['git_url'];
    sshUrl = json['ssh_url'];
    cloneUrl = json['clone_url'];
    svnUrl = json['svn_url'];
    homepage = json['homepage'];
    size = json['size'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    language = json['language'];
    hasIssues = json['has_issues'];
    hasProjects = json['has_projects'];
    hasDownloads = json['has_downloads'];
    hasWiki = json['has_wiki'];
    hasPages = json['has_pages'];
    forksCount = json['forks_count'];
    mirrorUrl = json['mirror_url'];
    archived = json['archived'];
    disabled = json['disabled'];
    openIssuesCount = json['open_issues_count'];
    license = json['license'];
    allowForking = json['allow_forking'];
    isTemplate = json['is_template'];
    if (json['topics'] != null) {
      topics = <String>[];
      json['topics'].forEach((v) {
        topics!.add(v);
      });
    }
    visibility = json['visibility'];
    forks = json['forks'];
    openIssues = json['open_issues'];
    watchers = json['watchers'];
    defaultBranch = json['default_branch'];
    tempCloneToken = json['temp_clone_token'];
    networkCount = json['network_count'];
    subscribersCount = json['subscribers_count'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['node_id'] = nodeId;
    data['name'] = name;
    data['full_name'] = fullName;
    data['private'] = private;
    data['owner'] = owner.toJson();
    data['html_url'] = htmlUrl;
    data['description'] = description;
    data['fork'] = fork;
    data['url'] = url;
    data['forks_url'] = forksUrl;
    data['keys_url'] = keysUrl;
    data['collaborators_url'] = collaboratorsUrl;
    data['teams_url'] = teamsUrl;
    data['hooks_url'] = hooksUrl;
    data['issue_events_url'] = issueEventsUrl;
    data['events_url'] = eventsUrl;
    data['assignees_url'] = assigneesUrl;
    data['branches_url'] = branchesUrl;
    data['tags_url'] = tagsUrl;
    data['blobs_url'] = blobsUrl;
    data['git_tags_url'] = gitTagsUrl;
    data['git_refs_url'] = gitRefsUrl;
    data['trees_url'] = treesUrl;
    data['statuses_url'] = statusesUrl;
    data['languages_url'] = languagesUrl;
    data['stargazers_url'] = stargazersUrl;
    data['contributors_url'] = contributorsUrl;
    data['subscribers_url'] = subscribersUrl;
    data['subscription_url'] = subscriptionUrl;
    data['commits_url'] = commitsUrl;
    data['git_commits_url'] = gitCommitsUrl;
    data['comments_url'] = commentsUrl;
    data['issue_comment_url'] = issueCommentUrl;
    data['contents_url'] = contentsUrl;
    data['compare_url'] = compareUrl;
    data['merges_url'] = mergesUrl;
    data['archive_url'] = archiveUrl;
    data['downloads_url'] = downloadsUrl;
    data['issues_url'] = issuesUrl;
    data['pulls_url'] = pullsUrl;
    data['milestones_url'] = milestonesUrl;
    data['notifications_url'] = notificationsUrl;
    data['labels_url'] = labelsUrl;
    data['releases_url'] = releasesUrl;
    data['deployments_url'] = deploymentsUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['pushed_at'] = pushedAt;
    data['git_url'] = gitUrl;
    data['ssh_url'] = sshUrl;
    data['clone_url'] = cloneUrl;
    data['svn_url'] = svnUrl;
    data['homepage'] = homepage;
    data['size'] = size;
    data['stargazers_count'] = stargazersCount;
    data['watchers_count'] = watchersCount;
    data['language'] = language;
    data['has_issues'] = hasIssues;
    data['has_projects'] = hasProjects;
    data['has_downloads'] = hasDownloads;
    data['has_wiki'] = hasWiki;
    data['has_pages'] = hasPages;
    data['forks_count'] = forksCount;
    data['mirror_url'] = mirrorUrl;
    data['archived'] = archived;
    data['disabled'] = disabled;
    data['open_issues_count'] = openIssuesCount;
    data['license'] = license;
    data['allow_forking'] = allowForking;
    data['is_template'] = isTemplate;
    // TODO: Check if this causes issues
    if (topics != null) {
      data['topics'] = topics!.map((v) async => v).toList();
    }
    data['visibility'] = visibility;
    data['forks'] = forks;
    data['open_issues'] = openIssues;
    data['watchers'] = watchers;
    data['default_branch'] = defaultBranch;
    data['temp_clone_token'] = tempCloneToken;
    data['network_count'] = networkCount;
    data['subscribers_count'] = subscribersCount;
    return data;
  }
}
