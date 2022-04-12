import 'package:flutter/material.dart';
import 'package:project_app/configs/global.dart';
import 'package:project_app/screens/home_scr.dart';
import 'package:project_app/screens/login_scr/login_form_section.dart';
import 'package:project_app/screens/login_scr/logo_section.dart';
import 'package:project_app/utils/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Auth.authChecker(() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_background_color,
      body: SafeArea(
        child: Column(
          children: [
            Spacer(
              flex: 3,
            ),
            LogoSection(),
            Spacer(
              flex: 3,
            ),
            FormSection(),
            Spacer(
              flex: 6,
            ),
          ],
        ),
      ),
    );
  }
}
