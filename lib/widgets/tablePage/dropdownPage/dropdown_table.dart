import 'package:flutter/material.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/widgets/tablePage/beforeOrderTab/page_view.dart';
import 'package:sizer/sizer.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({Key? key}) : super(key: key);

  @override
  State<DropdownPage> createState() => _DropdownPage();
}

class _DropdownPage extends State<DropdownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 3,
                top: SizeConfig.blockVertical * 3),
            child: Text(
              'Section/Floor : ',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 1,
                top: SizeConfig.blockVertical * 2.5),
            width: SizeConfig.blockHorizontal * 60,
            height: SizeConfig.blockVertical * 5,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(8)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 2),
                  child: Text(
                    "Select Section",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                elevation: 0,
                items: _dropDownItem(),
                onChanged: (value) {
                  switch (value) {
                    case 'Base Section':
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => ViewPage()));
                      break;
                    case 'Section 001':
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => ViewPage()));
                      break;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<DropdownMenuItem<String>> _dropDownItem() {
  List<String> dll = ['Base Section', 'Section 001'];
  return dll
      .map(
        (value) => DropdownMenuItem(value: value, child: Text(value)),
      )
      .toList();
}
