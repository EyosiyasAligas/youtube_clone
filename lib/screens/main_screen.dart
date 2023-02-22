import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './nav_screen.dart';
import './signin_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if((snapshot.connectionState == ConnectionState.waiting)){
            return const Center(
              child: CircularProgressIndicator(color: Colors.white,),
            );
          } else if(snapshot.hasData){
            return const NavScreen();
          } else if(snapshot.hasError){
            return const Center(
              child: Text('Something went wrong'),
            );
          } else {
            return const SignInScreen();
          }
        }
      ),
    );
  }
}
