import 'package:flutter/material.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mobile/widgets/login%20page/login_page.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String api = "";
  @override
  void initState() {
    getApiText();
    super.initState();
  }

  getApiText() async {
    final SharedPreferences getApi = await SharedPreferences.getInstance();
    setState(() {
      api = getApi.getString("setApi") ?? "-";
    });
  }

  TextEditingController dataApi = TextEditingController();

  final _fromKey = GlobalKey<FormState>();
  static var today = DateTime.now();
  var formatedTanggal = DateFormat.Hm().format(today);
  var formatedTahun = DateFormat.yMMMEd().format(today);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    SizeConfig().init(context);
    return Sizer(builder: (context, orentation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            title: Container(
              margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 24,
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontFamily: ' Montserrat',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
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
                                top: SizeConfig.blockVertical * 0),
                            height: SizeConfig.blockVertical * 25,
                            width: SizeConfig.blockHorizontal * 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: SizeConfig.blockHorizontal * 64),
                                  child: Text(
                                    'Servers Name : ',
                                    style: TextStyle(
                                      fontFamily: ' Montserrat',
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                                SizedBox(height: SizeConfig.blockVertical * 2),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: SizeConfig.blockHorizontal * 47),
                                  child: Text(
                                    'Clock in Time: ' +
                                        '           ' +
                                        formatedTanggal.toString(),
                                    style: TextStyle(
                                      fontFamily: ' Montserrat',
                                      fontSize: 10.sp,
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                SizedBox(height: SizeConfig.blockVertical * 2),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: SizeConfig.blockHorizontal * 47),
                                  child: Text(
                                      'Date:      ' +
                                          ' ' +
                                          formatedTahun.toString(),
                                      style: TextStyle(
                                          fontFamily: ' Montserrat',
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.grey.shade400)),
                                ),
                                SizedBox(height: SizeConfig.blockVertical * 2),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: SizeConfig.blockHorizontal * 15),
                                  child: Text('Local: ' + '  $api',
                                      style: TextStyle(
                                          fontFamily: ' Montserrat',
                                          fontSize: 10.sp,
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
                              controller: dataApi,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: "Outlet IP Address",
                              ),
                              validator: Validators.compose([
                                Validators.required('Fill IP Address'),
                                Validators.maxLength(
                                    160, 'Your IP Address cant Access'),
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
                              onPressed: () async {
                                SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();

                                sharedPreferences.setString(
                                    'setApi', dataApi.text);

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildPopDialog(context),
                                );
                                setState(() {});
                              },
                              child: Text(
                                'Confirm IP Address',
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.indigoAccent.shade400,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.indigoAccent.shade400,
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
                              left: SizeConfig.blockVertical * 16),
                          child: Text(
                            formatedTanggal.toString() +
                                ", " +
                                formatedTahun.toString(),
                            style: TextStyle(
                              fontFamily: ' Montserrat',
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockVertical * 26),
                          height: SizeConfig.blockVertical * 10,
                          width: SizeConfig.blockHorizontal * 95,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text(
                              'Back',
                              style: TextStyle(
                                  fontFamily: 'Rubik',
                                  color: Colors.indigoAccent.shade400,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.indigoAccent.shade400,
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

_buildPopDialog(BuildContext context) {
  return AlertDialog(
      title: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: SizeConfig.blockHorizontal * 0,
              bottom: SizeConfig.blockVertical * 6),
          height: SizeConfig.blockVertical * 16,
          width: SizeConfig.blockHorizontal * 100,
          color: Colors.white,
          child: Icon(
            Icons.check_rounded,
            color: Colors.indigoAccent.shade400,
            size: 130,
          ),
        ),
        Text("Ip Address Confirmed!",
            style: TextStyle(
                fontFamily: ' Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ],
    ),
  ));
}
