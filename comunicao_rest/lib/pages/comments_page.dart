import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/comments.dart';

class CommentsPage extends StatefulWidget {
  final int postId;

  CommentsPage({required this.postId});

 @override
  _CommentsPageState createState() => _CommentsPageState();

}

class _CommentsPageState extends State<CommentsPage> {
  final _apiService = ApiService();
  List<Comments> _comments = [];

  @override
  void initState(){
    super.initState();
    _loadComments();
  }

  Future<void> _loadComments() async{
    final comments = await _apiService.getUserComments(widget.postId);
    setState(() {
      _comments = comments;
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comentários')),
      body: ListView.builder(
        itemCount: _comments.length,
        itemBuilder: (context, index){
          final comment = _comments[index];
          return ListTile(
            title: Text(comment.name),
            subtitle: Text(comment.body),
          );
        }),
    );
  }

}