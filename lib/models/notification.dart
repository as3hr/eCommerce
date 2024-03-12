class NotificationModel {
  String? id;
  String? title;
  String? description;
  DateTime? date;

  NotificationModel({
    this.id,
    this.description,
    this.date,
    this.title,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
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
