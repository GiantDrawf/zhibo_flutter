import 'package:flutter/material.dart';
import 'tabPage/tabPage.dart';

void main() {
  runApp(new MaterialApp(
    title: 'zhibo_flutter', // used by the OS task switcher
    home: Scaffold(
        appBar: AppBar(
          title: new Center(
            child: new Text(
              '风直播',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            new TabPage(),
          ],
        )),
  ));
}
