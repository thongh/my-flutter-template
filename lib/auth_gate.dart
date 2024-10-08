import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // The authStateChanges API returns a Stream with either the current user (if they are signed in), or null if they are not. 
    // To subscribe to this state in our application, you can use Flutter's StreamBuilder widget and pass the stream to it.
    // StreamBuilder is a widget that builds itself based on the latest snapshot of data from a Stream that you pass it. 
    // It automatically rebuilds when the Stream emits a new snapshot.
    return StreamBuilder<User?>(
      // Before you can display a sign-in screen, you need to determine whether the user is currently authenticated. 
      // The most common way to check for this is to listen to FirebaseAuth's authStateChanges
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // The SignInScreen is a widget that comes from the FlutterFire UI package
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
            ],
          );
        }

        return const MyHomePage(title: 'My App',);
      },
    );
  }
}