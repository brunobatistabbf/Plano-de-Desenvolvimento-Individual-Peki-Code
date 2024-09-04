import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/contact.dart';
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
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _navigateToAddContactPage() async {
    final result = await Get.to(() => AddContactPage());
    if (result == true) {
      _contactController.fetchContatinhos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 155, 105, 255),
        title: Text(
          'Contatinhos',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: _navigateToAddContactPage,
              backgroundColor: Color.fromARGB(255, 155, 105, 255),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts, size: 32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 32),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 155, 105, 255),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        elevation: 8,
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  final ContactController _contactController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_contactController.contatinhosList.isEmpty) {
        return Center(child: Text('Nenhum contatinho...'));
      }
      return ListView.separated(
        itemCount: _contactController.contatinhosList.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[400],
        ),
        itemBuilder: (context, index) {
          final contatinho = _contactController.contatinhosList[index];
          return ListTile(
            title: Text(
              contatinho.nome,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contatinho.descricao),
                Text(contatinho.telefone),
              ],
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'Editar') {
                  _navigateToEditContactPage(contatinho);
                } else if (value == 'Excluir') {
                  _contactController.deleteContato(contatinho);
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'Editar',
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Editar'),
                  ),
                ),
                PopupMenuItem(
                  value: 'Excluir',
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Excluir'),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Future<void> _navigateToEditContactPage(Contact contact) async {
    final result = await Get.to(() => AddContactPage(editingContact: contact));
    if (result == true) {
      _contactController.fetchContatinhos();
    }
  }

  
}
