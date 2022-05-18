import 'package:flutter/material.dart';
import 'package:flutter_mobile/providers/posSetting.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/utilities/methodStyle/theme.dart';
import 'package:flutter_mobile/widgets/loginPage/login_validation.dart';
import 'package:flutter_mobile/widgets/setting/setting.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    PosProviders posProviders =
        Provider.of<PosProviders>(context, listen: false);

    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundClor,
          elevation: 0,
          title: Container(
            margin: EdgeInsets.only(
              left: SizeConfig.blockHorizontal * 85,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Settings()));
                },
                icon: const Icon(Icons.settings),
                color: iconColor2),
          ],
        ),
        backgroundColor: backgroundClor,
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: SizeConfig.blockVertical * 3),
            height: SizeConfig.blockVertical * 80,
            width: SizeConfig.blockHorizontal * 95,
            decoration: BoxDecoration(color: backgroundClor),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockHorizontal * 24,
                      top: SizeConfig.blockVertical * 3),
                  height: SizeConfig.blockVertical * 30,
                  width: SizeConfig.blockHorizontal * 50,
                  decoration: BoxDecoration(
                    color: backgroundClor,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: SizeConfig.blockVertical * 7,
                              left: SizeConfig.blockHorizontal * 1),
                          child: Image.asset('images/logo.png',
                              height: SizeConfig.blockVertical * 45,
                              width: SizeConfig.blockHorizontal * 45),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockHorizontal * 13,
                            top: SizeConfig.blockVertical * 27),
                        height: SizeConfig.blockVertical * 0.8,
                        width: SizeConfig.blockHorizontal * 22,
                        decoration: BoxDecoration(
                          color: buttonNavbar,
                          borderRadius: BorderRadius.circular(0),
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
                    color: backgroundClor,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockVertical * 1,
                            left: SizeConfig.blockHorizontal * 5),
                        child: Container(
                          margin: EdgeInsets.only(
                              right: SizeConfig.blockHorizontal * 3.5),
                          child: Center(
                            child: Text('Hello, Armor Kopi Leuwit!',
                                style: textWelcome.copyWith(fontSize: 14.sp)),
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
                        color: backgroundClor,
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
                        color: backgroundClor,
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.blockHorizontal * 2,
                                  bottom: SizeConfig.blockVertical * 5),
                              child: Text('Qoligo© Mobile Waiter Ver.01',
                                  style: footerText.copyWith(fontSize: 10.sp)),
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
