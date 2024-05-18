class ImageType {
  String image;
  bool hasPath;
  String? imageName;
  ImageType({
    this.imageName,
    this.hasPath = false,
    required this.image,
  });
}
