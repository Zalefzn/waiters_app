//pos setting

class PosSettingData {
  late String nameOutlate;

  PosSettingData({
    required this.nameOutlate,
  });

  PosSettingData.fromJson(Map<String, dynamic> json) {
    nameOutlate = json['outlate_name'];
  }

  Map<String, dynamic> toJson() {
    return {
      "outlate_name": nameOutlate,
    };
  }
}
