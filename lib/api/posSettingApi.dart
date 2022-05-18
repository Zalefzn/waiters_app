import 'dart:convert';
import 'package:flutter_mobile/model/posSetting.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//api pos setting
class PosSettings {
  Future<List<SettingPos>> posSettings() async {
    SharedPreferences getServ = await SharedPreferences.getInstance();
    var baseUrl = getServ.getString("setApi");
    var url = '$baseUrl/pos_setting';
    // var auth = getServ.getString("access_token");

    var headers = {
      // "Authorization": "Bearer ${auth}",
      'Content-type': 'application/json'
    };

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)["data"];
      List<SettingPos> serv = [];

      for (var item in data) {
        serv.add(SettingPos.fromJson(item));
      }
      return serv;
    } else {
      throw Exception('Gagal Get Outlet');
    }
  }
}
