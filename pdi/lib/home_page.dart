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
        title: Text("Analytics"),
        titleTextStyle: TextStyle(color: Colors.blueGrey),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.965),
      ),
       body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              'https://nordicapis.com/wp-content/uploads/5-KPIs-for-API-Platform-Engineering.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color:  Colors.black.withOpacity(0.75),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ],
        // Center(
        //   child: ListView.builder(
        //     itemCount: 10,
        //     itemBuilder: (context, index){
        //       return Container(
       //         margin: const EdgeInsets.all(12),
        //         width: double.infinity,
        //         height: 90,
        //         color: Colors.orange,
        //       );
        //     },
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
      );

  }

}