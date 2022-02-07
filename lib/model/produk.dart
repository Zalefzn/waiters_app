import 'dart:convert';

List<Item> itemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Item({
    required this.product_name,
    required this.id_product,
    required this.product_price,
    required this.image,
    required this.image_url,
  });

  final String product_name;
  final String id_product;
  final String product_price;
  final String image;
  final String image_url;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        product_name:
            json["product_name"] == null ? null : json["product_name"],
        id_product: json["id_product"] == null ? null : json["id_product"],
        product_price:
            json["product_price"] == null ? null : json["product_price"],
        image: json["image"] == null ? null : json["image"]["url"],
        image_url: json["image_url"] == null ? null : json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": product_name == null ? null : product_name,
        "id_product": id_product == null ? null : id_product,
        "product_name": product_name == null ? null : product_name,
        "image": image == null ? null : image,
        "image_url": image_url == null ? null : image_url,
      };
}
