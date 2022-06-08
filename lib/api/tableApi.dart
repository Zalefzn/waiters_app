import 'dart:convert';
import 'package:flutter_mobile/model/tableManagement.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//api tableService
class TableService {
  Future<List<TableManagement>> getTable() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var baseUrl = sharedPreferences.getString("setApi");

    var url = '$baseUrl/table_management';
    var apiSet = sharedPreferences.getString("setApi");

    var auth = sharedPreferences.getString("access_token");
    print(auth);
    var headers = {
      "Authorization": "Bearer ${auth}",
      'Content-Type': 'application/json',
    };

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];

      List<TableManagement> tables = [];

      for (var item in data) {
        tables.add(TableManagement.fromJson(item));
      }
      return tables;
    } else {
      throw Exception('Gagal Get Table');
    }
  }
}
