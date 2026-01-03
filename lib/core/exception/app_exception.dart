class AppException implements Exception {
  final _message;

  AppException([this._message]);

  @override
  String toString() {
    return '$_message';
  }
}

class NoInternetException extends AppException {
  NoInternetException([String? super.message]);
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([String? super.message]);
}
