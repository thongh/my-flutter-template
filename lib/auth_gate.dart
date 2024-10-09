import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

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
              GoogleProvider(clientId: "319731334863-ush2s8ko9t8409a0fhniq02u8ieu1hs6.apps.googleusercontent.com"),
            ],
            // Using the SignInScreen.headerBuilder argument, you can add whatever widgets you want above the sign-in form.
            // This widget is only displayed on narrow screens, such as mobile devices
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/flutterfire_300x.png'),
                ),
              );
            },
            // The subtitleBuilder is slightly different in that the callback arguments include an action, which is of type AuthAction.
            //  AuthAction is an enum that you can use to detect if the screen the user is on is the "sign in" screen or the "register" screen.
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                    ? const Text('Welcome to FlutterFire, please sign in!')
                    : const Text('Welcome to Flutterfire, please sign up!'),
              );
            },
            // The footerBuilder argument is the same as the subtitleBuilder.
            // It doesn't expose BoxConstraints or shrinkOffset, as it's intended for text rather than images.
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            // The SignInScreen.sidebuilder argument accepts a callback, and this time the arguments to that callback are BuildContext 
            // and double shrinkOffset. The widget that sideBuilder returns will be displayed to the left of the sign in form, 
            // and only on wide screens. Effectively that means the widget will only be displayed on desktop and web apps.
            sideBuilder: (context, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/flutterfire_300x.png'),
                ),
              );
            },
          );
        }

        return const MyHomePage(
          title: 'My App',
        );
      },
    );
  }
}
