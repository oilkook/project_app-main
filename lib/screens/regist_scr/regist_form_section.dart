import 'package:flutter/material.dart';
import 'package:project_app/components/popup_loading.dart';
import 'package:project_app/utils/auth.dart';
import 'package:project_app/utils/utils.dart';

class RegisterFormSection extends StatefulWidget {
  RegisterFormSection({Key key}) : super(key: key);

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationPasswordContoller = TextEditingController();
  InputDecoration getInputDecorated({@required String label}) {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        label: Text(label),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: getInputDecorated(label: 'Psu E-mail'),
                    validator: (value) {
                      if (!Utils.isPsuMail(value)) {
                        return 'อีเมล์ต้องเป็นโดเมน @phuket.psu.ac.th เท่านั้น';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: getInputDecorated(label: 'รหัสผ่าน'),
                    validator: (value) {
                      if (value.length < 6 && value.length != 0) {
                        return 'รหัสผ่านต้องมีความยาว 6 - 12 ตัวอักษร';
                      }
                      if (value.length == 0) {
                        return 'โปรดระบุรหัสผ่าน';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: confirmationPasswordContoller,
                    obscureText: true,
                    validator: (value) {
                      if (value != passwordController.text.trim()) {
                        return 'รหัสผ่านไม่ตรงกัน กรุณาตรวจสอบ';
                      }
                      if (value.length == 0) {
                        return 'รหัสผ่านไม่ตรงกัน กรุณาตรวจสอบ';
                      }
                      return null;
                    },
                    decoration: getInputDecorated(label: 'ยืนยันรหัสผ่าน'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Spacer(
                flex: 3,
              ),
              SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                          Loading.showPopUp(context);
                          bool isCompleted =
                              await Auth.registerWithEmailPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                          Navigator.pop(context);
                          if (isCompleted) {
                            await Future.delayed(Duration(milliseconds: 500));
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Text('ลงทะเบียน'))),
              Spacer(
                flex: 1,
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                    onPressed: () {
                      emailController.clear();
                      passwordController.clear();
                      confirmationPasswordContoller.clear();
                    },
                    child: Text('ล้าง')),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
