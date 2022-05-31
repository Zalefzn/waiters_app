// import 'package:flutter_mobile/model/idOrder.dart';
// import 'package:flutter_mobile/model/sessionStatus.dart';
// import 'package:flutter_mobile/model/tableManagement.dart';

// class SessionTableManage {
//   IdOrder? idOrder;
//   late int idSessionTable;
//   TableManagement? table;
//   late bool isAccessed;
//   SessionStatus? status;

//   SessionTableManage({
//     required this.idOrder,
//     required this.idSessionTable,
//     required this.isAccessed,
//     required this.status,
//     required this.table,
//   });

//   SessionTableManage.fromJson(Map<String, dynamic> json) {
//     var idOrder;
//     if (idOrder != null) {
//       idOrder = IdOrder.fromJson(json["id_order"]);
//     }
//     idSessionTable = json["id_session_table"];
//     var table;
//     if (table != null) {
//       table = TableManagement.fromJson(json["id_table_management"]);
//     }
//     isAccessed = json["is_accessed"];
//     var status;
//     if (status != null) {
//       status = SessionStatus.fromJson(json["session_table_status"]);
//     }
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "id_order": idOrder?.toJson(),
//       "id_session_table": idOrder,
//       "id_table_management": table?.toJson(),
//       "is_accessed": isAccessed,
//       "session_table_status": status?.toJson(),
//     };
//   }
// }
