import 'package:flutter/material.dart';
import 'package:project_app/screens/login_scr.dart';
import 'package:project_app/utils/auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: ElevatedButton(onPressed: () {
        Auth.signOut(context, LoginScreen());
      } , child: Text("Sign Out"),),
    );
  }
}