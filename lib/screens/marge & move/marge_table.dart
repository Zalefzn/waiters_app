import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/navigation%20page/navigation_navbar.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mobile/validation/method style/theme.dart';

class MargeTable extends StatefulWidget {
  const MargeTable({Key? key}) : super(key: key);

  @override
  _MargeTable createState() => _MargeTable();
}

class _MargeTable extends State<MargeTable> {
  @override
  Widget build(BuildContext context) {
    var margeTable = "";
    List childTable = [];

    TableProviders tableProviders = Provider.of<TableProviders>(context);
    MargeProviders margeProvider = Provider.of<MargeProviders>(context);

    handleMarge() async {
      if (await margeProvider.margeCheck(tableProviders.tables)) {}
    }

    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: backgroundClor,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: SizeConfig.blockVertical * 28,
              width: SizeConfig.blockHorizontal * 100,
              decoration: BoxDecoration(
                color: backgroundClor,
                boxShadow: [
                  BoxShadow(
                    color: buttonNavbar2,
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 2), // changes position of shadow
                  )
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.blockVertical * 7),
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
                              left: SizeConfig.blockHorizontal * 20,
                            ),
                            child: Text(
                              "Marge Table",
                              style: margeStyle.copyWith(
                                fontSize: 16.sp,
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockHorizontal * 6),
                          child: RaisedButton(
                            onPressed: () async {
                              _saveMainMarge = "-";
                              _saveChildMarge = "-";
                            },
                            child: Text(
                              "Clear",
                              style: clearStyle.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                            color: backgroundClor,
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
                      color: textColor3,
                    ),
                  ),
                  Container(
                    height: SizeConfig.blockVertical * 10,
                    width: SizeConfig.blockHorizontal * 100,
                    decoration: BoxDecoration(
                      color: backgroundClor,
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
                                  style: floor.copyWith(fontSize: 12.sp),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockHorizontal * 3,
                                    top: SizeConfig.blockVertical * 3),
                                width: SizeConfig.blockHorizontal * 60,
                                height: SizeConfig.blockVertical * 6,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 1, color: bordeSide),
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockHorizontal * 2),
                                      child: Text(
                                        'Base Section',
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
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MargeTable()));
                                          break;
                                        case 'Section 001':
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
                decoration: BoxDecoration(
                  color: backgroundClor,
                ),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 1,
                      childAspectRatio: 1,
                    ),
                    itemCount: tableProviders.tables.length,
                    itemBuilder: (context, j) {
                      final b = tableProviders.tables[j];

                      return Row(
                        children: [
                          GestureDetector(
                            //Logik untuk memangil data berupa child dan parent
                            onTap: () async {
                              if (margeTable == "") {
                                margeTable = b.idTable.toString();

                                SharedPreferences setMargeTable =
                                    await SharedPreferences.getInstance();
                                setMargeTable.setInt("MainMarge", b.idTable);

                                print(margeTable);
                              } else {
                                if (margeTable != b.idTable) {
                                  if (childTable != 0) {
                                    childTable.addAll({b.idTable});

                                    var isTableExist = childTable
                                        .where((data) => data == b.idTable);
                                    if (isTableExist == 0) {
                                      childTable.addAll({b.idTable});
                                    }
                                    SharedPreferences setMargeTable =
                                        await SharedPreferences.getInstance();
                                    setMargeTable.setString(
                                        "ChildTable", json.encode(childTable));
                                    print(childTable);
                                  }
                                }
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: SizeConfig.blockVertical * 2,
                                  left: SizeConfig.blockHorizontal * 2.5),
                              height: SizeConfig.blockVertical * 25,
                              width: SizeConfig.blockHorizontal * 46,
                              decoration: BoxDecoration(
                                color: textColor3,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      b.tableName,
                                      style:
                                          textButton.copyWith(fontSize: 20.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    })
                // child: GridView.count(
                //   crossAxisCount: 2,
                //   mainAxisSpacing: 1,
                //   crossAxisSpacing: 0,
                //   padding: const EdgeInsets.all(1),
                //   childAspectRatio: 1,
                //   children: tableProviders.tables
                //       .map((tableProducts) => TableCard(tableProducts))
                //       .toList(),
                // ),
                ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.blockVertical * 0),
              height: SizeConfig.blockVertical * 10,
              width: SizeConfig.blockHorizontal * 100,
              decoration: BoxDecoration(
                color: backgroundClor,
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

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewBar()));
                },
                style: ElevatedButton.styleFrom(
                  primary: buttonNavbar,
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
  List<String> dll = ['Base Section', 'Section 001'];
  return dll
      .map(
        (value) => DropdownMenuItem(value: value, child: Text(value)),
      )
      .toList();
}

// class TableCard extends StatefulWidget {
//   final TableManagement data;
//   TableCard(this.data);

//   @override
//   State<TableCard> createState() => _TableCardState();
// }

// class _TableCardState extends State<TableCard> {
//   @override
  // var _hasBeenPressed = false;
  // var pressed = false;
  // var pressed2 = false;
  // var margeTable = "";
  // var childTable = [];

//   @override
//   Widget build(BuildContext context) {
    // return Row(
    //   children: [
    //     GestureDetector(
    //       //Logik untuk memangil data berupa child dan parent
    //       onTap: () async {
    //         if (margeTable == "") {
    //           margeTable = widget.data.idTable.toString();
              // SharedPreferences setMargeTable =
              //     await SharedPreferences.getInstance();
              // setMargeTable.setInt("saveMainTable", widget.data.idTable);
    //           setState(() {
    //             _hasBeenPressed ? null : _hasBeenPressed = !_hasBeenPressed;
    //             pressed ? null : pressed = !pressed;
    //           });
    //           print(margeTable);
    //         } else {
    //           if (margeTable != widget.data.idTable) {
    //             childTable.add(widget.data.idTable);
    //             var isTableExist = childTable
    //                 .where((element) => element == widget.data.idTable);
                // SharedPreferences setMargeTable =
                //     await SharedPreferences.getInstance();
                // setMargeTable.setInt("saveChild", widget.data.idTable);
    //             setState(() {
    //               _hasBeenPressed ? null : _hasBeenPressed = !_hasBeenPressed;
    //               pressed2 ? null : pressed2 = !pressed2;
    //             });
    //             print(isTableExist);
    //           }
    //         }
    //       },
    //       child: Container(
    //         margin: EdgeInsets.only(
    //             top: SizeConfig.blockVertical * 2,
    //             left: SizeConfig.blockHorizontal * 2.5),
    //         height: SizeConfig.blockVertical * 25,
    //         width: SizeConfig.blockHorizontal * 46,
    //         decoration: BoxDecoration(
    //           color: _hasBeenPressed ? buttonNavbar2 : textColor3,
    //           borderRadius: BorderRadius.circular(15),
    //         ),
    //         child: Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 widget.data.tableName,
    //                 style: textButton.copyWith(fontSize: 20.sp),
    //               ),
    //               pressed ? Text("Main Table") : Container(),
    //               pressed2 ? Text("Child Table") : Container(),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
//   }
// }
