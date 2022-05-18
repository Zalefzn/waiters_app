import 'dart:convert';
import 'package:flutter_mobile/model/token.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//api AuthService
class AuthService {
  Future<ModelToken> login({
    required int pin,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var baseUrl = sharedPreferences.getString("setApi");
    print(baseUrl);
    var url = '$baseUrl/auth/pin';
    var headers = {'Content-type': 'application/json'};
    var body = jsonEncode({
      "pin": pin,
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["json"];
      ModelToken pin = ModelToken.fromJson(data['pin']);
      pin.token = 'bearer ' + data['access_token'];

      return pin;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
