enum ErrorType { invalidCredentials, invalidTokens, missingAttributes, unknown }

class ApiError implements Exception {
  final int statusCode;
  late final ErrorType type;
  final String? errorCode;
  late dynamic displayMessage;
  List<String>? attributes;

  ApiError({required this.statusCode, this.errorCode, this.displayMessage}) {
    if (errorCode == 'invalid-credentials') {
      type = ErrorType.invalidCredentials;
    } else if (errorCode == 'invalid-tokens') {
      type = ErrorType.invalidTokens;
    } else {
      type = ErrorType.unknown;
    }
  }

  @override
  String toString() {
    return displayMessage.toString();
  }
}
