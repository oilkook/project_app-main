// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:mailer/mailer.dart';

// class SentEmailBox extends StatefulWidget {
//   const SentEmailBox({Key key}) : super(key: key);

//   @override
//   _SentEmailBoxState createState() => _SentEmailBoxState();
// }

// class _SentEmailBoxState extends State<SentEmailBox> {
//   @override
//   Widget build(BuildContext context) {
//     return sendEmail();
//   }
  
// }

// Future sendEmail() async {
//   final email = 's6135512017@phuket.psu.ac.th';
//   final message = Message()
//     ..from = Address(email, 'Your name')
//     ..recipients.add('s6135512017@phuket.psu.ac.th')
//     ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
//     ..text = 'This is a test Email';
//   try {
//     await send(message);
//     showSnackBar('Sent Email Success');
//   } on MailerException catch (e) {
//     print(e);
//   }
// }

// void showSnackBar(String text) {
//   final snackBar = SnackBar(
//     content: Text(
//       text,
//       style: TextStyle(fontSize: 20),
//     ),
//     backgroundColor: Colors.orange,
//   );

//   ScaffoldMessenger.of(context)
//     ..removeCurrentSnackBar()
//     ..showSnackBar(snackBar);
// }
