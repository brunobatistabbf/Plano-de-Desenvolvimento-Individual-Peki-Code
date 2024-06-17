import 'package:flutter/material.dart';
import 'package:pdi/home_controller.dart';

// class HomeWidget extends StatelessWidget{
//   const HomeWidget({super.key});

//   @override
//   Widget build(BuildContext context) {

//     var controller = HomeController.of(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Peki Code"),
//         backgroundColor: Color.fromRGBO(255, 0, 0, 0.612),
//       ),
//       body: Center(
//         child: Text("Peki Code ${controller.value}")
//         ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Color.fromRGBO(255, 0, 0, 0.612),
//         onPressed: (){
//           controller.increment();
//         }),
//     );
//   }

// }

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
  return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peki Code"),
        backgroundColor: Color.fromRGBO(255, 106, 0, 0.966),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
            return Container(
              margin: const EdgeInsets.all(12),
              width: double.infinity,
              height: 90,
              color: Colors.orange,
            );
          },
          //SingleChildScrollView(
        //child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center , //alinhamento cruzado
          //  children: [
          //   for(var i = 0; i < 10; i++)
          //   Container(
          //     margin: const EdgeInsets.all(12),
          //     width: double.infinity,
          //     height: 90,
          //     color: Colors.orange,
          //   ),
          //],
        ),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(255, 106, 0, 0.966),
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            counter++;
          });
        }),
    );
  }

}