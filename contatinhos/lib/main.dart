import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/login.dart';
import './pages/signup.dart';
import './pages/home.dart';
import './pages/contact.dart';
import './pages/add_contact.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return GetMaterialApp(
    title: 'Contatinhos App',
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => Login()),
    ],
  );
  }
}