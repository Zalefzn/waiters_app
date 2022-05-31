//model table managamenet
class TableManagement {
  late int idOutlet;
  late int idTable;
  bool? isParentMarge;
  late String tableName;

  TableManagement({
    required this.idOutlet,
    required this.idTable,
    required this.isParentMarge,
    required this.tableName,
  });

  TableManagement.fromJson(Map<String, dynamic> json) {
    idOutlet = json["id_outlet"];
    idTable = json["id_table_management"];
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
      "is_parent_table": isParentMarge,
      "table_name": tableName,
    };
  }
}
