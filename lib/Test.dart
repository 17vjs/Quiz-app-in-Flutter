import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Question{
  String question;
  String option1,option2,option3,option4;
  int correctAnswer;
  int selectedAnswer;
  int result=-1;
  String getCorrectAnswer(){
    switch(correctAnswer){
      case 1: return option1;
      case 2: return option2;
      case 3: return option3;
      case 4: return option4;
    }
    return 'No answer';
  }
  void calculateResult(){
if(selectedAnswer!=null) {
  result = selectedAnswer == correctAnswer ? 1 : 0;
}
  }
Question({

  this.correctAnswer,
  this.option1,
  this.option2,
  this.option3,
  this.option4,
  this.question
});
}
class Test extends StatefulWidget {
  String module;
  Test({this.module});
  List<Question> module1questions=<Question>[
Question(question:"How to kill an activity in Android?",correctAnswer:3 ,option1:"finish()"
  ,option2: "finishActivity(int requestCode)",option3:"A & B" ,option4:"kill()"),
    Question(question:"What is android view group?",correctAnswer:1 ,option1:"Collection of views and other child views"
        ,option2: "Base class of building blocks ",option3:"Layouts" ,option4:"None of the Above "),
    Question(question:"How many threads are there in asyncTask in android?",correctAnswer:1 ,option1:"Only one"
        ,option2: "two",option3:"AsyncTask doesn't have tread" ,option4:"None"),
    Question(question:"What is the use of content provider in android?",correctAnswer:3 ,option1:"A - To send the data from an application to another application"
        ,option2: "To store the data in a database",option3:"C - To share the data between applications" ,option4:"None of the Above "),
    Question(question:"How to get current location in android?",correctAnswer:3 ,option1:"Using with GPRS"
        ,option2: "Using location provider ",option3:"A & B" ,option4:"SQlite"),


  ];
  List<Question> module2questions=<Question>[
    Question(question:"How many ports are allocated for new emulator?",correctAnswer:1 ,option1:"2"
        ,option2: "0",option3:"10" ,option4:"None"),
    Question(question:"Data can be read from local source XML in android through",correctAnswer:1 ,option1:"XML resource parser"
        ,option2: "XML pull parsing ",option3:"DOM parsing" ,option4:"None of the Above "),
    Question(question:"What is sandbox in android?",correctAnswer:1 ,option1:"Each application runs securely in sandbox without interrupting another process "
        ,option2: "Android Box ",option3:"Android development tool kit" ,option4:"None"),
    Question(question:"Is it possible activity without UI in android?",correctAnswer:2 ,option1:"A - No, it's not possible"
        ,option2: "Yes,it's possible",option3:"We can't say" ,option4:"None of the Above "),
    Question(question:"Data can be read from local source XML in android through",correctAnswer:1 ,option1:"XML resource parser"
        ,option2: "XML pull parsing ",option3:"DOM parsing" ,option4:"None of the Above "),

  ];
  @override
  TestState createState() => new TestState(moduleQuestions: this.module=="module1"?module1questions:module2questions);
}


class TestState extends State<Test> {
  int remainingTime;
 Timer _timer;
  startTime() async {
    var _duration = new Duration(seconds: 1);
    _timer = new Timer.periodic(_duration,(Timer t){
      setState(() {
     --remainingTime;
     print(remainingTime.toString());
     if(remainingTime<=0){
_timer.cancel();
        remainingTime=10;
        showResult=true;
     } });
    });
  }
 List<Question> moduleQuestions;
 TestState({this.moduleQuestions});
 int currentQuestion;
 bool showResult,showSolution;
 void startTest(){
   remainingTime=10;
   currentQuestion=0;
   showResult=false;
   showSolution=false;
  startTime();

 }
 @override
  void dispose() {
_timer.cancel();
   super.dispose();

 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
startTest();
 }
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit the test'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: ()=>
              Navigator.of(context).pop(true),
            child: Text("YES"),
          ),
        ],
      ),
    ) ??
        false;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    WillPopScope (
      onWillPop: _onBackPressed,
      child:  new Scaffold(
        appBar: new AppBar(
            title:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Time Remaining: " + remainingTime.toString()+" seconds"),


              ],)


        ),
        body:  Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Visibility(
                    visible:!showResult ,
                    child:   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(

                            child: Card(
                                color: Colors.white,

                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:     Text(moduleQuestions[currentQuestion].question) ,
                                )
                            )
                        ),
                      ],
                    )),
                Visibility(
                    visible:!showResult ,
                    child:   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(

                            child: Card(
                                color: Colors.white,

                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Column(children: <Widget>[
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(moduleQuestions[currentQuestion].option1),
                                          Radio<int>(
                                              value: 1,
                                              groupValue: moduleQuestions[currentQuestion].selectedAnswer,
                                              onChanged: (int value) {
                                                setState(() {
                                                  moduleQuestions[currentQuestion].selectedAnswer = value;
                                                });
                                              })
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(moduleQuestions[currentQuestion].option2),
                                          Radio<int>(
                                              value: 2,
                                              groupValue:  moduleQuestions[currentQuestion].selectedAnswer,
                                              onChanged: (int value) {
                                                setState(() {
                                                  moduleQuestions[currentQuestion].selectedAnswer = value;
                                                });
                                              })
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(moduleQuestions[currentQuestion].option3),
                                          Radio<int>(
                                              value: 3,
                                              groupValue:  moduleQuestions[currentQuestion].selectedAnswer,
                                              onChanged: (int value) {
                                                setState(() {
                                                  moduleQuestions[currentQuestion].selectedAnswer = value;
                                                });
                                              })
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(moduleQuestions[currentQuestion].option4),
                                          Radio<int>(
                                              value: 4,
                                              groupValue:  moduleQuestions[currentQuestion].selectedAnswer,
                                              onChanged: (int value) {
                                                setState(() {
                                                  moduleQuestions[currentQuestion].selectedAnswer = value;
                                                });
                                              })
                                        ],
                                      )
                                    ],)

                                )
                            )
                        ),
                      ],
                    )),
                Visibility(
                    visible:!showResult ,
                    child:     ButtonTheme(
                      minWidth: 1000.0,
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.lightBlueAccent,
                        textColor: Colors.white,
                        onPressed: () {
                          setState(() {

                            moduleQuestions[currentQuestion].calculateResult();
                            if(currentQuestion<moduleQuestions.length-1){
                              currentQuestion=currentQuestion+1;
                              showResult=false;}
                            else{
                              remainingTime=0;
                              showResult=true;
                            }
                          });
                        },
                        child: Text("Submit and next"),
                      ),
                    )),
                Visibility(
                  visible:showResult ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                          child: Card(
                              color: Colors.blue,

                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: <Widget>[
                                    Text("Result",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text("Correct : "+moduleQuestions.where((test)=>test.result==1).toList().length.toString(),
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white
                                      ),
                                    ),
                                    Text("Wrong : "+moduleQuestions.where((test)=>test.result==0).toList().length.toString(),
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white
                                      ),
                                    )
                                    ,
                                    Text("Unanswered : "+moduleQuestions.where((test)=>test.result==-1).toList().length.toString(),
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white
                                      ),
                                    )
                                    ,
                                    ButtonTheme(
                                      minWidth: 1000.0,
                                      height: 35.0,
                                      child: RaisedButton(
                                        color: Colors.white,
                                        textColor: Colors.blue,
                                        onPressed: () {
                                          setState(() {
                                            for(Question q in moduleQuestions){
                                              q.selectedAnswer=null;
                                              q.result=-1;
                                            }
                                            startTest();
                                          });


                                        },
                                        child: Text("Re take the exam"),
                                      ),
                                    ),
                                    ButtonTheme(
                                      minWidth: 1000.0,
                                      height: 35.0,
                                      child: RaisedButton(
                                        color: Colors.yellow,
                                        textColor: Colors.black,
                                        onPressed: () {
                                          setState(() {
                                            showSolution=true;
                                          });


                                        },
                                        child: Text("View Solutions"),
                                      ),
                                    )

                                  ],
                                ) ,
                              )
                          )
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible:showSolution ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                          child: Card(
                              color: Colors.lightBlueAccent,

                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: <Widget>[
                                    Text("Solutions",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                    ),
                                    Container(
                                      height: 300.0,
                                      child: ListView.builder(
                                          itemCount: moduleQuestions.length,
                                          itemBuilder: (BuildContext con,int ind){
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text("Q : "+moduleQuestions[ind].question),
                                                Text("A : "+moduleQuestions[ind].getCorrectAnswer())
                                                ,SizedBox(
                                                  height: 10.0,
                                                )
                                              ],
                                            );
                                          }),
                                    )

                                  ],
                                ) ,
                              )
                          )
                      ),
                    ],
                  ),
                )
              ],)

        ),

      ),
    );
  }
}