import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/contact.dart';

class ApiService {
  final String baseUrl = 'http://191.252.222.51';

  Future<String?> login(String email, String senha) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'email': email,
        'senha': senha,
      }),
    );

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return responseBody['token']; 
    } else {
      return null;
    }
  }



  Future<bool> signup(String nome, String email, String senha) async {
    final response = await http.post(
      Uri.parse('$baseUrl/usuario'),
      headers: {
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'nome': nome,
        'email': email,
        'senha': senha,
      }),
    );
    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response.statusCode == 200;
  }


  Future<List<Contact>?> getContatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('$baseUrl/contatinhos'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Contact.fromJson(json)).toList();
    }
    return null;
  }

  Future<void> createContato(Contact contact) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    await http.post(
      Uri.parse('$baseUrl/contatinhos'),
      headers: {'Authorization': 'Bearer $token'},
      body: contactToJson(contact),
    );
  }

  Future<void> updateContato(Contact contact) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    await http.put(
      Uri.parse('$baseUrl/contatinhos/${contact.telefone}'),
      headers: {'Authorization': 'Bearer $token'},
      body: contactToJson(contact),
    );
  }
}
