class Historic {
  String subject;
  DateTime dateTime;

  Historic({
    required this.subject,
    required this.dateTime,
  });

  factory Historic.fromJson(Map<String, dynamic> json) {
    return Historic(
      subject: json['subject'],
      dateTime: json['dateTime'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'dateTime': dateTime,
    };
  }
}
