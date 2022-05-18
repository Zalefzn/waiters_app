import 'dart:convert';
import 'package:flutter_mobile/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//api dataService Product
class DataService {
  static Future<List<DataProduct>> getDataPro() async {
    SharedPreferences qoligoPos = await SharedPreferences.getInstance();
    var baseUrl = qoligoPos.getString("setApi");

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
