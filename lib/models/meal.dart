class Meal {
  String entree;
  String principal;
  String dessert;
  DateTime start;
  DateTime end;
  List students;

  Meal({
    required this.entree,
    required this.principal,
    required this.dessert,
    required this.start,
    required this.end,
    required this.students,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      entree: json['entree'],
      principal: json['principal'],
      dessert: json['dessert'],
      students: json['students'],
      start: json['start'].toDate(),
      end: json['end'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'entree': entree,
      'principal': principal,
      'dessert': dessert,
      'start': start,
      'end': end,
      'students': students,
    };
  }
}
