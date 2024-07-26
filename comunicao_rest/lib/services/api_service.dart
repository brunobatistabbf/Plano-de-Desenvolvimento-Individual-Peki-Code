import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/comments.dart';
import '../models/posts.dart';

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<User?> login(String username) async {
    final response = await http.get(Uri.parse('$baseUrl/users?username=$username'));

    if (response.statusCode == 200) {
      final List<dynamic> users = json.decode(response.body);
      if (users.isNotEmpty) {
        return User.fromJson(users[0]);
      }
    }
    return null;
  }

  Future<List<Posts>> getUserPosts(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/posts?userId=$userId'));
    if (response.statusCode == 200) {
      final List posts = json.decode(response.body);
      return posts.map((json) => Posts.fromJson(json)).toList();
    }
    return [];
  }

  Future<List<Comments>> getPostComments(int postId) async {
    final response = await http.get(Uri.parse('$baseUrl/comments?postId=$postId'));
    if (response.statusCode == 200) {
      final List comments = json.decode(response.body);
      return comments.map((json) => Comments.fromJson(json)).toList();
    }
    return [];
  }
}
