import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_app/Screens/home/home_screen.dart';
import 'package:project_app/actions/ActionLogin.dart';
import 'package:project_app/constants.dart';
import 'package:project_app/login/login_screens.dart';
import 'package:project_app/login/register.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: ListView(
        children: <Widget>[
          Spacer(flex: 1),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.height / 3,
              child: Image.asset('assets/images/Iogo1.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (_emailController.text.trim().length == 0) {
                              return 'Please Enter Email';
                            }
                            if (_emailController.text.trim().split('@')[1] !=
                                'phuket.psu.ac.th') {
                              return 'This not a PSU Phuket Email';
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                            controller: _passwordController,
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            validator: (value) {
                              if (_passwordController.text.trim().length == 0) {
                                return 'Please Enter Password';
                              }

                              return null;
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim());

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      } catch (err) {
                        print("ERROR!!!!!");
                        Fluttertoast.showToast(
                            gravity: ToastGravity.BOTTOM,
                            msg: 'Login Not Complete');
                      }
                    }
                  },
                  child: Card(
                    elevation: 8,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      color: kPrimaryColor,
                      child: Text("Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegisterScreen();
                    }));
                  },
                  child: Card(
                    elevation: 8,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      color: Colors.red,
                      child: Text("Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
