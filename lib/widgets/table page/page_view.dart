import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/class_model.dart';
import 'package:flutter_mobile/navigation%20page/navigation_navbar.dart';
import 'package:flutter_mobile/validation/method style/theme.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/screens/setting%20&%20Logout/logout.dart';
import 'package:flutter_mobile/screens/marge%20&%20move/marge_table.dart';
import 'package:flutter_mobile/screens/marge%20&%20move/move_table.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPage extends StatefulWidget {
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  List<TableSection> sectionTable = [];
  var loading = false;

  TextEditingController indoor = TextEditingController();
  TextEditingController outdoor = TextEditingController();

  @override
  void initState() {
    setState(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          loading = false;
        });
      });
      loading = true;
    });
    getTab();
    getProducts();
    super.initState();
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
            icon: const Icon(Icons.settings),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
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
                          color: backgroundClor,
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
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewBar()));
                                            break;
                                          case 'Section 001':
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewBar()));
                                            break;
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
            SizedBox(height: SizeConfig.blockVertical * 2),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical * 0),
                  height: SizeConfig.blockVertical * 5,
                  width: SizeConfig.blockHorizontal * 30,
                  child: ElevatedButton(
                    child: Text(
                      'Marge Table',
                      style: titleTable.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MargeTable()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: buttonColor, onPrimary: textColor3),
                  ),
                ),
                SizedBox(width: SizeConfig.blockVertical * 10),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical * 0),
                  height: SizeConfig.blockVertical * 5,
                  width: SizeConfig.blockHorizontal * 30,
                  child: ElevatedButton(
                    child: Text('Move Table',
                        style: titleTable.copyWith(
                          fontSize: 12.sp,
                        )),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MoveTable()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: buttonColor, onPrimary: textColor3),
                  ),
                ),
              ],
            ),

            //widget table
            Container(
                margin: EdgeInsets.only(top: SizeConfig.blockVertical * 1),
                height: SizeConfig.blockVertical * 69,
                width: SizeConfig.blockHorizontal * 100,
                decoration: BoxDecoration(
                  color: backgroundClor,
                ),
                child: loading
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 1,
                          childAspectRatio: 1,
                        ),
                        itemCount: tableProviders.tables.length,
                        itemBuilder: (context, i) {
                          final a = tableProviders.tables[i];
                          sectionTable.sections
                              .where((data) =>
                                  data.idOutlet ==
                                  tableProviders.tables[i].idTable)
                              .toList();
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  a.tableName != null;
                                  SharedPreferences getOutlet =
                                      await SharedPreferences.getInstance();
                                  getOutlet.setInt("saveIdOutlete", a.idOutlet);
                                  print(a.idOutlet);
                                  SharedPreferences getId =
                                      await SharedPreferences.getInstance();
                                  getId.setInt("saveId", a.idTable);
                                  print(a.idTable);
                                  SharedPreferences getTable =
                                      await SharedPreferences.getInstance();
                                  getTable.setString("saveTable", a.tableName);
                                  print(a.tableName);
                                  Navigator.pushReplacementNamed(
                                      context, '/inputCount');
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockVertical * 2,
                                      left: SizeConfig.blockHorizontal * 2.5),
                                  height: SizeConfig.blockVertical * 25,
                                  width: SizeConfig.blockHorizontal * 46,
                                  decoration: BoxDecoration(
                                    color: buttonNavbar2,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      a.tableName,
                                      style: textButton.copyWith(
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }))
          ]),
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
