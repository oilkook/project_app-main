import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/Homepage/homepage.dart';
import 'package:project_app/Screens/home/home_screen.dart';

class FormScreens extends StatelessWidget {
  final String roomnumber;
  final String dormitoryX;
  final String list;
  final String photo;
  final String details;
  final String datetime;

  const FormScreens({
    Key key,
    this.dormitoryX,
    this.roomnumber,
    this.list,
    this.photo,
    this.details,
    this.datetime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ยืนยันรายการแจ้งซ่อม'),
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image(
                        height: 200,
                        width: 200,
                        image: NetworkImage(photo),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('วันที่/เวลาที่สะดวกเข้าซ่อม : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900])),
                  Text(datetime),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('หอพัก : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900])),
                  Text(dormitoryX),
                  Text('    '),
                  Text('ห้อง : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900])),
                  Text(roomnumber),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'รายการแจ้งซ่อม : ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                    overflow: TextOverflow.visible,
                  ),
                  Expanded(
                      child: Text(
                    list,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('รายละเอียด : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900])),
                  Text(details),
                ],
              ),
            ),
            //
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text(
                        "ยืนยันการเข้าซ่อม",
                      ),
                      actions: [
                        CupertinoDialogAction(
                          child: Text("ยกเลิก"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        CupertinoDialogAction(
                            child: Text("ส่ง"),
                            onPressed: () {
                              print('ยืนยัน');
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomeScreen();
                              }));
                            })
                      ],
                    );
                  },
                );
              },
              child: Card(
                elevation: 8,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  color: Colors.orange,
                  child: Text("ยืนยันการซ่อม",
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
    );
  }
}
