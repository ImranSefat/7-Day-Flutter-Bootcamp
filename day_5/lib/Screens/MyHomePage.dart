import 'dart:convert';

import 'package:day_5/Screens/PostDetails.dart';
import 'package:day_5/Widget/PostCard.dart';
import 'package:day_5/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<List<PostModel>> getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url).then((value) {
      return value.body;
    });

    List<dynamic> postCollection = jsonDecode(response);

    List<PostModel> postData = [];

    postCollection.forEach((element) {
      PostModel singlePost = PostModel.fromJson(element);
      postData.add(singlePost);
    });

    return postData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                PostModel post = snapshot.data[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetails(
                          post: post,
                        ),
                      ),
                    );
                  },
                  child: PostCard(post: post),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
