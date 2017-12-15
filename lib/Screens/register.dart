import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

class register extends StatefulWidget {
  register({Key key, this.title}) : super(key: key);

  static const String routeName = "/RegisterPage";

  final String title;

  @override
  _register createState() => new _register();
}

///usernameInput

Widget createUsername = new TextField(
  textAlign: TextAlign.center,
  decoration: new InputDecoration.collapsed(
    hintText: "Choose a Username",
  ),
  obscureText: false,
);

Widget usernameInput = new FractionallySizedBox(
  widthFactor: 0.9, // 265 / 375
  child: new Container(
    margin: const EdgeInsets.all(12.0),
    height: 44.0,
    child: new Center(child: new Container(child: createUsername)),
    decoration: new BoxDecoration(
        color: Colors.white, borderRadius: new BorderRadius.circular(3.0)),
  ),
);

///passwordInput

Widget createPassword = new TextField(
  textAlign: TextAlign.center,
  decoration: new InputDecoration.collapsed(
    hintText: "Choose a Password",
  ),
  obscureText: false,
);

Widget passwordInput = new FractionallySizedBox(
  widthFactor: 0.9, // 265 / 375
  child: new Container(
    margin: const EdgeInsets.all(12.0),
    height: 44.0,
    child: new Center(child: new Container(child: createPassword)),
    decoration: new BoxDecoration(
        color: Colors.white, borderRadius: new BorderRadius.circular(3.0)),
  ),
);

///passwordVerify

Widget verifyPassword = new TextField(
  textAlign: TextAlign.center,
  decoration: new InputDecoration.collapsed(
    hintText: "Verify Password",
  ),
  obscureText: false,
);

Widget passwordVerify = new FractionallySizedBox(
  widthFactor: 0.9, // 265 / 375
  child: new Container(
    margin: const EdgeInsets.all(12.0),
    height: 44.0,
    child: new Center(child: new Container(child: verifyPassword)),
    decoration: new BoxDecoration(
        color: Colors.white, borderRadius: new BorderRadius.circular(3.0)),
  ),
);

///emailEnter

Widget enterEmail = new TextField(
  textAlign: TextAlign.center,
  decoration: new InputDecoration.collapsed(
    hintText: "Enter Email Address",
  ),
  obscureText: false,
);

Widget emailEnter = new FractionallySizedBox(
  widthFactor: 0.9, // 265 / 375
  child: new Container(
    margin: const EdgeInsets.all(12.0),
    height: 44.0,
    child: new Center(child: new Container(child: enterEmail)),
    decoration: new BoxDecoration(
        color: Colors.white, borderRadius: new BorderRadius.circular(3.0)),
  ),
);

///emailVerify

Widget verifyEmail = new TextField(
  textAlign: TextAlign.center,
  decoration: new InputDecoration.collapsed(
    hintText: "Verify Email Address",
  ),
  obscureText: false,
);

Widget emailVerify = new FractionallySizedBox(
  widthFactor: 0.9, // 265 / 375
  child: new Container(
    margin: const EdgeInsets.all(12.0),
    height: 44.0,
    child: new Center(child: new Container(child: verifyEmail)),
    decoration: new BoxDecoration(
        color: Colors.white, borderRadius: new BorderRadius.circular(3.0)),
  ),
);

///Firstname

Widget fName = new TextField(
  textAlign: TextAlign.center,
  decoration: new InputDecoration.collapsed(
    hintText: "First Name",
  ),
  obscureText: false,
);

Widget firstName = new FractionallySizedBox(
  widthFactor: 0.9, // 265 / 375
  child: new Container(
    margin: const EdgeInsets.all(12.0),
    height: 44.0,
    child: new Center(child: new Container(child: fName)),
    decoration: new BoxDecoration(
        color: Colors.white, borderRadius: new BorderRadius.circular(3.0)),
  ),
);


///LastName

Widget lName = new TextField(
  textAlign: TextAlign.center,
  decoration: new InputDecoration.collapsed(
    hintText: "Last Name",
  ),
  obscureText: false,
);

Widget lastName = new FractionallySizedBox(
  widthFactor: 0.9, // 265 / 375
  child: new Container(
    margin: const EdgeInsets.all(12.0),
    height: 44.0,
    child: new Center(child: new Container(child: lName)),
    decoration: new BoxDecoration(
        color: Colors.white, borderRadius: new BorderRadius.circular(3.0)),
  ),
);

///SubmitButton

Widget subBut = new Align(
  child: new Container(
    margin: const EdgeInsets.only(top: 10.0),
    child: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new RaisedButton(
          child: const Text('Submit'),
          onPressed: null,
        ),
      ],
    ),
  ),
);


///page

class _register extends State<register> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: <Widget>[
          usernameInput,
          passwordInput,
          passwordVerify,
          emailEnter,
          emailVerify,
          firstName,
          lastName,
          subBut,
        ],
      ),
    );
  }
}