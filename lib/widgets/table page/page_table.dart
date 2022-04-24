import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/class_model.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/screens/marge%20&%20move/marge_table.dart';
import 'package:flutter_mobile/screens/marge%20&%20move/move_table.dart';
import 'package:flutter_mobile/screens/setting%20&%20Logout/logout.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:flutter_mobile/widgets/table%20page/change_page_view.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mobile/validation/method style/theme.dart';

class ViewTable extends StatefulWidget {
  @override
  State<ViewTable> createState() => _PageTableState();
}

class _PageTableState extends State<ViewTable> {
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
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: backgroundClor,
        appBar: AppBar(
          backgroundColor: appBarColor,
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
                icon: const Icon(
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
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockHorizontal * 1,
                                      top: SizeConfig.blockVertical * 2.5),
                                  width: SizeConfig.blockHorizontal * 60,
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
                                          "Base Section",
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
                height: SizeConfig.blockVertical * 66,
                width: SizeConfig.blockHorizontal * 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 0,
                  padding: EdgeInsets.all(1),
                  childAspectRatio: 1,
                  children: tableProviders.tables
                      .map((products) => TableArea(products))
                      .toList(),
                )),
          ],
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

class TableArea extends StatefulWidget {
  final TableManagement tableProduct;
  TableArea(this.tableProduct);

  @override
  State<TableArea> createState() => _TableAreaState();
}

class _TableAreaState extends State<TableArea> {
  bool _buttonPressed = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            if (widget.tableProduct.tableName.contains("T-1")) {
              if (widget.tableProduct.tableName.contains("T-1")) {
                SharedPreferences getOutlet =
                    await SharedPreferences.getInstance();
                getOutlet.getInt("saveIdOutlete");

                SharedPreferences getId = await SharedPreferences.getInstance();
                getId.getInt("saveId");

                SharedPreferences getTable =
                    await SharedPreferences.getInstance();

                getTable.getString("saveTable");
              }
            } else if (widget.tableProduct.tableName.contains("T-2")) {
              if (widget.tableProduct.tableName.contains("T-2")) {
                SharedPreferences getOutlet =
                    await SharedPreferences.getInstance();
                getOutlet.getInt("saveIdOutlete");

                SharedPreferences getId = await SharedPreferences.getInstance();

                getId.getInt("saveId");

                SharedPreferences getTable =
                    await SharedPreferences.getInstance();

                getTable.getString("saveTable");
              }
            } else if (widget.tableProduct.tableName.contains("T-3")) {
              if (widget.tableProduct.tableName.contains("T-3")) {
                SharedPreferences getOutlet =
                    await SharedPreferences.getInstance();
                getOutlet.getInt("saveIdOutlete");

                SharedPreferences getId = await SharedPreferences.getInstance();

                getId.getInt("saveId");

                SharedPreferences getTable =
                    await SharedPreferences.getInstance();

                getTable.getString("saveTable");
              }
            } else if (widget.tableProduct.tableName.contains("T-4")) {
              if (widget.tableProduct.tableName.contains("T-4")) {
                SharedPreferences getOutlet =
                    await SharedPreferences.getInstance();
                getOutlet.getInt("saveIdOutlete");

                SharedPreferences getId = await SharedPreferences.getInstance();

                getId.getInt("saveId");

                SharedPreferences getTable =
                    await SharedPreferences.getInstance();

                getTable.getString("saveTable");
              }
            } else if (widget.tableProduct.tableName.contains("T-5")) {
              SharedPreferences getOutlet =
                  await SharedPreferences.getInstance();
              getOutlet.getInt("saveIdOutlete");

              SharedPreferences getId = await SharedPreferences.getInstance();

              getId.getInt("saveId");

              if (widget.tableProduct.tableName.contains("T-5")) {
                SharedPreferences getTable =
                    await SharedPreferences.getInstance();

                getTable.getString("saveTable");
              }
            }
          },
          child: Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 2.5,
                top: SizeConfig.blockVertical * 2),
            height: SizeConfig.blockVertical * 25,
            width: SizeConfig.blockHorizontal * 46,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                widget.tableProduct.tableName,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

_buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 7),
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
                left: SizeConfig.blockHorizontal * 0,
                bottom: SizeConfig.blockVertical * 0),
            height: SizeConfig.blockVertical * 5,
            width: SizeConfig.blockHorizontal * 15,
            child: RaisedButton(
                color: backgroundClor,
                elevation: 0,
                child: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ViewBarPage()));
                }),
          ),
        ],
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(top: SizeConfig.blockVertical * 0),
          height: SizeConfig.blockVertical * 8,
          width: SizeConfig.blockHorizontal * 95,
          child: ElevatedButton(
            child: Text(
              'Marge Table',
              style: titleTable.copyWith(
                fontSize: 12.sp,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MargeTable()));
            },
            style: ElevatedButton.styleFrom(
                primary: buttonColor, onPrimary: textColor3),
          ),
        ),
        SizedBox(height: SizeConfig.blockVertical * 1),
        Container(
          margin: EdgeInsets.only(top: SizeConfig.blockVertical * 0),
          height: SizeConfig.blockVertical * 8,
          width: SizeConfig.blockHorizontal * 95,
          child: ElevatedButton(
            child: Text('Move Table',
                style: titleTable.copyWith(
                  fontSize: 12.sp,
                )),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MoveTable()));
            },
            style: ElevatedButton.styleFrom(
                primary: buttonColor, onPrimary: textColor3),
          ),
        ),
      ],
    ),
  );
}
