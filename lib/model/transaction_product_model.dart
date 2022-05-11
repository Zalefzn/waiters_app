class TransactionProductModel {
  late String name;
  late double price;
  late int quantity;
  late String notes;

  TransactionProductModel({
    required this.name,
    required this.price,
    this.quantity = 1,
    this.notes = "",
  });
}