import 'package:flutter/material.dart';
import 'package:flutter_mobile/api/posSetting.dart';
import 'package:flutter_mobile/model/posSetting.dart';

//provider pos setting
class PosProviders with ChangeNotifier {
  List<SettingPos> _pos = [];
  List<SettingPos> get pos => _pos;

  set pos(List<SettingPos> poses) {
    notifyListeners();
  }

  Future<void> getPos() async {
    try {
      List<SettingPos> poses = await PosSettings().posSettings();
      _pos = poses;
    } catch (e) {
      print(e);
    }
  }
}
