import 'package:flutter/material.dart';
import 'package:flutter_mobile/method/method%20size/method.dart';
import 'package:flutter_mobile/method/method%20style/theme.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/widgets/table%20page/page_table.dart';
import 'package:flutter_mobile/widgets/table%20page/page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobile/widgets/login%20page/login_page.dart';
import 'package:sizer/sizer.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class LogOut extends StatefulWidget {
  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  String api = "";
  bool isValidate = true;
  List userName = [];

  @override
  void initState() {
    getApiText();
    super.initState();
  }

  getUser() async {
    await Provider.of<ProviderUser>(context, listen: false).getUsers();
  }

  getApiText() async {
    final SharedPreferences getApi = await SharedPreferences.getInstance();
    setState(() {
      api = getApi.getString("setApi") ?? "-";
    });
  }

  TextEditingController dataApi = TextEditingController();
  var buttonOutline = false;
  var buttonChange = false;
  var buttonBack = false;
  var buttonBackText = false;
  final _fromKey = GlobalKey<FormState>();
  static var today = DateTime.now();
  var formatedTanggal = DateFormat.Hm().format(today);
  var formatedTahun = DateFormat.yMMMEd().format(today);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Sizer(builder: (context, orentation, deviceType) {
      return Scaffold(
        backgroundColor: backgroundClor,
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ViewPage()));
                },
                icon: const Icon(Icons.chevron_left,
                    size: 40, color: Colors.black)),
            elevation: 1,
            backgroundColor: backgroundClor,
            title: Container(
              margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 24,
              ),
              child: const Text(
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
                          EdgeInsets.only(left: SizeConfig.blockHorizontal * 3),
                      height: SizeConfig.blockVertical * 25,
                      width: SizeConfig.blockHorizontal * 100,
                      decoration: BoxDecoration(
                        color: backgroundClor,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Servers Name : ',
                                  style: nameServer.copyWith(fontSize: 11.sp),
                                ),
                                Text(
                                  'Clock in Time: ' +
                                      '  ' +
                                      formatedTanggal.toString(),
                                  style: nameServer.copyWith(fontSize: 11.sp),
                                ),
                                Text(
                                  'Date:  ' + ' ' + formatedTahun.toString(),
                                  style: nameServer.copyWith(fontSize: 11.sp),
                                ),
                                Text(
                                  'Local: ' + '  $api',
                                  style: nameServer.copyWith(fontSize: 11.sp),
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
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: isValidate
                                            ? buttonNavbar
                                            : buttonColor3),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  hintText: "Outlet IP Address",
                                ),
                                style: TextStyle(
                                    color: isValidate
                                        ? buttonNavbar
                                        : buttonColor3),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter Ip Address";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  bool isValid = EmailValidator.validate(value);
                                  print(isValid);
                                  if (isValid) {
                                    setState(() {
                                      isValidate = true;
                                    });
                                  } else {
                                    setState(() {
                                      isValidate = false;
                                    });
                                  }
                                }),
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
                            height: SizeConfig.blockVertical * 9,
                            width: SizeConfig.blockHorizontal * 95,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_fromKey.currentState!.validate()) {
                                  SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  sharedPreferences.setString(
                                      'setApi', dataApi.text);

                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildPopDialog(context),
                                  );

                                  setState(() {
                                    buttonChange
                                        ? null
                                        : buttonChange = !buttonChange;
                                    buttonOutline
                                        ? null
                                        : buttonOutline = !buttonOutline;
                                    // getUser();

                                    // getUserServer();
                                  });
                                }
                              },
                              child: Text(
                                'Confirm IP Address',
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w800,
                                  color: backgroundClor,
                                  fontSize: 13.sp,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      buttonChange ? textColor3 : buttonNavbar,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: buttonOutline
                                          ? textColor3
                                          : buttonNavbar,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(9),
                                  )),
                            ),
                          ),
                          TextButton(
                              onPressed: () async {
                                SharedPreferences cacheTable =
                                    await SharedPreferences.getInstance();
                                var tableClear = cacheTable.remove("saveTable");
                                SharedPreferences cacheIdTable =
                                    await SharedPreferences.getInstance();
                                cacheIdTable.remove("saveId");
                                SharedPreferences cacheOutletTable =
                                    await SharedPreferences.getInstance();
                                cacheOutletTable.remove("saveIdOutlete");
                                SharedPreferences cacheInputCount =
                                    await SharedPreferences.getInstance();
                                var clearCount = cacheInputCount.remove("key");
                                print(tableClear);
                                print(clearCount);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _showPopDialog(context),
                                );
                              },
                              child: Text("Clear Cache",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Montserrat'))),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockVertical * 15,
                              left: SizeConfig.blockVertical * 13),
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
                              top: SizeConfig.blockVertical * 20),
                          height: SizeConfig.blockVertical * 9,
                          width: SizeConfig.blockHorizontal * 95,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                buttonBack ? null : buttonBack = !buttonBack;
                                buttonBackText
                                    ? null
                                    : buttonBackText = !buttonBackText;
                              });
                              // SharedPreferences removeAll =
                              //     await SharedPreferences.getInstance();
                              // removeAll.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text(
                              'Log Out',
                              style: TextStyle(
                                  fontFamily: 'Rubik',
                                  color: buttonBackText
                                      ? backgroundClor
                                      : buttonNavbar,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary:
                                  buttonBack ? buttonNavbar : backgroundClor,
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

_showPopDialog(BuildContext context) {
  return AlertDialog(
      title: Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          height: SizeConfig.blockVertical * 15,
          decoration: BoxDecoration(color: Colors.white),
          child: Icon(
            Icons.check_rounded,
            color: Colors.blue.shade900,
            size: 100,
          )),
      Container(
        margin: EdgeInsets.only(
            left: SizeConfig.blockHorizontal * 5,
            bottom: SizeConfig.blockVertical * 4),
        child: Text("Clear Cache successful!",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
    ]),
  ));
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
                bottom: SizeConfig.blockVertical * 5),
            height: SizeConfig.blockVertical * 15,
            width: SizeConfig.blockHorizontal * 20,
            child: Icon(
              Icons.check_rounded,
              color: Colors.blue.shade900,
              size: 100,
            )),
        Container(
          margin: EdgeInsets.only(
              left: SizeConfig.blockHorizontal * 5,
              bottom: SizeConfig.blockVertical * 4),
          child: Text("Ip Address Confirmed!",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      ],
    ),
  ));
}

class LogOut2 extends StatefulWidget {
  @override
  State<LogOut2> createState() => _LogOut2State();
}

class _LogOut2State extends State<LogOut2> {
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
  var buttonOutline = false;
  var buttonChange = false;
  var buttonBack = false;
  var buttonBackText = false;
  final _fromKey = GlobalKey<FormState>();
  static var today = DateTime.now();
  var formatedTanggal = DateFormat.Hm().format(today);
  var formatedTahun = DateFormat.yMMMEd().format(today);

  @override
  Widget build(BuildContext context) {
    ProviderUser userProvider = Provider.of<ProviderUser>(context);
    SizeConfig().init(context);
    return Sizer(builder: (context, orentation, deviceType) {
      return Scaffold(
        backgroundColor: backgroundClor,
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ViewTable()));
                },
                icon: Icon(Icons.chevron_left, size: 40, color: Colors.black)),
            elevation: 1,
            backgroundColor: backgroundClor,
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
                          EdgeInsets.only(left: SizeConfig.blockHorizontal * 3),
                      height: SizeConfig.blockVertical * 25,
                      width: SizeConfig.blockHorizontal * 100,
                      decoration: BoxDecoration(
                        color: backgroundClor,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Servers Name : ',
                                  style: nameServer.copyWith(fontSize: 11.sp),
                                ),
                                Text(
                                  'Clock in Time: ' +
                                      '  ' +
                                      formatedTanggal.toString(),
                                  style: nameServer.copyWith(fontSize: 11.sp),
                                ),
                                Text(
                                  'Date:  ' + ' ' + formatedTahun.toString(),
                                  style: nameServer.copyWith(fontSize: 11.sp),
                                ),
                                Text(
                                  'Local: ' + '  $api',
                                  style: nameServer.copyWith(fontSize: 11.sp),
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
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                labelText: "Outlet IP Address",
                              ),
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
                            height: SizeConfig.blockVertical * 9,
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
                                setState(() {
                                  buttonChange
                                      ? null
                                      : buttonChange = !buttonChange;
                                  buttonOutline
                                      ? null
                                      : buttonOutline = !buttonOutline;
                                });
                              },
                              child: Text(
                                'Confirm IP Address',
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w800,
                                  color: backgroundClor,
                                  fontSize: 13.sp,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      buttonChange ? textColor3 : buttonNavbar,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: buttonOutline
                                          ? textColor3
                                          : buttonNavbar,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(9),
                                  )),
                            ),
                          ),
                          TextButton(
                              onPressed: () async {
                                SharedPreferences cacheTable =
                                    await SharedPreferences.getInstance();
                                var tableClear = cacheTable.remove("saveTable");
                                SharedPreferences cacheIdTable =
                                    await SharedPreferences.getInstance();
                                cacheIdTable.remove("saveId");
                                SharedPreferences cacheOutletTable =
                                    await SharedPreferences.getInstance();
                                cacheOutletTable.remove("saveIdOutlete");
                                SharedPreferences cacheInputCount =
                                    await SharedPreferences.getInstance();
                                var clearCount = cacheInputCount.remove("key");
                                print(tableClear);
                                print(clearCount);
                              },
                              child: Text("Clear Cache",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Montserrat'))),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockVertical * 15,
                              left: SizeConfig.blockVertical * 13),
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
                              top: SizeConfig.blockVertical * 20),
                          height: SizeConfig.blockVertical * 9,
                          width: SizeConfig.blockHorizontal * 95,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                buttonBack ? null : buttonBack = !buttonBack;
                                buttonBackText
                                    ? null
                                    : buttonBackText = !buttonBackText;
                              });
                              // SharedPreferences removeAll =
                              //     await SharedPreferences.getInstance();
                              // removeAll.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text(
                              'Log Out',
                              style: TextStyle(
                                  fontFamily: 'Rubik',
                                  color: buttonBackText
                                      ? backgroundClor
                                      : buttonNavbar,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary:
                                  buttonBack ? buttonNavbar : backgroundClor,
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

_buildPopDialog2(BuildContext context) {
  return AlertDialog(
      title: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 0,
                bottom: SizeConfig.blockVertical * 5),
            height: SizeConfig.blockVertical * 15,
            width: SizeConfig.blockHorizontal * 20,
            child: Icon(
              Icons.check_rounded,
              color: Colors.blue.shade900,
              size: 100,
            )),
        Container(
          margin: EdgeInsets.only(
              left: SizeConfig.blockHorizontal * 5,
              bottom: SizeConfig.blockVertical * 4),
          child: Text("Ip Address Confirmed!",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      ],
    ),
  ));
}
