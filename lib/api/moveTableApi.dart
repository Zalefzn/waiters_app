import 'dart:convert';
import 'package:flutter_mobile/model/tableManagement.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//api move table
class MoveCheck {
  Future<bool> moveCheck(List<TableManagement> table) async {
    SharedPreferences getMoveCheck = await SharedPreferences.getInstance();
    var moveTable = getMoveCheck.getInt("getMoveTable");
    var baseUrl = getMoveCheck.getString("setApi");
    var url = '$baseUrl/session_table/move';
    var auth = getMoveCheck.getString("access_token");
    print(moveTable);

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${auth}",
    };
    print(auth);

    var body = jsonEncode({
      "dest_table": 302,
      "origin_table": moveTable,
    });
    print(body);

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Move");
    }
  }
}
