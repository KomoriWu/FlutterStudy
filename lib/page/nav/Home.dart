import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/detail.dart';

import '../second_detail.dart';

class HomePage extends StatelessWidget {
  var context;
  @override
  Widget build(BuildContext context) {
    this.context = context;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("主页"),
      ),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView(children: <Widget>[
      ListTile(
        title: Text("导航栏组件", style: TextStyle(fontWeight: FontWeight.w500)),
        leading: Icon(Icons.home),
        subtitle: Text("常见的底部导航栏组件"),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SecondDetailPage()));
        },
      )
    ]);
  }
}
