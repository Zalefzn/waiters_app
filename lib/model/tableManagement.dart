//model table managamenet
import 'package:flutter_mobile/model/sessionTable.dart';

class TableManagement {
  late int idOutlet;
  late int idTable;
  late String tableName;
  SessionTable? session;

  TableManagement({
    required this.idOutlet,
    required this.idTable,
    required this.tableName,
    required this.session,
  });

  TableManagement.fromJson(Map<String, dynamic> json) {
    idOutlet = json["id_outlet"];
    idTable = json["id_table_management"];
    tableName = json["table_name"];
    var session;
    if (json['session_table'] != null) {
      session = SessionTable.fromJson(json['session_table']);
    }
  }
  Map<String, dynamic> toJson() {
    return {
      "id_outlet": idOutlet,
      "id_table_management": idTable,
      "table_name": tableName,
      "session_table": session,
    };
  }
}
