Map<String, dynamic> getCommonValues({
  required Map<String, dynamic> map1,
  required Map<String, dynamic> map2,
}) {
  Map<String, dynamic> result = {};
  for (var key in map1.keys) {
    if (map2.containsKey(key) && map1[key] != null) {
      result[key] = map1[key];
    }
  }
  return result;
}
