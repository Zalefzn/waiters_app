import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/tableManagement.dart';
import 'package:flutter_mobile/providers/sectionTable,.dart';
import 'package:flutter_mobile/providers/tableProvider.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/utilities/methodStyle/theme.dart';
import 'package:flutter_mobile/utilities/navigation/navigation_navbar.dart';
import 'package:flutter_mobile/widgets/setting/logout.dart';
import 'package:flutter_mobile/widgets/tablePage/dropdownPage/dropdown_table.dart';
import 'package:flutter_mobile/widgets/tablePage/margeTable/marge_table.dart';
import 'package:flutter_mobile/widgets/tablePage/moveTable/move_table.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPage extends StatefulWidget {
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  var selectedValue;
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
    SectionTable sectionTable = Provider.of<SectionTable>(context);

    filterTableSection() {
      tableProviders.tables
          .where((element) => element.idTable == sectionTable.sections)
          .toList();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PageView()));
    }

    Widget header() {
      return Stack(
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
                      DropdownPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget buttonMarge() {
      return Row(
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const MoveTable()));
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
      );
    }

    Widget tablePage() {
      handleTableNavigate(TableManagement table) async {
        SharedPreferences preferences = await SharedPreferences.getInstance();

        preferences.setInt("saveId", table.idTable);
        preferences.setString("saveTable", table.tableName);

        if (table.sessionTable?.idSession == table.idTable) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ViewMenuGrid()));
        } else {
          Navigator.pushNamed(context, '/inputCount');
        }
        print(table.sessionTable?.idSession);
        print(table.tableName);
        print(table.idTable);
      }

      return Container(
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            handleTableNavigate(a);
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
                  }));
    }

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
            header(),
            SizedBox(height: SizeConfig.blockVertical * 2),
            buttonMarge(),
            tablePage(),
          ]),
        ),
      );
    });
  }
}
