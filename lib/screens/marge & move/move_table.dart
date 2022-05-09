import 'package:flutter/material.dart';
import 'package:flutter_mobile/method/method%20size/method.dart';
import 'package:flutter_mobile/method/method%20style/theme.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/widgets/table%20page/page_view.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobile/validation/method style/theme.dart';

class MoveTable extends StatefulWidget {
  const MoveTable({Key? key}) : super(key: key);

  @override
  _MoveTable createState() => _MoveTable();
}

class _MoveTable extends State<MoveTable> {
  @override
  Widget build(BuildContext context) {
    bool _hasBeenPressed = false;
    var pressed = false;
    var pressed2 = false;
    MoveProvider moveProvider = Provider.of<MoveProvider>(context);
    TableProviders tableProviders = Provider.of<TableProviders>(context);

    handleMove() async {
      if (await moveProvider.moveCheck(tableProviders.tables)) {}
    }

    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: backgroundClor,
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                      margin:
                          EdgeInsets.only(top: SizeConfig.blockVertical * 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewPage()));
                              });
                            },
                            icon: Icon(Icons.chevron_left),
                            iconSize: 35,
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockHorizontal * 20,
                              ),
                              child: Text("Move Table",
                                  style: margeStyle.copyWith(
                                    fontSize: 16.sp,
                                  ))),
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockHorizontal * 10),
                            child: RaisedButton(
                              onPressed: () {},
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
                      margin:
                          EdgeInsets.only(top: SizeConfig.blockVertical * 2),
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
                                  width: SizeConfig.blockHorizontal * 64,
                                  height: SizeConfig.blockVertical * 6,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      hint: Container(
                                        margin: EdgeInsets.only(
                                            left:
                                                SizeConfig.blockHorizontal * 2),
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
              SizedBox(height: SizeConfig.blockVertical * 3),
              Container(
                height: SizeConfig.blockVertical * 10,
                width: SizeConfig.blockHorizontal * 100,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "Main Table : ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Destination Table : ",
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
              Container(
                  height: SizeConfig.blockVertical * 50,
                  width: SizeConfig.blockHorizontal * 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 1,
                        childAspectRatio: 1,
                      ),
                      itemCount: tableProviders.tables.length,
                      itemBuilder: (context, k) {
                        final c = tableProviders.tables[k];
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (!pressed) {
                                  pressed == c.idTable;
                                  print(c.idTable);
                                  SharedPreferences setMoveTable =
                                      await SharedPreferences.getInstance();
                                  setMoveTable.setInt(
                                      "getMoveTable", c.idTable);
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockVertical * 2,
                                    left: SizeConfig.blockHorizontal * 2),
                                height: SizeConfig.blockVertical * 25,
                                width: SizeConfig.blockHorizontal * 46,
                                decoration: BoxDecoration(
                                  color: _hasBeenPressed
                                      ? textColor3
                                      : buttonNavbar2,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        c.tableName,
                                        style: textButton.copyWith(
                                            fontSize: 20.sp),
                                      ),
                                      pressed
                                          ? Text("Origin Table")
                                          : Container(),
                                      pressed2
                                          ? Text("Destination Table")
                                          : Container(),
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
                  onPressed: () {
                    handleMove();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: buttonNavbar,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
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

// class TableCard extends StatefulWidget {
//   final TableManagement data;
//   TableCard(this.data);

//   @override
//   State<TableCard> createState() => _TableCardState();
// }

// class _TableCardState extends State<TableCard> {
  // bool _hasBeenPressed = false;
  // var pressed = false;
  // var pressed2 = false;
//   @override
//   Widget build(BuildContext context) {
    // return Row(
    //   children: [
    //     GestureDetector(
    //       onTap: () async {
    //         if (!pressed) {
    //           pressed == widget.data.idTable;
    //           print(widget.data.idTable);
    //           SharedPreferences setMoveTable =
    //               await SharedPreferences.getInstance();
    //           setMoveTable.setInt("getMoveTable", widget.data.idTable);
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
    //               pressed ? Text("Origin Table") : Container(),
    //               pressed2 ? Text("Destination Table") : Container(),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
//   }
// }
