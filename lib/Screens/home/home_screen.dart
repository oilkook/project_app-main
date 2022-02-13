import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_app/Screens/home/components/body.dart';
import 'package:project_app/login/LoginPage.dart';

class HomeScreen extends StatelessWidget {
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
      body: Body(),
    );
  }
}
