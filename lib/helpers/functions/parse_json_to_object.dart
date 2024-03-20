T? parseJsonToObject<T>(data, T Function(Map<String, dynamic>) fromJson) {
  if (data == null) {
    return data;
  } else if (data is Map<String, dynamic>) {
    return fromJson(data);
  } else {
    return fromJson({'_id': data.toString()});
  }
}

double parseValToDouble(val, {int digits = 2}) {
  return double.parse(
    (val?.toDouble() ?? 0.0).toStringAsFixed(digits),
  );
}
