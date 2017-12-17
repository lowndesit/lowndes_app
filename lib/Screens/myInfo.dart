import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app/Screens/drawer.dart';



////MyInfoPage

class myInfo extends StatefulWidget {
  myInfo({Key key, this.title}) : super(key: key);

  static const String routeName = "/MyInfoPage";

  final String title;

  @override
  _myInfo createState() => new _myInfo();
}

class _myInfo extends State<myInfo> {
  @override
  Widget build(BuildContext context) {
    drawer;
    ///page

    return new Scaffold(
      drawer: drawer,
      appBar: new AppBar(
        title: new Text("My Info"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}