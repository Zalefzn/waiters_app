import 'package:flutter/material.dart';
import 'package:flutter_mobile/screens/input_customer_count.dart';
import 'package:flutter_mobile/screens/logout.dart';
import 'package:flutter_mobile/screens/marge_table.dart';
import 'package:flutter_mobile/screens/move_table.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_mobile/validation/navbutton_page.dart';
import 'package:flutter_mobile/validation/page_View2.dart';

import 'package:sizer/sizer.dart';

class ViewPage2 extends StatefulWidget {
  ViewPage2({Key? key}) : super(key: key);

  TextEditingController indoor = TextEditingController();
  TextEditingController outdoor = TextEditingController();

  @override
  State<ViewPage2> createState() => _ViewPage2State();
}

class _ViewPage2State extends State<ViewPage2> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Container(
            margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 23),
            child: Image.asset('images/qoligo_white.png',
                width: SizeConfig.blockHorizontal * 22,
                height: SizeConfig.blockVertical * 22),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LogOut()));
            },
            icon: Icon(Icons.settings),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                  );
                },
                icon: Icon(
                  Icons.table_chart,
                )),
          ],
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Material(
                  elevation: 4,
                  child: Stack(
                    children: [
                      Container(
                        height: SizeConfig.blockVertical * 10,
                        width: SizeConfig.blockHorizontal * 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockHorizontal * 3,
                                      top: SizeConfig.blockVertical * 3),
                                  child: Text(
                                    'Section/Floor : ',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockHorizontal * 1,
                                      top: SizeConfig.blockVertical * 2.5),
                                  width: SizeConfig.blockHorizontal * 64,
                                  height: SizeConfig.blockVertical * 5,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButton<String>(
                                    hint: Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockVertical * 2),
                                      child: Text(
                                        'Outdoor',
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
                                        case 'Indoor':
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewBar()));
                                          break;
                                        case 'Outdoor':
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewBar2()));
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.blockVertical * 1),
              height: SizeConfig.blockVertical * 65.9,
              width: SizeConfig.blockHorizontal * 100,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockHorizontal * 4,
                                    top: SizeConfig.blockVertical * 2),
                                height: SizeConfig.blockVertical * 23,
                                width: SizeConfig.blockHorizontal * 44,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InputCustomer()));
                                    });
                                  },
                                  child: Text(
                                    'T-1',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey[300],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockHorizontal * 4,
                                    top: SizeConfig.blockVertical * 2),
                                height: SizeConfig.blockVertical * 23,
                                width: SizeConfig.blockHorizontal * 44,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InputCustomer()));
                                    });
                                  },
                                  child: Text(
                                    'T-2',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey[300],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockHorizontal * 4,
                                    top: SizeConfig.blockVertical * 2),
                                height: SizeConfig.blockVertical * 23,
                                width: SizeConfig.blockHorizontal * 44,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InputCustomer()));
                                    });
                                  },
                                  child: Text(
                                    'T-3',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey[300],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockHorizontal * 4,
                                    top: SizeConfig.blockVertical * 2),
                                height: SizeConfig.blockVertical * 23,
                                width: SizeConfig.blockHorizontal * 44,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InputCustomer()));
                                    });
                                  },
                                  child: Text(
                                    'T-4',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey[300],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockHorizontal * 4,
                                    top: SizeConfig.blockVertical * 2),
                                height: SizeConfig.blockVertical * 23,
                                width: SizeConfig.blockHorizontal * 44,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InputCustomer()));
                                    });
                                  },
                                  child: Text(
                                    'T-5',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey[300],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockHorizontal * 4,
                                    top: SizeConfig.blockVertical * 2),
                                height: SizeConfig.blockVertical * 23,
                                width: SizeConfig.blockHorizontal * 44,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InputCustomer()));
                                    });
                                  },
                                  child: Text(
                                    'T-6',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey[300],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

_buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: Center(
      child: Text(
        'Table Management',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: SizeConfig.blockVertical * 8,
          width: SizeConfig.blockHorizontal * 95,
          child: ElevatedButton(
            child: Text('Marge Table'),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MargeTables()));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue.shade900,
            ),
          ),
        ),
        SizedBox(height: SizeConfig.blockVertical * 1),
        Container(
          height: SizeConfig.blockVertical * 8,
          width: SizeConfig.blockHorizontal * 95,
          child: ElevatedButton(
            child: Text('Move Table'),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MoveTables()));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue.shade900,
            ),
          ),
        ),
      ],
    ),
  );
}

List<DropdownMenuItem<String>> _dropDownItem() {
  List<String> dll = ['Indoor', 'Outdoor'];
  return dll
      .map(
        (value) => DropdownMenuItem(value: value, child: Text(value)),
      )
      .toList();
}
