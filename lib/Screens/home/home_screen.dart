import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_app/Screens/home/components/body.dart';
import 'package:project_app/Screens/noti/latest_noti.dart';
import 'package:project_app/actions/ActionGet.dart';
import 'package:project_app/actions/ActionSheet.dart';
import 'package:project_app/constants.dart';
import 'package:project_app/login/LoginPage.dart';
import 'package:project_app/provider/HomePageProvider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RefreshController _controller = RefreshController(initialRefresh: false);
  @override
  void initState() {
    initialAction();

    super.initState();
  }

  initialAction() async {

    ActionGet.getSheetData(context: context);
    final provider = Provider.of<HomePageProvider>(context, listen: false);
    provider.fetchRequestStatus();
    provider.fetchConfirmStatus();
    
    print('complete ${provider.requestedStatus}');
  }

  _onRefresh() async {
    await initialAction();

    _controller.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(builder: (context, provider, child) {
      return Scaffold(
          backgroundColor: Colors.orange[100],
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 0,
            leading: Stack(
              children: [
                Positioned(
                  top: 5,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.red[900],
                      radius: 10,
                      child: Text(
                        '${provider.noti_count}',
                        style: TextStyle(fontSize: 12),
                      )),
                ),
                IconButton(onPressed: () async {

                  provider.clearCount();
                  await Navigator.push(context, MaterialPageRoute(builder: (context) => LatestNoti(),));
                  
                }, icon: Icon(Icons.notifications)),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.logout_rounded, color: Colors.white),
                tooltip: 'Log Out',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                  print('Logout');
                },
              ),
            ],
          ),
          // body: Body(),

          body: SmartRefresher(
            onRefresh: _onRefresh,
            enablePullDown: true,
            enablePullUp: true,
            controller: _controller,
            child: Body(),
          ));
    });
  }
}
