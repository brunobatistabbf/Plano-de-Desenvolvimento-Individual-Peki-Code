import 'package:contatinhos/pages/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';

class Home extends StatelessWidget {
  final _contatinhosController = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatinhos'),
        actions: [
          IconButton(
          icon: Icon(Icons.add),
          onPressed: (){
            Get.to(createContato());
          },
          )
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount:  _contatinhosController.contatinhosList.length,
          itemBuilder: (context, index){
            final contatinho = _contatinhosController.contatinhosList[index];
            return ListTile(
              title:  Text(contatinho.nome ?? ''),
              subtitle: Text(contatinho.telefone ?? ''),
              onTap: (){

              },
            );
          },
          );
      },),
    );
  }
  
}