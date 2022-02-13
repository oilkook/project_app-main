// import 'package:flutter/material.dart';

// class SettingsPage extends StatefulWidget {
//   const SettingsPage({Key key}) : super(key: key);

//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SETTINGS'),
//       ),
//       body: SafeArea(
//         child: ListView(
//           padding: EdgeInsets.all(24),
//           children: [
//             SettingsGroup(
//               title: 'GENERAL',
//               children: <Widget>[
//                 buildLogout(),
//                 buildDarkMode(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildLogout() => SimpleSettingsTite(
//       leading: IconWidget(
//         icon: Icons.logout,
//         color: Colors.blueAccent,
//       ),
//       title: 'Logout',
//       subtitle: '',
//       onTap: () { /* logout() */},
//   );

//   Widget buildAccount() => SimpleSettingsTite(
//       leading: IconWidget(
//         icon: Icons.person,
//         color: Colors.green,
//       ),
//       title: 'Account Settings',
//       subtitle: 'Privacy, Security, Language',
//       child: Container(),
//       onTap: () { /* NOOP */},
//   );

//   Widget buildDarkMode() => SwitchSettingsTitle(
//       settingKey: keyDarkMode,
//       leading: IconWidget(
//         icon: Icons.dark_mode,
//         color: Colors.white,
//       ),
//       title: 'Dark Mode',
//       onChange: (isDarkMode) { /* NOOP */},
//   );

//   Widget buildLanguage() => DropDoenSettingsTitle(
//       settingKey: keyLanguage,
//       title: 'Language',
//       selevted: 1,
//       values: <int, String>{
//         1: 'English',
//         2: 'Thai',
//         3: 'Chinese',
//       },
//       onChange: (language) { /* NOOP */},
//   );

// }
