import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MainContent extends StatelessWidget {
  final String currentTab;
  MainContent({
    Key key,
    this.currentTab: 'selected',
  }) : super(key: key);

  List<Widget> generateMainContent() {
    var contentList = new List<Widget>();
    if (this.currentTab == 'selected') {
      contentList.add(new Container(
        height: 170,
        child: new Swiper(
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              "http://via.placeholder.com/350x150",
              fit: BoxFit.fill,
            );
          },
          itemCount: 3,
          pagination: new SwiperPagination(alignment: Alignment.bottomRight),
        ),
      ));
    } else if (this.currentTab == 'today') {
      contentList.add(new Text(this.currentTab));
    } else if (this.currentTab == 'classify') {
      contentList.add(new Text(this.currentTab));
    }

    return contentList;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(children: generateMainContent());
  }
}
