import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import './providerAuth/google_sign_in_provider.dart';
import '../screens/nav_screen.dart';
import 'screens/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.black54,
          primaryColor: Colors.black54,
          brightness: Brightness.dark,
        ),
        title: 'YouTube Clone',
        home: const MainScreen(),
      ),
    ),
  );
}