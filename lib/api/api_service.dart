import 'dart:convert';
import 'package:flutter_mobile/model/produk.dart';
import 'package:flutter_mobile/model/table.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TableService {
  Future<List<TableManagement>> getTable() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var baseUrl = sharedPreferences.getString("setApi");
    print(baseUrl);

    var url = '$baseUrl/table_management';
    var apiSet = sharedPreferences.getString("setApi");

    var auth = sharedPreferences.getString("access_token");
    print(auth);
    var headers = {"Authorization": "Bearer ${auth}"};

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

class DataService {
  Future<List<DataProduct>> getDataPro() async {
    SharedPreferences qoligoPos = await SharedPreferences.getInstance();
    var baseUrl = qoligoPos.getString("setApi");
    print(baseUrl);

    var url = '$baseUrl/product?_deep=0';
    var auth = qoligoPos.getString("access_token");
    print(auth);
    var headers = {"Authorization": "Bearer ${auth}"};

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<DataProduct> dataProduk = [];

      for (var item in data) {
        dataProduk.add(DataProduct.fromJson(item));
      }
      return dataProduk;
    } else {
      throw Exception('Gagal Get Product');
    }
  }
}
