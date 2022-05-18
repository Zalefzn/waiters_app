//model product data
class DataProduct {
  late int productId;
  late int idoutlet;
  late int idepart;
  late String nameProduct;
  late String priceProduct;
  late String gambarProduct;
  late String gambarUrl;
  late int quantity;
  late int idProCategory;

  DataProduct({
    required this.productId,
    required this.idoutlet,
    required this.idepart,
    required this.nameProduct,
    required this.priceProduct,
    required this.gambarProduct,
    required this.gambarUrl,
    required this.quantity,
    required this.idProCategory,
  });

  DataProduct.fromJson(Map<String, dynamic> json) {
    idoutlet = json["id_outlet"];
    idepart = json["id_department"];
    productId = json["id_product"];
    nameProduct = json["product_name"];
    priceProduct = json["product_price"];
    gambarProduct = "";
    gambarUrl = "";
    if (json["image"] != null) {
      gambarProduct = json["image"];
    }
    if (json["image_url"] != null) {
      gambarUrl = json["image_url"];
    }
    var quantity = "";
    if (json["quantity_status"] != null) {
      quantity = json["quantity_status"];
    }
    idProCategory = json["id_product_category"];
  }

  Map<String, dynamic> toJson() {
    return {
      'id_outlet': idoutlet,
      'id_department': idepart,
      'id_product': productId,
      'product_name': nameProduct,
      'product_price': priceProduct,
      'image': gambarProduct,
      'image_url': gambarUrl,
      'quantity_status': quantity,
      'id_product_category': idProCategory,
    };
  }
}
