import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static signInWithEmailPassword({
    VoidCallback onCompleted,
    String email,
    String password,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user.uid != null &&
          userCredential.user.email != null) {
        prefs.setString('user_uid', userCredential.user.uid);
        prefs.setString('user_email', userCredential.user.email);
        if (onCompleted != null) {
          onCompleted();
        }
        return true;
      } else {
        return false;
      }
    } catch (err) {
      Fluttertoast.showToast(msg: 'Login Failed');
      print(err);
      return false;
    }
  }

  static registerWithEmailPassword({String email, String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(msg: 'Register Completed!');
      return true;
    } on FirebaseAuthException catch (err) {
      Fluttertoast.showToast(msg: err.message);
      return false;
    }
  }

  static signOut(BuildContext context, Widget to) async {
    final prefs = await SharedPreferences.getInstance();
    await FirebaseAuth.instance.signOut();
    await prefs.remove('user_uid');
    await prefs.remove('user_email');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => to,
        ),
        (route) => false);
  }

  static authChecker(VoidCallback ifLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user_uid') != null) {
      ifLoggedIn();
    }
  }
}
