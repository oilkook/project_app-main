import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_app/Screens/details/components/repair_card_more.dart';
import 'package:project_app/Screens/details/details_screens.dart';
import 'package:project_app/actions/ActionGet.dart';
import 'package:project_app/model/bill.dart';
import 'package:project_app/provider/HomePageProvider.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../form_screens.dart';

class LatestNoti extends StatefulWidget {
  const LatestNoti({Key key}) : super(key: key);

  @override
  State<LatestNoti> createState() => _LatestNotiState();
}

class _LatestNotiState extends State<LatestNoti> {
  List<Bill> bills = [];
  bool isLoad = true;

  initialAction() async {
    final List result = await ActionGet.getSheetData();

    final provider = Provider.of<HomePageProvider>(context, listen: false);
    int last_start = result.length - provider.diff;
    print('last ${result.length - provider.diff}');
  print(result.getRange(last_start , result.length ).toList());

    setState(() {
      bills = result.getRange(last_start , result.length ).toList();
      isLoad = false;
    });
  }

  @override
  void initState() {
    initialAction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest'),
        elevation: 0,
      ),
      body: isLoad == true
          ? SpinKitPouringHourGlassRefined(color: Colors.orange)
          : bills.length > 0
          ? Container(
                  child: ListView.builder(
                    itemCount: bills.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.height,
                        child: RepairNoti(
                          data: bills[index],
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              : Center(child: Text("${bills.toString()}")),

    );
   
  }
}

class RepairNoti extends StatelessWidget {
  const RepairNoti({
    Key key,
    this.image,
    this.title,
    this.domitory,
    this.room,
    this.press,
    this.data,
  }) : super(key: key);
  final String image, title, domitory, room;
  final Function press;
  final Bill data;
  String getImageUrl(String url) {
    String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";
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
                      style: ElevatedButton.styleFrom(primary: kPrimaryColor,),
                      onPressed: () {
                        print('object');

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FormScreens(
                            id: "${data.id}",
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
                      child: Text('ยืนยันวันเข้าซ่อม'),
                    ),
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
