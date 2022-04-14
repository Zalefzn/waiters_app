import 'package:flutter/material.dart';
import 'package:flutter_mobile/navigation%20page/navigation_navbar.dart';
import 'package:flutter_mobile/screens/customer%20count/numpad_page.dart';
import 'package:flutter_mobile/screens/marge%20&%20move/marge_table.dart';
import 'package:flutter_mobile/screens/marge%20&%20move/move_table.dart';
import 'package:flutter_mobile/screens/setting%20&%20Logout/logout.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
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

class InputCount extends StatefulWidget {
  const InputCount({Key? key}) : super(key: key);

  @override
  State<InputCount> createState() => _InputCount();
}

class _InputCount extends State<InputCount> {
  int selectedIndex = 0;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: backgroundClor,
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: Container(
            margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 23),
            child: Image.asset('images/qoligo_white.png',
                width: SizeConfig.blockHorizontal * 22,
                height: SizeConfig.blockVertical * 22),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LogOut()));
            },
            icon: Icon(Icons.settings),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                  );
                },
                icon: Icon(
                  Icons.table_chart,
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: SizeConfig.blockVertical * 62,
                      child: Stack(
                        children: [
                          Container(
                            child: NumpadPage(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 76.h, left: SizeConfig.blockHorizontal * 3),
                      height: SizeConfig.blockVertical * 7,
                      width: SizeConfig.blockHorizontal * 95,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewBar()));
                          });
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.indigoAccent.shade400,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.indigoAccent.shade400,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

_buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: Center(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 10),
            child: Text(
              'Table Management',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 2,
                bottom: SizeConfig.blockVertical * 0),
            height: SizeConfig.blockVertical * 5,
            width: SizeConfig.blockHorizontal * 15,
            child: RaisedButton(
                color: backgroundClor,
                elevation: 0,
                child: Icon(Icons.close),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ViewBar()));
                }),
          ),
        ],
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: SizeConfig.blockVertical * 8,
          width: SizeConfig.blockHorizontal * 95,
          child: ElevatedButton(
            child: Text('Marge Table'),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MargeTable()));
            },
            style: ElevatedButton.styleFrom(
              primary: buttonNavbar,
            ),
          ),
        ),
        SizedBox(height: SizeConfig.blockVertical * 1),
        Container(
          height: SizeConfig.blockVertical * 8,
          width: SizeConfig.blockHorizontal * 95,
          child: ElevatedButton(
            child: Text('Move Table'),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MoveTable()));
            },
            style: ElevatedButton.styleFrom(
              primary: buttonNavbar,
            ),
          ),
        ),
      ],
    ),
  );
}
