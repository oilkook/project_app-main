import 'package:flutter/material.dart';
import 'package:project_app/configs/global.dart';
import 'package:project_app/providers/task_provider.dart';
import 'package:project_app/screens/home_scr/bill_confirmation_section.dart';
import 'package:project_app/screens/home_scr/finished_section.dart';
import 'package:project_app/screens/home_scr/reports_section.dart';
import 'package:project_app/screens/home_scr/view_more.dart';
import 'package:project_app/screens/login_scr.dart';
import 'package:project_app/utils/auth.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'home_scr/view_history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RefreshController refreshController = RefreshController();
  bool isLoad = true;

  initialAction() async {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    await provider.loadTask();
    setState(() {
      isLoad = false;
    });
  }

  onRefresh() async {
    setState(() {
      isLoad = true;
    });
    final provider = Provider.of<TaskProvider>(context, listen: false);
    await provider.loadTask();
    setState(() {
      isLoad = false;
    });
    refreshController.refreshCompleted();
  }

  @override
  void initState() {
    initialAction();
    super.initState();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondary_background_color,
      appBar: AppBar(
        backgroundColor: primary_appbar_color,
        elevation: 0,
        title: Row(children: [
          // Badge(
          //   badgeContent: Text('3', style: TextStyle(color: Colors.white)),
          //   child: Icon(Icons.notifications),
          // ),
          IconButton(
              onPressed: () {
                print('history_completed');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewHistory(),
                    ));
              },
              icon: Icon(Icons.history)),
          Spacer(),
          IconButton(
              onPressed: () {
                Auth.signOut(context, LoginScreen());
              },
              icon: Icon(Icons.logout))
        ]),
      ),
      body: SmartRefresher(
        controller: refreshController,
        onRefresh: onRefresh,
        child: taskSection(size),
      ),
    );
  }

  ListView taskSection(Size size) {
    return ListView(
      children: [
        AppBar(
          backgroundColor: primary_appbar_color,
          elevation: 0,
          toolbarHeight: size.height / 6,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          title: Row(
            children: [
              Expanded(child: Text('Repair Service')),
              Image.asset(
                'assets/images/repair_icon.png',
                width: size.height / 10,
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ReportSection(isLoad: isLoad),
        BillConfirmationSection(isLoad: isLoad),
        // FinishedSection(isLoad: isLoad),
      ],
    );
  }
}
