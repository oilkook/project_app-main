import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_app/Screens/home/home_screen.dart';
import 'package:project_app/actions/ActionLogin.dart';
import 'package:project_app/login/LoginPage.dart';
import 'package:project_app/login/model/profile.dart';

import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("สร้างบัญชี"),
        ),
        backgroundColor: Colors.orange[100],
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Register',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
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
                        return 'Please Enter Email (@phuket.psu.ac.th)';
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
                          return 'Please Enter Password (0-9, a-z)';
                        }
                        return null;
                      }),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () async {
                            if (_formKey.currentState.validate()) {
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: _emailController.text.trim(),
                                            password: _passwordController.text
                                                .trim());

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              } catch (err) {
                                print("ERROR!!!!!");
                                Fluttertoast.showToast(
                                    gravity: ToastGravity.BOTTOM,
                                    msg: 'Login Not Complete');
                              }
                            }
                          },
                          child: GestureDetector(
                            onTap: () async {
                              print('Register Success');
                              ActionLogin().registerWithEmail(
                                  mail: _emailController.text,
                                  pass: _passwordController.text);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Card(
                              elevation: 8,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.3,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                color: Colors.red,
                                child: Text("Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       GestureDetector(
                  //         behavior: HitTestBehavior.translucent,
                  //         onTap: () async {
                  //           if (_formKey.currentState.validate()) {
                  //             try {
                  //               UserCredential userCredential =
                  //                   await FirebaseAuth.instance
                  //                       .signInWithEmailAndPassword(
                  //                           email: _emailController.text.trim(),
                  //                           password: _passwordController.text
                  //                               .trim());

                  //               Navigator.pushReplacement(
                  //                   context,
                  //                   MaterialPageRoute(
                  //                       builder: (context) => HomeScreen()));
                  //             } catch (err) {
                  //               print("ERROR!!!!!");
                  //               Fluttertoast.showToast(
                  //                   gravity: ToastGravity.BOTTOM,
                  //                   msg: 'Login Not Complete');
                  //             }
                  //           }
                  //         },

                  //         // Text(
                  //         //   "Email",
                  //         //   style: TextStyle(
                  //         //       color: Colors.black,
                  //         //       fontSize: 16,
                  //         //       fontWeight: FontWeight.bold),
                  //         // ),
                  //         // TextFormField(
                  //         //   keyboardType: TextInputType.emailAddress,
                  //         //   onSaved: (String email) {
                  //         //     profile.email = email;
                  //         //   },
                  //         // ),
                  //         // SizedBox(
                  //         //   height: 15,
                  //         // ),
                  //         // Text(
                  //         //   "Password",
                  //         //   style: TextStyle(
                  //         //       color: Colors.black,
                  //         //       fontSize: 16,
                  //         //       fontWeight: FontWeight.bold),
                  //         // ),
                  //         // TextFormField(
                  //         //   onSaved: (String password) {
                  //         //     profile.password = password;
                  //         //   },
                  //         // ),
                  //         // SizedBox(
                  //         //   width: double.infinity,
                  //         //   child: ElevatedButton(
                  //         //     child: Text(
                  //         //       "ลงทะเบียน",
                  //         //       style: TextStyle(
                  //         //         color: Colors.white,
                  //         //         fontSize: 16,
                  //         //       ),
                  //         //     ),
                  //         //     onPressed: () {
                  //         //       formKey.currentState.save();
                  //         //       print(
                  //         //           "email = ${profile.email} password = ${profile.password}");
                  //         //       formKey.currentState.reset();
                  //         //     },
                  //         //   ),
                  //         // )
                  //         // GestureDetector(
                  //         //   behavior: HitTestBehavior.translucent,
                  //         //   onTap: () {
                  //         //     Navigator.push(context,
                  //         //         MaterialPageRoute(builder: (context) {
                  //         //       return LoginPage();
                  //         //     }));
                  //         //   },
                  //         //   child: Card(
                  //         //     elevation: 8,
                  //         //     margin: const EdgeInsets.symmetric(
                  //         //         vertical: 8, horizontal: 10),
                  //         //     child: Container(
                  //         //       alignment: Alignment.center,
                  //         //       width: MediaQuery.of(context).size.width * 0.3,
                  //         //       padding: const EdgeInsets.symmetric(vertical: 10),
                  //         //       color: Colors.red,
                  //         //       child: Text("Sign Up",
                  //         //           style: TextStyle(
                  //         //               color: Colors.white,
                  //         //               fontSize: 16,
                  //         //               fontWeight: FontWeight.bold)),
                  //         //     ),
                  //         //   ),
                  //         // ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        )));
  }
}
