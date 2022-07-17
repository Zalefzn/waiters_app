import 'margeTable.dart';

class SessionTable {
  late int sessionTable;
  late bool isAccessed;
  late MargedTable margeTable;
  late int orderId;

  SessionTable({
    required this.sessionTable,
    required this.isAccessed,
    required this.margeTable,
    required this.orderId,
  });

  SessionTable.fromJson(Map<String, dynamic> json) {
    sessionTable = json["id_session_table"];
    isAccessed = json["is_accessed"];

    if (json["marged_table"] != null) {
      margeTable = MargedTable.fromJson(json["marged_table"]);
    }

    if (json["id_order"] != null) {
      orderId = json["id_order"]["id_order"];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id_session_table": sessionTable,
      "is_accessed": isAccessed,
      "marged_table": margeTable,
      "id_order": orderId,
    };
  }
}
