//model category product
class ProductCategory {
  late String categoryName;
  late int idDepartement;
  late int idOutlet;
  late int idCategory;

  ProductCategory({
    required this.categoryName,
    required this.idDepartement,
    required this.idOutlet,
    required this.idCategory,
  });

  ProductCategory.fromJson(Map<String, dynamic> json) {
    categoryName = json["category_name"];
    idDepartement = json["id_department"];
    idOutlet = json["id_outlet"];
    idCategory = json["id_product_category"];
  }

  Map<String, dynamic> toJson() {
    return {
      "category_name": categoryName,
      "id_department": idDepartement,
      "id_outlet": idOutlet,
      "id_product_category": idCategory,
    };
  }
}
