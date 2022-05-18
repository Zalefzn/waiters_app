import 'dart:convert';
import 'package:flutter_mobile/model/categoryProduct.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//api category product
class GetCategory {
  Future<List<ProductCategory>> getCategoryProduct() async {
    SharedPreferences getCategory = await SharedPreferences.getInstance();
    var connect = getCategory.getString('setApi');
    print(connect);

    var url = "$connect/product_category?_deep=0";
    var token = getCategory.getString("access_token");
    print(token);

    var headers = {"Authorization": "Bearer ${token}"};
    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<ProductCategory> categoryProduk = [];

      for (var item in data) {
        categoryProduk.add(ProductCategory.fromJson(item));
      }
      return categoryProduk;
    } else {
      throw Exception('Gagal Get Category');
    }
  }
}
