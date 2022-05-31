import 'package:flutter/foundation.dart';
import 'package:flutter_mobile/api/transaction_service.dart';
import 'package:flutter_mobile/model/transactionModel.dart';
import 'package:flutter_mobile/model/transactionProduct.dart';
import 'package:flutter_mobile/providers/tableProvider.dart';

class TransactionProvider with ChangeNotifier {
  late TransactionModel transaction;

  final List<TransactionProduct> transactionProducts = [];
  List<TransactionProduct> get products => transactionProducts;

  addProduct(TransactionProduct product) {
    if (product.id == null) {
      insertProduct(product);
    } else {
      updateProduct(product);
    }

    notifyListeners();
  }

  removeProduct(TransactionProduct product) {
    transactionProducts.removeAt(product.productId);
    notifyListeners();
  }

  insertProduct(TransactionProduct product) {
    product.id = generateTransactionProductId();
    transactionProducts.add(product);
  }

  updateProduct(TransactionProduct product) {
    var productIndex =
        transactionProducts.indexWhere((element) => element.id == product.id);

    if (productIndex != -1) {
      var updatedProduct = transactionProducts[productIndex];

      updatedProduct.name = product.name;
      updatedProduct.price = product.price;
      updatedProduct.quantity = product.quantity;
      updatedProduct.notes = product.notes;
    }
  }

  subtotal() {
    double subtotal = 0;

    for (var product in transactionProducts) {
      subtotal += product.price * product.quantity;
    }

    return subtotal;
  }

  totalItemCount() {
    return transactionProducts.length;
  }

  isHaveOrderedProduct() {
    return (totalItemCount() > 0);
  }

  generateTransactionProductId() {
    var transactionProductCount = transactionProducts.length;
    return (transactionProductCount == 0) ? 1 : transactionProductCount++;
  }

  clearTransaction() {
    clearTransactionProducts();
  }

  clearTransactionProducts() {
    transactionProducts.clear();
  }

  Future<bool> saveTransaction() async {
    try {
      var transactionStatus =
          TransactionService().placeOrder(transactionProducts);
      if (transactionStatus == true) {
        TableProviders().getTable();
        clearTransaction();
        print(transactionStatus);
      }
      return transactionStatus;
    } catch (e) {
      return false;
    }
  }
}