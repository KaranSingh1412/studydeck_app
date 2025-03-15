class InitializationException<T> implements Exception {
  @override
  String toString() {
    return "${T.toString()} instance was not initialized";
  }
}

class LoginStateException implements Exception {
  final String message;

  LoginStateException(this.message);

  @override
  String toString() {
    return message;
  }
}

class RequestException implements Exception {
  String message;
  String? status;
  String? endpoint;

  RequestException(this.message, {this.status, this.endpoint});

  @override
  String toString() {
    return message;
  }
}
