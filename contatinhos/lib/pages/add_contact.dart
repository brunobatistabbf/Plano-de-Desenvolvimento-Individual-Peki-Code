import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';
import '../models/contact.dart';
import '../pages/home.dart';

class AddContactPage extends StatelessWidget {
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _contactController = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: _telefoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final contact = Contact(
                  nome: _nomeController.text,
                  descricao: _descricaoController.text,
                  telefone: _telefoneController.text,
                );
                _contactController.addContatinho(contact);
                Get.offAll(() => HomeScreen());
              },
              child: Text('Add Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
