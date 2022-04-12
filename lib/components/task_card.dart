import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String imagePath;
  final String date;
  final String time;
  final String name;
  final String room;
  const TaskCard({
    Key key,
    this.imagePath = "",
    @required this.date,
    @required this.time,
    @required this.name,
    @required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 1.5,
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              : Container(),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$date'),
                Text('$time'),
                Text('$name'),
                Text('$room'),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
