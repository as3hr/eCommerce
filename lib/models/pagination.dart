import 'data/api_helpers.dart';

class Pagination<T> {
  int totalPages;
  int limit;
  int totalCount;
  int currentPage;
  int count;
  List<T> data;
  Pagination({
    this.count = 0,
    this.data = const [],
    this.currentPage = 0,
    this.limit = 0,
    this.totalCount = 0,
    this.totalPages = 0,
  });
  factory Pagination.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) dataFromJson,
  ) {
    return Pagination<T>(
      count: json['count'],
      limit: json['limit'],
      totalCount: json['totalCount'],
      totalPages: json['totalPages'],
      currentPage: json['currentPage'],
      data: json['data'] is List && json['data'] != null
          ? ApiHelpers.parseList(json['data'], dataFromJson)
          : [],
    );
  }
}
