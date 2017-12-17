import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app/Screens/drawer.dart';



//// myCamPage

class myCam extends StatefulWidget {
  myCam({Key key, this.title}) : super(key: key);

  static const String routeName = "/myCamPage";

  final String title;

  @override
  _myCam createState() => new _myCam();
}

class _myCam extends State<myCam> {
  Future<File> _imageFile;

  Future<File> get imageFile => _imageFile;

  void test() {
    _imageFile.then((File image) => null);
  }

  @override
  Widget build(BuildContext context) {
    drawer:
    ///inputDesc

    Widget inputIssueDesc = new TextField(
      textAlign: TextAlign.center,
      decoration: new InputDecoration.collapsed(
        hintText: "Enter Issue Description",
      ),
      obscureText: false,
    );

    Widget issueDesc = new FractionallySizedBox(
      widthFactor: 0.70666666666, // 265 / 375
      child: new Container(
        height: 44.0,
        child: new Center(child: new Container(child: inputIssueDesc)),
        decoration: new BoxDecoration(
            color: Colors.white, borderRadius: new BorderRadius.circular(3.0)),
      ),
    );

    ///imagePicker

    Widget futureBuilder = new FutureBuilder<File>(
      future: _imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return new Image.file(snapshot.data);
        } else {
          return const Text('You have not yet picked an image.');
        }
      },
    );

    ///page

    return new Scaffold(
      drawer: drawer,
      appBar: new AppBar(
        actions: <Widget>[
          new ButtonBar(
            children: <Widget>[
              new FlatButton(
                onPressed: null,
                child: new Text("< Next >",
                  style: new TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
        title: const Text('Submit Issue'),
      ),
      body: new Container(
          margin: const EdgeInsets.only(
              top: 20.0, left: 30.0, right: 210.0, bottom: 20.0),
          child: new Center(
              child: new Column(children: <Widget>[
                futureBuilder,
                issueDesc,
              ]))),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setState(() {
            _imageFile = ImagePicker.pickImage();
          });
        },
        tooltip: 'Pick Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }
}