import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './library_screen.dart';
import './subscription_screen.dart';
import '../widgets/bottom_nav.dart';
import './home_screen.dart';
import './shorts_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int selectedNav = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Shorts(),
    Container(
      child: const Text('Add'),
    ),
    const SubscrScreen(),
    const LibraryScreen(),
  ];

  void changeIndex(selectedNav) {
    setState(() {
      this.selectedNav = selectedNav;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return Scaffold(
      // backgroundColor: Theme.of(context).canvasColor,
      body: Stack(
        children: _screens
            .asMap()
            .map(
              (index, screen) => MapEntry(
                index,
                Offstage(
                  offstage: selectedNav != index,
                  child: screen,
                ),
              ),
            )
            .values
            .toList(),
      ),
      bottomNavigationBar: BottomNav(
        changeIndex: changeIndex,
        selectedNav: selectedNav,
      ),
    );
  }
}
