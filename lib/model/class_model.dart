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
