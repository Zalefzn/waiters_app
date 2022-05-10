import 'dart:convert';
import 'package:flutter_mobile/model/class_cartModel.dart';
import 'package:flutter_mobile/model/class_dataProduct.dart';
import 'package:flutter_mobile/model/class_model.dart';
import 'package:flutter_mobile/model/class_model_categoryProduct.dart';
import 'package:flutter_mobile/model/class_model_posSetting.dart';
import 'package:flutter_mobile/model/class_model_token.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//api AuthService
class AuthService {
  Future<ModelToken> login({
    required int pin,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var baseUrl = sharedPreferences.getString("setApi");
    print(baseUrl);
    var url = '$baseUrl/auth/pin';
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

//api tableService
class TableService {
  Future<List<TableManagement>> getTable() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var baseUrl = sharedPreferences.getString("setApi");

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

//api section table
class GetSection {
  Future<List<TableSection>> getSection() async {
    SharedPreferences section = await SharedPreferences.getInstance();
    var baseUrl = section.getString("setApi");

    var url = '$baseUrl/section';
    var auth = section.getString("access_token");

    var headers = {"Authorization": "Bearer ${auth}"};

    var response = await http.get(Uri.parse(url), headers: headers);

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

//api pos setting
class PosSettings {
  Future<List<SettingPos>> posSettings() async {
    SharedPreferences getServ = await SharedPreferences.getInstance();
    var baseUrl = getServ.getString("setApi");
    var url = '$baseUrl/pos_setting';
    // var auth = getServ.getString("access_token");

    var headers = {
      // "Authorization": "Bearer ${auth}",
      'Content-type': 'application/json'
    };

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<SettingPos> serv = [];

      for (var item in data) {
        serv.add(SettingPos.fromJson(item));
      }
      return serv;
    } else {
      throw Exception('Gagal Get Outlet');
    }
  }
}

//api user server
class UserModelApi {
  Future<List<UserServer>> getUser() async {
    SharedPreferences dataServer = await SharedPreferences.getInstance();
    var baseUrl = dataServer.getString("setApi");
    print(baseUrl);

    var url = '$baseUrl/auth/user';
    var auth = dataServer.getString("access_token");
    print(auth);
    var headers = {"Authorization": "Bearer ${auth}"};

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonServer = jsonDecode(response.body);
      var server = jsonServer["data"];
      List<UserServer> getDataServer = [];
      print(server);

      return getDataServer;
    } else {
      throw Exception('Gagal Get User');
    }
  }
}

//api order data
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

//api void transcation
class VoidTrancs {
  Future<bool> voidTranscation(List<VoidTrans> voidProduct) async {
    SharedPreferences getVoid = await SharedPreferences.getInstance();
    var urlApi = getVoid.getString("setApi");
    var urlVoid = '$urlApi/api/void_transaction';
    var authToken = getVoid.getString("access_token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${authToken}",
    };
    print(authToken);

    var body = jsonEncode({
      "id_order_product": 224,
      "is_stock_decreased": "0",
      "note": "",
    });
    print(body);

    var response =
        await http.post(Uri.parse(urlVoid), headers: headers, body: body);
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Void");
    }
  }
}

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
