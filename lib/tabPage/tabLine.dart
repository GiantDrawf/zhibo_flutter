import 'package:flutter/material.dart';

class TabLine extends StatelessWidget {
  final String currentTab;
  final ValueChanged<String> onChanged;
  final List tabMapList = [
    {'tabName': '精选', 'value': 'selected'},
    {'tabName': '今日', 'value': 'today'},
    {'tabName': '分类', 'value': 'classify'},
  ];

  TabLine({Key key, this.currentTab: 'selected', @required this.onChanged})
      : super(key: key);

  Color handleTabColor(String activeTab, String currentTab) {
    return activeTab != currentTab
        ? new Color(0xFF5c5c5c)
        : new Color(0xFFf54343);
  }

  double handleTabFontSize(String activeTab, String currentTab) {
    return activeTab != currentTab ? 16.0 : 18.0;
  }

  BorderSide handleTabBorderBottom(String activeTab, String currentTab) {
    return activeTab != currentTab
        ? BorderSide.none
        : BorderSide(
            width: 2.0,
            color: const Color(0xFFf54343),
            style: BorderStyle.solid);
  }

  List<Widget> newTabList() {
    var tabs = new List<Widget>();
    for (var i = 0; i < tabMapList.length; i++) {
      tabs.add(new GestureDetector(
        onTap: () {
          this.onChanged(tabMapList[i]['value']);
        },
        child: new Container(
          width: 72.0,
          alignment: Alignment.center,
          height: 43.5,
          decoration: new BoxDecoration(
              border: new Border(
                  bottom: handleTabBorderBottom(
                      this.currentTab, tabMapList[i]['value']))),
          child: new Text(
            tabMapList[i]['tabName'],
            style: new TextStyle(
                fontSize:
                    handleTabFontSize(this.currentTab, tabMapList[i]['value']),
                color: handleTabColor(this.currentTab, tabMapList[i]['value'])),
          ),
        ),
      ));
    }

    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: newTabList(),
    );
  }
}
