//model user
class UserServer {
  late int idCompany;
  late int idOutlet;
  late int idStaff;
  late int idStaffRole;
  late String staffEmail;
  late String staffName;
  late int staffNip;
  late String staffPin;
  late String staffUsername;
  late String updatedAt;

  UserServer({
    required this.idCompany,
    required this.idOutlet,
    required this.idStaff,
    required this.idStaffRole,
    required this.staffEmail,
    required this.staffName,
    required this.staffNip,
    required this.staffPin,
    required this.staffUsername,
    required this.updatedAt,
  });

  UserServer.fromJson(Map<String, dynamic> json) {
    idCompany = json['id_company'];
    idOutlet = json['id_outlet'];
    idStaff = json['id_staff'];
    idStaffRole = json['id_staff_role'];
    staffEmail = json['staff_email'];
    staffName = json['staff_name'];
    staffNip = json['staff_nip'];
    staffPin = json['staff_pin'];
    staffUsername = json['staff_username'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id_company': idCompany,
      'id_outlet': idOutlet,
      'id_staff': idStaff,
      'id_staff_role': idStaffRole,
      'staff_email': staffEmail,
      'staff_name': staffName,
      'staff_nip': staffNip,
      'staff_pin': staffPin,
      'staff_username': staffUsername,
      'updated_at': updatedAt,
    };
  }
}