import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_app/actions/action_google_sheet.dart';
import 'package:project_app/components/popup_loading.dart';
import 'package:project_app/configs/global.dart';
import 'package:project_app/models/repair_request.dart';
import 'package:project_app/providers/task_provider.dart';
import 'package:project_app/utils/line_notify.dart';
import 'package:project_app/utils/utils.dart';
import 'package:intl/intl.dart' as initl;
import 'package:provider/provider.dart';

class ViewTaskDetails extends StatelessWidget {
  final RepairRequest task;
  const ViewTaskDetails({Key key, this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var format = initl.DateFormat.yMEd();

    TextStyle boldText = TextStyle(fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: primary_background_color,
      appBar: AppBar(
          backgroundColor: primary_appbar_color,
          elevation: 0,
          title: Text('Order #${task.id}')),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width / 2,
                height: size.width / 2,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: Utils.getImageUrlFormat(task.photo),
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          SpinKitFadingFour(color: Colors.orange),
                    )),
              ),
            ],
          ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Order Details',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.75),
                        ),
                      ],
                    ),
                    Row(
                      children: [Expanded(child: Divider())],
                    ),
                    Row(
                      children: [
                        Text(
                          "Ready To Service",
                          style: boldText,
                        ),
                        Spacer(),
                        Text(
                            "${format.format(DateTime.parse(task.date))} ${task.time}"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dormitory",
                              style: boldText,
                            ),
                            Text("- ${task.dormitoryX}"),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Room Number", style: boldText),
                            Text("- ${task.roomnumber}")
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Item, List',style: boldText,),
                    Row(
                      children: [
                        Expanded(child: Text("- ${task.list} ")),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Details",
                              style: boldText,
                            ),
                            Text("- ${task.details} "),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.grey[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width - 40,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orangeAccent[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                      ),
                      onPressed: task.msg == "0"
                          ? () async {
                              final provider = Provider.of<TaskProvider>(
                                  context,
                                  listen: false);
                              Loading.showPopUp(context);

                              final res = await ActionGoogleSheet.editStatus(
                                  id: task.id, status: "1");

                              if (res) {
                                LineNotify.send(
                                    message:
                                        "${task.dormitoryX} - ${task.roomnumber} repair request has been Confirm.");
                                await provider.loadTask();
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }
                            }
                          : null,
                      child: Text('Confirm',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.25))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
