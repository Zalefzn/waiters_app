import 'package:flutter/material.dart';
import 'package:flutter_mobile/navigation%20page/navbutton_page.dart';
import 'package:flutter_mobile/screens/setting%20&%20Logout/logout.dart';
import 'package:flutter_mobile/screens/marge%20&%20move/marge_table.dart';
import 'package:flutter_mobile/screens/marge%20&%20move/move_table.dart';
import 'package:flutter_mobile/screens/customer%20count/numpad_page.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:sizer/sizer.dart';

class InputCount extends StatefulWidget {
  const InputCount({Key? key}) : super(key: key);

  @override
  State<InputCount> createState() => _InputCount();
}

class _InputCount extends State<InputCount> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    height: SizeConfig.blockVertical * 67,
                    child: Stack(
                      children: [
                        Container(
                          child: NumpadPage(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockVertical * 68,
                        left: SizeConfig.blockHorizontal * 3),
                    height: SizeConfig.blockVertical * 7,
                    width: SizeConfig.blockHorizontal * 95,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewBar()));
                        });
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.indigoAccent.shade400,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.indigoAccent.shade400,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
            margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 10),
            child: Text(
              'Table Management',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
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
            child: Text('Marge Table'),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MargeTable()));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue.shade900,
            ),
          ),
        ),
        SizedBox(height: SizeConfig.blockVertical * 1),
        Container(
          height: SizeConfig.blockVertical * 8,
          width: SizeConfig.blockHorizontal * 95,
          child: ElevatedButton(
            child: Text('Move Table'),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MoveTable()));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue.shade900,
            ),
          ),
        ),
      ],
    ),
  );
}
