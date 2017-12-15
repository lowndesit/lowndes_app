import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

final Random random = new Random();

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
    };

    return new MaterialApp(
      title: 'Lowndes County Mobile App',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Lowndes County Mobile App'),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ///titleSection

    Widget titleSection = new Container(
      padding: const EdgeInsets.all(18.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Welcome to the Lowndes County Mobile App!',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    ///inputUsername

    Widget inputUsername = new TextField(
      textAlign: TextAlign.center,
      decoration: new InputDecoration.collapsed(
        hintText: "Username",
      ),
      obscureText: false,
    );

    Widget usernameInput = new FractionallySizedBox(
      widthFactor: 0.70666666666, // 265 / 375
      child: new Container(
        margin: const EdgeInsets.all(12.0),
        height: 44.0,
        child: new Center(child: new Container(child: inputUsername)),
        decoration: new BoxDecoration(
            color: Colors.white, borderRadius: new BorderRadius.circular(3.0)),
      ),
    );

    ///inputPassword

    Widget inputPassword = new TextField(
      textAlign: TextAlign.center,
      decoration: new InputDecoration.collapsed(
        hintText: "Password",
      ),
      obscureText: false,
    );

    Widget passwordInput = new FractionallySizedBox(
      widthFactor: 0.70666666666, // 265 / 375
      child: new Container(
        margin: const EdgeInsets.all(12.0),
        height: 44.0,
        child: new Center(child: new Container(child: inputPassword)),
        decoration: new BoxDecoration(
            color: Colors.white, borderRadius: new BorderRadius.circular(3.0)),
      ),
    );

    ///loginButton

    Widget loginButton = new Align(
      alignment: const Alignment(0.0, -0.2),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new FlatButton(
            child: const Text('Login'),
            onPressed: (){Navigator.of(context).pushNamed('/myItems');
            }
          ),
        ],
      ),
    );


    Widget regButton = new Align(
      alignment: const Alignment(0.0, -0.2),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new FlatButton(
            child: const Text('Register'),
            onPressed: (){Navigator.of(context).pushNamed('/register');
            }
          ),
        ],
      ),
    );

    ///drawer

    Text child1 = new Text("First");
    Text child2 = new Text("Second");

    var pad =
        const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0, top: 50.0);
    var pad2 =
        const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0, top: 50.0);

    Padding padding = new Padding(child: child1, padding: pad);
    Padding padding2 = new Padding(child: child2, padding: pad2);

    var children = [padding, padding2];

    ListView listView = new ListView(children: children);

    Drawer drawer = new Drawer(child: listView);

    /// Page
    return new Scaffold(
        drawer: drawer,
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new ListView(
          children: [
            new Image.asset(
              'assets/judcomplex.jpg',
              width: 500.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            usernameInput,
            passwordInput,
            loginButton,
            regButton,
          ],
        ));
  }
}
