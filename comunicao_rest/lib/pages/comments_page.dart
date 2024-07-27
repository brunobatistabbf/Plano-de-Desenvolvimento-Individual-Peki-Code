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
      appBar: AppBar(
        title: const Text('Comentários')
        ),
      body: ListView.separated(
        itemCount: _comments.length,
        itemBuilder: (context, index) {
          final comment = _comments[index];
          return ListTile(
            title: Text(comment.name, style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),),
            subtitle: Text(comment.body, style: const TextStyle(
              color: Color.fromARGB(255, 98, 98, 98),
              fontSize: 12,
            ),),
          );
        },
          separatorBuilder: (context, index) => const Divider(
          color: Color.fromARGB(255, 220, 220, 220),
          height: 0.2,
      ),
      )
    );
  }
}
