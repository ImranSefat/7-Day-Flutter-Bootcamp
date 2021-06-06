import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Second Day'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email = "";
  String password = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text("Sample Text"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        print('Menu  button pressed');
                      },
                      icon: Icon(
                        Icons.menu,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print('Menu  button pressed');
                      },
                      icon: Icon(
                        Icons.shop,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Grocery\nat your Doorstep",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Fresh Fruits Upto",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("15% Off"),
                          ],
                        ),
                        Text("Second Child of Row"),
                      ],
                    ),
                  ),
                )
                // Row(
                //   children: [
                //     Flexible(
                //       flex: 1,
                //       child: Container(
                //         height: 80,
                //         color: Colors.red,
                //       ),
                //     ),
                //     Flexible(
                //       flex: 2,
                //       child: Container(
                //         height: 80,
                //         color: Colors.blue,
                //       ),
                //     ),
                //   ],
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 16,
                //     vertical: 4,
                //   ),
                //   child: TextFormField(
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return "Please enter email";
                //       }
                //       return null;
                //     },
                //     onChanged: (value) {
                //       email = value;
                //     },
                //     decoration: InputDecoration(
                //       // prefixIcon: Icon(
                //       //   Icons.email,
                //       // ),
                //       suffixIcon: Icon(
                //         Icons.email,
                //       ),
                //       hintText: "Please enter email",
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 16,
                //     vertical: 4,
                //   ),
                //   child: TextFormField(
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return "Please enter password";
                //       }
                //       return null;
                //     },
                //     onChanged: (value) {
                //       password = value;
                //     },
                //     obscureText: true,
                //     decoration: InputDecoration(
                //       suffixIcon: Icon(
                //         Icons.password,
                //       ),
                //       hintText: "Please enter password",
                //     ),
                //   ),
                // ),

                // // TextButton(
                // //   onPressed: () {},
                // //   child: Text("Login"),
                // // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 32),
                //   child: Container(
                //     width: 200,
                //     child: ElevatedButton(
                //       onPressed: () {
                //         if (_formKey.currentState!.validate()) {
                //           print("Email is $email & password is $password");
                //         }
                //         // print("Email is " + email + " & password is " + password);
                //       },
                //       child: Text("Login"),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
