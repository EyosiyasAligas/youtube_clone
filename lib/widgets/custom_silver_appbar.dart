import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/my_account.dart';
import '../screens/notification_screen.dart';
import '../screens/search_screen.dart';

class CustomSilverAppBar extends StatelessWidget {
  const CustomSilverAppBar({Key? key}) : super(key: key);

  _myAccount(BuildContext context) {
    return showModalBottomSheet(
        enableDrag: false,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const MyAccount();
        });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return SliverAppBar(
      floating: true,
      backgroundColor: Colors.black87,
      leading: Image.asset(
        'asset/YouTube_white.png',
      ),
      leadingWidth: 100,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.cast_sharp,
            size: 20,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Notifications()),
            );
          },
          icon: const Icon(
            Icons.notifications_outlined,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Search()),
            );
          },
          icon: const Icon(
            Icons.search,
            size: 22,
          ),
        ),
        InkWell(
          onTap: () => _myAccount(context),
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              radius: 13,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.network(
                  user.photoURL!,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
