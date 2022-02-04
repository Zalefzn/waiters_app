import 'package:flutter/material.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/widgets/input_count.dart';
import 'package:flutter_mobile/widgets/page_view.dart';
import 'package:flutter_mobile/widgets/summery_page.dart';
import 'package:sizer/sizer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class InputCustomer extends StatefulWidget {
  const InputCustomer({Key? key}) : super(key: key);

  @override
  State<InputCustomer> createState() => _InputCustomer();
}

class _InputCustomer extends State<InputCustomer> {
  int _currentIndex = 0;
  List options = [
    InputCount(),
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
