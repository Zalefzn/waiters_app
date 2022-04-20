import 'package:flutter_mobile/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/class_model.dart';

//provider Auth service
class AuthProviders with ChangeNotifier {
  late ModelToken _pin;

  ModelToken get pin => _pin;
  set pin(ModelToken pin) {
    pin = _pin;
    notifyListeners();
  }

  Future<bool> login({
    required pin,
  }) async {
    try {
      ModelToken basePin = await AuthService().login(pin: pin);
      _pin = basePin;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

//provider table management
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

//provider pos setting
class PosProviders with ChangeNotifier {
  List<PosSetting> _pos = [];
  List<PosSetting> get pos => _pos;

  set pos(List<PosSetting> poses) {
    notifyListeners();
  }

  Future<void> getPos() async {
    try {
      List<PosSetting> poses = await PosSettingServ().posSettings();
      _pos = poses;
    } catch (e) {
      print(e);
    }
  }
}

//provider product data
class ProductProviders with ChangeNotifier {
  List<DataProduct> _barangs = [];
  List<DataProduct> _searchBarang = [];

  List<DataProduct> get search => _searchBarang;
  set search(List<DataProduct> search) {
    notifyListeners();
  }

  List<DataProduct> get products => _barangs;
  set products(List<DataProduct> barangs) {
    notifyListeners();
  }

  Future<void> getSeacrh() async {
    try {
      List<DataProduct> search = await DataService.getDataPro();
      _searchBarang = search;
    } catch (i) {
      print(i);
    }
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
      total += (item.quantity);
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

//provider category product
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

//provider section table
class SectionTable with ChangeNotifier {
  List<TableSection> _section = [];
  List<TableSection> get sections => _section;

  set sections(List<TableSection> _section) {
    notifyListeners();
  }

  Future<void> getSection() async {
    try {
      List<TableSection> sectionTab = await GetSection().getSection();
    } catch (e) {
      print(e);
    }
  }
}

//provider user
class ProviderUser with ChangeNotifier {
  List<UserServer> _user = [];
  List<UserServer> get users => _user;

  set users(List<UserServer> _user) {
    notifyListeners();
  }

  Future<void> getUsers() async {
    try {
      List<UserServer> getUsers = await UserModelApi().getUser();
    } catch (e) {
      print(e);
    }
  }
}

//provider marge table
class MargeProviders with ChangeNotifier {
  Future<bool> margeCheck(List<TableManagement> table) async {
    try {
      if (await MargeCheck().margeCheck(table)) {
        return true;
      } else {
        return false;
      }
    } catch (d) {
      print(d);
      return false;
    }
  }
}

//provider move table
class MoveProvider with ChangeNotifier {
  Future<bool> moveCheck(List<TableManagement> table) async {
    try {
      if (await MoveCheck().moveCheck(table)) {
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
