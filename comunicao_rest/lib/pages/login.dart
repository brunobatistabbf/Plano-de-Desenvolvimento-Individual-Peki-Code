import 'package:comunicao_rest/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'home.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController =  TextEditingController();
  final _apiService = ApiService();
  bool _isLoading = false;


  Future<void> _login() async{
    setState(() {
      _isLoading = true;
    });
  

    final username = _usernameController.text;
    final user = await _apiService.login(username);

    setState(() {
      _isLoading = false;
    });

    if (user != null){
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('userID', user.id);
      await prefs.setString('username', user.username);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage() )); 
    } else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Usuário Inválido!")));
    };
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 20),
            _isLoading
              ? CircularProgressIndicator() : ElevatedButton(onPressed: _login, child: Text('Login'),
              ),
          ],
        ),
        
        ),
    );
  }
}
