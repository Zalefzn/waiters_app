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

class OrderProduct {
  Future<bool> orderProduct(
    List<CartModel> cartss,
  ) async {
    SharedPreferences postOrder = await SharedPreferences.getInstance();
    var baseUrl = postOrder.getString("setApi");
    var getTableName = postOrder.getString("saveTable");
    var countNumber = postOrder.getInt("key");
    print(countNumber);
    print(getTableName);
    print(baseUrl);

    var url = '$baseUrl/order';
    var auth = postOrder.getString("access_token");
    print(auth);
    var headers = {"Authorization": "Bearer ${auth}"};
    var bodyy = jsonEncode({
      'customer': {
        'count': countNumber,
        'name': getTableName,
        'phone': null,
        'address': null,
      },
      'produtcs': cartss
          .map((carts) => {
                'id': carts.product.productId,
                'product_price': carts.product.hargaProduct,
                'total_price': carts.product.hargaProduct,
              })
          .toList(),
      'id_order_type': 1,
      'table': {
        'table_name': getTableName,
        'id_outlet': 4,
        'id_table_management': 303
      }
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: bodyy);
    print(bodyy);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Post Order');
    }
  }
}
