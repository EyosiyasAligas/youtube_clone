import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  final List _settings = const [
    'General', 'Data Saving', 'Autoplay', 'Video quality preferences',
    'Downloads', 'Watch on TV', 'History & privacy', 'Try new features',
    'Purchases and memberships', 'Notifications', 'Connected apps', 'Live chats',
    'Captions', 'Accessibility', 'About',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            letterSpacing: 1,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, top: 5, bottom: 35),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._settings.map((setting) {
              return InkWell(
                onTap: () { },
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Text(setting),
                ),
              );
            }),
          ]
        ),
      ),
    );
  }
}
