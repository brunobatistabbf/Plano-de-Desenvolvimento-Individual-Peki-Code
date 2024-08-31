import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/login.dart';
import './pages/home.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Contatinhos App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Login()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}
