class ModelToken {
  late int pin;
  late String token;

  ModelToken({required this.pin, required this.token});

  ModelToken.fromJson(Map<String, dynamic> json) {
    pin = json["pin"];
    token = json["access_token"];
  }

  Map<String, dynamic> toJson() {
    return {
      "pin": pin,
      "access_token": token,
    };
  }
}
