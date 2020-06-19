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
  List liveList = [];
  bool liveListIsEnd = false;
  Map livePagination = {"page": 1, "pageSize": 6};

  void getPageData() async {
    // 获取轮播图数据
    var swiperData = await getSwiperData();
    if (swiperData is List && swiperData.length > 0) {
      setState(() {
        this.swiperData = swiperData;
      });
    }
    // 获取栏目数据
    var columnsList = await getColumnsList();
    if (columnsList is List && columnsList.length > 0) {
      setState(() {
        this.columnsList = columnsList;
      });
    }
    // 获取直播间列表
    var liveList = await getLiveList(livePagination);
    if (liveList is List && liveList.length > 0) {
      setState(() {
        this.liveList = liveList;
        // this.livePagination = {
        //   "page": this.livePagination["page"] + 1,
        //   "pageSize": this.livePagination["pageSize"]
        // };
      });
      if (liveList.length < 6) {
        setState(() {
          this.liveListIsEnd = true;
        });
      }
    }
  }

  Widget generateMainContent() {
    var contentList;
    if (widget.currentTab == 'selected') {
      contentList = new SelectedPage(
        swiperData: this.swiperData,
        columnsList: this.columnsList,
        liveList: this.liveList,
        liveListIsEnd: this.liveListIsEnd,
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
