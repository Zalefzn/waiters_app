//model cart product
import 'package:flutter_mobile/model/product.dart';

class CartModel {
  late int id;
  late DataProduct product;
  late int quantity;

  CartModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json["id_product"];
    product = DataProduct.fromJson(json['product']);
    var quantity = "";
    if (json['quantity'] != null) {
      quantity = json['quantity'];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id_product': id,
      'quantity': quantity,
      'product': product.toJson(),
    };
  }
}
