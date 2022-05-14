import 'package:flutter/material.dart';
import 'package:flutter_mobile/method/methodSize/method.dart';
import 'package:flutter_mobile/method/methodStyle/theme.dart';
import 'package:flutter_mobile/navigation/navigation_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class NumpadPage extends StatefulWidget {
  const NumpadPage({Key? key}) : super(key: key);

  @override
  _NumpadState createState() => _NumpadState();
}

class _NumpadState extends State<NumpadPage> {
  var loading = false;

  @override
  void initState() {
    setState(() {
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          loading = false;
        });
      });
      loading = true;
    });

    super.initState();
  }

  bool isValidate = false;
  final _fromKey = GlobalKey<FormState>();

  final TextEditingController _myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _fromKey,
              child: Padding(
                padding: EdgeInsets.all(7),
                child: SizedBox(
                  height: SizeConfig.blockVertical * 8,
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: isValidate ? buttonNavbar : buttonColor3),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        hintText: "Enter Customer Count",
                      ),
                      controller: _myController,
                      textAlign: TextAlign.center,
                      showCursor: false,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Count Number!";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.none,
                    ),
                  ),
                ),
              ),
            ),
            NumPad(
              buttonSize: 15.h,
              colorButton: Colors.white,
              delete: () {
                _myController.text = _myController.text
                    .substring(0, _myController.text.length - 1);
              },
              onSubmit: () {
                if (_fromKey.currentState!.validate()) {
                  setState(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewMenuGrid()));
                  });
                }
              },
              controller: _myController,
            )
          ],
        ),
      );
    });
  }
}

class NumPad extends StatelessWidget {
  final double buttonSize;
  final Color colorButton;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;

  const NumPad({
    Key? key,
    this.buttonSize = 80,
    this.colorButton = Colors.grey,
    this.iconColor = Colors.black,
    required this.delete,
    required this.onSubmit,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numpadColor = 0;
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
            SizedBox(height: SizeConfig.blockVertical * 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  number: 7,
                  size: buttonSize,
                  color: numpadColor == 1 ? buttonNavbar : buttonColor,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: SizeConfig.blockVertical * 10,
                  width: SizeConfig.blockHorizontal * 25,
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
                          primary: buttonColor2, onPrimary: buttonNavbar)),
                ),
                NumberButton(
                  number: 0,
                  size: buttonSize,
                  color: buttonColor,
                  controller: controller,
                ),
                Container(
                  height: SizeConfig.blockVertical * 10,
                  width: SizeConfig.blockHorizontal * 25,
                  child: ElevatedButton(
                    onPressed: () => onSubmit(),
                    child: Text('OK',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                        primary: buttonColor2, onPrimary: buttonNavbar),
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
    return Container(
      margin: EdgeInsets.all(4),
      width: SizeConfig.blockHorizontal * 25,
      height: SizeConfig.blockVertical * 10,
      child: GestureDetector(
        onTap: () {},
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: buttonColor2, onPrimary: buttonNavbar),
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
