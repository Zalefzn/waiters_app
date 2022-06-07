class SessionStatus {
  late int idSessionStatus;
  late String name;

  SessionStatus({
    required this.idSessionStatus,
    required this.name,
  });

  SessionStatus.fromJson(Map<String, dynamic> json) {
    idSessionStatus = json["id_session_table_status"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id_session_table_status": idSessionStatus,
      "name": name,
    };
  }
}
