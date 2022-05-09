import 'package:flutter/material.dart';
import 'package:flutter_mobile/method/method%20size/method.dart';
import 'package:flutter_mobile/method/method%20style/theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobile/validation/method%20size/method.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mobile/widgets/login%20page/login_page.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
import 'package:flutter_mobile/validation/method style/theme.dart';
import 'package:email_validator/email_validator.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String api = "";
  var loading = false;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        loading = false;
      });
    });
    loading = true;
    getApiText();

    super.initState();
  }

  getUserServer() async {
    await Provider.of<ProviderUser>(context, listen: false).getUsers();
  }

  getTab() async {
    await Provider.of<TableProviders>(context, listen: false).getTable();
  }

  getProducts() async {
    await Provider.of<ProductProviders>(context, listen: false).getData();
  }

  getApiText() async {
    final SharedPreferences getApi = await SharedPreferences.getInstance();
    setState(() {
      api = getApi.getString("setApi") ?? "-";
    });
  }

  TextEditingController dataApi = TextEditingController();
  bool isValidate = true;
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
    var userProvider = Provider.of<ProviderUser>(context);
    SizeConfig().init(context);
    return Sizer(builder: (context, orentation, deviceType) {
      return Scaffold(
        backgroundColor: backgroundClor,
        appBar: AppBar(
            elevation: 1,
            backgroundColor: backgroundClor,
            title: Container(
              margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 24,
              ),
              child: Text(
                'Settings',
                style: settings,
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
                            height: SizeConfig.blockVertical * 9,
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
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  hintText: "Outlet IP Address",
                                ),
                                style: TextStyle(color: buttonNavbar),
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
                                      isValidate = false;
                                    });
                                  } else {
                                    setState(() {
                                      isValidate = true;
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
                                    getTab();
                                    // getUserServer();
                                  });
                                }
                              },
                              child: Text(
                                'Confirm IP Address',
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w800,
                                  color: buttonOutline
                                      ? buttonNavbar
                                      : Colors.white,
                                  fontSize: 13.sp,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: buttonChange
                                      ? backgroundClor
                                      : buttonNavbar,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: buttonNavbar,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
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
                              top: SizeConfig.blockVertical * 26),
                          height: SizeConfig.blockVertical * 9,
                          width: SizeConfig.blockHorizontal * 95,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                buttonBack ? null : buttonBack = !buttonBack;
                                buttonBackText
                                    ? null
                                    : buttonBackText = !buttonBackText;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text(
                              'Back',
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
                              onPrimary: buttonNavbar,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: buttonNavbar,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
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
        const Text("Ip Address Confirmed!",
            style: TextStyle(
                fontFamily: ' Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ],
    ),
  ));
}
