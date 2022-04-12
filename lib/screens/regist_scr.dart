import 'package:flutter/material.dart';
import 'package:project_app/configs/global.dart';
import 'package:project_app/screens/regist_scr/regist_form_section.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_background_color,
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
       
        children: [
          Spacer(flex: 2,),
          RegisterFormSection(),
          Spacer(flex: 10,),
        ],
      ),
    );
  }
}
