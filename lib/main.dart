import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String ans;
  num pre;
  num post;
  String operator="";
  void calculate(str){
    setState(() {
      if(pre==null && str is num){
        ans=str.toString();
        pre=str;
        log("str:"+str.toString());
        log("pre:"+pre.toString());
        log("post:"+post.toString());
        log("operator:"+operator.toString());
        return;
      }
      else if(str is num){
        ans = str.toString();
//        pre=null;
        post=str;
        log("in else if");
        log("str:"+str.toString());
        log("pre:"+pre.toString());
        log("post:"+post.toString());
        log("operator:"+operator.toString());
        return;
      }
      switch(str){
        case("AC"):
          ans=null;
          pre=null;
          post=null;
          log("AC");
          break;
        case("C"):
          ans="0";
          break;
        case("+"):
          ans="";
          operator="+";
          break;
        case("-"):
          ans="";
          operator="-";
          break;
        case("*"):
          ans="";
          operator="*";
          break;
        case("/"):
          ans="";
          operator="/";
          break;
        case("="):
          if(operator!=null) {
            switch (operator) {
              case("+"):
                pre = pre + post;
                operator=null;
                break;
              case("-"):
                pre = post - pre;
                operator=null;
                break;
              case("*"):
                pre = pre * post;
                operator=null;
                break;
              case("/"):
                pre = post / pre;
                operator=null;
                break;
            }
          }
          else{
            log("No Operator");
          }
          log("IN equals");
          log("pre:"+pre.toString());
          log("post:"+post.toString());
          ans=pre.toString();
          break;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "$ans"
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate(9)},
                      child:Text(
                        "9",
                    ),
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate(8)},
                      child:Text(
                        "8",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate(7)},
                      child:Text(
                        "7",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate("+")},
                      child:Text(
                        "+",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate(6)},
                      child:Text(
                        "6",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate(5)},
                      child:Text(
                        "5",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate(4)},
                      child:Text(
                        "4",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate("-")},
                      child:Text(
                        "-",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate(3)},
                      child:Text(
                        "3",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate(2)},
                      child:Text(
                        "2",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate(1)},
                      child:Text(
                        "1",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate("*")},
                      child:Text(
                        "*",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate("C")},
                      child:Text(
                        "C",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate(0)},
                      child:Text(
                        "0",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate("AC")},
                      child:Text(
                        "AC",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: ()=> {calculate("/")},
                      child:Text(
                        "/",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: ()=>{calculate("=")},
              child: Text(
                  "="
              ),
            )
          ],
        ),
      ),
    );
  }
}
