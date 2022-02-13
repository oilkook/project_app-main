import 'package:flutter/material.dart';
import 'package:project_app/Homepage/homepage.dart';
import 'package:project_app/Screens/details/components/confirm_repair_card_more.dart';
import 'package:project_app/Screens/details/components/repair_card_more.dart';
import 'package:project_app/Screens/home/components/confirm_repair_cardBox.dart';
import 'package:project_app/Screens/home/components/header_with_Box.dart';
import 'package:project_app/Screens/home/components/repair_cardBox.dart';
import 'package:project_app/Screens/home/components/title_with_morebox.dart';
import 'package:project_app/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithBox(size: size),
          TitleWithMoreBth(
            title: 'ใบแจ้งซ่อม',
            press: () {
              print('ใบแจ้งซ่อมทั้งหมด');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MoreRepair(),
                ),
              );
            },
          ),
          RepairCardBox(),
          TitleWithMoreBth(
              title: 'ยืนยันเข้าซ้อม',
              press: () {
                print('ใบยืนยันเข้าซ่อมทั้งหมด');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoreConfirm(),
                  ),
                );
              }),
          ConfirmRepairCardBox(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
