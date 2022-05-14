import 'package:flutter/material.dart';
import 'package:flutter_mobile/api/sectionTable.dart';
import 'package:flutter_mobile/model/sectionTable.dart';

//provider section table
class SectionTable with ChangeNotifier {
  List<TableSection> _section = [];
  List<TableSection> get sections => _section;

  set sections(List<TableSection> _section) {
    notifyListeners();
  }

  Future<void> getSection() async {
    try {
      List<TableSection> sectionTab = await GetSection().getSection();
      print(sectionTab);
    } catch (e) {
      print(e);
    }
  }
}
