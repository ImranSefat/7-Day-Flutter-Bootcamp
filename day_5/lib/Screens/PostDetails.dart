import 'package:day_5/model/post_model.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final PostModel post;

  PostDetails({
    @required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Title"),
      ),
      body: Column(
        children: [
          Text(post.id.toString()),
          Text(
            post.title,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
