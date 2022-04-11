import 'package:flutter/material.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:flutter_mobile/screens/customer%20count/input_count.dart';
import 'package:flutter_mobile/widgets/summery%20page/summery_page.dart';
import 'package:sizer/sizer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_mobile/validation/method style/theme.dart';

class InputCustomer extends StatefulWidget {
  const InputCustomer({Key? key}) : super(key: key);

  @override
  State<InputCustomer> createState() => _InputCustomer();
}

class _InputCustomer extends State<InputCustomer> {
  int _currentIndex = 0;
  int selectedIndex = 0;
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
              color: selectedIndex == 0 ? buttonNavbar : buttonNavbar2,
            ),
            Icon(
              Icons.summarize_outlined,
              color: selectedIndex == 1 ? buttonNavbar : buttonNavbar2,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              selectedIndex = index;
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
