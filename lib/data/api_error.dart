enum ErrorType {
  unknown,
  invalidCredentials,
  unAuthorized,
  invalidTokens,
  missingParameters,
  invalidParameters,
  notFound,
  referenceError
}

class ApiError implements Exception {
  final String code;
  late final ErrorType type;
  late String displayMessage;
  List<String>? attributes;

  ApiError({required this.code, message}) {
    if (code == 'invalid-credentials') {
      type = ErrorType.invalidCredentials;
      displayMessage = message.toString();
    } else if (code == 'unauthorized') {
      displayMessage = message.toString();
      type = ErrorType.unAuthorized;
    } else if (code == 'missing-parameters') {
      displayMessage = (message?.split(',') ?? [])
          .map((param) => '$param is required')
          .join('\n');
      type = ErrorType.missingParameters;
    } else if (code == 'invalid-parameters') {
      displayMessage = message.toString();
      type = ErrorType.invalidParameters;
    } else if (code == 'not-found') {
      displayMessage = message.toString();
      type = ErrorType.notFound;
    } else if (code == 'invalid-tokens') {
      displayMessage = message.toString();
      type = ErrorType.invalidTokens;
    } else if (code == 'reference-error') {
      displayMessage = message.toString();
      type = ErrorType.referenceError;
    } else {
      displayMessage = message.toString();
      type = ErrorType.unknown;
    }
  }

  @override
  String toString() {
    return displayMessage;
  }
}
