import 'package:flutter/material.dart';
import 'package:flutter_mobile/validation/login_validation.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            margin: EdgeInsets.only(
              left: SizeConfig.blockHorizontal * 85,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: SizeConfig.blockVertical * 3),
            height: SizeConfig.blockVertical * 80,
            width: SizeConfig.blockHorizontal * 95,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockHorizontal * 24,
                      top: SizeConfig.blockVertical * 3),
                  height: SizeConfig.blockVertical * 30,
                  width: SizeConfig.blockHorizontal * 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.blockVertical * 6,
                            left: SizeConfig.blockHorizontal * 3),
                        child: Image.asset('images/logo.png',
                            height: SizeConfig.blockVertical * 45,
                            width: SizeConfig.blockHorizontal * 45),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockHorizontal * 15,
                            top: SizeConfig.blockVertical * 27),
                        height: SizeConfig.blockVertical * 0.8,
                        width: SizeConfig.blockHorizontal * 22,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockVertical * 35,
                      left: SizeConfig.blockHorizontal * 5),
                  height: SizeConfig.blockVertical * 6,
                  width: SizeConfig.blockHorizontal * 85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockVertical * 1,
                            left: SizeConfig.blockHorizontal * 5),
                        child: Container(
                          margin: EdgeInsets.only(
                              right: SizeConfig.blockHorizontal * 6),
                          child: Center(
                            child: Text(
                              'Hello, Armor Kopi Leuwit!',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockHorizontal * 0,
                          top: SizeConfig.blockVertical * 40),
                      height: SizeConfig.blockVertical * 25,
                      width: SizeConfig.blockHorizontal * 95,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Container(
                        child: ValidationLogin(),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: SizeConfig.blockVertical * 62),
                      height: SizeConfig.blockHorizontal * 20,
                      width: SizeConfig.blockHorizontal * 95,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockHorizontal * 23,
                                top: SizeConfig.blockVertical * 1),
                            child: Text(
                              'Qoligo© Mobile Pos Lite Ver.01',
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
