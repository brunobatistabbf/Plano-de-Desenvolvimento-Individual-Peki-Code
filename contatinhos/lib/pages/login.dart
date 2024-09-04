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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255,155, 105, 255),
              Color.fromARGB(255, 180, 142, 255),
              Color.fromARGB(255, 220, 203, 255),
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 40, 
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 6),
                const Text(
                  'Acesse sua conta',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 150, 150, 150),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 80, 76, 112)),
                      prefixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 80, 76, 112)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 80, 76, 112)),
                      prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 80, 76, 112)),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    _authController.login(
                      _usernameController.text,
                      _passwordController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,155, 105, 255),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                TextButton(
                  onPressed: () {
                    Get.to(Signup());
                  },
                  child: const Text('Cadastre-se aqui'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}