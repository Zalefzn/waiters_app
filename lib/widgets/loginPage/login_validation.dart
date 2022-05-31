import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/providers/categoryProduct.dart';
import 'package:flutter_mobile/providers/productProvider.dart';
import 'package:flutter_mobile/providers/sectionTable,.dart';
import 'package:flutter_mobile/providers/tableProvider.dart';
import 'package:flutter_mobile/providers/userServer.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/utilities/methodStyle/theme.dart';
import 'package:flutter_mobile/widgets/tablePage/beforeOrderTab/page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:email_validator/email_validator.dart';

class ValidationLogin extends StatefulWidget {
  ValidationLogin({Key? key}) : super(key: key);

  @override
  State<ValidationLogin> createState() => _ValidationLoginState();
}

class _ValidationLoginState extends State<ValidationLogin> {
  TextEditingController _pin = TextEditingController();

  final _fromKey = GlobalKey<FormState>();
  late bool _isLoading;
  bool pressedLogin = false;
  bool isValidButton = true;

  @override
  @override
  void initState() {
    setState(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _isLoading = false;
        });
      });
      _isLoading = true;
    });
    super.initState();
  }

  getSectionProduct() async {
    await Provider.of<ProductCategorys>(context, listen: false).getCategory();
  }

  getProducts() async {
    await Provider.of<ProductProviders>(context, listen: false).getData();
  }

  getTab() async {
    await Provider.of<TableProviders>(context, listen: false).getTable();
  }

  getUser() async {
    await Provider.of<ProviderUser>(context, listen: false).getUsers();
  }

  loginPin(String pin) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"pin": pin};
    var baseUrl = sharedPreferences.getString("setApi");
    print(baseUrl);
    var url = '$baseUrl/auth/pin';
    var jsonResponse;
    var res = await http.post(
      //Uri.parse("https://backend-staging.qoligo.com/api/auth/pin"),
      Uri.parse(url),
      body: body,
    );
    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);

      print("Response status: ${res.statusCode}");
      print("Response status: ${res.body}");

      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });

        sharedPreferences.setString(
            "access_token", jsonResponse['access_token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => ViewPage()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });

      print("Response status: ${res.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: backgroundClor,
        body: SafeArea(
          child: Center(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(0),
                    child: Form(
                      key: _fromKey,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockHorizontal * 1.5,
                                top: SizeConfig.blockVertical * 1),
                            height: SizeConfig.blockVertical * 7,
                            width: SizeConfig.blockHorizontal * 85,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: _pin,
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintStyle: hintStyle,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        width: SizeConfig.blockHorizontal * 1,
                                        color: buttonNavbar),
                                  ),
                                  hintText: 'Enter Your Pin'),
                              style: TextStyle(
                                color: buttonNavbar,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your pin";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                bool isValid = EmailValidator.validate(value);
                                print(isValid);
                                if (isValid) {
                                  setState(() {
                                    isValidButton = false;
                                  });
                                } else {
                                  setState(() {
                                    isValidButton = true;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockVertical * 2),
                Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockHorizontal * 1.5,
                      top: SizeConfig.blockVertical * 10),
                  height: SizeConfig.blockVertical * 7,
                  width: SizeConfig.blockHorizontal * 85,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_fromKey.currentState!.validate()) {
                        loginPin(_pin.text);
                        setState(() {
                          getTab();
                          getProducts();
                          getUser();
                          getSectionProduct();
                          pressedLogin = !pressedLogin;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(milliseconds: 500),
                            backgroundColor: Colors.greenAccent[400],
                            content: const Text(
                              "Login Success!",
                              textAlign: TextAlign.center,
                            )));
                      }
                    },
                    child: Text('Login',
                        style: buttonLogin.copyWith(fontSize: 30.sp)),
                    style: ElevatedButton.styleFrom(
                      primary: pressedLogin ? textColor3 : buttonColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
