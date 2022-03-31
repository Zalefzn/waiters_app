import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/table.dart';
import 'package:flutter_mobile/navigation%20page/navbutton_page.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MargeTable extends StatefulWidget {
  const MargeTable({Key? key}) : super(key: key);

  @override
  _MargeTable createState() => _MargeTable();
}

class _MargeTable extends State<MargeTable> {
  @override
  Widget build(BuildContext context) {
    TableProviders tableProviders = Provider.of<TableProviders>(context);
    MargeProvider margeProvider = Provider.of<MargeProvider>(context);

    handleMarge() async {
      if (await margeProvider.margeCheck(tableProviders.tables)) {}
    }

    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: SizeConfig.blockVertical * 28,
              width: SizeConfig.blockHorizontal * 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 2), // changes position of shadow
                  )
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.blockVertical * 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewBar()));
                            });
                          },
                          icon: Icon(Icons.chevron_left),
                          iconSize: 35,
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: SizeConfig.blockHorizontal * 23,
                            ),
                            child: Text(
                              "Marge Table",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockHorizontal * 13),
                          child: RaisedButton(
                            onPressed: () async {
                              SharedPreferences removeMainMarge =
                                  await SharedPreferences.getInstance();
                              removeMainMarge.remove("nameMainTable");
                              print(removeMainMarge);
                              SharedPreferences removeChildMarge =
                                  await SharedPreferences.getInstance();
                              removeChildMarge.remove("getNamechild");
                              _saveMainMarge = "-";
                              _saveChildMarge = "-";
                            },
                            child: Text(
                              "Clear",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue[600]),
                            ),
                            color: Colors.white,
                            elevation: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.blockVertical * 2),
                    height: SizeConfig.blockVertical * 0.1,
                    width: SizeConfig.blockHorizontal * 90,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Container(
                    height: SizeConfig.blockVertical * 10,
                    width: SizeConfig.blockHorizontal * 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Row(
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
                                    left: SizeConfig.blockHorizontal * 3,
                                    top: SizeConfig.blockVertical * 3),
                                width: SizeConfig.blockHorizontal * 60,
                                height: SizeConfig.blockVertical * 6,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockHorizontal * 2),
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
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockVertical * 2),
            addContent(),
            Container(
              height: SizeConfig.blockVertical * 50,
              width: SizeConfig.blockHorizontal * 100,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 0,
                padding: const EdgeInsets.all(1),
                childAspectRatio: 1,
                children: tableProviders.tables
                    .map((tableProducts) => TableCard(tableProducts))
                    .toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.blockVertical * 0),
              height: SizeConfig.blockVertical * 10,
              width: SizeConfig.blockHorizontal * 100,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ElevatedButton(
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontFamily: 'Rubik',
                  ),
                ),
                onPressed: () async {
                  handleMarge();
                  SharedPreferences getTabMain =
                      await SharedPreferences.getInstance();
                  var getTab = getTabMain.getString("nameMainTable");
                  print(getTab);
                  SharedPreferences getTabMarge =
                      await SharedPreferences.getInstance();
                  var getMarge = getTabMarge.getString("getNamechild");
                  print(getMarge);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewBar()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigoAccent.shade400,
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }
}

addContent() {
  return Column(
    children: [
      Container(
        height: SizeConfig.blockVertical * 10,
        width: SizeConfig.blockHorizontal * 100,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Main Table : " + "$_saveMainMarge",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )),
                Text(
                  "Merged Table :" + "$_saveChildMarge",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

String _saveMainMarge = "";
String _saveChildMarge = "";

List<DropdownMenuItem<String>> _dropDownItem() {
  List<String> dll = ['Indoor', 'Outdoor'];
  return dll
      .map(
        (value) => DropdownMenuItem(value: value, child: Text(value)),
      )
      .toList();
}

class TableCard extends StatefulWidget {
  final TableManagement tableProducts;
  TableCard(this.tableProducts);

  @override
  State<TableCard> createState() => _TableCardState();
}

class _TableCardState extends State<TableCard> {
  @override
  void initState() {
    getNameMain();
    getChildName();
    super.initState();
  }

  void getNameMain() async {
    SharedPreferences getName = await SharedPreferences.getInstance();
    _saveMainMarge = getName.getString("nameMainTable") ?? "";
  }

  void getChildName() async {
    SharedPreferences getChildName = await SharedPreferences.getInstance();
    _saveChildMarge = getChildName.getString("getNamechild") ?? "";
  }

  var _hasBeenPressed = false;
  var pressed = false;
  var pressed2 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},

          // onTap: widget.tableProducts.idTable != null
          //     ? () async {
          //         SharedPreferences saveNameTable =
          //             await SharedPreferences.getInstance();
          //         saveNameTable.setString(
          //             "nameTable", widget.tableProducts.tableName);
          //         print(widget.tableProducts.tableName);
          //         SharedPreferences saveMainTable =
          //             await SharedPreferences.getInstance();
          //         saveMainTable.setInt(
          //             "saveMainTable", widget.tableProducts.idTable);
          //         print(widget.tableProducts.idTable);
          //         setState(() {
          //           pressed ? null : pressed = !pressed;
          //         });
          //       }
          //     : () {},

          // SharedPreferences setChild =
          //     await SharedPreferences.getInstance();
          // setChild.setInt("saveIdChild", widget.tableProducts.idTable);
          // print(widget.tableProducts.idTable);
          // setState(() {
          //   pressed2 ? null : pressed2 = !pressed2;
          // });

          // : () async {
          //     SharedPreferences setChildTable =
          //         await SharedPreferences.getInstance();
          //     setChildTable.setInt(
          //         "nameChild", widget.tableProducts.idTable);
          //     print(widget.tableProducts.idTable);
          //     SharedPreferences setNameTable =
          //         await SharedPreferences.getInstance();
          //     setNameTable.setString(
          //         "saveNameTab", widget.tableProducts.tableName);
          //     print(widget.tableProducts.tableName);
          //     setState(() {
          //       pressed2 ? null : pressed2 = !pressed2;
          //     });
          //   },
          // onTap: widget.tableProducts.tableName.isNotEmpty
          //     ? null
          //     : () async {
          //         if (widget.tableProducts.tableName.isNotEmpty) {
          //           SharedPreferences saveIdTable =
          //               await SharedPreferences.getInstance();
          //           saveIdTable.setInt(
          //               "saveMarge", widget.tableProducts.idTable);
          //           print(widget.tableProducts.idTable);
          //           setState(() {
          //             pressed ? null : pressed = !pressed;
          //           });
          //         }
          //         widget.tableProducts.tableName.isEmpty
          //             ? () async {
          //                 if (widget.tableProducts.tableName.isEmpty) {
          //                   SharedPreferences saveIdChild =
          //                       await SharedPreferences.getInstance();

          //                   saveIdChild.setInt(
          //                       "saveChild", widget.tableProducts.idTable);
          //                   print(widget.tableProducts.idTable);
          //                   setState(() {
          //                     pressed2 ? null : pressed2 = !pressed2;
          //                   });
          //                 }
          //               }
          //             : null;

          // if (widget.tableProducts.tableName == "T-1") {

          // } else if (widget.tableProducts.tableName != "T-1"
          //   ) {

          // }

          // if (pressed) {
          //   setState(() {
          //     pressed == null;
          //   });
          // } else {
          //   setState(() {
          //     pressed = !pressed;
          //     _hasBeenPressed = !_hasBeenPressed;
          //   });
          // }

          // if (widget.tableProducts.tableName.contains("T-1")) {
          //   if (widget.tableProducts.tableName.contains("T-1")) {

          // } else if (widget.tableProducts.tableName.contains("T-2")) {
          //   if (widget.tableProducts.tableName.contains("T-2")) {
          //     SharedPreferences getTable =
          //         await SharedPreferences.getInstance();

          //     getTable.setString(
          //         "ChildTable", widget.tableProducts.tableName);
          //     print(widget.tableProducts.tableName);
          //     pressed2
          //         ? null
          //         : setState(() {
          //             pressed2 = !pressed2;
          //             _hasBeenPressed = !_hasBeenPressed;
          //             // if (pressed2) {
          //             //   setState(() {
          //             //     pressed2 == null;
          //             //   });
          //             // } else {
          //             //   setState(() {
          //             //     pressed2 = !pressed2;
          //             //     _hasBeenPressed = !_hasBeenPressed;
          //             //   });
          //             // }
          //           });
          //   }
          // } else if (widget.tableProducts.tableName.contains("T-3")) {
          //   if (widget.tableProducts.tableName.contains("T-3")) {
          //     SharedPreferences getTable =
          //         await SharedPreferences.getInstance();

          //     getTable.setString(
          //         "ChildTable", widget.tableProducts.tableName);
          //     print(widget.tableProducts.tableName);
          //     pressed2
          //         ? null
          //         : setState(() {
          //             pressed2 = !pressed2;
          //             _hasBeenPressed = !_hasBeenPressed;
          //             // if (pressed2) {
          //             //   setState(() {
          //             //     pressed2 == null;
          //             //   });
          //             // } else {
          //             //   setState(() {
          //             //     pressed2 = !pressed2;
          //             //     _hasBeenPressed = !_hasBeenPressed;
          //             //   });
          //             // }
          //           });
          //   }
          // } else if (widget.tableProducts.tableName.contains("T-4")) {
          //   if (widget.tableProducts.tableName.contains("T-4")) {
          //     SharedPreferences getTable =
          //         await SharedPreferences.getInstance();

          //     getTable.setString(
          //         "ChildTable", widget.tableProducts.tableName);
          //     print(widget.tableProducts.tableName);
          //     pressed2
          //         ? null
          //         : setState(() {
          //             pressed2 = !pressed2;
          //             _hasBeenPressed = !_hasBeenPressed;
          //             // if (pressed2) {
          //             //   setState(() {
          //             //     pressed2 == null;
          //             //   });
          //             // } else {
          //             //   setState(() {
          //             //     pressed2 = !pressed2;
          //             //     _hasBeenPressed = !_hasBeenPressed;
          //             //   });
          //             // }
          //           });
          //   }
          // } else if (widget.tableProducts.tableName.contains("T-5")) {
          //   if (widget.tableProducts.tableName.contains("T-5")) {
          //     SharedPreferences getTable =
          //         await SharedPreferences.getInstance();

          //     getTable.setString(
          //         "ChildTable", widget.tableProducts.tableName);
          //     print(widget.tableProducts.tableName);
          //     pressed2
          //         ? null
          //         : setState(() {
          //             pressed2 = !pressed2;
          //             _hasBeenPressed = !_hasBeenPressed;
          //             // if (pressed2) {
          //             //   setState(() {
          //             //     pressed2 == null;
          //             //   });
          //             // } else {
          //             //   setState(() {
          //             //     pressed2 = !pressed2;
          //             //     _hasBeenPressed = !_hasBeenPressed;
          //             //   });
          //             // }
          //           });
          //   }
          // }
          // }
          child: Container(
            margin: EdgeInsets.only(
                top: SizeConfig.blockVertical * 2,
                left: SizeConfig.blockHorizontal * 2.5),
            height: SizeConfig.blockVertical * 25,
            width: SizeConfig.blockHorizontal * 46,
            decoration: BoxDecoration(
              color:
                  _hasBeenPressed ? Colors.grey.shade200 : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.tableProducts.tableName,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  pressed ? Text("Main Table") : Container(),
                  pressed2 ? Text("Child Table") : Container(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
