import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_app/providers/task_provider.dart';
import 'package:project_app/screens/login_scr.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MaterialApp(home: LoginScreen()),
    );
  }
}
