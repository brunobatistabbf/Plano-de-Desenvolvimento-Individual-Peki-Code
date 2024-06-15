import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeWidget(),
    );
  }

}

class HomeWidget extends StatelessWidget{
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peki Code"),
        backgroundColor: Color.fromRGBO(255, 55, 55, 0.612),
      ),
      body: Center(
        child: Text("Peki Code")
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(255, 0, 0, 0.612),
        onPressed: (){
          print("Clicou");
        }),
    );
  }

}