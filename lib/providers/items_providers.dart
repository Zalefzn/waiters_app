import 'package:flutter_mobile/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/providers/items_providers.dart';
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
      List<DataProduct> barang = await DataService.getDataPro();
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
    int total = 0;
    for (var item in carts) {
      total += item.id;
    }
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

class ProductCategorys with ChangeNotifier {
  List<ProductCategory> _category = [];
  List<ProductCategory> get categorys => _category;

  set category(List<ProductCategory> _category) {
    notifyListeners();
  }

  Future<void> getCategory() async {
    try {
      List<ProductCategory> category = await GetCategory().getCategoryProduct();
      _category = category;
    } catch (e) {
      print(e);
    }
  }
}

class SectionTable with ChangeNotifier {
  List<Section> _section = [];
  List<Section> get sections => _section;

  set sections(List<Section> _section) {
    notifyListeners();
  }

  Future<void> getSection() async {
    try {
      List<Section> sectionTab = await GetSection().getSection();
    } catch (e) {
      print(e);
    }
  }
}

class UserProvider with ChangeNotifier {
  List<UserModel> _user = [];
  List<UserModel> get users => _user;

  set users(List<UserModel> _user) {
    notifyListeners();
  }

  Future<void> getUsers() async {
    try {
      List<UserModel> getUsers = await UserModelApi().getUser();
    } catch (e) {
      print(e);
    }
  }
}

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
