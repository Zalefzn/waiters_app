import 'margeTable.dart';

class SessionTable {
  late int sessionTable;
  late bool isAccessed;
  late MargedTable margeTable;
  late int orderId;
  // late IdOrder idOrder;
  late int idSession;

  SessionTable({
    required this.idSession,
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
    // idOrder = IdOrder.fromJson(json["id_order"]);
    idSession = json["id_session_table"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id_session_table": idSession,
    };
  }
}
