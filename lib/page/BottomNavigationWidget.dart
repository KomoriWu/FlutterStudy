import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'nav/Home.dart';
import 'nav/Mine.dart';
import 'nav/Room.dart';

class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;
  var navTitles = ["主页", "房间", "我的"];
  var navIcons = [Icons.all_inclusive, Icons.access_alarm, Icons.blur_on];
  List<Widget> pageList = List();

  // 初始化方法
  @override
  void initState() {
    pageList..add(HomePage())..add(RoomPage())..add(MinePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: pageList[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(icon: getIcon(0), title: getTitle(0)),
          new BottomNavigationBarItem(icon: getIcon(1), title: getTitle(1)),
          new BottomNavigationBarItem(icon: getIcon(2), title: getTitle(2))
        ],
        fixedColor: Colors.orange,
        // 高亮选项
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Icon getIcon(int curIndex) {
    if (curIndex == _currentIndex) {
      return Icon(navIcons[curIndex], color: const Color(0xff845F3F));
    } else {
      return Icon(navIcons[curIndex], color: const Color(0xff696969));
    }
  }

  Text getTitle(int curIndex) {
    if (curIndex == _currentIndex) {
      return Text(navTitles[curIndex],
          style: new TextStyle(fontSize: 14, color: const Color(0xff845F3F)));
    } else {
      return Text(navTitles[curIndex],
          style: new TextStyle(fontSize: 14, color: const Color(0xff696969)));
    }
  }
}
