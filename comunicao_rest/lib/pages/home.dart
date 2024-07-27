import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';
import '../models/posts.dart';
import 'comments_page.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _apiService = ApiService();
  int? _userId;
  String? _username;
  List<Posts> _posts = [];

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    final username = prefs.getString('username');

    if (userId != null && username != null) {
      setState(() {
        _userId = userId;
        _username = username;
      });
      _loadPosts(userId);
    } else {
      _logout();
    }
  }

  Future<void> _loadPosts(int userId) async {
    final posts = await _apiService.getUserPosts(userId);
    setState(() {
      _posts = posts;
    });
  }

  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Posts de $_username',
        style: const TextStyle(
          color:  Colors.white,
        )
        ),
        actions: [
          IconButton(onPressed: _logout, icon: const Icon(Icons.logout), color: Colors.white,)
        ],
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return ListTile(
            title: Text(post.title, style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
            subtitle: Text(post.body, textAlign: TextAlign.justify,),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommentsPage(postId: post.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}



