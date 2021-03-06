import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/drawer.dart';
//import 'package:sqljocky5/constants.dart';
//import 'package:sqljocky5/sqljocky.dart';
//import 'package:sqljocky5/utils.dart';

class home extends StatefulWidget {
  home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _home createState() => new _home();
}

class _home extends State<home> {

  @override
  Widget build(BuildContext context) {
    drawer;

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

    ///regButton

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