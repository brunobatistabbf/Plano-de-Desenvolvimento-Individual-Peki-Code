import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';
import '../models/contact.dart';

class AddContactPage extends StatelessWidget {
  final Contact? editingContact;

  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _telefoneController = TextEditingController();
  final ContactController _contactController = Get.find<ContactController>();

  AddContactPage({this.editingContact}) {
    if (editingContact != null) {
      _nomeController.text = editingContact!.nome;
      _descricaoController.text = editingContact!.descricao;
      _telefoneController.text = editingContact!.telefone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 155, 105, 255),
        title: Text(
          editingContact == null ? 'Adicionar Contato' : 'Editar Contato',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(_nomeController, 'Nome'),
            SizedBox(height: 16),
            _buildTextField(_descricaoController, 'Descrição'),
            SizedBox(height: 16),
            _buildTextField(_telefoneController, 'Telefone'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (editingContact == null) {
                  final contact = Contact(
                    id: 0, 
                    nome: _nomeController.text,
                    descricao: _descricaoController.text,
                    telefone: _telefoneController.text,
                  );
                  await _contactController.addContatinho(contact);
                } else {
                  final updatedContact = Contact(
                    id: editingContact!.id, 
                    nome: _nomeController.text,
                    descricao: _descricaoController.text,
                    telefone: _telefoneController.text,
                  );
                  await _contactController.updateContato(updatedContact);
                }
                
                Get.back(); 
              },
              child: Text(editingContact == null ? 'Adicionar' : 'Salvar'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 155, 105, 255),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Color.fromARGB(255, 80, 76, 112)),
          prefixIcon: Icon(
            labelText == 'Nome'
                ? Icons.person
                : labelText == 'Descrição'
                ? Icons.description
                : Icons.phone,
            color: Color.fromARGB(255, 80, 76, 112),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
      ),
    );
  }
}
