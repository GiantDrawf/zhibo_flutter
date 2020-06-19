// 精选页
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../components/itemSwiper.dart';
import '../util/utils.dart';

class SelectedPage extends StatelessWidget {
  final List swiperData;
  final List columnsList;
  final List liveList;
  final bool liveListIsEnd;
  SelectedPage(
      {Key key,
      this.swiperData,
      this.columnsList,
      this.liveList,
      this.liveListIsEnd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return new Column(
      children: <Widget>[
        new Container(
          height: screenWidth / 2,
          child: this.swiperData.length > 0
              ? new Swiper(
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return new ItemSwiper(itemData: this.swiperData[index]);
                  },
                  itemCount: this.swiperData.length,
                  pagination: new SwiperPagination(
                    alignment: Alignment.bottomRight,
                    builder: new DotSwiperPaginationBuilder(
                        color: new Color.fromRGBO(245, 67, 67, 0.2),
                        activeColor: new Color.fromRGBO(245, 67, 67, 1)),
                  ),
                )
              : null,
        ),
        new Container(
          alignment: Alignment.centerLeft,
          height: 70,
          child: new Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: new ListView(
                  scrollDirection: Axis.horizontal,
                  children: this.columnsList.map<Widget>((dynamic itemColumn) {
                    return new Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      alignment: Alignment.center,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      handleUrl(itemColumn["logo"])),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          new Container(
                            child: new Text(
                              itemColumn["name"],
                              style: new TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              new Container(
                width: 10,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assests/images/leftBorder.png"),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              new Container(
                width: 25,
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assests/images/moreColumnDots.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
            ],
          ),
        ),
        new Scrollbar(
          child: new SingleChildScrollView(
            child: new Column(
              children: this
                  .liveList
                  .map((item) => (new Container(
                        height: 160,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(handleUrl(item["thumb_new"])),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      )))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
