import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/table.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/screens/outdoor_marge_table.dart';
import 'package:flutter_mobile/validation/navbutton_page.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:provider/provider.dart';

class MargeTable extends StatefulWidget {
  const MargeTable({Key? key}) : super(key: key);

  @override
  _MargeTable createState() => _MargeTable();
}

class _MargeTable extends State<MargeTable> {
  bool _isVisible = true;
  bool tableName = false;

  @override
  void showWidget() {
    setState(() {
      _isVisible = false;
    });
  }

  void hideWidget() {
    setState(() {
      _isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    TableProviders tableProviders = Provider.of<TableProviders>(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                      margin:
                          EdgeInsets.only(top: SizeConfig.blockVertical * 5),
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewBar()));
                              },
                              child: Text(
                                "Save",
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
                                                        OutMarge()));
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
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Merged Table :",
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
                height: SizeConfig.blockVertical * 60,
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
            ],
          ),
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

class TableCard extends StatefulWidget {
  final TableManagement tableProducts;
  TableCard(this.tableProducts);

  @override
  State<TableCard> createState() => _TableCardState();
}

class _TableCardState extends State<TableCard> {
  bool _hasBeenPressed = false;
  bool pressed = false;
  bool pressed2 = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (widget.tableProducts.tableName.contains("T-1")) {
              setState(() {
                pressed = !pressed;
                _hasBeenPressed = !_hasBeenPressed;
              });
            } else if (widget.tableProducts.tableName.contains("T-2")) {
              setState(() {
                pressed2 = !pressed2;
                _hasBeenPressed = !_hasBeenPressed;
              });
            } else if (widget.tableProducts.tableName.contains("T-3")) {
              setState(() {
                pressed = !pressed;

                _hasBeenPressed = !_hasBeenPressed;
              });
            } else if (widget.tableProducts.tableName.contains("T-4")) {
              setState(() {
                pressed2 = !pressed2;
                _hasBeenPressed = !_hasBeenPressed;
              });
            } else if (widget.tableProducts.tableName.contains("T-5")) {
              setState(() {
                pressed = !pressed;
                _hasBeenPressed = !_hasBeenPressed;
              });
            }
          },
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
                  pressed ? Text("Main Table") : SizedBox(),
                  pressed2 ? Text("Child Table") : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
