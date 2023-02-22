import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providerAuth/google_sign_in_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  'asset/youtube_logo.png',
                  height: 150,
                ),
                const SizedBox(height: 17,),
                const Center(
                  child: Text(
                    'YouTube',
                    // maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 35,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Authentication',
                    // maxLines: 2,
                    style: TextStyle(
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.normal,
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black87),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
              icon: Image.asset(
                'asset/google.png',
                height: 30,
              ),
              label: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
