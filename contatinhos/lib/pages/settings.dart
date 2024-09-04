import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/support.dart';
import '../controllers/auth.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  File? _profileImage;
  final AuthController _authController = Get.put(AuthController());
  String? _userEmail;

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  Future<void> _loadUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userEmail = prefs.getString('email');
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : AssetImage("assets/default_profile.png") as ImageProvider,
              ),
            ),
            SizedBox(height: 10),
            Text(
              _userEmail ?? "email@usuario.com",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            ListTile(
              title: Text("Suporte"),
              leading: Icon(Icons.support_agent),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SupportPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("Sair"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                _authController.logout();  
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
