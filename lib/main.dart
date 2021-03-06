import 'package:flutter/material.dart';
import 'package:tontonin/UI/home/home.dart';
import 'package:tontonin/UI/login_page.dart';

// import 'package:tontonin/UI/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tontonin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
