class SessionTable {
  late int idSession;

  SessionTable({
    required this.idSession,
  });

  SessionTable.fromJson(Map<String, dynamic> json) {
    idSession = json["id_session_table"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id_session_table": idSession,
    };
  }
}
