import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_app/Screens/details/details_confirm_screen.dart';
import 'package:project_app/actions/ActionGet.dart';
import 'package:project_app/constants.dart';
import 'package:project_app/model/bill.dart';
import 'package:project_app/notifications/notifications.dart';
import 'package:project_app/provider/HomePageProvider.dart';
import 'package:project_app/view/CheckList.dart';
import 'package:provider/provider.dart';

class ConfirmRepairCardBox extends StatefulWidget {
  const ConfirmRepairCardBox({Key key}) : super(key: key);

  @override
  _ConfirmRepairCardBoxState createState() => _ConfirmRepairCardBoxState();
}

class _ConfirmRepairCardBoxState extends State<ConfirmRepairCardBox> {
  bool isLoad = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, value, child) {
        return isLoad == false
            ? SpinKitPouringHourGlassRefined(color: Colors.orange)
            : value.repairConfirm.length > 0
                ? Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.repairConfirm.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.height / 4,
                          child: ConfirmRepairCard(
                            data: value.repairConfirm[index],
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
      },
    );
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
