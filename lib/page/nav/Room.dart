import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("房间"),
          centerTitle: true,
        ),
        body: new ListView(
          children: [
            new Container(
              child: new Image.network(
                  "https://img04.sogoucdn.com/app/a/100520093/ac75323d6b6de243-0bd502b2bdc1100a-92cef3b2299cfc6875afe7d5d0b83a7b.jpg"),
            ),
            _buildTopText(),
            _buildButtonSection(),
            _buildBottomText()
          ],
        ),
      ),
    );
  }

  Widget _buildTopText() {
    return new Container(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: new Row(
        children: [
          //这里用Expanded的好处就是 会占用icon之外的剩余空间
          new Expanded(
              //在Expanded内创建一个垂直布局 放置两个文本
              child: new Column(
            //文本是起始端对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text("我是标题湖人总冠军",
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              ),
              new Text(
                "副标题，詹姆斯牛逼",
                style: new TextStyle(color: Colors.grey, fontSize: 12),
              )
            ],
          )),
          new Icon(Icons.star, color: Colors.red[500]),
          new Container(
            padding: const EdgeInsets.only(left: 4),
            child: new Text("33"),
          )
        ],
      ),
    );
  }

  Widget getBtnText(IconData icon, String text) {
    return new GestureDetector(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: Colors.blue),
          new Container(
            margin: EdgeInsets.only(top: 8),
            child: new Text(
              text,
              style: new TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
      onTap: () {
        Fluttertoast.showToast(msg: "点击了: " + text);
      },
    );
  }

  Widget _buildButtonSection() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child:
          new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        getBtnText(Icons.call, "CALL"),
        getBtnText(Icons.near_me, "ROUTE"),
        getBtnText(Icons.share, "SHARE")
      ]),
    );
  }

  Widget _buildBottomText() {
    return Container(
      margin: const EdgeInsets.all(30),
      child: new Text(
          "北京时间2月19日，湖人对阵篮网，上半场53比64落后，詹姆斯上半场得到17分，职业生涯总得分达到35002分，成为NBA历史第三位突破35000分里程碑的球员，另外两位是贾巴尔和卡尔·马龙。詹皇以36岁50天成为最年轻的35000分先生。",
          softWrap: true),
    );
  }
}
