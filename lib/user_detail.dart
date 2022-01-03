import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'models/user.dart';

class UserDetail extends StatefulWidget {
  final User user;

  const UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(widget.user.bio ?? ""),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (kIsWeb) {
                        html.window.open(
                            widget.user.githubUrl ?? "https://github.com",
                            "_blank");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Linking only available in web.")));
                      }
                    },
                    icon: Icon(Icons.code_sharp),
                    label: Text("GitHub"),
                  ),
                ),
              ),
              ((widget.user.twitterHandle != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: ElevatedButton.icon(
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style
                              ?.copyWith(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue)),
                          onPressed: () {
                            if (kIsWeb) {
                              html.window.open(
                                  "https://twitter.com/${widget.user.twitterHandle!}",
                                  "_blank");
                            }
                          },
                          icon: Icon(Icons.flutter_dash),
                          label: Text("Twitter"),
                        ),
                      ),
                    )
                  : Container()))
            ],
          ),
        ],
      ),
    );
  }
}
