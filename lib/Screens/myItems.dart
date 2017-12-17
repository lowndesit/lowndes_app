import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/Screens/myCam.dart';
import 'package:flutter_app/Screens/myInfo.dart';
import 'package:flutter_app/Screens/myItems.dart';
import 'package:flutter_app/Screens/mySubmit.dart';
import 'package:flutter_app/Screens/register.dart';
import 'package:flutter_app/Screens/drawer.dart';


class myItems extends StatefulWidget {
  myItems({Key key, this.title}) : super(key: key);

  static const String routeName = "/MyItemsPage";

  final String title;

  @override
  _myItems createState() => new _myItems();
}

class _myItems extends State<myItems> {
  @override
  Widget build(BuildContext context) {
    drawer;
    ///launchUtilPayURL

    _launchUtilPayURL() async {
      const url = 'http://ecommerce.lowndescounty.com/';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
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
            buildButtonColumn1(Icons.info, 'My Info', (){Navigator.of(context).pushNamed('/myInfo');}),
            buildButtonColumn1(
                Icons.camera, 'Submit An Issue', (){Navigator.of(context).pushNamed('/myCam');})
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
      drawer: drawer,
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
