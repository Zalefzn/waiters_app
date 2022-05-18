import 'package:flutter_mobile/api/moveTableApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/tableManagement.dart';

//provider move table
class MoveProvider with ChangeNotifier {
  Future<bool> moveCheck(List<TableManagement> table) async {
    try {
      if (await MoveCheck().moveCheck(table)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
