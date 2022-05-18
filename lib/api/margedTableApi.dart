import 'dart:convert';
import 'package:flutter_mobile/model/tableManagement.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//api marge table
class MargeCheck {
  Future<bool> margeCheck(List<TableManagement> table) async {
    SharedPreferences getOrder = await SharedPreferences.getInstance();
    var getMainMarge = getOrder.getInt("MainMarge");
    var baseUrl = getOrder.getString("setApi");
    var getChildMarge = getOrder.getString("ChildTable");

    print(getMainMarge);
    print(getChildMarge);
    print(baseUrl);

    var urlData = '$baseUrl/session_table/merge';
    var auth = getOrder.getString("access_token");
    print(auth);
    var headerProduct = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${auth}",
    };
    var dataChild = [];
    var bodyProduct = jsonEncode({
      "child_tables": dataChild = jsonDecode(getChildMarge.toString()),
      "parent_tables": getMainMarge,
    });
    var response = await http.post(Uri.parse(urlData),
        headers: headerProduct, body: bodyProduct);

    print(bodyProduct);
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Marge");
    }
  }
}
