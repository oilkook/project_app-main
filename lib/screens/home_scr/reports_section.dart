import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_app/components/task_card.dart';
import 'package:project_app/configs/global.dart';
import 'package:project_app/providers/task_provider.dart';
import 'package:project_app/screens/home_scr/view_more.dart';
import 'package:project_app/screens/home_scr/view_task_details.dart';
import 'package:provider/provider.dart';

class ReportSection extends StatefulWidget {
  final bool isLoad;
  const ReportSection({Key key, this.isLoad = true}) : super(key: key);

  @override
  State<ReportSection> createState() => _ReportSectionState();
}

class _ReportSectionState extends State<ReportSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<TaskProvider>(builder: (
      context,
      provider,
      child,
    ) {
      return Container(
        height: size.height * 0.45,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical : 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text('การแจ้งซ่อม', style: sectionHeader),
                  ),
                  SizedBox(
                    width: 125,
                    child: ElevatedButton(
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
                                        title: "การแจ้งซ่อม", type: 'reported'),
                                  ));
                            },
                      child: Text('เพิ่มเติม',style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w600 , letterSpacing: 0.75)),
                    ),
                  )
                ],
              ),
            ),
            !widget.isLoad
                ? Flexible(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.reported.length < 4 ? provider.reported.length : 4,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          callback: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewTaskDetails(task: provider.reported[index]),
                              )),
                          imagePath: provider.reported[index].photo,
                          date: provider.reported[index].date,
                          time: provider.reported[index].time,
                          name: provider.reported[index].repairname,
                          room: provider.reported[index].roomnumber,
                          dorm: provider.reported[index].dormitoryX,
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
