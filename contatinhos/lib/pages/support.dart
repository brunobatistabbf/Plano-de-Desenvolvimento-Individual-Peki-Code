import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _mensagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 155, 105, 255),
        title: Text(
          'Suporte',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(_nomeController, 'Nome', Icons.person),
            SizedBox(height: 16),
            _buildTextField(_emailController, 'Email', Icons.email),
            SizedBox(height: 16),
            _buildTextField(_mensagemController, 'Mensagem', Icons.message, maxLines: 3),
            SizedBox(height: 18),
            Center(
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 155, 105, 255),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text('Enviar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, IconData iconData, {int? maxLines}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Color.fromARGB(255, 80, 76, 112)),
          prefixIcon: Icon(
            iconData,
            color: Color.fromARGB(255, 80, 76, 112),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
      ),
    );
  }
}

