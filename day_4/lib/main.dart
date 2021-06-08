import 'dart:convert';

import 'package:day_4/apod_model.dart';
import 'package:day_4/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Astronomy Picture of the Day'),
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
  Future<ApodModel> getData() async {
    var url =
        Uri.parse('https://api.nasa.gov/planetary/apod?api_key=' + API_KEY);
    var response = await http.get(url).then((value) {
      return value;
    });
    ApodModel apodModel = ApodModel.fromJson(jsonDecode(response.body));
    return apodModel;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: getData(),
              builder:
                  (BuildContext context, AsyncSnapshot<ApodModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: NetworkImage(
                          snapshot.data.url,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 8,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              snapshot.data.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Opacity(
                              opacity: 0.7,
                              child: Text(
                                "Date : " + snapshot.data.date,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              snapshot.data.explanation,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
