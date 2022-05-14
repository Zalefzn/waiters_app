import 'package:flutter/material.dart';
import 'package:flutter_mobile/method/methodSize/method.dart';
import 'package:flutter_mobile/method/methodStyle/theme.dart';
import 'package:flutter_mobile/providers/tableProvider.dart';
import 'package:flutter_mobile/screens/marge_move/marge_table.dart';
import 'package:flutter_mobile/screens/marge_move/move_table.dart';
import 'package:flutter_mobile/screens/setting/logout.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPage extends StatefulWidget {
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  var loading = false;
  var button2 = false;
  var buttonText2 = false;
  var buttonText = false;
  var button1 = false;

  TextEditingController indoor = TextEditingController();
  TextEditingController outdoor = TextEditingController();

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
                                      borderRadius: BorderRadius.circular(8)),
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
                                                        ViewPage()));
                                            break;
                                          case 'Section 001':
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewPage()));
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
                  width: SizeConfig.blockHorizontal * 48,
                  child: ElevatedButton(
                    child: Text(
                      'Marge Table',
                      style: TextStyle(
                        color: buttonText ? backgroundClor : buttonNavbar,
                        fontWeight: bold,
                        fontFamily: 'Rubik',
                        fontSize: 12.sp,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        button1 ? null : button1 = !button1;
                        buttonText ? null : buttonText = !buttonText;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MargeTable()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: button1 ? buttonNavbar : backgroundClor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: buttonNavbar,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(9),
                        )),
                  ),
                ),
                SizedBox(width: SizeConfig.blockHorizontal * 1),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical * 0),
                  height: SizeConfig.blockVertical * 5,
                  width: SizeConfig.blockHorizontal * 48,
                  child: ElevatedButton(
                    child: Text('Move Table',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Rubik",
                          color: buttonText2 ? backgroundClor : buttonNavbar,
                          fontWeight: bold,
                        )),
                    onPressed: () {
                      setState(() {
                        button2 ? null : button2 = !button2;
                        buttonText2 ? null : buttonText2 = !buttonText2;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MoveTable()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: button2 ? buttonNavbar : backgroundClor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: buttonNavbar,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(9),
                        )),
                  ),
                ),
              ],
            ),

            //widget table
            Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.blockVertical * 1,
                ),
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
                          mainAxisSpacing: 2,
                          childAspectRatio: 1,
                        ),
                        itemCount: tableProviders.tables.length,
                        itemBuilder: (context, i) {
                          final a = tableProviders.tables[i];
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  if (a.tableName.isEmpty) {
                                  } else {
                                    if (a.tableName.isNotEmpty) {
                                      SharedPreferences getId =
                                          await SharedPreferences.getInstance();
                                      getId.setInt("saveId", a.idTable);
                                      print(a.idTable);
                                      SharedPreferences getTable =
                                          await SharedPreferences.getInstance();
                                      getTable.setString(
                                          "saveTable", a.tableName);
                                      print(a.tableName);

                                      Navigator.pushReplacementNamed(
                                          context, '/inputCount');
                                    }
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockVertical * 2,
                                      left: SizeConfig.blockHorizontal * 2),
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
