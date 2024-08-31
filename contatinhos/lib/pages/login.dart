import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth.dart';
import 'signup.dart';

class Login extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _authController.login(
                    _usernameController.text,
                    _passwordController.text,
                  );
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Get.to(Signup()); 
                },
                child: Text('Não tem uma conta? Cadastre-se aqui'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

