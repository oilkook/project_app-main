import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_app/components/task_card.dart';
import 'package:project_app/configs/global.dart';
import 'package:project_app/providers/task_provider.dart';
import 'package:project_app/screens/home_scr/view_more.dart';
import 'package:provider/provider.dart';

import 'view_task_details.dart';

class FinishedSection extends StatefulWidget {
  final bool isLoad;
  const FinishedSection({Key key, this.isLoad = true}) : super(key: key);

  @override
  State<FinishedSection> createState() => _FinishedSectionState();
}

class _FinishedSectionState extends State<FinishedSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<TaskProvider>(builder: (
      context,
      provider,
      child,
    ) {
      return Container(
        height: size.height * 0.40,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('Finish', style: sectionHeader),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.orangeAccent[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: widget.isLoad
                      ? null
                      : () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewMore(
                                    title: "Finished", type: 'finished'),
                              ));
                        },
                  child: Text('เพิ่มเติม'),
                )
              ],
            ),
            !widget.isLoad
                ? Flexible(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.finished.length < 4 ? provider.finished.length : 4,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          callback: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewTaskDetails(task: provider.finished[index]),
                              )),
                          imagePath: provider.finished[index].photo,
                          date: provider.finished[index].date,
                          time: provider.finished[index].time,
                          name: provider.finished[index].repairname,
                          room: provider.finished[index].roomnumber,
                          dorm: provider.finished[index].dormitoryX,
                        );
                      },
                    ),
                  )
                : Flexible(
                    child: Container(
                    child: SpinKitDoubleBounce(color: Colors.orange),
                  )),
          ],
        ),
      );
    });
  }
}
