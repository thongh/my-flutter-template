import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            // The callback passed to the IconButton.isPressed method. When that IconButton is pressed,
            // your application creates a new anonymous route and navigates to it. That route will display the ProfileScreen widget,
            // which is returned from the MaterialPageRoute.builder callback.
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    avatar: CircleAvatar(
                      child: Icon(Icons.person)
                    ),
                    // The ProfileScreen.appBar argument accepts an AppBar widget from the Flutter Material package,
                    // so it can be treated like any other AppBar you've built and passed to a Scaffold.
                    // In this example, the default functionality of automatically adding a "back" button is kept,
                    // and the screen now has a title
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    // Pass it a list of actions to the ProfileScreen.actions argument. These actions are of the type FlutterFireUiAction.
                    // There are many different classes that are subtypes of FlutterFireUiAction, and in general you use them to tell your app
                    // to react to different auth state changes. The SignedOutAction calls a callback function that you give it when
                    // the Firebase auth state changes to the currentUser being null.
                    actions: [
                      SignedOutAction((context) {
                        // By adding a callback that calls Navigator.of(context).pop() when SignedOutAction triggers,
                        // the app will navigate to the previous page. In this example app, there is only one permanent route,
                        // which shows the sign in page if there isn't a user signed in, and the home page if there is a user.
                        // Because this happens when the user signs out, the app will display the SignIn page.
                        Navigator.of(context).pop();
                      })
                    ],
                    // The ProfileScreen widget also has an optional argument named children. This argument accepts a list of widgets, 
                    // and those widgets will be placed vertically inside of a Column widget that's already used internally 
                    // to build the ProfileScreen. This Column widget in the ProfileScreen build method will place the children 
                    // you pass it above the "Sign out" button.
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset('assets/flutterfire_300x.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SignOutButton(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
