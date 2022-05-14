import 'package:flutter/material.dart';
import 'package:flutter_mobile/api/authService.dart';
import 'package:flutter_mobile/model/class_model_token.dart';

//provider Auth service
class AuthProviders with ChangeNotifier {
  late ModelToken _pin;

  ModelToken get pin => _pin;
  set pin(ModelToken pin) {
    pin = _pin;
    notifyListeners();
  }

  Future<bool> login({
    required pin,
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
