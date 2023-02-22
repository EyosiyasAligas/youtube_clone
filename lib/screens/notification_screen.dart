import 'package:flutter/material.dart';

import './search_screen.dart';
import './settings_screen.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        title: const Text('Notifications'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.cast_sharp, size: 20,),),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Search()),
              );
            },
            icon: const Icon(Icons.search, size: 22),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  // padding: const EdgeInsets.all(0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Settings()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      // padding: const EdgeInsets.only(top: 5),
                      child: const Text('Settings'),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: const Text('watch on TV'),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: const Text('Terms & privacy policy'),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: const Text('Help & feedback'),
                  onTap: () {},
                ),
              ];
            },
          ),
        ],
      ),
      // bottomNavigationBar: BottomNav(d: NavScreen().selelctedItem,),
    );
  }
}
