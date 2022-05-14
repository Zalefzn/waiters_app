import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/cartProduct.dart';
import 'package:flutter_mobile/model/product.dart';

//provider cart model
class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> _carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(DataProduct product) {
    if (productExist(product)) {
      int index = _carts.indexWhere(
          (element) => element.product.productId == product.productId);
      _carts[index].quantity++;
    } else {
      _carts.add(CartModel(
        id: _carts.length,
        product: product,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  reduceQuntity(int id) {
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    _carts[id].quantity--;
    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  removeAll(int id) {
    _carts.remove(id);
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in carts) {
      var hargaProduct = double.parse(item.product.priceProduct).floor();
      total += (item.quantity * hargaProduct);
    }
    return total;
  }

  productExist(DataProduct product) {
    if (carts.indexWhere(
            (element) => element.product.productId == product.productId) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
