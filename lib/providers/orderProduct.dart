import 'package:flutter/material.dart';
import 'package:flutter_mobile/api/orderProduct.dart';
import 'package:flutter_mobile/model/cartProduct.dart';
import 'package:flutter_mobile/model/tableManagement.dart';

//provider order data
class OrderProvider with ChangeNotifier {
  Future<bool> orderCheck(
      List<CartModel> carts, List<TableManagement> tables) async {
    try {
      if (await OrderService().orderCheck(carts, tables)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
