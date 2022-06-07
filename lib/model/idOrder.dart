class IdOrder {
  late String change;
  late String charge;
  late String completion;
  late String createdAt;
  late String discount;
  late String grandTotal;
  late int idCustomer;
  late int idOrder;
  late String subtotal;
  late String total;

  IdOrder({
    required this.charge,
    required this.change,
    required this.completion,
    required this.createdAt,
    required this.discount,
    required this.grandTotal,
    required this.idCustomer,
    required this.idOrder,
    required this.subtotal,
    required this.total,
  });

  IdOrder.fromJson(Map<String, dynamic> json) {
    charge = json["charge"];
    change = json["change"];
    completion = json["completion"];
    createdAt = json["created_at"];
    discount = json["discount"];
    grandTotal = json["grand_total"];
    idCustomer = json["id_customer"];
    idOrder = json["id_order"];
    subtotal = json["subtotal"];
    total = json["total"];

    Map<String, dynamic> toJson() {
      return {
        "charge": charge,
        "chnage": change,
        "completion": completion,
        "created_at": createdAt,
        "discount": discount,
        "total": total,
        "subtotal": subtotal,
        "id_customer": idCustomer,
        "id_order": idOrder,
        "grand_total": grandTotal,
      };
    }
  }
}
