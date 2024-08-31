import 'package:contatinhos/models/contact.dart';
import 'package:contatinhos/pages/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';
import 'add_contact.dart';
import 'settings.dart';  

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ContactController _contactController = Get.put(ContactController());
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    ContactList(), 
    Container(),  
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatinhos'),
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0 
          ? FloatingActionButton(
              onPressed: () {
                Get.to(() => AddContactPage());
              },
              child: Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contatos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  final ContactController _contactController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: _contactController.contatinhosList.length,
        itemBuilder: (context, index) {
          final contatinho = _contactController.contatinhosList[index];
          return ListTile(
            title: Text(contatinho.nome),
            subtitle: Text(contatinho.telefone),
            onTap: () {
              Get.to(ContactPage(
                contatinho,
                contacts: _contactController.contatinhosList,
              ));
            },
          );
        },
      );
    });
  }
}