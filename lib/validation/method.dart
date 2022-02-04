import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = _mediaQueryData;
  static double screenWidth = screenHeight;
  static double screenHeight = screenHeight;
  static double blockHorizontal = blockHorizontal;
  static double blockVertical = blockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockHorizontal = screenWidth / 100;
    blockVertical = screenHeight / 100;
  }
}
