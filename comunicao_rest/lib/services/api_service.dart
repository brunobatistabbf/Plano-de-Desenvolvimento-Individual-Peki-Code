import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/comments.dart';
import '../models/posts.dart';

class ApiService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<User?> login(String username) async{
    final Response = await http.get(Uri.parse('$baseUrl/users?username=$username'));
    if (Response.statusCode == 200) {
      final List users = json.decode(Response.body);
      if (users.isNotEmpty) {
        return User.fromJson(users[0]);
      }
    }
    return null;
  }

  Future<List<Posts>> getUserPosts(int userID) async{
    final response = await http.get(Uri.parse('$baseUrl/posts?userID=$userID'));
    if (response.statusCode == 200) {
      final List posts = json.decode(response.body);
      return posts.map((json) => Posts.fromJson(json)).toList();
    }
    return [];
  }

  Future<List<Comments>> getUserComments(int postID) async{
    final response = await http.get(Uri.parse('$baseUrl/comments?postID=$postID'));
    if (response.statusCode == 200) {
      final List comments = json.decode(response.body);
      return comments.map((json) => Comments.fromJson(json)).toList();
    }
    return [];
  }


}