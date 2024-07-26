class ImageType {
  String image;
  bool hasPath;
  String? imageName;
  List<int> bytes;
  String? mimeType;
  ImageType({
    this.mimeType,
    this.imageName,
    this.bytes = const [],
    this.hasPath = false,
    required this.image,
  });
}
