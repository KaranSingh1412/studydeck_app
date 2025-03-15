import 'package:dio/dio.dart' as dio;

class Authenticator {
  final String? token;

  Authenticator({this.token});

  Future<void> authenticate(dio.Options options) async {
    options.headers ??= {};
    options.headers?["Authorization"] = "Bearer $token";
  }
}
