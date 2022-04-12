import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 2,
      height: size.width / 2,
      child : Image.asset('assets/images/Iogo1.png')
    );
  }
}