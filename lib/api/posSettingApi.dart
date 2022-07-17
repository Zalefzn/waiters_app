import 'dart:convert';
import 'package:flutter_mobile/model/posSetting.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//api pos setting
class PosSettings {
  Future<List<PosSettingData>> posSettings() async {
    SharedPreferences getServ = await SharedPreferences.getInstance();
    var baseUrl = getServ.getString("setApi");
    var url = '$baseUrl/pos_setting';
    // var auth = getServ.getString("access_token");

    var headers = {
      // "Authorization": "Bearer ${auth}",
      'Content-type': 'application/json'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      var data;
      data = jsonDecode(response.body);
      print(data);
      List<PosSettingData> posSetting = [];

      // for (var item in data) {
      //   item.add(PosSettingData.fromJson(item));
      // }

      return posSetting;
    } else {
      throw Exception('Gagal Get Outlet');
    }
  }
}
