import 'dart:convert';
import 'package:flutter_mobile/model/UserServer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//api user server
class UserModelApi {
  Future<List<UserServer>> getUser() async {
    SharedPreferences dataServer = await SharedPreferences.getInstance();
    var baseUrl = dataServer.getString("setApi");
    print(baseUrl);

    var url = '$baseUrl/auth/user';
    var auth = dataServer.getString("access_token");
    print(auth);
    var headers = {"Authorization": "Bearer ${auth}"};

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonServer = jsonDecode(response.body);
      var server = jsonServer["data"];
      List<UserServer> getDataServer = [];
      print(server);

      return getDataServer;
    } else {
      throw Exception('Gagal Get User');
    }
  }
}
