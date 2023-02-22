import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providerAuth/google_sign_in_provider.dart';
import './settings_screen.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      color: Theme.of(context).primaryColor,
      height: double.infinity,
      child: Container(
        height: MediaQuery.of(context).size.height + 10,
        margin: const EdgeInsets.only(
          left: 5,
          right: 10,
          top: 10,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close_outlined),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    width: double.infinity,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(user.photoURL!),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.displayName!),
                              Text(user.email!),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 235,
                          alignment: Alignment.centerRight,
                          child: const Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 57),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Manage your Google Account',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              // color: Colors.grey,
              padding: const EdgeInsets.only(left: 10, top: 10),
              height: MediaQuery.of(context).size.height - 151,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Icon(Icons.person_pin_outlined),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Your channel'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Icon(Icons.man),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Turn on Incognito'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {  },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Icon(Icons.person_add_outlined),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Add account'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      provider.googleLogOut(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Icon(Icons.person_add_outlined),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Sign out'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.grey[800],
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    height: 1,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Icon(Icons.attach_money),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Purchases and memberships'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Icon(Icons.insert_chart_outlined),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Time watched'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Icon(Icons.privacy_tip),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Your data on YouTube'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.grey[800],
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    height: 1,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settings()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Icon(Icons.settings),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Settings'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Icon(Icons.help_outline),
                          SizedBox(
                            width: 25,
                          ),
                          Text('Help & feedback'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.grey[800],
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    height: 1,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.play_circle,
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text('YouTube Studio'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.play_circle_outline_rounded,
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text('YouTube Kids'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
