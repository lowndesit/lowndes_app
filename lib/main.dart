import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

final Random random = new Random();

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

Future<String> _testSignInWithGoogle() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final FirebaseUser user = await _auth.signInWithGoogle(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      MyItemsPage.routeName: (BuildContext context) =>
          new MyItemsPage(title: "MyItemsPage"),
      MyInfoPage.routeName: (BuildContext context) =>
          new MyInfoPage(title: "MyInfoPage"),
      myCamPage.routeName: (BuildContext context) =>
          new myCamPage(title: "myCamPage"),
      mySubmitImagePage.routeName: (BuildContext context) =>
          new mySubmitImagePage(title: "mySubmitImagePage"),
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
        height: 44.0,
        child: new Center(child: new Container(child: inputPassword)),
        decoration: new BoxDecoration(
            color: Colors.white, borderRadius: new BorderRadius.circular(3.0)),
      ),
    );

    ///loginButton

    void _loginButton() {
      Navigator.pushNamed(context, MyItemsPage.routeName);
    }

    Widget loginButton = new Align(
      alignment: const Alignment(0.0, -0.2),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new FlatButton(
            child: const Text('Login'),
            onPressed: _loginButton,
          ),
          new FlatButton(
            onPressed: _testSignInWithGoogle,
            child: new Image.asset(
              'assets/btn_signinwithgoogle.png',
            ),
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
          ],
        ));
  }
}

////MyItemsPage

class MyItemsPage extends StatefulWidget {
  MyItemsPage({Key key, this.title}) : super(key: key);

  static const String routeName = "/MyItemsPage";

  final String title;

  @override
  _MyItemsPageState createState() => new _MyItemsPageState();
}

/// // 1. After the page has been created, register it with the app routes
/// routes: <String, WidgetBuilder>{
///   MyItemsPage.routeName: (BuildContext context) => new MyItemsPage(title: "MyItemsPage"),
/// },
///
/// // 2. Then this could be used to navigate to the page.
/// Navigator.pushNamed(context, MyItemsPage.routeName);
///

class _MyItemsPageState extends State<MyItemsPage> {
  @override
  Widget build(BuildContext context) {
    ///launchUtilPayURL

    _launchUtilPayURL() async {
      const url = 'http://ecommerce.lowndescounty.com/';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    ///launchMyInfoPage

    void _launchMyInfoPage() {
      Navigator.pushNamed(context, MyInfoPage.routeName);
    }

    ///launch CamPage

    void _launchMyCamPage() {
      Navigator.pushNamed(context, myCamPage.routeName);
    }

    ///row1

    Column buildButtonColumn1(IconData icon, String label, onPress) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new IconButton(
            icon: new Icon(icon, color: color, size: 50.0),
            onPressed: onPress,
          ),
          new Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonRow1 = new Container(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 40.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButtonColumn1(Icons.info, 'My Info', _launchMyInfoPage),
            buildButtonColumn1(
                Icons.camera, 'Submit An Issue', _launchMyCamPage)
          ],
        ));

    //rowBuild

    Widget row1 = new Row(
      children: <Widget>[
        buttonRow1,
      ],
    );

    ///row2

    Column buildButtonColumn2(IconData icon, String label, onPress) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new IconButton(
            icon: new Icon(icon, color: color, size: 50.0),
            onPressed: onPress,
          ),
          new Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonRow2 = new Container(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButtonColumn2(
                Icons.payment, 'Make a Payment', _launchUtilPayURL),
            buildButtonColumn2(Icons.business, 'Local Companies', null),
          ],
        ));

    //rowBuild

    Widget row2 = new Row(
      children: <Widget>[
        buttonRow2,
      ],
    );

    ///myInfoButton

    ///page

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Homepage'),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            row1,
            row2,
          ],
        ),
      ),
    );
  }
}

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

//// myCamPage

class myCamPage extends StatefulWidget {
  myCamPage({Key key, this.title}) : super(key: key);

  static const String routeName = "/myCamPage";

  final String title;

  @override
  _myCamPageState createState() => new _myCamPageState();
}

class _myCamPageState extends State<myCamPage> {
  Future<File> _imageFile;

  @override
  Widget build(BuildContext context) {
    void _mySubmitImagePageState() {
      Navigator.pushNamed(context, mySubmitImagePage.routeName);
    }

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
      appBar: new AppBar(
        actions: <Widget>[
          new ButtonBar(
            children: <Widget>[
              new FlatButton(
                onPressed: _mySubmitImagePageState,
                child: new Text(
                  "< Next >",
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

////Submit an issue page

class mySubmitImagePage extends StatefulWidget {
  mySubmitImagePage({Key key, this.title}) : super(key: key);

  static const String routeName = "/mySubmitImagePage";

  final String title;

  @override
  _mySubmitImagePageState createState() => new _mySubmitImagePageState();
}

class _mySubmitImagePageState extends State<mySubmitImagePage> {
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
