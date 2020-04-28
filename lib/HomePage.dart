import 'package:flutter/material.dart';
import 'package:painthub/Exam%20Modules.dart';


class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => new HomePageState();
}


class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body:
                Center(
                  child: Column(
mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                         Container(
                          color: Colors.amber,
                          width: 100,
                          child:   ButtonTheme(
                            minWidth: 1000.0,
                            height: 100.0,
                            child: RaisedButton(
                              color: Colors.lightBlueAccent,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExamModule()),
                                );
                              },
                              child: Text("Take Test"),
                            ),
                          ),
                        ),


                    ],
                  ),
                ),
    );
  }
}