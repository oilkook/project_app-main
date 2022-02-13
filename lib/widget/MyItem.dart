import 'package:flutter/material.dart';
import 'package:project_app/Screens/form_screens.dart';
import 'package:project_app/model/bill.dart';

class MyItem extends StatelessWidget {
  final Bill data;
  MyItem({this.data});
  String getImageUrl(String url) {
    String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";
    // String postman = '${data['photo']}';
    List<String> afterSplit = url.split("=");
    return googleDriveUrl + afterSplit.last;
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Container(
    //     height: 120,
    //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //         color: Colors.white,
    //         boxShadow: [
    //           BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
    //         ]),
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: <Widget>[
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 '${DateTime.parse(data.informationDate).toLocal().day}/${DateTime.parse(data.informationDate).toLocal().month}/${DateTime.parse(data.informationDate).toLocal().year} ',
    //                 style: TextStyle(
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.blue[900]),
    //               ),
    //               Text(
    //                 'เวลา ${DateTime.parse(data.informationDate).toLocal().hour}:${DateTime.parse(data.informationDate).toLocal().minute} น.',
    //                 style: TextStyle(
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.blue[900]),
    //               ),
    //               Text(
    //                 'ชื่อ : ${data.repairname} ',
    //                 style: TextStyle(
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.blue[900]),
    //               ),
    //               Text(
    //                 'หอพัก : ${data.dormitoryX}',
    //                 style: TextStyle(
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.blue[900]),
    //               ),
    //               Text(
    //                 'ห้อง : ${data.roomnumber} ',
    //                 style: TextStyle(
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.blue[900]),
    //               ),
    //             ],
    //           ),
    //           Image(
    //               width: 100,
    //               image: NetworkImage(getImageUrl('${data.photo}'))),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
//   }
// }
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
                      'ที่อยู่อีเมล : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text('${data.emailaddress}'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'ชื่อผู้แจ้งซ่อม : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text('${data.repairname}'),
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
                      'เบอร์โทร : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text('${data.phonenumber}'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'ID LINE : ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                    Text('${data.lineID}'),
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
                            return FormScreens(
                              dormitoryX: "${data.dormitoryX}",
                              roomnumber: "${data.roomnumber}",
                              list: "${data.list}",
                              details: "${data.details}",
                              photo: getImageUrl("${data.photo}"),
                              datetime:
                                  "${DateTime.parse(data.date).toLocal().day}/${DateTime.parse(data.date).toLocal().month}/${DateTime.parse(data.date).toLocal().year} เวลา ${data.time} น.",
                            );
                          }));
                        },
                        child: Text('ยืนยันวันเข้าซ่อม')),
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
