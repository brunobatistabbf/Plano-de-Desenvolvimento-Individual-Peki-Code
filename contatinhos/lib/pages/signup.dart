import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth.dart';
import '../pages/terms_priv.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _authController = Get.put(AuthController());

  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 155, 105, 255),
              Color.fromARGB(255, 180, 142, 255),
              Color.fromARGB(255, 220, 203, 255),
            ],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Get.back(); 
                },
              ),
            ),
            Center(
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
                      'Crie sua conta',
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
                        controller: _nomeController,
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 80, 76, 112)),
                          prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 80, 76, 112)),
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
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 80, 76, 112)),
                          prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 80, 76, 112)),
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
                        controller: _senhaController,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 80, 76, 112)),
                          prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 80, 76, 112)),
                          border: InputBorder.none,
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: _agreedToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreedToTerms = value ?? false;
                            });
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => TermsPage());
                          },
                          child: const Text(
                            'Li e concordo com os termos de uso e privacidade',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _agreedToTerms
                          ? () {
                              _authController.signup(
                                _nomeController.text,
                                _emailController.text,
                                _senhaController.text,
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 155, 105, 255),
                        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
