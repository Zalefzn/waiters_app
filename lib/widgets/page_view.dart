import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/table.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/screens/input_customer_count.dart';
import 'package:flutter_mobile/screens/logout.dart';
import 'package:flutter_mobile/screens/marge_table.dart';
import 'package:flutter_mobile/screens/move_table.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobile/validation/navbutton_page.dart';
import 'package:flutter_mobile/validation/page_View2.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPage extends StatefulWidget {
  TextEditingController indoor = TextEditingController();
  TextEditingController outdoor = TextEditingController();

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  bool _isLoading = true;

  @override
  void initState() {
    if (mounted) {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
      });
    }

    getProducts();
    getTab();
    getSection();

    super.initState();
  }

  getSection() async {
    await Provider.of<SectionTable>(context, listen: false).getSection();
  }

  getProducts() async {
    await Provider.of<ProductProviders>(context, listen: false).getData();
  }

  getTab() async {
    await Provider.of<TableProviders>(context, listen: false).getTable();
  }

  @override
  Widget build(BuildContext context) {
    TableProviders tableProviders = Provider.of<TableProviders>(context);
    SectionTable sectionTable = Provider.of<SectionTable>(context);

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
        body: Column(children: [
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
                                      fontFamily: 'Montserrat',
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
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockVertical * 2),
                                      child: Text(
                                        "Indoor",
                                        style: TextStyle(
                                          fontFamily: ' Montserrat',
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
            child: RefreshIndicator(
                onRefresh: _refresh,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 0,
                  padding: EdgeInsets.all(1),
                  childAspectRatio: 1,
                  children: tableProviders.tables
                      .map((tableProducts) => TableCard(tableProducts))
                      .toList(),
                )),
          )
        ]),
      );
    });
  }
}

Future<void> _refresh() {
  return Future.delayed(Duration(milliseconds: 300));
}

_buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: Center(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 9),
            child: Text(
              'Table Management',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 2,
                bottom: SizeConfig.blockVertical * 0),
            height: SizeConfig.blockVertical * 5,
            width: SizeConfig.blockHorizontal * 15,
            child: RaisedButton(
                color: Colors.white,
                elevation: 0,
                child: Icon(Icons.close),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ViewBar()));
                }),
          ),
        ],
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: SizeConfig.blockVertical * 8,
          width: SizeConfig.blockHorizontal * 95,
          child: ElevatedButton(
            child: Text(
              'Marge Table',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                color: Colors.white,
                fontFamily: 'Rubik',
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MargeTable()));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.indigoAccent.shade400,
            ),
          ),
        ),
        SizedBox(height: SizeConfig.blockVertical * 1),
        Container(
          height: SizeConfig.blockVertical * 8,
          width: SizeConfig.blockHorizontal * 95,
          child: ElevatedButton(
            child: Text(
              'Move Table',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                color: Colors.white,
                fontFamily: 'Rubik',
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MoveTable()));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.indigoAccent.shade400,
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

class TableCard extends StatefulWidget {
  final TableManagement tableProducts;
  TableCard(this.tableProducts);

  @override
  State<TableCard> createState() => _TableCardState();
}

class _TableCardState extends State<TableCard> {
  bool _hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            setState(() {
              _hasBeenPressed = !_hasBeenPressed;
            });
            if (widget.tableProducts.tableName.contains("T-1")) {
              if (widget.tableProducts.tableName.contains("T-1")) {
                SharedPreferences getOutlet =
                    await SharedPreferences.getInstance();
                getOutlet.setInt("saveIdOutlete", widget.tableProducts.idTable);
                print(widget.tableProducts.idOutlet);
                SharedPreferences getId = await SharedPreferences.getInstance();
                getId.setInt("saveId", widget.tableProducts.idTable);
                print(widget.tableProducts.idTable);
                SharedPreferences getTable =
                    await SharedPreferences.getInstance();

                getTable.setString("saveTable", widget.tableProducts.tableName);
                print(widget.tableProducts.tableName);
              }

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputCustomer()));
            } else if (widget.tableProducts.tableName.contains("T-2")) {
              if (widget.tableProducts.tableName.contains("T-2")) {
                SharedPreferences getOutlet =
                    await SharedPreferences.getInstance();
                getOutlet.setInt("saveIdOutlete", widget.tableProducts.idTable);
                print(widget.tableProducts.idOutlet);
                SharedPreferences getId = await SharedPreferences.getInstance();

                getId.setInt("saveId", widget.tableProducts.idTable);
                print(widget.tableProducts.idTable);
                SharedPreferences getTable =
                    await SharedPreferences.getInstance();

                getTable.setString("saveTable", widget.tableProducts.tableName);
                print(widget.tableProducts.tableName);
              }
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputCustomer()));
            } else if (widget.tableProducts.tableName.contains("T-3")) {
              if (widget.tableProducts.tableName.contains("T-3")) {
                SharedPreferences getOutlet =
                    await SharedPreferences.getInstance();
                getOutlet.setInt("saveIdOutlete", widget.tableProducts.idTable);
                print(widget.tableProducts.idOutlet);
                SharedPreferences getId = await SharedPreferences.getInstance();

                getId.setInt("saveId", widget.tableProducts.idTable);
                print(widget.tableProducts.idTable);
                SharedPreferences getTable =
                    await SharedPreferences.getInstance();

                getTable.setString("saveTable", widget.tableProducts.tableName);
                print(widget.tableProducts.tableName);
              }
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputCustomer()));
            } else if (widget.tableProducts.tableName.contains("T-4")) {
              if (widget.tableProducts.tableName.contains("T-4")) {
                SharedPreferences getOutlet =
                    await SharedPreferences.getInstance();
                getOutlet.setInt("saveIdOutlete", widget.tableProducts.idTable);
                print(widget.tableProducts.idOutlet);
                SharedPreferences getId = await SharedPreferences.getInstance();

                getId.setInt("saveId", widget.tableProducts.idTable);
                print(widget.tableProducts.idTable);
                SharedPreferences getTable =
                    await SharedPreferences.getInstance();

                getTable.setString("saveTable", widget.tableProducts.tableName);
                print(widget.tableProducts.tableName);
              }
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputCustomer()));
            } else if (widget.tableProducts.tableName.contains("T-5")) {
              SharedPreferences getOutlet =
                  await SharedPreferences.getInstance();
              getOutlet.setInt("saveIdOutlete", widget.tableProducts.idTable);
              print(widget.tableProducts.idOutlet);
              SharedPreferences getId = await SharedPreferences.getInstance();

              getId.setInt("saveId", widget.tableProducts.idTable);
              print(widget.tableProducts.idTable);
              if (widget.tableProducts.tableName.contains("T-5")) {
                SharedPreferences getTable =
                    await SharedPreferences.getInstance();

                getTable.setString("saveTable", widget.tableProducts.tableName);
                print(widget.tableProducts.tableName);
              }
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputCustomer()));
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
              child: Text(
                widget.tableProducts.tableName,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: ' Rubik',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Future<Null> refreshList() async {
  await Future.delayed(Duration(seconds: 1));

  return null;
}
