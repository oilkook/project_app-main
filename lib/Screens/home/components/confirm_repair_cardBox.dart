import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_app/Screens/details/details_confirm_screen.dart';
import 'package:project_app/actions/ActionGet.dart';
import 'package:project_app/constants.dart';
import 'package:project_app/model/bill.dart';
import 'package:project_app/notifications/notifications.dart';
import 'package:project_app/view/CheckList.dart';

class ConfirmRepairCardBox extends StatefulWidget {
  const ConfirmRepairCardBox({Key key}) : super(key: key);

  @override
  _ConfirmRepairCardBoxState createState() => _ConfirmRepairCardBoxState();
}

class _ConfirmRepairCardBoxState extends State<ConfirmRepairCardBox> {
  bool isLoad = true;
  List<Bill> myData = [];
  List<Bill> requestedStatus = [];
  List<Bill> repairConfirm = [];
  String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";
  Timer _timer;
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
    initialAction();
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      initialAction();
    });

    super.initState();

    this._notifications.initNotifications();
  }

  void _pushNotification() {
    this._notifications.pushNotification();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return isLoad == true
        ? SpinKitPouringHourGlassRefined(color: Colors.orange)
        : repairConfirm.length > 0
            ? Container(
                height: MediaQuery.of(context).size.height / 3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: repairConfirm.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.height / 4,
                      child: ConfirmRepairCard(
                        data: repairConfirm[index],
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsConfirmScreen(),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            : Center(child: Text("No RequestedConfirm Now"));
  }
}

class ConfirmRepairCard extends StatelessWidget {
  const ConfirmRepairCard({
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
        onTap: () {
          print('object');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
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
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(children: [
                Expanded(
                  child: Container(
                      child: CachedNetworkImage(
                    placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    )),
                    fit: BoxFit.fill,
                    imageUrl: getImageUrl('${data.photo}'),
                  )),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${DateTime.parse(data.informationDate).toLocal().day}/${DateTime.parse(data.informationDate).toLocal().month}/${DateTime.parse(data.informationDate).toLocal().year}',
                        style: Theme.of(context).textTheme.button,
                      ),
                      Text(
                          'เวลา ${DateTime.parse(data.informationDate).toLocal().hour}:${DateTime.parse(data.informationDate).toLocal().minute} น.'),
                      Text('ชื่อ ${data.repairname.toUpperCase()}'),
                      Text('${data.dormitoryX} ห้อง ${data.roomnumber}'),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
