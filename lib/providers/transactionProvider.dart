import 'package:flutter/foundation.dart';
import 'package:flutter_mobile/model/transactionModel.dart';
import 'package:flutter_mobile/model/transactionProduct.dart';

class TransactionProvider with ChangeNotifier {
  late TransactionModel transactionModel;

  final List<TransactionProduct> transactionProduct = [];
  List<TransactionProduct> get productData => transactionProduct;

  addProduct(TransactionProduct product) {
    if (product.id == 0) {
      insertProduct(product);
    } else {
      updateProduct(product);
    }

    notifyListeners();
  }

  insertProduct(TransactionProduct product) {
    product.id == generateProductId();
    transactionProduct.add(product);
  }

  updateProduct(TransactionProduct product) {
    var productIndex =
        transactionProduct.indexWhere((element) => element.id == product.id);

    if (productIndex != -1) {
      var updateProduct = transactionProduct[productIndex];

      updateProduct.name = product.name;
      updateProduct.priceProduct = product.priceProduct;
      updateProduct.quantity = product.quantity;
      updateProduct.notes = product.notes;
    }
  }

  subTotal() {
    double subTotal = 0;

    for (var dataProduct in transactionProduct) {
      subTotal += dataProduct.priceProduct * dataProduct.quantity;
    }

    return subTotal;
  }

  totalItemCount() {
    return transactionProduct.length;
  }

  generateProductId() {
    var transactionProductCount = transactionProduct.length;
    return (transactionProductCount == 0) ? 1 : transactionProductCount++;
  }
}
