import 'dart:convert';
import 'package:flutter_mobile/model/sectionTable.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//api section table
class GetSection {
  Future<List<TableSection>> getSection() async {
    SharedPreferences section = await SharedPreferences.getInstance();
    var baseUrl = section.getString("setApi");

    var url = '$baseUrl/section';
    var auth = section.getString("access_token");

    var headers = {"Authorization": "Bearer ${auth}"};

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<TableSection> getSection = [];

      for (var item in data) {
        getSection.add(TableSection.fromJson(item));
      }
      return getSection;
    } else {
      throw Exception('Gagal Get Section');
    }
  }
}
