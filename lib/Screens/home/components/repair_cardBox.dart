import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_app/Screens/details/details_screens.dart';
import 'package:project_app/actions/ActionGet.dart';
import 'package:project_app/constants.dart';
import 'package:project_app/model/bill.dart';
import 'package:project_app/notifications/notifications.dart';
import 'package:project_app/provider/HomePageProvider.dart';
import 'package:provider/provider.dart';

class RepairCardBox extends StatefulWidget {
  const RepairCardBox({
    Key key,
  }) : super(key: key);

  @override
  _RepairCardBoxState createState() => _RepairCardBoxState();
}

class _RepairCardBoxState extends State<RepairCardBox> {
  bool isLoad = true;
  String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";
  Timer _timer;
  final Notifications _notifications = Notifications();
  initialAction() async {
    setState(() {
      isLoad = false;
    });
  }

  @override
  void initState() {
    initialAction();

    super.initState();

    this._notifications.initNotifications();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, value, child) {
        return isLoad == true
            ? SpinKitPouringHourGlassRefined(color: Colors.orange)
            : value.requestedStatus.length > 0
                ? Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.requestedStatus.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.height / 4,
                          child: RepairCard(
                            data: value.requestedStatus[index],
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
                : Center(child: Text("No Requested Now"));
      },
    );
  }
}

class RepairCard extends StatelessWidget {
  const RepairCard({
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
          return DetailsScreen(
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
      ),
    );
  }
}
