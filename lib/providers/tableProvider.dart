import 'package:flutter/material.dart';
import 'package:flutter_mobile/api/tableApi.dart';
import 'package:flutter_mobile/model/tableManagement.dart';

//provider table management
class TableProviders with ChangeNotifier {
  List<TableManagement> _tables = [];
  List<TableManagement> get tables => _tables;
  
  set tables(List<TableManagement> tables) {
    notifyListeners();
  }

  Future<void> getTable() async {
    try {
      List<TableManagement> tables = await TableService().getTable();
      _tables = tables;
    } catch (e) {
      print(e);
    }
  }
}
