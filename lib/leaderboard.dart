import 'package:flutter/material.dart';
import 'package:github_rest_api/api.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 4,
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              side: BorderSide(
                color: Theme.of(context).primaryColor,
              )),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(8.0),
                    itemBuilder: (BuildContext context, int index) =>
                        LeaderboardTile(user: users[index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: users.length),
              ),
              Flexible(
                child: Form(
                  key: _formKey,
                  child: SizedBox.expand(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: TextField(
                            onEditingComplete: () async =>
                                await _buildLeaderboard(),
                            controller: _controller,
                            autocorrect: false,
                          ),
                        ),
                        Flexible(
                          child: IconButton(
                            onPressed: () async => await _buildLeaderboard(),
                            color: Theme.of(context).primaryColor,
                            icon: Icon(Icons.arrow_forward),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
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

class LeaderboardTile extends StatelessWidget {
  const LeaderboardTile({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: CircleAvatar(
          foregroundImage: user.avatar,
        ),
        title: Text(user.login),
      ),
    );
  }
}
