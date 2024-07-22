import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/home.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: LoginPage(),
    );
  }
}