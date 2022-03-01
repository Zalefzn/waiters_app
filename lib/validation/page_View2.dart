import 'package:flutter/material.dart';

import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/widgets/page2.dart';

import 'package:flutter_mobile/widgets/summery_page.dart';

import 'package:sizer/sizer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ViewBar2 extends StatefulWidget {
  const ViewBar2({Key? key}) : super(key: key);

  @override
  State<ViewBar2> createState() => _ViewBar2State();
}

class _ViewBar2State extends State<ViewBar2> {
  int _currentIndex = 0;
  List options = [
    ViewPage2(),
    SummeryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
