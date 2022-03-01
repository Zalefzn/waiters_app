import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_mobile/model/tokenModel.dart';

class AuthService {
  String baseUrl = "https://backend-staging.qoligo.com/api/auth";

  Future<ModelToken> login({
    required String pin,
  }) async {
    var url = '$baseUrl/pin';
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
