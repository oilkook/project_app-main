import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:project_app/Homepage/homepage.dart';
import 'package:project_app/Screens/home/home_screen.dart';
import 'package:project_app/actions/ActionSheet.dart';
import 'package:project_app/provider/HomePageProvider.dart';
import 'package:project_app/view/sent_email.dart';
import 'package:provider/provider.dart';

class CheckList extends StatelessWidget {
  final String roomnumber;
  final String dormitoryX;
  final String email;
  final String phonenumber;
  final String list;
  final String datetime;
  final String line;
  final String name;
  final String id;

  const CheckList({
    Key key,
    this.datetime,
    this.roomnumber,
    this.list,
    this.dormitoryX,
    this.email,
    this.phonenumber,
    this.line,
    this.name,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: Text('แจ้งเข้าซ่อมเสร็จ ${id}'),
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        body: Card(
          elevation: 8,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'ถึง : ',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Text(
                          email,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "[ประชาสัมพันธ์] แจ้งซ่อมเสร็จสิ้น",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "จากฟอร์มการแจ้งซ่อมของ ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue[900]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "   -> เบอร์โทรศัพท์ ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      phonenumber,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue[900]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('   -> หอพัก : ',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    Text(
                      dormitoryX,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue[900]),
                    ),
                    Text('    '),
                    Text('ห้อง : ',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    Text(
                      roomnumber,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue[900]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "ตามวันเวลาที่นัดซ่อม  ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Expanded(
                      child: Text(
                        datetime,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue[900]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "แจ้งซ่อม ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Expanded(
                      child: Text(
                        list,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue[900]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_box,
                      color: Colors.green.withOpacity(1.0),
                    ),
                    Text(
                      "  ได้ทำการเข้าซ่อมเสร็จเรียบร้อยแล้ว ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.grey.withOpacity(0.50),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('ซ่อมเสร็จ')
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text(
                          "ยืนยันการซ่อมเสร็จ ${id}",
                        ),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("ยกเลิก"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          CupertinoDialogAction(
                            child: Text("ยืนยัน"),
                            onPressed: () async{
                              print('ซ่อมเสร็จแล้ว');
                              await ActionSheet.editStatus(id: id, status: '2');
                              final provider = Provider.of<HomePageProvider>(
                                  context,
                                  listen: false);
                              provider.fetchRequestStatus();
                              provider.fetchConfirmStatus();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomeScreen();
                              }));
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Card(
                  elevation: 8,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    color: Colors.orange,
                    child: Text("ซ่อมสำเร็จ",
                        style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future sendEmail() async {
  //   final email = 's6135512017@phuket.psu.ac.th';

  //   String username = 's6135512017@phuket.psu.ac.th';
  //   String password = '1909802402869';
  //   final smtpServer = gmail(username, password);
  //   final message = Message()
  //     ..from = Address(email, 'Papavarin')
  //     ..recipients = ['s6135512017@phuket.psu.ac.th']
  //     ..subject = 'Hello RepairMan'
  //     ..text = 'This is a test Email';
  //   try {
  //     await send(message, smtpServer);
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
}
