//pos setting
class SettingPos {
  late String outletName;

  SettingPos({
    required this.outletName,
  });

  SettingPos.fromJson(Map<String, dynamic> json) {
    outletName = json["outlet_name"];
  }

  Map<String, dynamic> toJson() {
    return {
      "outlet_name": outletName,
    };
  }
}
