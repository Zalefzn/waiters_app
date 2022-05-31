// class IdOrder {
//   late String change;
//   late String charge;
//   late String completion;
//   late String createdAt;
//   late String deletedAt;
//   late String discount;
//   late String grandTotal;
//   late int idCustomer;
//   late int idOrd;
//   late int idOrderType;
//   late int idStaff;
//   late String service;
//   late String subTotal;
//   late String tax;
//   late String total;
//   late String totalCogs;
//   late String upodateAt;

//   IdOrder({
//     required this.change,
//     required this.charge,
//     required this.completion,
//     required this.deletedAt,
//     required this.createdAt,
//     required this.discount,
//     required this.grandTotal,
//     required this.idCustomer,
//     required this.idOrd,
//     required this.idOrderType,
//     required this.idStaff,
//     required this.service,
//     required this.subTotal,
//     required this.tax,
//     required this.total,
//     required this.totalCogs,
//     required this.upodateAt,
//   });

//   IdOrder.fromJson(Map<String, dynamic> json) {
//     change = json["change"];
//     charge = json["charge"];
//     completion = json["completion"];
//     var deletedAt;
//     if (deletedAt != null) {
//       deletedAt = json["deleted_at"];
//     }
//     discount = json["discount"];
//     grandTotal = json["grand_total"];
//     idCustomer = json["id_customer"];
//     idOrd = json["id_order"];
//     idStaff = json["id_staff"];
//     subTotal = json["subtotal"];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "change": change,
//       "charge": charge,
//       "completion": completion,
//       "deleted_at": deletedAt,
//       "discount": discount,
//       "grand_total": grandTotal,
//       "id_customer": idCustomer,
//       "id_order": idOrd,
//       "id_staff": idStaff,
//       "subtotal": subTotal,
//     };
//   }
// }
