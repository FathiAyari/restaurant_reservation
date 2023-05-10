class Cusers {
  String uid;
  String name;
  String last_name;
  DateTime birth_date;
  DateTime sexe;
  DateTime student_card_number;
  String role;
  String cin;
  String email;

  Cusers({
    required this.uid,
    required this.name,
    required this.last_name,
    required this.birth_date,
    required this.sexe,
    required this.student_card_number,
    required this.email,
    required this.cin,
    required this.role,
  });

  factory Cusers.fromJson(Map<String, dynamic> json) {
    return Cusers(
      uid: json["uid"],
      name: json["name"],
      last_name: json["last_name"],
      birth_date: json["birth_date"].toDate(),
      sexe: json["sexe"],
      student_card_number: json["student_card_number"].toDate(),
      email: json["email"],
      role: json["role"],
      cin: json["cin"],
    );
  }
  Map<String, dynamic> Tojson() {
    return {
      "uid": uid,
      "userName": userName,
      "email": email,
      "role": role,
      "cin": cin,
    };
  }
}
