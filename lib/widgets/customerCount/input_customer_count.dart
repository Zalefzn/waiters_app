import 'package:flutter/material.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/utilities/methodStyle/theme.dart';
import 'package:flutter_mobile/widgets/customerCount/numpad_page.dart';
import 'package:flutter_mobile/widgets/tablePage/beforeOrderTab/page_view.dart';
import 'package:sizer/sizer.dart';

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
