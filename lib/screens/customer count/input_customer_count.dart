import 'package:flutter/material.dart';
import 'package:flutter_mobile/method/method%20size/method.dart';
import 'package:flutter_mobile/method/method%20style/theme.dart';
import 'package:flutter_mobile/screens/customer%20count/numpad_page.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:flutter_mobile/widgets/summery%20page/summery_page.dart';
import 'package:flutter_mobile/widgets/table%20page/page_view.dart';
import 'package:sizer/sizer.dart';
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
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: _currentIndex,
        //   selectedItemColor: buttonNavbar,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.shopping_bag_outlined,
        //       ),
        //       title: Text("Order"),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.summarize_outlined,
        //       ),
        //       title: Text("Summary"),
        //     )
        //   ],
        //   onTap: (index) {
        //     setState(() {
        //       _currentIndex = index;
        //     });
        //   },
        // ),
        // bottomNavigationBar: CurvedNavigationBar(
        //   buttonBackgroundColor: Colors.white,
        //   backgroundColor: Colors.grey.shade300,
        //   animationDuration: Duration(milliseconds: 400),
        //   animationCurve: Curves.easeIn,
        //   items: [
        //     Column(
        //       children: [
        //         Icon(
        //           Icons.shopping_bag_outlined,
        //           color: selectedIndex == 0 ? buttonNavbar : buttonNavbar2,
        //         ),
        //         Text("Order",
        //             style: TextStyle(
        //               fontSize: 13,
        //               fontWeight: FontWeight.w700,
        //               color: selectedIndex == 0 ? buttonNavbar : buttonNavbar2,
        //             ))
        //       ],
        //     ),
        //     Column(
        //       children: [
        //         Icon(
        //           Icons.summarize_outlined,
        //           color: selectedIndex == 1 ? buttonNavbar : buttonNavbar2,
        //         ),
        //         Text("Summary",
        //             style: TextStyle(
        //               fontSize: 13,
        //               fontWeight: FontWeight.w700,
        //               color: selectedIndex == 1 ? buttonNavbar : buttonNavbar2,
        //             ))
        //       ],
        //     ),
        //   ],
        //   onTap: (index) {
        //     setState(() {
        //       _currentIndex = index;
        //       selectedIndex = index;
        //     });
        //   },
        // ),
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
  bool buttonNump = false;
  bool textButton = false;
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
                            textButton ? null : textButton = !textButton;
                            buttonNump ? null : buttonNump = !buttonNump;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewPage()));
                          });
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: textButton ? backgroundClor : buttonNavbar,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: buttonNump ? buttonNavbar : backgroundClor,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: buttonNavbar,
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
