import 'package:flutter/material.dart';
import 'tabLine.dart';
import 'mainContent.dart';

class TabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabPage();
  }
}

class _TabPage extends State<TabPage> {
  String currentTab = 'selected';

  void onTabChangeHandle(String activeTab) {
    setState(() {
      this.currentTab = activeTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TabLine(
          currentTab: this.currentTab,
          onChanged: this.onTabChangeHandle,
        ),
        new MainContent(
          currentTab: this.currentTab,
        )
      ],
    );
  }
}
