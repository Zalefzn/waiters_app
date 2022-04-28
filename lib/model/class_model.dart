//model token
class ModelToken {
  late int pin;
  late String token;

  ModelToken({required this.pin, required this.token});

  ModelToken.fromJson(Map<String, dynamic> json) {
    pin = json["pin"];
    token = json["access_token"];
  }

  Map<String, dynamic> toJson() {
    return {
      "pin": pin,
      "access_token": token,
    };
  }
}

//model product data
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

//model cart product
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
}

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

//pos setting
class PosSetting {
  late String outletName;
  late String privateKey;
  late int productSearchName;

  PosSetting({
    required this.outletName,
    required this.privateKey,
    required this.productSearchName,
  });

  PosSetting.fromJson(Map<String, dynamic> json) {
    outletName = json["outlet_name"];
    privateKey = json["private_key"];
    productSearchName = json["product_searchbyname"];
  }

  Map<String, dynamic> toJson() {
    return {
      "outlet_name": outletName,
      "private_key": privateKey,
      "product_searchbyname": productSearchName,
    };
  }
}

//model user
class UserServer {
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

  UserServer({
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

  UserServer.fromJson(Map<String, dynamic> json) {
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

//model table managamenet
class TableManagement {
  late int idOutlet;
  late int idTable;
  late SessionTable session;
  late bool isParentMarge;
  late String tableName;

  TableManagement({
    required this.idOutlet,
    required this.idTable,
    required this.session,
    required this.isParentMarge,
    required this.tableName,
  });

  TableManagement.fromJson(Map<String, dynamic> json) {
    idOutlet = json["id_outlet"];
    idTable = json["id_table_management"];
    var session;
    if (json["session_table"] != null) {
      session = SessionTable.fromJson(json["session_table"]);
    }

    var isParentMarge;
    if (json["is_parent_table"] != null) {
      isParentMarge = json["is_parent_table"];
    }

    tableName = json["table_name"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id_outlet": idOutlet,
      "id_table_management": idTable,
      "session_table": session.toJson(),
      "is_parent_table": isParentMarge,
      "table_name": tableName,
    };
  }
}

//model section table
class TableSection {
  late String createdAt;
  late int idOutlet;
  late int idSection;
  late String sectionName;
  late String updatedAt;

  TableSection({
    required this.createdAt,
    required this.idOutlet,
    required this.idSection,
    required this.sectionName,
    required this.updatedAt,
  });

  TableSection.fromJson(Map<String, dynamic> json) {
    var createdAt;
    if (json["created_At"] != null) {
      createdAt = json["created_at"];
    }

    idOutlet = json["id_outlet"];
    idSection = json["id_section"];
    sectionName = json["section_name"];
    var updatedAt;
    if (json["updated_at"] != null) {
      updatedAt = json["updated_at"];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "created_at": createdAt,
      "id_outlet": idOutlet,
      "id_section": idSection,
      "section_name": sectionName,
      "updated_at": updatedAt,
    };
  }
}

//model session table
class SessionTable {
  late int sessionTable;
  late bool isAccessed;
  late MargedTable margeTable;

  SessionTable({
    required this.isAccessed,
    required this.sessionTable,
    required this.margeTable,
  });

  SessionTable.fromJson(Map<String, dynamic> json) {
    sessionTable = json["id_session_table"];
    isAccessed = json["is_accessed"];
    var margeTable;
    if (json["marged_table"] != null) {
      margeTable = MargedTable.fromJson(json["marged_table"]);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id_session_table": sessionTable,
      "is_accessed": isAccessed,
      'marged_table': margeTable.toJson(),
    };
  }
}

//model margeTable
class MargedTable {
  late int idOutlet;
  late int idTableManage;
  late bool isParentTable;

  MargedTable({
    required this.idOutlet,
    required this.idTableManage,
    required this.isParentTable,
  });

  MargedTable.fromJson(Map<String, dynamic> json) {
    idOutlet = json["id_outlet"];
    idTableManage = json["id_table_management"];
    isParentTable = json["is_parent_table"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id_outlet": idOutlet,
      "id_table_management": idTableManage,
      "is_parent-table": isParentTable,
    };
  }
}

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
