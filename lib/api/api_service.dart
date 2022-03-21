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

class GetSection {
  Future<List<Section>> getSection() async {
    SharedPreferences section = await SharedPreferences.getInstance();
    var baseUrl = section.getString("setApi");
    print(baseUrl);

    var url = '$baseUrl/section';
    var auth = section.getString("access_token");
    print(auth);
    var headers = {"Authorization": "Bearer ${auth}"};

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<Section> getSection = [];

      for (var item in data) {
        getSection.add(Section.fromJson(item));
      }
      return getSection;
    } else {
      throw Exception('Gagal Get Section');
    }
  }
}

class UserModelApi {
  Future<List<UserModel>> getUser() async {
    SharedPreferences getUser = await SharedPreferences.getInstance();
    var baseUrl = getUser.getString("setApi");
    print(baseUrl);

    var url = '$baseUrl/auth/user';
    var auth = getUser.getString("access_token");
    print(auth);
    var headers = {"Authorization": "Bearer ${auth}"};

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<UserModel> getuser = [];

      for (var item in data) {
        getuser.add(UserModel.fromJson(item));
      }
      return getuser;
    } else {
      throw Exception('Gagal Get User');
    }
  }
}

class OrderService {
  Future<bool> orderCheck(
      List<CartModel> carts, List<TableManagement> tables) async {
    SharedPreferences getOrder = await SharedPreferences.getInstance();
    var baseUrl = getOrder.getString("setApi");
    var getTableName = getOrder.getString("saveTable");
    var getCount = getOrder.getInt("key");
    print(baseUrl);
    print(getTableName);
    print(getCount);

    var url = '$baseUrl/order';
    var auth = getOrder.getString("access_token");
    print(auth);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${auth}",
    };
    var body = jsonEncode({
      "customer": {
        "name": getTableName,
        "count": getCount,
        "products": carts
            .map((cart) => {
                  'product_price': cart.product.hargaProduct,
                  'total_price': cart.product.hargaProduct,
                  'quantity': cart.quantity,
                })
            .toList(),
        "table": tables
            .map((tables) => {
                  "table_name": getTableName,
                })
            .toList()
      },
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Post");
    }
  }
}
