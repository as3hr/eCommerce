class Notification {
  String? id;
  String? title;
  String? description;
  DateTime? date;

  Notification({
    this.id,
    this.description,
    this.date,
    this.title,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
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
