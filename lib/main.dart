import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(VisitorProApp());
}

class VisitorProApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VisitorPro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}