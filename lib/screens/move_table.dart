import 'package:flutter/material.dart';

import 'package:flutter_mobile/screens/move_table_page.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/validation/navbutton_page.dart';

import 'package:sizer/sizer.dart';

import 'marge_table.dart';

class MoveTables extends StatefulWidget {
  const MoveTables({Key? key}) : super(key: key);

  @override
  State<MoveTables> createState() => _MoveTableState();
}

class _MoveTableState extends State<MoveTables> {
  int _currentIndex = 0;
  List options = [MoveTable(), MargeTables()];
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 18),
            child: Text(
              'Move Table',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => ViewBar()));
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          actions: [
            Container(
              height: SizeConfig.blockVertical * 3,
              width: SizeConfig.blockHorizontal * 25,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: options[_currentIndex],
        ),
      );
    });
  }
}
