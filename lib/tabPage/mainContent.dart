import 'package:flutter/material.dart';
import './selectedPage.dart';
import '../services/selectedPageApis.dart';

class MainContent extends StatefulWidget {
  MainContent({
    Key key,
    this.currentTab,
  }) : super(key: key);

  final String currentTab;

  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  List swiperData = [];
  List columnsList = [];

  void getPageData() async {
    var swiperData = await getSwiperData();
    var columnsList = await getColumnsList();
    setState(() {
      this.swiperData = swiperData;
      this.columnsList = columnsList;
    });
  }

  Widget generateMainContent() {
    var contentList;
    if (widget.currentTab == 'selected') {
      contentList = new SelectedPage(
        swiperData: this.swiperData,
        columnsList: this.columnsList,
      );
    } else if (widget.currentTab == 'today') {
      contentList = new Text(widget.currentTab);
    } else if (widget.currentTab == 'classify') {
      contentList = new Text(widget.currentTab);
    }

    return contentList;
  }

  @override
  Widget build(BuildContext context) {
    // 初始化获取数据
    getPageData();

    return new Container(child: generateMainContent());
  }
}
