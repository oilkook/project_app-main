import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_app/Screens/home/components/body.dart';
import 'package:project_app/actions/ActionSheet.dart';
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
    return Scaffold(
        backgroundColor: Colors.orange[100],

        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.notifications_active_outlined, color: Colors.white),
            onPressed: () {
              print('Notifications');
            },
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

        body: 
        
        SmartRefresher(
          onRefresh: _onRefresh,
          enablePullDown: true,
          enablePullUp: true,
          controller: _controller,
          child: Body(),
        )
        
        
        )
        
        ;
  }
}
