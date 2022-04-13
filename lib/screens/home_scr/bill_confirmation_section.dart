import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_app/components/task_card.dart';
import 'package:project_app/configs/global.dart';
import 'package:project_app/providers/task_provider.dart';
import 'package:project_app/screens/home_scr/view_more.dart';
import 'package:project_app/screens/home_scr/view_task_details.dart';
import 'package:provider/provider.dart';

class BillConfirmationSection extends StatefulWidget {
  final isLoad;
  const BillConfirmationSection({Key key, this.isLoad = true})
      : super(key: key);

  @override
  State<BillConfirmationSection> createState() =>
      _BillConfirmationSectionState();
}

class _BillConfirmationSectionState extends State<BillConfirmationSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<TaskProvider>(builder: (context, provider, child) {
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
                    child: Text('Confirm', style: sectionHeader),
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
                                        title: "Confirmed", type: 'confirmed'),
                                  ));
                            },
                      child: Text('More' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w600 , letterSpacing: 0.75),),
                    ),
                  )
                ],
              ),
            ),
            !widget.isLoad
                ? Flexible(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.confirmed.length < 4 ? provider.confirmed.length : 4,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          callback: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewTaskDetails(task: provider.confirmed[index]),
                              )),
                          imagePath: provider.confirmed[index].photo,
                          date: provider.confirmed[index].date,
                          time: provider.confirmed[index].time,
                          name: provider.confirmed[index].repairname,
                          room: provider.confirmed[index].roomnumber,
                          dorm: provider.confirmed[index].dormitoryX,
                          
                        );
                      },
                    ),
                  )
                : Flexible(
                    child: Container(
                        child: SpinKitDoubleBounce(color: Colors.orange)),
                  )
          ],
        ),
      );
    });
  }
}
