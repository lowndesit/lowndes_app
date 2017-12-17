import 'package:flutter/material.dart';


var drawer = new Drawer(
    child: new ListView(
      children: [
        new DrawerHeader(
            child: new Text('Headers'),
        ),
        new ListTile(
            leading: const Icon(Icons.info),
            title: const Text('MyInfo'),
            onTap: () {
              Navigator.of(context).pushNamed('/myInfo');
            }
        ),
        new ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Submit an Issue'),
            onTap: () {
              Navigator.of(context).pushNamed('/myCam');
            }
        ),

      ],
    ),
);
