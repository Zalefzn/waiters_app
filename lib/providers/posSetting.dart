import 'package:flutter/material.dart';
import 'package:flutter_mobile/api/posSettingApi.dart';
import 'package:flutter_mobile/model/posSetting.dart';

//provider pos setting
class PosProviders with ChangeNotifier {
  List<PosSettingData> _pos = [];
  List<PosSettingData> get pos => _pos;

  set pos(List<PosSettingData> poses) {
    notifyListeners();
  }

  Future<void> getPos() async {
    try {
      List<PosSettingData> poses = await PosSettings().posSettings();
      _pos = poses;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUserPos() async {}
}
