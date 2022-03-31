import 'package:flutter/material.dart';
import 'package:flutter_mobile/navigation%20page/menu_navbar.dart';
import 'package:flutter_mobile/screens/customer%20count/num_pad.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';

import 'package:sizer/sizer.dart';

class NumpadPage extends StatefulWidget {
  const NumpadPage({Key? key}) : super(key: key);

  @override
  _NumpadState createState() => _NumpadState();
}

class _NumpadState extends State<NumpadPage> {
  final TextEditingController _myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(7),
              child: SizedBox(
                height: SizeConfig.blockVertical * 10,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      hintText: 'Enter Customer Count',
                    ),
                    controller: _myController,
                    textAlign: TextAlign.center,
                    showCursor: false,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.none,
                  ),
                ),
              ),
            ),
            NumPad(
              buttonSize: 80,
              buttonColor: Colors.amber,
              delete: () {
                _myController.text = _myController.text
                    .substring(0, _myController.text.length - 1);
              },
              onSubmit: () {
                setState(() {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ViewMenu()));
                });
              },
              controller: _myController,
            )
          ],
        ),
      );
    });
  }
}
