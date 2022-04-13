import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_app/utils/utils.dart';
import 'package:intl/intl.dart' as initl;

class TaskCard extends StatelessWidget {
  final String imagePath;
  final String date;
  final String time;
  final String name;
  final String room;
  final String dorm;
  final VoidCallback callback;
  const TaskCard({
    Key key,
    this.imagePath = "",
    @required this.date,
    @required this.time,
    @required this.name,
    @required this.room,
    @required this.dorm,
    @required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var format = initl.DateFormat.yMMM();
    return GestureDetector(
      onTap: callback,
      child: SizedBox(
        width: size.width / 1.5,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            imagePath.length == 0
                ? Center(
                    child: Container(
                      width: size.width / 3,
                      height: size.width / 3,
                      color: Colors.blue,
                    ),
                  )
                : Center(
                    child: Container(
                      color: Colors.grey[100],
                      width: size.width / 3,
                      height: size.width / 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                            placeholder: (context, url) => SpinKitFadingFour(
                                  color: Colors.orange,
                                ),
                            fit: BoxFit.cover,
                            imageUrl: Utils.getImageUrlFormat(imagePath)),
                      ),
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${format.format(DateTime.parse(date))} $time'),
                    ],
                  ),
                  Text('$name',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.75,
                          fontSize: 14)),
                  Text('$dorm',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.75,
                          fontSize: 14)),
                  Text('Rm. $room',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.75,
                          fontSize: 14)),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
