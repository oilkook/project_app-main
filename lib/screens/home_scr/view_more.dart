import 'package:flutter/material.dart';
import 'package:project_app/components/task_card.dart';
import 'package:project_app/configs/global.dart';
import 'package:project_app/providers/task_provider.dart';
import 'package:project_app/screens/home_scr/view_task_details_completed.dart';
import 'package:provider/provider.dart';

import 'view_task_details.dart';

class ViewMore extends StatefulWidget {
  final String title;
  final String type;
  ViewMore({Key key, this.type = "reported", this.title = "Reported"})
      : super(key: key);

  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary_background_color,
      appBar: AppBar(
        backgroundColor: primary_appbar_color,
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Flexible(child: listRender(context, widget.type)),
          ],
        ),
      ),
    );
  }

  Consumer<TaskProvider> listRender(BuildContext context, String type) {
    return Consumer<TaskProvider>(builder: (context, provider, child) {
      if (type == 'reported') {
        return ListView.builder(
          itemCount: provider.reported.length,
          itemBuilder: (context, index) {
            return TaskCard(
              callback: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ViewTaskDetails(task: provider.reported[index]),
                  )),
              imagePath: provider.reported[index].photo,
              date: provider.reported[index].date,
              time: provider.reported[index].time,
              name: provider.reported[index].repairname,
              room: provider.reported[index].roomnumber,
              dorm: provider.reported[index].dormitoryX,
            );
          },
        );
      } else if (type == 'confirmed') {
        return ListView.builder(
          itemCount: provider.confirmed.length,
          itemBuilder: (context, index) {
            return TaskCard(
              callback: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewTaskDetailsCompleted(
                        task: provider.confirmed[index]),
                  )),
              imagePath: provider.confirmed[index].photo,
              date: provider.confirmed[index].date,
              time: provider.confirmed[index].time,
              name: provider.confirmed[index].repairname,
              room: provider.confirmed[index].roomnumber,
              dorm: provider.confirmed[index].dormitoryX,
            );
          },
        );
      } else if (type == 'finished') {
        return ListView.builder(
          itemCount: provider.finished.length,
          itemBuilder: (context, index) {
            return TaskCard(
              callback: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewTaskDetailsCompleted(
                        task: provider.finished[index]),
                  )),
              imagePath: provider.finished[index].photo,
              date: provider.finished[index].date,
              time: provider.finished[index].time,
              name: provider.finished[index].repairname,
              room: provider.finished[index].roomnumber,
              dorm: provider.finished[index].dormitoryX,
            );
          },
        );
      } else {
        return Container();
      }
    });
  }
}
