import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_app/components/task_card.dart';

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
    return Container(
      height: size.height * 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Confirm'),
              ),
              ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.orangeAccent[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: widget.isLoad ? null : () {},
                child: Text('More'),
              )
            ],
          ),
          !widget.isLoad
              ? Flexible(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return TaskCard(
                          date: "1/1/3",
                          time: "14:30",
                          name: "task ${index + 1}",
                          room: "10$index");
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
  }
}
