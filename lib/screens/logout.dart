import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/validation/navbutton_page.dart';
import 'package:flutter_mobile/widgets/login_page.dart';
import 'package:sizer/sizer.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  final _fromKey = GlobalKey<FormState>();

  static var today = DateTime.now();
  var formatedTanggal = DateFormat.Hm().format(today);
  var formatedTahun = DateFormat.yMMMEd().format(today);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Sizer(builder: (context, orentation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: RaisedButton(
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              color: Colors.white,
              elevation: 0,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewBar(),
                    ));
              },
            ),
            elevation: 1,
            backgroundColor: Colors.white,
            title: Container(
              margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 24,
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                key: _fromKey,
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: SizeConfig.blockVertical * 0),
                      height: SizeConfig.blockVertical * 25,
                      width: SizeConfig.blockHorizontal * 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockHorizontal * 0,
                                top: SizeConfig.blockVertical * 4),
                            height: SizeConfig.blockVertical * 15,
                            width: SizeConfig.blockHorizontal * 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Servers Name:      Qoligo Pos',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                SizedBox(height: SizeConfig.blockVertical * 2),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: SizeConfig.blockHorizontal * 4),
                                  child: Text(
                                    'Clock in Time: ' +
                                        '           ' +
                                        formatedTanggal.toString(),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                SizedBox(height: SizeConfig.blockVertical * 2),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: SizeConfig.blockHorizontal * 6),
                                  child: Text(
                                      '  Date:      ' +
                                          ' ' +
                                          formatedTahun.toString(),
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.grey.shade400)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(bottom: SizeConfig.blockVertical * 4),
                      height: SizeConfig.blockVertical * 0.3,
                      width: SizeConfig.blockHorizontal * 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockVertical * 0.2),
                            height: SizeConfig.blockVertical * 10,
                            width: SizeConfig.blockHorizontal * 95,
                            child: TextFormField(
                              controller: password,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Outlet IP Address'),
                              validator: Validators.compose([
                                Validators.required('Fill IP Address'),
                                Validators.maxLength(
                                    15, 'Your IP Address cant Access'),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockVertical * 0.5),
                            height: SizeConfig.blockVertical * 10,
                            width: SizeConfig.blockHorizontal * 95,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (_fromKey.currentState!.validate() ==
                                      false) {
                                    print('access danied');
                                  } else if (_fromKey.currentState!
                                          .validate() ==
                                      true) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ViewBar()));
                                  }
                                });
                              },
                              child: Text(
                                'Confirm IP Address',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue.shade900,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.blue.shade900,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockVertical * 22,
                              left: SizeConfig.blockVertical * 14),
                          child: Text(
                            formatedTanggal.toString() +
                                ", " +
                                formatedTahun.toString(),
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockVertical * 26),
                          height: SizeConfig.blockVertical * 10,
                          width: SizeConfig.blockHorizontal * 95,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Log Out',
                              style: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.blue.shade900,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
