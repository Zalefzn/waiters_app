import 'package:flutter/material.dart';

import 'package:flutter_mobile/screens/logout.dart';
import 'package:flutter_mobile/screens/produk_list.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'dart:convert';
import 'package:flutter_mobile/validation/method.dart';
import 'package:sizer/sizer.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  TextEditingController indoor = TextEditingController();
  TextEditingController outdoor = TextEditingController();
  TextEditingController controller = TextEditingController();

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
        ),
        body: SingleChildScrollView(
          child: Column(
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
                                        left: SizeConfig.blockHorizontal * 2.5,
                                        top: SizeConfig.blockVertical * 2),
                                    height: SizeConfig.blockVertical * 6,
                                    width: SizeConfig.blockHorizontal * 95,
                                    child: ElevatedButton(
                                      child: Text(
                                        'List Menu                                                                   >',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                      onPressed: () {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            enableDrag: true,
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                height:
                                                    SizeConfig.blockVertical *
                                                        90,
                                                color: Colors.white,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                          top: SizeConfig
                                                                  .blockVertical *
                                                              2,
                                                        ),
                                                        height: SizeConfig
                                                                .blockVertical *
                                                            1,
                                                        width: SizeConfig
                                                                .blockHorizontal *
                                                            40,
                                                        color: Colors
                                                            .grey.shade300,
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: SizeConfig
                                                                    .blockVertical *
                                                                2),
                                                        child: Text(
                                                          'Armor Kopi Leuwit - Best Seller',
                                                          style: TextStyle(
                                                            fontSize: 15.sp,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: SizeConfig
                                                                    .blockVertical *
                                                                2,
                                                            left: SizeConfig
                                                                    .blockHorizontal *
                                                                0),
                                                        height: SizeConfig
                                                                .blockVertical *
                                                            80,
                                                        width: SizeConfig
                                                                .blockHorizontal *
                                                            100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                        ),
                                                        child: ListView(
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  left: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  right: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  top: SizeConfig
                                                                          .blockVertical *
                                                                      2),
                                                              height: SizeConfig
                                                                      .blockVertical *
                                                                  9,
                                                              width: SizeConfig
                                                                      .blockHorizontal *
                                                                  95,
                                                              child:
                                                                  ElevatedButton(
                                                                child: Text(
                                                                  'All Menu Items',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary: Colors
                                                                      .white,
                                                                  elevation: 0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(7),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  left: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  right: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  top: SizeConfig
                                                                          .blockVertical *
                                                                      2),
                                                              height: SizeConfig
                                                                      .blockVertical *
                                                                  9,
                                                              width: SizeConfig
                                                                      .blockHorizontal *
                                                                  95,
                                                              child:
                                                                  ElevatedButton(
                                                                child: Text(
                                                                  'Best Sellers',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary: Colors
                                                                      .white,
                                                                  elevation: 0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(7),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  left: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  right: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  top: SizeConfig
                                                                          .blockVertical *
                                                                      2),
                                                              height: SizeConfig
                                                                      .blockVertical *
                                                                  9,
                                                              width: SizeConfig
                                                                      .blockHorizontal *
                                                                  95,
                                                              child:
                                                                  ElevatedButton(
                                                                child: Text(
                                                                  'Dim Sum',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary: Colors
                                                                      .white,
                                                                  elevation: 0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(7),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  left: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  right: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  top: SizeConfig
                                                                          .blockVertical *
                                                                      2),
                                                              height: SizeConfig
                                                                      .blockVertical *
                                                                  9,
                                                              width: SizeConfig
                                                                      .blockHorizontal *
                                                                  95,
                                                              child:
                                                                  ElevatedButton(
                                                                child: Text(
                                                                  'Appetizers',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary: Colors
                                                                      .white,
                                                                  elevation: 0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(7),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  left: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  right: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  top: SizeConfig
                                                                          .blockVertical *
                                                                      2),
                                                              height: SizeConfig
                                                                      .blockVertical *
                                                                  9,
                                                              width: SizeConfig
                                                                      .blockHorizontal *
                                                                  95,
                                                              child:
                                                                  ElevatedButton(
                                                                child: Text(
                                                                  'Noodles',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary: Colors
                                                                      .white,
                                                                  elevation: 0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(7),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  left: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  right: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  top: SizeConfig
                                                                          .blockVertical *
                                                                      2),
                                                              height: SizeConfig
                                                                      .blockVertical *
                                                                  9,
                                                              width: SizeConfig
                                                                      .blockHorizontal *
                                                                  95,
                                                              child:
                                                                  ElevatedButton(
                                                                child: Text(
                                                                  'Main Course',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary: Colors
                                                                      .white,
                                                                  elevation: 0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(7),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  left: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  right: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  top: SizeConfig
                                                                          .blockVertical *
                                                                      2),
                                                              height: SizeConfig
                                                                      .blockVertical *
                                                                  9,
                                                              width: SizeConfig
                                                                      .blockHorizontal *
                                                                  95,
                                                              child:
                                                                  ElevatedButton(
                                                                child: Text(
                                                                  'Dessert',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary: Colors
                                                                      .white,
                                                                  elevation: 0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(7),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  left: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  right: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  top: SizeConfig
                                                                          .blockVertical *
                                                                      2),
                                                              height: SizeConfig
                                                                      .blockVertical *
                                                                  9,
                                                              width: SizeConfig
                                                                      .blockHorizontal *
                                                                  95,
                                                              child:
                                                                  ElevatedButton(
                                                                child: Text(
                                                                  'Coffe',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary: Colors
                                                                      .white,
                                                                  elevation: 0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(7),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  left: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  right: SizeConfig
                                                                          .blockHorizontal *
                                                                      2,
                                                                  top: SizeConfig
                                                                          .blockVertical *
                                                                      2),
                                                              height: SizeConfig
                                                                      .blockVertical *
                                                                  9,
                                                              width: SizeConfig
                                                                      .blockHorizontal *
                                                                  95,
                                                              child:
                                                                  ElevatedButton(
                                                                child: Text(
                                                                  'Tea',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary: Colors
                                                                      .white,
                                                                  elevation: 0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(7),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(7),
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
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.blockVertical * 3),
                    height: SizeConfig.blockVertical * 10,
                    width: SizeConfig.blockHorizontal * 95,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Product ...',
                            icon: Icon(Icons.search),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockHorizontal * 3),
                          height: SizeConfig.blockVertical * 53.2,
                          width: SizeConfig.blockHorizontal * 100,
                          child: Stack(
                            children: [],
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
