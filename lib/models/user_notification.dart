class UserNotification {
  String? id;
  String? title;
  String? description;
  DateTime? date;

  UserNotification({
    this.id,
    this.description,
    this.date,
    this.title,
  });

  factory UserNotification.fromJson(Map<String, dynamic> json) {
    return UserNotification(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.tryParse(json['date'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'date': date?.toIso8601String(),
    };
  }
}
