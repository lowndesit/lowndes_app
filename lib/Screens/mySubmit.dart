import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';


///Submit an issue page

class MySubmitImagePage extends StatefulWidget {
  MySubmitImagePage({Key key, this.title}) : super(key: key);

  static const String routeName = "/mySubmitImagePage";

  final String title;

  @override
  _MySubmitImagePageState createState() => new _MySubmitImagePageState();
}

class _MySubmitImagePageState extends State<MySubmitImagePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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