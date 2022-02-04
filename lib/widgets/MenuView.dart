import 'package:flutter/material.dart';
import 'package:flutter_mobile/screens/input_customer_count.dart';
import 'package:flutter_mobile/screens/logout.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:sizer/sizer.dart';

class MenuView extends StatefulWidget {
  MenuView({Key? key}) : super(key: key);

  TextEditingController indoor = TextEditingController();
  TextEditingController outdoor = TextEditingController();

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
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
                onPressed: () {},
                icon: Icon(
                  Icons.calculate_outlined,
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
                                      color: Colors.white,
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
                                  onPressed: () {},
                                  child: Text(
                                    'T-2',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
                                  onPressed: () {},
                                  child: Text(
                                    'T-3',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
                                  onPressed: () {},
                                  child: Text(
                                    'T-4',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
                                  onPressed: () {},
                                  child: Text(
                                    'T-5',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
                                  onPressed: () {},
                                  child: Text(
                                    'T-6',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
                                  onPressed: () {},
                                  child: Text(
                                    'T-7',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
                                  onPressed: () {},
                                  child: Text(
                                    'T-8',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
