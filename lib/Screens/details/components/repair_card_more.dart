import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_app/Screens/details/details_screens.dart';
import 'package:project_app/Screens/form_screens.dart';
import 'package:project_app/actions/ActionGet.dart';
import 'package:project_app/model/bill.dart';
import 'package:project_app/notifications/notifications.dart';

class MoreRepair extends StatefulWidget {
  const MoreRepair({Key key}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<MoreRepair> {
  bool isLoad = true;
  List<Bill> myData = [];
  List<Bill> requestedStatus = [];
  List<Bill> repairConfirm = [];
  String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";

  final Notifications _notifications = Notifications();
  initialAction() async {
    final List<Bill> res = await ActionGet.getSheetData();
    print("res => ${res.runtimeType}");

    res.sort(
        (Bill a, Bill b) => b.informationDate.compareTo(a.informationDate));
    print(res.toString());
    final List<Bill> msg_0 =
        res.where((element) => element.msg == "0").toList();
    final List<Bill> msg_1 =
        res.where((element) => element.msg == "1").toList();

    setState(() {
      requestedStatus = msg_0;
      repairConfirm = msg_1;
      isLoad = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialAction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text('ใบแจ้งซ่อมทั้งหมด'),
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isLoad == true
          ? SpinKitPouringHourGlassRefined(color: Colors.orange)
          : requestedStatus.length > 0
              ? Container(
                  child: ListView.builder(
                    itemCount: requestedStatus.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.height,
                        child: RepairMore(
                          data: requestedStatus[index],
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
              : Center(child: Text("No Requested Now")),
    );
  }
}

class RepairMore extends StatelessWidget {
  const RepairMore({
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
