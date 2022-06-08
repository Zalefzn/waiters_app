//model table managamenet
import 'package:flutter_mobile/model/sessionTable.dart';

class TableManagement {
  late int idOutlet;
  late int idTable;
<<<<<<< HEAD
  late String tableName;
  SessionTable? session;
=======
  late SessionTable? session;
  late bool isParentMarge;
  late String tableName;
  late bool hasSession;
>>>>>>> 0d7d3c90a8c12261af61e9fdc9bfdd7a6fb40ff1

  TableManagement({
    required this.idOutlet,
    required this.idTable,
<<<<<<< HEAD
=======
    required this.isParentMarge,
>>>>>>> 0d7d3c90a8c12261af61e9fdc9bfdd7a6fb40ff1
    required this.tableName,
    required this.session,
  });

  TableManagement.fromJson(Map<String, dynamic> json) {
    idOutlet = json["id_outlet"];
    idTable = json["id_table_management"];
<<<<<<< HEAD
=======

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

>>>>>>> 0d7d3c90a8c12261af61e9fdc9bfdd7a6fb40ff1
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
<<<<<<< HEAD
=======
      "session_table": session?.toJson(),
      "is_parent_table": isParentMarge,
>>>>>>> 0d7d3c90a8c12261af61e9fdc9bfdd7a6fb40ff1
      "table_name": tableName,
      "session_table": session,
    };
  }
}
