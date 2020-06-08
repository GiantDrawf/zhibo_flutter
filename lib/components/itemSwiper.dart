import 'package:flutter/material.dart';
import '../util/utils.dart';

class ItemSwiper extends StatelessWidget {
  final Map itemData;
  ItemSwiper({Key key, @required this.itemData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage(handleUrl(this.itemData['picture'])),
          fit: BoxFit.cover,
        ),
      ),
      child: new Align(
        alignment: Alignment.bottomLeft,
        child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: 60,
                height: 20,
                decoration: BoxDecoration(
                  color: new Color.fromRGBO(0, 0, 0, 0.6),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assests/images/swiperItemStatusBg.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                margin: EdgeInsets.only(left: 10),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      width: 10,
                      margin: EdgeInsets.only(left: 3, right: 3),
                      child: new Image.asset(
                        this.itemData['status'] == 3
                            ? "assests/images/recordPlayBtn.png"
                            : "assests/images/playingBtn.png",
                        width: 10,
                      ),
                    ),
                    new Text(this.itemData['status'] == 3 ? '回顾' : '直播',
                        style: new TextStyle(color: Colors.white))
                  ],
                ),
              ),
              new Container(
                height: 50,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assests/images/swiperTitleBg.png"),
                        fit: BoxFit.fill)),
                padding: EdgeInsets.only(left: 10, top: 5),
                child: new Text(
                  this.itemData['title'],
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
            ]),
      ),
    );
  }
}
