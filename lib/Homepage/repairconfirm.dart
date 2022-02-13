import 'package:flutter/material.dart';
import 'package:project_app/Screens/form_screens.dart';
import 'package:project_app/model/bill.dart';
import 'package:project_app/view/CheckList.dart';

class RepairConfirm extends StatelessWidget {
  final Bill data;
  RepairConfirm({this.data});
  String getImageUrl(String url) {
    String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";
    // String postman = '${data['photo']}';
    List<String> afterSplit = url.split("=");
    return googleDriveUrl + afterSplit.last;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image(
                          height: 150,
                          width: 150,
                          image: NetworkImage(getImageUrl('${data.photo}')),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       Text(
              //         'รูปภาพประกอบ : ',
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.blue[900]),
              //         overflow: TextOverflow.visible,
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'วัน/เวลาที่แจ้งซ่อม :',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                      ),
                    ),
                    Text(
                      '${DateTime.parse(data.informationDate).toLocal().day}/${DateTime.parse(data.informationDate).toLocal().month}/${DateTime.parse(data.informationDate).toLocal().year} เวลา ${DateTime.parse(data.informationDate).toLocal().hour}:${DateTime.parse(data.informationDate).toLocal().minute} น.',
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'หอพัก : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text(
                      '${data.dormitoryX}',
                    ),
                    Text('    '),
                    Text(
                      'ห้อง : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text(
                      '${data.roomnumber}',
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'วันที่/เวลาที่สะดวกเข้าซ่อม  : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text(
                        '${DateTime.parse(data.date).toLocal().day}/${DateTime.parse(data.date).toLocal().month}/${DateTime.parse(data.date).toLocal().year} เวลา ${data.time} น.'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'ในช่วงเข้าซ่อมผู้ใช้ต้องการให้ :  ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text('${data.status}')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        'รายการแจ้งซ่อม : ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${data.list}',
                        maxLines: 2,
                        overflow: TextOverflow.visible,
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
                      'รายละเอียด : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text('${data.details}'),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                        onPressed: () {
                          print('object');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CheckList(
                              email: "${data.emailaddress}",
                              name: "${data.repairname}",
                              dormitoryX: "${data.dormitoryX}",
                              roomnumber: "${data.roomnumber}",
                              line: "${data.lineID}",
                              phonenumber: "${data.phonenumber}",
                              list: "${data.list}",
                              datetime:
                                  "${DateTime.parse(data.date).toLocal().day}/${DateTime.parse(data.date).toLocal().month}/${DateTime.parse(data.date).toLocal().year} เวลา ${data.time} น.",
                            );
                          }));
                        },
                        child: Text('แจ้งซ่อมเสร็จ')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
