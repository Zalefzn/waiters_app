import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_mobile/validation/method.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: Column(
          children: [
            Hero(
              tag: 'Card',
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      height: SizeConfig.blockVertical * 35,
                      width: SizeConfig.blockHorizontal * 100,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: SizeConfig.blockVertical * 25,
              width: SizeConfig.blockHorizontal * 100,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      );
    });
  }
}
