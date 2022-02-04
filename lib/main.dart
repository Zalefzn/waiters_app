import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_mobile/widgets/login_page.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
              splash: Image.asset('images/logo.png', height: 40.h, width: 40.w),
              nextScreen: LoginPage(),
              splashTransition: SplashTransition.fadeTransition));
    });
  }
}
