import 'package:flutter/material.dart';
import 'package:project_app/configs/global.dart';
import 'package:project_app/providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as initl;

class ViewHistory extends StatefulWidget {
  const ViewHistory({Key key}) : super(key: key);

  @override
  State<ViewHistory> createState() => _ViewHistoryState();
}

class _ViewHistoryState extends State<ViewHistory> {
  var format = initl.DateFormat.yMMM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary_background_color,
      appBar: AppBar(
        backgroundColor: primary_appbar_color,
        elevation: 0,
        title: Text("History"),
      ),
      body: Consumer<TaskProvider>(
        builder: ((context, value, child) {
          return ListView.builder(
            itemCount: value.history.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${format.format(DateTime.parse(value.history[index].date))} ${value.history[index].time}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("${value.history[index].dormitoryX}"),
                          Text("ห้อง :${value.history[index].roomnumber}"),
                          Text(
                            "${value.history[index].msg == "2" ? "Finish" : "cancel"}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
              );
            },
          );
        }),
      ),
    );
  }
}
