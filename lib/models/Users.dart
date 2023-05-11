class Cusers {
  String? uid;
  String name;
  String last_name;
  DateTime birth_date;
  String sexe;
  String student_card_number;
  String role;
  String cin;
  String email;
  String? password;
  List<dynamic>? tickets;

  Cusers({
    this.uid,
    required this.name,
    required this.last_name,
    required this.birth_date,
    required this.sexe,
    required this.student_card_number,
    required this.email,
    required this.cin,
    required this.role,
    this.password,
    this.tickets,
  });

  factory Cusers.fromJson(Map<String, dynamic> json) {
    return Cusers(
      uid: json["uid"],
      name: json["name"],
      last_name: json["last_name"],
      birth_date: json["birth_date"].toDate(),
      sexe: json["sexe"],
      student_card_number: json["student_card_number"],
      email: json["email"],
      role: json["role"],
      cin: json["cin"],
      tickets: json["tickets"],
    );
  }
  Map<String, dynamic> Tojson(String id) {
    return {
      "uid": id,
      "name": name,
      "sexe": sexe,
      "student_card_number": student_card_number,
      "birth_date": birth_date,
      "last_name": last_name,
      "email": email,
      "role": role,
      "cin": cin,
      "password": password,
      "tickets": [],
    };
  }
}
