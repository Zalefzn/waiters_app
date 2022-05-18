class TransactionProduct {
  late String name;
  late double price;
  late int quantity;
  late String notes;
  late int? id;
  late int productId;

  TransactionProduct({
    required this.name,
    required this.price,
    required this.productId,
    this.quantity = 1,
    this.notes = "",
    this.id,
  });

  totalPrice() {
    return price * quantity;
  }
}
