import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/page/detail.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../second_detail.dart';

class HomePage extends StatefulWidget {
  var context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
  }

  @override
  _HomePageState createState() {
   return _HomePageState();
  }
}

//有状态的page
class _HomePageState extends State<HomePage> {
  static const MethodChannel _methodChannel =
  MethodChannel("com.wz.jump/plugin");

  static const EventChannel _eventChannel =
      const EventChannel("com.wz.event/plugin");
  var _streamSubscription;
  var _platformMessage;

  @override
  Widget build(BuildContext context) {
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
      ),
      ListTile(
        title: Text("flutter与native交互", style: TextStyle(fontWeight: FontWeight.w500)),
        leading: Icon(Icons.settings),
        subtitle: Text("MethodChannel、EventChannel"),
        trailing: Icon(Icons.chevron_right),
        onTap: () async {
          String result = await _methodChannel.invokeMethod("one_act");
        },
      )
    ]);
  }
  @override
  void initState() {
    super.initState();
    _enableEventReceiver();
  }

  @override
  void dispose() {
    super.dispose();
    _disableEventReceiver();
  }

  void _enableEventReceiver() {
    _streamSubscription =
        _eventChannel.receiveBroadcastStream().listen((event) {
      print('Received event: $event');
      Fluttertoast.showToast(msg: 'Received event: $event');
      setState(() {
        _platformMessage = event;
      });

    }, onError: (dynamic error) {
      print('Received error: ${error.message}');
    }, cancelOnError: true);
  }

  void _disableEventReceiver() {
    if (_streamSubscription != null) {
      _streamSubscription.cancel();
      _streamSubscription = null;
    }
  }
}
