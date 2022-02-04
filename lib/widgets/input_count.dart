import 'package:flutter/material.dart';
import 'package:flutter_mobile/screens/logout.dart';
import 'package:flutter_mobile/screens/numpad_page.dart';

import 'package:flutter_mobile/validation/method.dart';

import 'package:flutter_mobile/validation/navbutton_page.dart';

import 'package:sizer/sizer.dart';

class InputCount extends StatefulWidget {
  const InputCount({Key? key}) : super(key: key);

  @override
  State<InputCount> createState() => _InputCount();
}

class _InputCount extends State<InputCount> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
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
                onPressed: () {},
                icon: Icon(
                  Icons.table_chart,
                )),
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    height: SizeConfig.blockVertical * 67,
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
                        top: SizeConfig.blockVertical * 68,
                        left: SizeConfig.blockHorizontal * 3),
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
                          color: Colors.blue.shade900,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.blue.shade900,
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
      );
    });
  }
}
