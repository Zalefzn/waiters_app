class DataProduct {
  late int productId;
  late String nameProduct;
  late String hargaProduct;
  late String gambarProduct;
  late String gambarUrl;

  DataProduct({
    required this.productId,
    required this.nameProduct,
    required this.hargaProduct,
    required this.gambarProduct,
    required this.gambarUrl,
  });

  DataProduct.fromJson(Map<String, dynamic> json) {
    productId = json["id_product"];
    nameProduct = json["product_name"];
    hargaProduct = json["product_price"];
    gambarProduct = "";
    gambarUrl = "";
    if (json["image"] != null) {
      gambarProduct = json["image"];
    }
    if (json["image_url"] != null) {
      gambarUrl = json["image_url"];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id_product': productId,
      'product_name': nameProduct,
      'product_price': hargaProduct,
      'image': gambarProduct,
      'image_url': gambarUrl,
    };
  }
}

class CartModel {
  late int id;
  late DataProduct product;
  late int quantity;

  CartModel({required this.id, required this.product, required this.quantity});

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

  totalPrice() {
    return product.hargaProduct * quantity;
  }
}
