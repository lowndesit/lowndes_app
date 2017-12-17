import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app/Screens/drawer.dart';

class mySubmit extends StatefulWidget {
  mySubmit({Key key, this.title}) : super(key: key);

  static const String routeName = "/mySubmitImagePage";

  final String title;

  @override
  _mySubmit createState() => new _mySubmit();
}

class _mySubmit extends State<mySubmit> {
  @override
  Widget build(BuildContext context) {
    drawer;
    return new Scaffold(
      drawer: drawer,
      appBar: new AppBar(
        title: new Text("Submit Issue"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: [new Image(image: null)],
          ),
        ),
      ),
    );
  }
}