import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/contact.dart';

class ApiService {
  final String baseUrl = 'http://191.252.222.51';

  Future<String?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      body: {'username':username, 'password':password},
      );

      if (response.statusCode == 200){
        return jsonDecode(response.body)['token'];
      }
  return null;
  }

  Future<List<Comments>?> getContatos() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('$baseUrl/contatinhos'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Comments.fromJson(json)).toList();
    }
    return null;
  }

  Future<void> createContato(Comments contato) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    await http.post(
      Uri.parse('$baseUrl/contatinhos/'),
      headers: {'Authorization': 'Bearer $token'},
      body: jsonEncode(contato.toJson()),
      );
  }
  
  Future<void> updateContato(Comments contato) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    await http.put(
      Uri.parse('$baseUrl/contatinhos'),
      headers: {'Authorization': 'Bearer $token'},
      body: jsonEncode(contato.toJson()),
    );    
  }


}



