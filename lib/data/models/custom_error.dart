import '../services/utils/exceptions.dart';

class CustomError implements Exception {
  String message;
  String errorStatus;
  String endpointPath;

  CustomError({
    required this.message,
    required this.errorStatus,
    required this.endpointPath,
  });

  factory CustomError.fromJson(Map<String, dynamic> data) {
    return CustomError(
      errorStatus: data['status'],
      message: data['message'] ?? 'your plan is invalid',
      endpointPath: data['endpoint'] ?? '',
    );
  }

  Object get getErrorType {
    switch (errorStatus) {
      case 'auth_error':
        return LoginStateException(message);
      default:
        return RequestException(message,
            endpoint: endpointPath, status: errorStatus);
    }
  }

  @override
  String toString() {
    return message;
  }
}
