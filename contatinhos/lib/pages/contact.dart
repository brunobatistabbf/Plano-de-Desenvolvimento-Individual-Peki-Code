import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactPage extends StatelessWidget {
  final Contact contact;

  ContactPage(this.contact, {required List<Contact> contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Descrição: ${contact.descricao}'),
            Text('Telefone: ${contact.telefone}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Edit Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
