import 'package:flutter_mobile/api/margedTableApi.dart';
import 'package:flutter_mobile/api/moveTableApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/tableManagement.dart';

//provider marge table
class MargeProviders with ChangeNotifier {
  Future<bool> margeCheck(List<TableManagement> table) async {
    try {
      if (await MargeCheck().margeCheck(table)) {
        return true;
      } else {
        return false;
      }
    } catch (d) {
      print(d);
      return false;
    }
  }
}
