// import 'dart:typed_data';
// import 'package:file_picker/file_picker.dart';
// import 'package:get/get.dart';

// class ImageController {
//   final _fileResult = Rx<FilePickerResult?>(null);
//   final Rx<String?> _imageUrl;

//   ImageController({String? imageUrl}) : _imageUrl = Rx<String?>(imageUrl);

//   FilePickerResult? get fileResult => _fileResult.value;

//   set fileResult(FilePickerResult? value) {
//     _fileResult.value = value;
//   }

//   String? get imageUrl => _imageUrl.value;

//   set imageUrl(String? value) {
//     _imageUrl.value = value;
//   }

//   Uint8List? get file {
//     if (_fileResult.value != null && _fileResult.value!.count >= 1) {
//       return _fileResult.value!.files.first.bytes;
//     }
//     return null;
//   }

//   Future<void> pickImage() async {
//     final result = await FilePicker.platform
//         .pickFiles(type: FileType.image, allowCompression: true);
//     if (result != null) {
//       fileResult = result;
//     }
//   }

//   Future<String?> uploadFile() async {
//     if (file != null) {}
//     return null;
//   }
// }
