import 'dart:convert';
import 'package:flutter_mobile/model/cartProduct.dart';
import 'package:flutter_mobile/model/tableManagement.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
                'product_price': cart.product.priceProduct,
                'total_price': cart.product.priceProduct,
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
