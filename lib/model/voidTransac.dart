//model void trancaction
class VoidTrans {
  late int idProductOrder;
  late String isStock;
  late String note;
  late int quantityProduct;

  VoidTrans({
    required this.idProductOrder,
    required this.isStock,
    required this.note,
    required this.quantityProduct,
  });

  VoidTrans.fromJson(Map<String, dynamic> json) {
    idProductOrder = json["id_order_product"];
    isStock = json["is_stock_decreased"];
    note = "";
    if (json["note"] != null) {
      note = json["note"];
    }
    quantityProduct = json["quantity"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id_order_product": idProductOrder,
      "is_stock_decreased": isStock,
      "note": note,
      "quantity": quantityProduct,
    };
  }
}
