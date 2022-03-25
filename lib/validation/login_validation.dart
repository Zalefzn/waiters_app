import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mobile/validation/method.dart';
import 'package:flutter_mobile/validation/navbutton_page.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class ValidationLogin extends StatefulWidget {
  ValidationLogin({Key? key}) : super(key: key);

  @override
  State<ValidationLogin> createState() => _ValidationLoginState();
}

class _ValidationLoginState extends State<ValidationLogin> {
  TextEditingController _pin = TextEditingController();

  final _fromKey = GlobalKey<FormState>();
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
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
            MaterialPageRoute(builder: (BuildContext context) => ViewBar()),
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
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
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
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                    width: SizeConfig.blockHorizontal * 1,
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: 'Enter Your Pin'),
                            validator: Validators.compose([
                              Validators.required('Your Pin Required'),
                              Validators.maxLength(5, 'Your Pin cant access'),
                            ]),
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
                    if (_pin.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(milliseconds: 500),
                          backgroundColor: Colors.red,
                          content: Text(
                            "Login Valid",
                            textAlign: TextAlign.center,
                          )));
                    } else if (_pin.text.isNotEmpty) {
                      loginPin(_pin.text);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(milliseconds: 500),
                          backgroundColor: Colors.green,
                          content: Text(
                            "Login Success",
                            textAlign: TextAlign.center,
                          )));
                    }
                  }, //_pin.text == ""
                  //? null
                  //: () {
                  //setState(() {});
                  //ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //duration: Duration(milliseconds: 500),
                  //backgroundColor: Colors.green,
                  //content: Text("Login Success",
                  //textAlign: TextAlign.center),
                  // ));
                  //loginPin(_pin.text);
                  //},
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 30.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigoAccent[400],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
