//model table managamenet
import 'package:flutter_mobile/model/sessionTable.dart';

class TableManagement {
  late int idOutlet;
  late int idTable;
  late SessionTable? session;
  late bool isParentMarge;
  late String tableName;
  late bool hasSession;

  TableManagement({
    required this.idOutlet,
    required this.idTable,
    required this.isParentMarge,
    required this.tableName,
  });

  TableManagement.fromJson(Map<String, dynamic> json) {
    idOutlet = json["id_outlet"];
    idTable = json["id_table_management"];

    print("Getting table data ...");
    print(json["session_table"]);

    if (json["session_table"] != null) {
      session = SessionTable.fromJson(json["session_table"]);
      hasSession = true;
    } else {
      hasSession = false;
      session = null;
    }

    if (json["is_parent_table"] != null) {
      isParentMarge = json["is_parent_table"];
    }

    tableName = json["table_name"];
  }
  Map<String, dynamic> toJson() {
    return {
      "id_outlet": idOutlet,
      "id_table_management": idTable,
      "session_table": session?.toJson(),
      "is_parent_table": isParentMarge,
      "table_name": tableName,
    };
  }
}
