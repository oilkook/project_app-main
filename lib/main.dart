import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_app/Homepage/homepage.dart';
import 'package:project_app/Screens/home/home_screen.dart';

import 'package:project_app/constants.dart';
import 'package:project_app/login/LoginPage.dart';

void main() async {
  // await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // final _init = Firebase.initializeApp();
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // LoginPage()
      home: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Scaffold();
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginPage();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Scaffold(
            body: Center(
              child: SpinKitDoubleBounce(
                color: Colors.blue,
                size: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
