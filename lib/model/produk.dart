class DataProduct {
  late int productId;
  late int idoutlet;
  late int idepart;
  late String nameProduct;
  late String hargaProduct;
  late String gambarProduct;
  late String gambarUrl;
  late int quantity;
  late int idProCategory;

  DataProduct({
    required this.productId,
    required this.idoutlet,
    required this.idepart,
    required this.nameProduct,
    required this.hargaProduct,
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
    hargaProduct = json["product_price"];
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
      'product_price': hargaProduct,
      'image': gambarProduct,
      'image_url': gambarUrl,
      'quantity_status': quantity,
      'id_product_category': idProCategory,
    };
  }
}

class CartModel {
  late int id;
  late DataProduct product;
  late int quantity;

  CartModel({required this.id, required this.product, required this.quantity});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json["id_product"];
    product = DataProduct.fromJson(json['product']);
    var quantity = "";
    if (json['quantity'] != null) {
      quantity = json['quantity'];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id_product': id,
      'quantity': quantity,
      'product': product.toJson(),
    };
  }

  totalPrice() {
    return product.hargaProduct * quantity;
  }
}

class ProductCategory {
  late String categoryName;
  late int idDepartement;
  late int idOutlet;
  late int idCategory;
  late DataProduct product;

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

class ModelUser {
  late int idCompany;
  late int idOutlet;
  late int idStaff;
  late int idStaffRole;
  late String staffEmail;
  late String staffName;
  late int staffNip;
  late String staffPin;
  late String staffUsername;
  late String updatedAt;

  ModelUser({
    required this.idCompany,
    required this.idOutlet,
    required this.idStaff,
    required this.idStaffRole,
    required this.staffEmail,
    required this.staffName,
    required this.staffNip,
    required this.staffPin,
    required this.staffUsername,
    required this.updatedAt,
  });

  ModelUser.fromJson(Map<String, dynamic> json) {
    idCompany = json['id_company'];
    idOutlet = json['id_outlet'];
    idStaff = json['id_staff'];
    idStaffRole = json['id_staff_role'];
    staffEmail = json['staff_email'];
    staffName = json['staff_name'];
    staffNip = json['staff_nip'];
    staffPin = json['staff_pin'];
    staffUsername = json['staff_username'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id_company': idCompany,
      'id_outlet': idOutlet,
      'id_staff': idStaff,
      'id_staff_role': idStaffRole,
      'staff_email': staffEmail,
      'staff_name': staffName,
      'staff_nip': staffNip,
      'staff_pin': staffPin,
      'staff_username': staffUsername,
      'updated_at': updatedAt,
    };
  }
}

class Customer {
  late String name;
  late String count;

  Customer({required this.name, required this.count});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "count": count,
    };
  }
}
