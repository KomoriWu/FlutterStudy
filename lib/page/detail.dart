import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/BottomNavigationWidget.dart';
import 'package:flutter_app/page/second_detail.dart';

class DetailPage extends StatelessWidget {
  var context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return new BottomNavigationWidget();
  }

}
