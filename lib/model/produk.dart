class Produk {
  int id_product;
  String product_name;
  String product_price;
  String image;
  String image_url;

  Produk({
    required this.id_product,
    required this.product_name,
    required this.product_price,
    required this.image,
    required this.image_url,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id_product: json['id_product'] as int,
      product_name: json['product_name'] as String,
      product_price: json['product_price'] as String,
      image: json['image'] as String,
      image_url: json['image_url'] as String,
    );
  }
}
