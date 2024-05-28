import 'package:flutter/material.dart';
import 'package:lifeline/widgets/custom_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeLine',
      theme: ThemeData(
        // This is the theme of the application.
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 183, 0, 0)),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: _checkIfLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.data == true) {
            return CustomTabScaffold();
          } else {
            return Login();
          }
        },
      ),
    );
  }  
  
  Future<bool> _checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

}