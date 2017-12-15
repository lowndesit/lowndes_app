import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';



////MyInfoPage

class MyInfoPage extends StatefulWidget {
  MyInfoPage({Key key, this.title}) : super(key: key);

  static const String routeName = "/MyInfoPage";

  final String title;

  @override
  _MyInfoPageState createState() => new _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  @override
  Widget build(BuildContext context) {
    ///myInfoColumn

    ///page

    return new Scaffold(
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