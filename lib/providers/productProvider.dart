  import 'package:flutter/material.dart';
import 'package:flutter_mobile/api/productApi.dart';
import 'package:flutter_mobile/model/product.dart';

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
