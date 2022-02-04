import 'package:flutter/material.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:sizer/sizer.dart';

class MoveTable extends StatefulWidget {
  MoveTable({Key? key}) : super(key: key);

  @override
  _MoveTable createState() => _MoveTable();
}

class _MoveTable extends State<MoveTable> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
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
                                  child: DropdownSearch<String>(
                                    mode: Mode.MENU,
                                    items: [
                                      "Indoor",
                                      "Outdoor",
                                    ],
                                    onChanged: print,
                                    selectedItem: 'Indoor',
                                    dropdownSearchDecoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.blockHorizontal * 1,
                                        vertical: SizeConfig.blockVertical * 1,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
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
                      top: SizeConfig.blockVertical * 3,
                      left: SizeConfig.blockHorizontal * 13),
                  child: Text(
                    'Main Table : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockVertical * 3,
                      left: SizeConfig.blockHorizontal * 20),
                  child: Text(
                    'Destination Table : ',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
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
                                  left: SizeConfig.blockHorizontal * 4,
                                  top: SizeConfig.blockVertical * 2,
                                ),
                                height: SizeConfig.blockVertical * 23,
                                width: SizeConfig.blockHorizontal * 44,
                                child: ElevatedButton(
                                  onPressed: () {},
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
