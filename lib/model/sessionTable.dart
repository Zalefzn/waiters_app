class SessionTable {
  // late IdOrder idOrder;
  late int idSession;
  // late SessionStatus sessionStatus;

  SessionTable({
    // required this.idOrder,
    required this.idSession,
    // required this.sessionStatus,
  });

  SessionTable.fromJson(Map<String, dynamic> json) {
    // idOrder = IdOrder.fromJson(json["id_order"]);
    idSession = json["id_session_table"];
    // sessionStatus = SessionStatus.fromJson(json["session_table_status"]);
  }

  Map<String, dynamic> toJson() {
    return {
      // "id_order": idOrder,
      "id_session_table": idSession,
      // "session_table_status": sessionStatus.toJson(),
    };
  }
}
