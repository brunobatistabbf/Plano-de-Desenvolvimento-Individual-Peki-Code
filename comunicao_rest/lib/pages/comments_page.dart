import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/comments.dart';

class CommentsPage extends StatefulWidget {
  final int postId;

  const CommentsPage({super.key, required this.postId});

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final _apiService = ApiService();
  List<Comments> _comments = [];

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  Future<void> _loadComments() async {
    final comments = await _apiService.getPostComments(widget.postId);
    setState(() {
      _comments = comments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comentários')),
      body: ListView.builder(
        itemCount: _comments.length,
        itemBuilder: (context, index) {
          final comment = _comments[index];
          return ListTile(
            title: Text(comment.name, style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),),
            subtitle: Text(comment.body, style: const TextStyle(
              color: Color.fromARGB(255, 60, 60, 60),
              fontSize: 12,
            ),),
          );
        },
      ),
    );
  }
}
