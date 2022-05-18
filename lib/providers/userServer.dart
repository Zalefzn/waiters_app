import 'package:flutter/material.dart';
import 'package:flutter_mobile/api/userServerApi.dart';
import 'package:flutter_mobile/model/UserServer.dart';

//provider user
class ProviderUser with ChangeNotifier {
  List<UserServer> _userServer = [];
  List<UserServer> get users => _userServer;

  set users(List<UserServer> _user) {
    notifyListeners();
  }

  Future<void> getUsers() async {
    try {
      List<UserServer> getServerName = await UserModelApi().getUser();
      print(getServerName);
    } catch (e) {
      print(e);
    }
  }
}
