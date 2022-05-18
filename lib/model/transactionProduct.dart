class TransactionProduct {
  late String name;
  late double priceProduct;
  late int quantity;
  late String notes;
  late int? id;

  TransactionProduct({
    required this.name,
    required this.priceProduct,
    this.quantity = 1,
    this.notes = "",
    this.id,
  });
}
