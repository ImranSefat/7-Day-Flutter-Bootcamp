import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_joke/model/random_joke_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Random Joke'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String joke;

  Future<RandomJokeModel> getData() async {
    var url = Uri.parse('http://api.icndb.com/jokes/random');
    var response = await http.get(url).then((value) {
      return value;
    });
    // randomJokeModel = RandomJokeModel.fromJson(jsonDecode(response.body));

    var json = jsonDecode(response.body);
    return RandomJokeModel.fromJson(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Image(
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage('images/bg1.jpg'),
          ),
          // FutureBuilder(
          //   future: getData(),
          //   builder: (BuildContext context,
          //       AsyncSnapshot<RandomJokeModel> snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       return Padding(
          //         padding: const EdgeInsets.all(12.0),
          //         child: Text(
          //           snapshot.data.value.joke,
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //             fontSize: 32,
          //           ),
          //         ),
          //       );
          //     }
          //     return Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   },
          // ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                joke ?? "Tap the button to get Jokes",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 10,
          //   bottom: 10,
          //   left: 10,
          //   right: 10,
          //   child: Padding(
          //     padding: const EdgeInsets.all(24.0),
          //     child: Text(
          //       joke ?? "Tap the button to get Jokes",
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 32,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          RandomJokeModel _jokeModel = await getData();
          setState(() {
            joke = _jokeModel.value.joke;
          });
        },
        child: Icon(Icons.radar),
      ),
    );
  }
}
