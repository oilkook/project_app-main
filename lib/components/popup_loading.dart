import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading {
  static showPopUp(BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
              child: Container(
                  width: size.width / 3,
                  height: size.width / 3,
                  child: Column(
                    children: [
                      Spacer(),
                      SpinKitDoubleBounce(
                        color: Colors.orangeAccent[700],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Loading'),
                      Spacer(),
                    ],
                  )),
            ));
  }
}
