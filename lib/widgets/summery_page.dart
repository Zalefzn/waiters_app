import 'package:flutter/material.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/validation/navbutton_page.dart';

import 'package:sizer/sizer.dart';

class SummeryPage extends StatefulWidget {
  const SummeryPage({Key? key}) : super(key: key);

  @override
  State<SummeryPage> createState() => _SummeryPage();
}

class _SummeryPage extends State<SummeryPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: RaisedButton(
            child: Icon(Icons.arrow_back),
            color: Colors.white,
            elevation: 0,
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => ViewBar()));
            },
          ),
          title: Container(
              margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 18,
              ),
              child: Text('Order Summary',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.black))),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.mode_edit_rounded, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: SizeConfig.blockVertical * 12,
              width: SizeConfig.blockHorizontal * 100,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(''),
            ),
            Container(
              padding: EdgeInsets.only(
                top: SizeConfig.blockVertical * 30,
              ),
              child: Center(
                child: Text(
                  'No Orders Yet',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
