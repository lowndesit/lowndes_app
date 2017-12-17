import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/Screens/myCam.dart';
import 'package:flutter_app/Screens/myInfo.dart';
import 'package:flutter_app/Screens/myItems.dart';
import 'package:flutter_app/Screens/mySubmit.dart';
import 'package:flutter_app/Screens/register.dart';
import 'package:flutter_app/Screens/drawer.dart';


void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Lowndes County Mobile App',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: <String,WidgetBuilder>{
        '/home': (BuildContext context) => new home(),
        '/myCam': (BuildContext context) => new myCam(),
        '/myInfo': (BuildContext context) => new myInfo(),
        '/myItems': (BuildContext context) => new myItems(),
        '/mySubmit': (BuildContext context) => new mySubmit(),
        '/register': (BuildContext context) => new register(),
      },
      home: new home(title: 'Lowndes County Mobile App'),
    );
  }
}
