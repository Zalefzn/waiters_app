import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:sizer/sizer.dart';

class NumPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;

  const NumPad({
    Key? key,
    this.buttonSize = 50,
    this.buttonColor = Colors.amber,
    this.iconColor = Colors.black,
    required this.delete,
    required this.onSubmit,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List number = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "0",
    ];
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Container(
        margin: EdgeInsets.only(
            left: SizeConfig.blockHorizontal * 5,
            right: SizeConfig.blockHorizontal * 5),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.blockVertical * 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  number: 1,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                NumberButton(
                  number: 2,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                NumberButton(
                  number: 3,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockVertical * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  number: 4,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                NumberButton(
                  number: 5,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                NumberButton(
                    number: 6,
                    size: buttonSize,
                    color: buttonColor,
                    controller: controller),
              ],
            ),
            SizedBox(height: SizeConfig.blockVertical * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  number: 7,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                NumberButton(
                  number: 8,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                NumberButton(
                  number: 9,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockVertical * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: SizeConfig.blockVertical * 11.5,
                  width: SizeConfig.blockHorizontal * 19.5,
                  child: ElevatedButton(
                      onPressed: () => delete(),
                      child: Text(
                        'C',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade300,
                      )),
                ),
                NumberButton(
                  number: 0,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                Container(
                  height: SizeConfig.blockVertical * 11.5,
                  width: SizeConfig.blockHorizontal * 19.5,
                  child: ElevatedButton(
                    onPressed: () => onSubmit(),
                    child: Text('OK',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade300,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: GestureDetector(
        onTap: () async {},
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey.shade300,
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onPressed: () async {
            controller.text += number.toString();
            SharedPreferences getCount = await SharedPreferences.getInstance();
            getCount.setInt("key", number);
            print(number);
          },
        ),
      ),
    );
  }
}
