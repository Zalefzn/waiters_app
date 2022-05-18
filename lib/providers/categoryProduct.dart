import 'package:flutter/material.dart';
import 'package:flutter_mobile/api/categoryProductApi.dart';
import 'package:flutter_mobile/model/categoryProduct.dart';

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
