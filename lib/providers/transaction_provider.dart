import 'package:flutter/foundation.dart';
import 'package:flutter_mobile/model/transaction_model.dart';
import 'package:flutter_mobile/model/transaction_product_model.dart';

class TransactionProvider with ChangeNotifier {
  late TransactionModel transaction;

  final List<TransactionProductModel> transactionProducts = [];
  List<TransactionProductModel> get products => transactionProducts;

  addProduct(TransactionProductModel product) {
    transactionProducts.add(product);
    notifyListeners();
  }

  subtotal() {
    double subtotal = 0;

    for (var product in transactionProducts) {
      subtotal += product.price * product.quantity;
    }

    return subtotal;
  }

}