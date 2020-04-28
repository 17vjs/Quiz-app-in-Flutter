import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:painthub/Test.dart';

class ExamModule extends StatefulWidget {
  @override
  ExamModuleState createState() => new ExamModuleState();
}


class ExamModuleState extends State<ExamModule> {
 String selectedIcon;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Exam Module"),
      ),
      body:  Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedIcon = "module1";
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Test(module: selectedIcon,)),
                      );
                    });
                  },
                  child: SizedBox(
                    width: 125.0,
                    height: 100.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Module 1\n5 questions"),
                        ],),

                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedIcon = "module2";
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Test(module: selectedIcon,)),
                      );
                    });
                  },
                  child: SizedBox(
                    height: 100.0,
                    width: 125.0,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          color:
                          Colors.tealAccent,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Module 2\n5 questions"),
                          ],)

                    ),
                  ),
                )
              ],
            )
          ],)

    ),

    );
  }
}