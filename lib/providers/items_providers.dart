import 'package:flutter_mobile/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/table.dart';
import 'package:flutter_mobile/model/produk.dart';

class TableProviders with ChangeNotifier {
  List<TableManagement> _tables = [];
  List<TableManagement> get tables => _tables;

  set tables(List<TableManagement> tables) {
    notifyListeners();
  }

  Future<void> getTable() async {
    try {
      List<TableManagement> tables = await TableService().getTable();
      _tables = tables;
    } catch (e) {
      print(e);
    }
  }
}

class ProductProviders with ChangeNotifier {
  List<DataProduct> _barangs = [];
  List<DataProduct> get products => _barangs;
  set products(List<DataProduct> barangs) {
    notifyListeners();
  }

  Future<void> getData() async {
    try {
      List<DataProduct> barang = await DataService().getDataPro();
      _barangs = barang;
    } catch (e) {
      print(e);
    }
  }
}

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
