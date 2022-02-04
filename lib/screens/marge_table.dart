import 'package:flutter/material.dart';
import 'package:flutter_mobile/screens/marge_table_page.dart';
import 'package:flutter_mobile/screens/move_table.dart';

import 'package:sizer/sizer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MargeTables extends StatefulWidget {
  const MargeTables({Key? key}) : super(key: key);

  @override
  State<MargeTables> createState() => _MargeTableState();
}

class _MargeTableState extends State<MargeTables> {
  int _currentIndex = 0;
  List options = [
    MargeTable(),
    MoveTables(),
  ];
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.grey.shade300,
          animationDuration: Duration(milliseconds: 400),
          animationCurve: Curves.easeIn,
          items: [
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
            Icon(
              Icons.summarize_outlined,
              color: Colors.black,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: options[_currentIndex],
        ),
      );
    });
  }
}
