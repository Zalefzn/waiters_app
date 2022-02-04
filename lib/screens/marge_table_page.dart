import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_mobile/validation/method.dart';

import 'package:flutter_mobile/validation/navbutton_page.dart';
import 'package:flutter_mobile/validation/page_View2.dart';
import 'package:sizer/sizer.dart';

class MargeTable extends StatefulWidget {
  MargeTable({Key? key}) : super(key: key);

  @override
  _MargeTable createState() => _MargeTable();
}

class _MargeTable extends State<MargeTable> {
  bool isVisible = true;
  bool isVisible2 = true;
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 16),
            child: Text(
              'Marge Table',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => ViewBar()));
            },
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          actions: [
            Container(
              height: SizeConfig.blockVertical * 3,
              width: SizeConfig.blockHorizontal * 25,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ViewBar()));
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
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
                                    top: SizeConfig.blockVertical * 3,
                                  ),
                                  child: Text(
                                    'Section/Floor :',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                                        'Indoor',
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
                                                      MargeTable()));
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
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockVertical * 2,
                      left: SizeConfig.blockHorizontal * 15),
                  height: SizeConfig.blockVertical * 4,
                  width: SizeConfig.blockHorizontal * 33,
                  child: Text('Main Table : ',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockVertical * 2,
                      left: SizeConfig.blockHorizontal * 10),
                  height: SizeConfig.blockVertical * 4,
                  width: SizeConfig.blockHorizontal * 33,
                  child: Text('Merged Tables : ',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.blockVertical * 1),
              height: SizeConfig.blockVertical * 60.2,
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
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: SizeConfig.blockHorizontal * 4,
                                      top: SizeConfig.blockVertical * 2,
                                    ),
                                    height: SizeConfig.blockVertical * 23,
                                    width: SizeConfig.blockHorizontal * 44,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          isVisible = !isVisible;
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
                                        primary: Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: SizeConfig.blockHorizontal * 7.5,
                                        top: SizeConfig.blockVertical * 6),
                                    height: SizeConfig.blockVertical * 4,
                                    width: SizeConfig.blockHorizontal * 35,
                                    child: Center(
                                        child: Visibility(
                                      visible: isVisible,
                                      maintainAnimation: true,
                                      maintainSize: true,
                                      maintainState: true,
                                      child: Text(
                                        'Main Table',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: SizeConfig.blockHorizontal * 4,
                                      top: SizeConfig.blockVertical * 2,
                                    ),
                                    height: SizeConfig.blockVertical * 23,
                                    width: SizeConfig.blockHorizontal * 44,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          isVisible2 = !isVisible2;
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
                                        primary: Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: SizeConfig.blockHorizontal * 7.5,
                                        top: SizeConfig.blockVertical * 6),
                                    height: SizeConfig.blockVertical * 4,
                                    width: SizeConfig.blockHorizontal * 35,
                                    child: Center(
                                        child: Visibility(
                                      visible: isVisible2,
                                      maintainAnimation: true,
                                      maintainSize: true,
                                      maintainState: true,
                                      child: Text(
                                        'Child Table',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: SizeConfig.blockHorizontal * 4,
                                  top: SizeConfig.blockVertical * 2,
                                ),
                                height: SizeConfig.blockVertical * 23,
                                width: SizeConfig.blockHorizontal * 44,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'T-3',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: SizeConfig.blockHorizontal * 4,
                                  top: SizeConfig.blockVertical * 2,
                                ),
                                height: SizeConfig.blockVertical * 23,
                                width: SizeConfig.blockHorizontal * 44,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'T-4',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey.shade300,
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
                                  top: SizeConfig.blockVertical * 2,
                                ),
                                height: SizeConfig.blockVertical * 23,
                                width: SizeConfig.blockHorizontal * 44,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'T-5',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: SizeConfig.blockHorizontal * 4,
                                  top: SizeConfig.blockVertical * 2,
                                ),
                                height: SizeConfig.blockVertical * 23,
                                width: SizeConfig.blockHorizontal * 44,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'T-6',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey.shade300,
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
                                  top: SizeConfig.blockVertical * 2,
                                ),
                                height: SizeConfig.blockVertical * 23,
                                width: SizeConfig.blockHorizontal * 44,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'T-7',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: SizeConfig.blockHorizontal * 4,
                                  top: SizeConfig.blockVertical * 2,
                                ),
                                height: SizeConfig.blockVertical * 23,
                                width: SizeConfig.blockHorizontal * 44,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'T-8',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey.shade300,
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

List<DropdownMenuItem<String>> _dropDownItem() {
  List<String> dll = ['Indoor', 'Outdoor'];
  return dll
      .map(
        (value) => DropdownMenuItem(value: value, child: Text(value)),
      )
      .toList();
}
