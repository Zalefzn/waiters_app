import 'package:flutter/material.dart';
import 'package:flutter_mobile/api/authService.dart';
import 'package:flutter_mobile/model/tokenModel.dart';

class AuthProviders with ChangeNotifier {
  late ModelToken _pin;

  ModelToken get pin => _pin;
  set pin(ModelToken pin) {
    _pin = pin;
    notifyListeners();
  }

  Future<bool> login({
    required String pin,
  }) async {
    try {
      ModelToken basePin = await AuthService().login(pin: pin);
      _pin = basePin;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
