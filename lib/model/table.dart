class TableManagement {
  late int idOutlet;
  late int idTable;
  late String tableName;

  TableManagement({
    required this.idOutlet,
    required this.idTable,
    required this.tableName,
  });

  TableManagement.fromJson(Map<String, dynamic> json) {
    idOutlet = json["id_outlet"];
    idTable = json["id_table_management"];

    tableName = json["table_name"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id_outlet": idOutlet,
      "id_table_management": idTable,
      "table_name": tableName,
    };
  }
}

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
    createdAt = json["created_at"];
    idOutlet = json["id_outlet"];
    idSection = json["id_section"];
    sectionName = json["section_name"];
    updatedAt = json["updated_at"];
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

class Section {
  late int idOutlet;
  late int idSection;
  late String nameSection;

  Section({
    required this.idOutlet,
    required this.idSection,
    required this.nameSection,
  });

  Section.fromJson(Map<String, dynamic> json) {
    idOutlet = json['id_outlet'];
    idSection = json['id_section'];
    nameSection = json['section_name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id_outlet': idOutlet,
      'id_section': idSection,
      'section_name': nameSection,
    };
  }
}

class SessionTable {
  late int idOrder;
  late int sessionTable;
  late int isAccessed;

  SessionTable({
    required this.idOrder,
    required this.isAccessed,
    required this.sessionTable,
  });

  SessionTable.fromJson(Map<String, dynamic> json) {
    idOrder = json["id_order"];
    sessionTable = json["id_session_table"];
    isAccessed = json["is_accessed"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id_order": idOrder,
      "id_session_table": sessionTable,
      "is_accessed": isAccessed,
    };
  }
}
