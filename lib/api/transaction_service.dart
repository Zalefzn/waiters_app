import 'dart:convert';
import 'package:flutter_mobile/model/transactionProduct.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TransactionService {
  Future<bool> placeOrder(List<TransactionProduct> transactionProduct) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var baseUrl = preferences.getString("setApi");
    var accessToken = preferences.getString("access_token");
    var url = '$baseUrl/order';

    var tableName = preferences.getString("saveTable");

    var customer = {"name": tableName, "count": preferences.getInt("key")};

    var table = {
      "table_name": tableName,
      "id_table_management": preferences.getInt("saveId")
    };

    var httpHeaders = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $accessToken",
    };

    var httpBody = jsonEncode({
      "customer": customer,
      "id_order_type": 1,
      "table": table,
      "products": transactionProduct
          .map((e) => {
                "id_product": e.productId,
                "product_price": e.price,
                "quantity": e.quantity,
                "note": e.notes,
                "total_price": e.totalPrice()
              })
          .toList()
    });

    var response =
        await http.post(Uri.parse(url), headers: httpHeaders, body: httpBody);

    return (response.statusCode == 200)
        ? true
        : throw Exception("Cannot place order, please try again");
  }
}
