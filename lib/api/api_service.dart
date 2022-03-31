import 'dart:convert';

import 'package:flutter_mobile/model/produk.dart';
import 'package:flutter_mobile/model/table.dart';
import 'package:flutter_mobile/model/tokenModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<ModelToken> login({
    required int pin,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var baseUrl = sharedPreferences.getString("setApi");
    print(baseUrl);
    var url = '$baseUrl/pin';
    var headers = {'Content-type': 'application/json'};
    var body = jsonEncode({
      "pin": pin,
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["json"];
      ModelToken pin = ModelToken.fromJson(data['pin']);
      pin.token = 'bearer ' + data['access_token'];

      return pin;
    } else {
      throw Exception('Gagal Login');
    }
  }
}

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
  static Future<List<DataProduct>> getDataPro() async {
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
  Future<List<ModelUser>> getUser() async {
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
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      List<ModelUser> getuser = [];

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
    var getNote = getOrder.getString("Notes");
    var baseUrl = getOrder.getString("setApi");
    var getTableName = getOrder.getString("saveTable");
    var getOut = getOrder.getInt("saveIdOutlete");
    var getCount = getOrder.getInt("key");
    var getId = getOrder.getInt("saveId");
    print(getNote);
    print(getId);
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
      },
      "id_order_type": 1,
      "products": carts
          .map((cart) => {
                'id_product': cart.product.productId,
                'note': getNote,
                'product_price': cart.product.hargaProduct,
                'total_price': cart.product.hargaProduct,
                'quantity': cart.quantity,
              })
          .toList(),
      "table": {
        "table_name": getTableName,
        "id_outlet": getOut,
        "id_table_management": getId,
      }
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(response.body);
    print(body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Post");
    }
  }
}

class MargeCheck {
  Future<bool> margeCheck(List<TableManagement> table) async {
    SharedPreferences getOrder = await SharedPreferences.getInstance();
    var getIdMarge = getOrder.getInt("saveMainTable");
    var baseUrl = getOrder.getString("setApi");
    var getIdChild = getOrder.getInt("saveChild");

    print(getIdMarge);
    print(baseUrl);

    var url = '$baseUrl/session_table/merge';
    var auth = getOrder.getString("access_token");
    print(auth);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${auth}",
    };
    var body = jsonEncode({
      "child_tables": {
        "0": [getIdChild],
      },
      "parent_tables": getIdMarge,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(response.body);
    print(body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Marge");
    }
  }
}

class MoveCheck {
  Future<bool> moveCheck(List<TableManagement> table) async {
    SharedPreferences getMoveCheck = await SharedPreferences.getInstance();
    var baseUrl = getMoveCheck.getString("setApi");
    var url = '$baseUrl/session_table/move';
    print(baseUrl);
    var auth = getMoveCheck.getString("access_token");
    print(auth);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${auth}",
    };
    var body = jsonEncode({
      "dest_table": 302,
      "origin_table": 303,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(response.body);
    print(body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Move");
    }
  }
}
