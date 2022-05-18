import 'dart:convert';
import 'package:flutter_mobile/model/voidTransac.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
