//model table managamenet
import 'package:flutter_mobile/model/sessionTable.dart';

class TableManagement {
  late int idOutlet;
  late int idTable;
  late SessionTable? sessionTable;
  bool? isParentMarge;
  late String tableName;

  TableManagement({
    required this.idOutlet,
    required this.idTable,
    required this.sessionTable,
    required this.isParentMarge,
    required this.tableName,
  });

  TableManagement.fromJson(Map<String, dynamic> json) {
    idOutlet = json["id_outlet"];
    idTable = json["id_table_management"];
    var sessionTable;
    if (json["session_table"] != null) {
      sessionTable = SessionTable.fromJson(json["session_table"]);
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
      "session_table": sessionTable?.toJson(),
      "is_parent_table": isParentMarge,
      "table_name": tableName,
    };
  }
}
