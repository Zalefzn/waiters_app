//model session table
import 'package:flutter_mobile/model/margeTable.dart';

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
