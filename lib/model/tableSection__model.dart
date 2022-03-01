class TableSection {
  late String createdAt;
  late int idOutlet;
  late int idSection;
  late String sectionName;
  late String updatedAt;

  TableSection({
    required this.createdAt,
    required this.idOutlet,
    required this.idSection,
    required this.sectionName,
    required this.updatedAt,
  });

  TableSection.fromJson(Map<String, dynamic> json) {
    createdAt = json["created_at"];
    idOutlet = json["id_outlet"];
    idSection = json["id_section"];
    sectionName = json["section_name"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    return {
      "created_at": createdAt,
      "id_outlet": idOutlet,
      "id_section": idSection,
      "section_name": sectionName,
      "updated_at": updatedAt,
    };
  }
}
