import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/table.dart';
import 'package:flutter_mobile/navigation%20page/navbutton_page.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/screens/customer%20count/input_customer_count.dart';
import 'package:flutter_mobile/screens/setting%20&%20Logout/logout.dart';
import 'package:flutter_mobile/screens/marge%20&%20move/marge_table.dart';
import 'package:flutter_mobile/screens/marge%20&%20move/move_table.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPage extends StatefulWidget {
  TextEditingController indoor = TextEditingController();
  TextEditingController outdoor = TextEditingController();

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  var loading = false;

  @override
  void initState() {
    if (mounted) {
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          loading = true;
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

                                          // Navigator.pushReplacement(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             ViewBar()));
                                          break;
                                        case 'Section 001':
                                        // Navigator.pushReplacement(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             ViewBar2()));
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
        ]),
      );
    });
  }
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
  List<String> dll = ['Base Section', 'Section 001'];
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
            widget.tableProducts.tableName != null;
            SharedPreferences getOutlet = await SharedPreferences.getInstance();
            getOutlet.setInt("saveIdOutlete", widget.tableProducts.idOutlet);
            print(widget.tableProducts.idOutlet);
            SharedPreferences getId = await SharedPreferences.getInstance();
            getId.setInt("saveId", widget.tableProducts.idTable);
            print(widget.tableProducts.idTable);
            SharedPreferences getTable = await SharedPreferences.getInstance();

            getTable.setString("saveTable", widget.tableProducts.tableName);
            print(widget.tableProducts.tableName);

            setState(() {
              _hasBeenPressed = !_hasBeenPressed;
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InputCustomer()));
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
