import 'package:flutter/material.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:flutter_mobile/widgets/summery%20page/change_summerypage.dart';
import 'package:flutter_mobile/widgets/table%20page/page_table.dart';
import 'package:sizer/sizer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ViewBarPage extends StatefulWidget {
  @override
  State<ViewBarPage> createState() => _ViewBarPage();
}

class _ViewBarPage extends State<ViewBarPage> {
  int _currentIndex = 0;
  List options = [
    ViewTable(),
    ChangeSummerPage(),
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
