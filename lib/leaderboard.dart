import 'package:flutter/material.dart';
import 'package:github_rest_api/api.dart';
import 'package:github_rest_api/user_detail.dart';

import 'models/user.dart';

class Leaderboard extends StatefulWidget {
  Leaderboard({Key? key}) : super(key: key);

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<User> users = <User>[];
  bool _isBottomSheet = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      // width: MediaQuery.of(context).size.width / 4,
      // height: MediaQuery.of(context).size.height / 4,
      child: Container(
        foregroundDecoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            side: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2.5,
            ),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17.5),
                topRight: Radius.circular(17.5),
              ),
            ),
            primary: false,
            title: Text('Leaderboard'),
          ),
          primary: false,
          floatingActionButton: FloatingActionButton(
            onPressed: () => _toggleBottomSheet(),
            child: Icon(Icons.add),
          ),
          body: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.all(8.0),
            itemBuilder: (BuildContext context, int index) =>
                LeaderboardTile(user: users[index]),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: users.length,
          ),
          bottomSheet: _isBottomSheet ? _showBottomSheet() : null,
        ),
      ),
    );
  }

  void _toggleBottomSheet() {
    setState(() {
      _isBottomSheet = !_isBottomSheet;
    });
  }

  Widget _showBottomSheet() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                onEditingComplete: () async {
                  _toggleBottomSheet();
                  await _buildLeaderboard();
                  _controller.clear();
                },
                controller: _controller,
                autocorrect: false,
              ),
            ),
            Flexible(
              child: IconButton(
                onPressed: () async {
                  _toggleBottomSheet();
                  await _buildLeaderboard();
                  _controller.clear();
                },
                color: Theme.of(context).primaryColor,
                icon: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _buildLeaderboard() async {
    var usersWithNew = users;
    usersWithNew.add(
      User(
        login: _controller.text,
        avatar: NetworkImage(''),
      ),
    );
    Api.rankUsers(usersWithNew).then(
      (value) => setState(
        () {
          users = value;
        },
      ),
    );
  }
}

class LeaderboardTile extends StatefulWidget {
  const LeaderboardTile({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<LeaderboardTile> createState() => _LeaderboardTileState();
}

class _LeaderboardTileState extends State<LeaderboardTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: CircleAvatar(
        foregroundImage: widget.user.avatar,
      ),
      children: <Widget>[UserDetail(user: widget.user)],
      title: Text(widget.user.login),
      subtitle: Text(widget.user.location ?? ''),
      textColor: Theme.of(context).primaryColor,
      iconColor: Theme.of(context).primaryColor,
    );
  }
}
