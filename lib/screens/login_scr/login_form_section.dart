import 'package:flutter/material.dart';
import 'package:project_app/screens/home_scr.dart';
import 'package:project_app/screens/regist_scr.dart';
import 'package:project_app/utils/auth.dart';
import 'package:project_app/utils/utils.dart';

class FormSection extends StatefulWidget {
  FormSection({Key key}) : super(key: key);

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  InputDecoration getInputDecorated({@required String label}) {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        label: Text(label),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (!Utils.isPsuMail(value.trim())) {
                        return 'รูปแบบอีเมลล์ไม่ถูกต้อง';
                      }
                      return null;
                    },
                    decoration: getInputDecorated(label: 'Psu E-Mail'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value.length < 6) {
                        return "รหัสผ่านต้องมีความยาว 6 - 12 ตัวอักษร";
                      }
                      return null;
                    },
                    decoration: getInputDecorated(label: 'รหัสผ่าน'),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Spacer(
                  flex: 4,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orangeAccent[700]),
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                          await Auth.signInWithEmailPassword(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              onCompleted: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  )));
                        }
                      },
                      child: Text('ลงชื่อเข้าใช้')),
                ),
                Spacer(
                  flex: 1,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orangeAccent[700]),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ));
                      },
                      child: Text('ลงทะเบียน')),
                ),
                Spacer(
                  flex: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
