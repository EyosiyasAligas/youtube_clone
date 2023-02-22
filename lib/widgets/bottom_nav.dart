import 'package:flutter/material.dart';

import 'addicon_bottom_sheet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({
    Key? key,
    required this.changeIndex,
    required this.selectedNav,
  }) : super(key: key);

  final Function changeIndex;
  final int selectedNav;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  addIcon() {
    return showModalBottomSheet(
      backgroundColor: Colors.grey[900],
      context: context,
      builder: (c) {
        return const AddBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height-629,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white10,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.black87,
        // elevation: 0,
        currentIndex: widget.selectedNav,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.black,
        // unselectedItemColor: Colors.black,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        iconSize: 22,
        onTap: (val) {
          if (val == 2) {
            return;
          }
          setState(() {
            widget.changeIndex(val);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'asset/home black.jpg',
                    height: 22,
                  ),
                ),
                const Text(
                  'Home',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            activeIcon: Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'asset/home selected.jpg',
                    height: 20,
                  ),
                ),
                const Text(
                  'Home',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'asset/shorts black.jpg',
                    height: 22,
                  ),
                ),
                const Text(
                  'Shorts',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            activeIcon: Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'asset/shorts selected.jpg',
                    height: 20,
                  ),
                ),
                const Text(
                  'Shorts',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            // icon: CircleAvatar(child: Image.asset('asset/addIcon.png', height: 32,),),
            icon: InkWell(
              onTap: () => addIcon(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  child: Image.asset(
                    'asset/addIcon.png',
                    height: 30,
                  ),
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'asset/subscriptions black.png',
                    height: 22,
                  ),
                ),
                const Text(
                  'Subscriptions',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            activeIcon: Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'asset/subscriptions selected.png',
                    height: 20,
                  ),
                ),
                const Text(
                  'Subscriptions',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'asset/library black.jpg',
                    height: 22,
                  ),
                ),
                const Text(
                  'Library',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            activeIcon: Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'asset/library selected.jpg',
                    height: 20,
                  ),
                ),
                const Text(
                  'Library',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
