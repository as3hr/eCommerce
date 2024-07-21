import '../helpers/functions/parse_json_to_object.dart';
import 'user.dart';

class Chat {
  String? id;
  DateTime? adminLastSeen;
  DateTime? userLastSeen;
  User? user;
  Chat({
    this.user,
    this.id,
    this.adminLastSeen,
    this.userLastSeen,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['_id'],
      user: parseJsonToObject(json['user'], User.fromJson),
      adminLastSeen: DateTime.tryParse(json['adminLastSeen'] ?? ''),
      userLastSeen: DateTime.tryParse(json['userLastSeen'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
    };
  }
}
