import 'package:flutter/material.dart';
import 'package:painthub/Exam%20Modules.dart';
import 'package:painthub/HomePage.dart';
import 'package:painthub/Test.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(title: 'Paint hub', home: FirstScreen());
  }
}

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() => new FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  final _formKey = GlobalKey<FormState>();

  String selectedIcon;
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();


  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username_controller.dispose();
    password_controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Login Screen"),
      ),
      body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: username_controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Username'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: password_controller,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.verified_user),
                          hintText: 'Password'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }

                        return null;
                      },
                    )),

                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ButtonTheme(
                      minWidth: 1000.0,
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.lightBlueAccent,
                        textColor: Colors.white,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            if (username_controller.text == "admin" &&
                                password_controller.text == "12345"
                              ) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            }
                          }
                        },
                        child: Text("LOGIN"),
                      ),
                    )),

              ],
            ),
          )),
    );
  }
}

