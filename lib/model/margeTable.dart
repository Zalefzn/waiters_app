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
