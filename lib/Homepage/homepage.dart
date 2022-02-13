import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_app/Homepage/repairconfirm.dart';
import 'package:project_app/Homepage/menu_Item.dart';
import 'package:project_app/account/Account.dart';
import 'package:project_app/actions/ActionGet.dart';
import 'package:project_app/main.dart';
import 'package:project_app/model/bill.dart';
import 'package:project_app/notifications/notifications.dart';
import 'package:project_app/settings/Settings.dart';
import 'package:project_app/widget/MyItem.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  bool isLoad = true;
  List<Bill> myData = [];
  List<Bill> requestedStatus = [];
  List<Bill> repairConfirm = [];
  final bool isSidebarOpened = false;
  final _animationDuration = const Duration(milliseconds: 500);

  String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";

  Timer _timer;

  final Notifications _notifications = Notifications();

  initialAction() async {
    final List<Bill> res = await ActionGet.getSheetData();
    print("res ----> ${res.runtimeType}");

    res.sort(
        (Bill a, Bill b) => b.informationDate.compareTo(a.informationDate));

    print(res.toString());
    final List<Bill> msg_0 =
        res.where((element) => element.msg == "0").toList();
    final List<Bill> msg_1 =
        res.where((element) => element.msg == "1").toList();

    setState(() {
      requestedStatus = msg_0;
      repairConfirm = msg_1;
      isLoad = false;
    });
  }

  @override
  void initState() {
    initialAction();
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      initialAction();
    });

    super.initState();

    this._notifications.initNotifications();
  }

  void _pushNotification() {
    this._notifications.pushNotification();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('RepairMan Apps'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                tooltip: 'Search',
                onPressed: () {
                  print('search');
                },
              ),
            ],
            bottom: TabBar(tabs: [
              // Tab(text: 'ใบแจ้งซ่อม'),
              GestureDetector(
                child: Tab(text: 'ใบแจ้งซ่อม'),
                onTap: () => initialAction(),
              ),
              GestureDetector(
                child: Tab(
                  text: 'รายการเข้าซ่อม',
                ),
                onTap: () => initialAction(),
              )
            ]),
          ),
          drawer: Drawer(
            child: AnimatedPositioned(
              duration: _animationDuration,
              top: 0,
              bottom: 0,
              left: isSidebarOpened ? 0 : 0,
              right: isSidebarOpened ? 0 : screenWidth - 45,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      color: Colors.blue,
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(
                                    "Oilkook",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  subtitle: Text(
                                    "S6135512017@phuket.psu.ac.th",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    print('Home');
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HomePage();
                                    }));
                                  },
                                  child: MenuItem(
                                    icon: Icons.home,
                                    title: "Home",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    print('account');
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Account();
                                    }));
                                  },
                                  child: MenuItem(
                                    icon: Icons.person,
                                    title: "Account",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    print('Settings');
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Settings();
                                    }));
                                  },
                                  child: MenuItem(
                                    icon: Icons.settings,
                                    title: "Settings",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    SystemNavigator.pop();
                                  },
                                  child: MenuItem(
                                    icon: Icons.logout,
                                    title: "Logout",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Container(
                      width: 0,
                      height: 0,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              isLoad == true
                  ? SpinKitPouringHourGlassRefined(color: Colors.blue)
                  : requestedStatus.length > 0
                      ? ListView.builder(
                          itemCount: requestedStatus.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return MyItem(
                              data: requestedStatus[index],
                            );
                          },
                        )
                      : Center(child: Text("No Requested Now")),
              isLoad == true
                  ? SpinKitPouringHourGlassRefined(color: Colors.blue)
                  : repairConfirm.length > 0
                      ? ListView.builder(
                          itemCount: repairConfirm.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return RepairConfirm(
                              data: repairConfirm[index],
                            );
                          },
                        )
                      : Center(child: Text("No RequestedConfirm Now")),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _pushNotification,
            tooltip: 'Push notifications',
            child: Icon(Icons.notifications),
          ),
        ),
      ),
    );
  }
}
