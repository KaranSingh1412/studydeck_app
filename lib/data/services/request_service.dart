import 'dart:convert';

import 'package:studydeck_app/data/models/flashcard.dart';
import 'package:studydeck_app/data/models/flashcard_set.dart';

import '../models/custom_error.dart';
import '../models/user_model.dart';
import '../models/user_session_model.dart';
import './utils/internal/authenticator.dart';
import 'package:dio/dio.dart' as dio;

class RequestService {
  final endpoint = 'https://api.studydeck.de';
  final _dio = dio.Dio();

  RequestService() {
    _dio.options.baseUrl = endpoint;
    _dio.options.contentType = "application/json";
    _dio.options.validateStatus = (status) => true;
  }

  dio.Dio get getClient => _dio;

  /* ===================
   * AUTH SECTION
   * ===================
   */

  Future<String> createUser(
    String name,
    String email,
    String password,
  ) async {
    final requestBody = {
      'name': name,
      'email': email,
      'password': password,
    };
    final responseBody = await _request('POST', '/user', body: requestBody);
    return responseBody['session_token'];
  }

  Future<String> openNewSession(String email, String password) async {
    final requestBody = {
      'email': email,
      'password': password,
    };
    final responseBody = await _request('POST', '/session', body: requestBody);
    return responseBody['session_token'];
  }

  Future<bool> deleteSession(Authenticator auth) async {
    final responseBody = await _request('DELETE', '/session', auth: auth);
    return responseBody['status'] == 'success';
  }

  Future<UserSession> getCurrentSession(Authenticator auth,
      {String? deviceToken}) async {
    final responseBody = await _request(
        'GET', '/session?user_device_id=$deviceToken',
        auth: auth);
    final session = responseBody['session'];
    return UserSession.fromMap(session);
  }

  /* ===================
   * USER SECTION
   * ===================
   */

  Future<User?> getUserInfo(Authenticator auth) async {
    final res = await _request('GET', '/user', auth: auth);
    final user = res['user'];
    return User.fromMap(user);
  }

  Future<User> getUserInfoByHandle(Authenticator auth, String handle) async {
    final res = await _request('GET', '/user?handle=$handle', auth: auth);
    final user = res['user'] as Map<String, dynamic>;
    return User.fromMap(user);
  }

  Future<User> getUserInfoById(Authenticator auth, String userId) async {
    final res = await _request('GET', '/user?id=$userId', auth: auth);
    final user = res['user'] as Map<String, dynamic>;
    return User.fromMap(user);
  }

  Future<bool> deleteAccount(
      Authenticator auth, String email, String password) async {
    final requestBody = {
      'email': email,
      'password': password,
    };
    final responseBody =
        await _request('DELETE', '/user', auth: auth, body: requestBody);
    final responseStatus = responseBody['status'] as String;
    return responseStatus != 'success';
  }

  /* ===================
   * UPDATE USER SECTION
   * ===================
   */

  Future<User?> updateUser(
    Authenticator auth, {
    String? name,
    String? handle,
    String? description,
    String? imageUrl,
    String? email,
  }) async {
    Map<String, String?> body = {
      if (name != null) "name": name,
      if (handle != null) "handle": handle,
      if (description != null) "description": description,
      if (imageUrl != null) "image": imageUrl,
      if (email != null) "email": email,
    };
    final res = await _request('PUT', '/user', auth: auth, body: body);
    final user = res['user'];
    if (user != null) {
      return User.fromMap(user);
    }
    return null;
  }

  Future<bool> resetPassword(Authenticator auth) async {
    final response = await _request(
      'POST',
      '/user/password',
      auth: auth,
    );
    return response['status'] == 'success';
  }

  Future<bool> forgotPassword({required String email}) async {
    final requestBody = {
      'email': email,
    };
    final response =
        await _request('POST', '/user/password', body: requestBody);
    return response['status'] == 'success';
  }

  /* ===================
   * FLASHCARDS SECTION
   * ===================
   */

  Future<FlashcardSet?> getFlashcardSet(Authenticator auth, int setId) async {
    final res = await _request('GET', '/cardset?id=$setId', auth: auth);
    final flashcardSet = res['cardset'];
    return FlashcardSet.fromJson(flashcardSet);
  }

  Future<List<FlashcardSet>> getFlashcardSets(Authenticator auth) async {
    final res = await _request('GET', '/user/cardsets', auth: auth);
    final flashcardSets = res['cardsets'];
    return [for (var set in flashcardSets) FlashcardSet.fromJson(set)];
  }

  Future<FlashcardSet> createFlashcardSet(
    Authenticator auth,
    String title,
    String description,
  ) async {
    final requestBody = {
      'name': title,
      'description': description,
    };
    final res =
        await _request('POST', '/cardset', auth: auth, body: requestBody);
    final flashcardSet = res['card_set'];
    return FlashcardSet.fromJson(flashcardSet);
  }

  Future<bool> deleteFlashcardSet(Authenticator auth, int setId) async {
    final res = await _request('DELETE', '/cardset?id=$setId', auth: auth);
    return res['status'] == 'success';
  }

  Future<FlashcardSet> updateFlashcardSet(
    Authenticator auth,
    int setId, {
    String? title,
    String? description,
  }) async {
    Map<String, String?> body = {
      if (title != null) "name": title,
      if (description != null) "description": description,
    };
    final res = await _request(
      'PUT',
      '/cardset?id=$setId',
      auth: auth,
      body: body,
    );
    final flashcardSet = res['card_set'];
    return FlashcardSet.fromJson(flashcardSet);
  }

  Future<Flashcard?> addFlashcard(
    Authenticator auth,
    int setId, {
    required String question,
    required String answer,
  }) async {
    final requestBody = {
      'set_id': setId,
      'front': question,
      'back': answer,
      'icon': 1,
    };
    final res = await _request(
      'POST',
      '/card',
      auth: auth,
      body: requestBody,
    );
    if (res['card'] == null) return null;
    return Flashcard.fromJson(res['card']);
  }

  Future<bool> deleteFlashcard(
    Authenticator auth,
    int flashcardId,
  ) async {
    final res = await _request(
      'DELETE',
      '/card?id=$flashcardId',
      auth: auth,
    );
    if (res == null) return false;
    return res['status'] == 'success';
  }

  Future<Flashcard> updateFlashcard(
    Authenticator auth,
    int flashcardId, {
    String? question,
    String? answer,
  }) async {
    Map<String, dynamic> body = {
      'id': flashcardId,
      if (question != null) "front": question,
      if (answer != null) "back": answer,
    };
    final res = await _request(
      'PUT',
      '/card',
      auth: auth,
      body: body,
    );
    final flashcard = res['card'];
    return Flashcard.fromJson(flashcard);
  }

  Future<List<int>?> generateFlashcards(Authenticator auth,
      {required String pdfLink, required int setId}) async {
    final requestBody = {
      'url': pdfLink,
      'set_id': setId,
    };
    final res = await _request(
      'POST',
      '/cardset/generate',
      auth: auth,
      body: requestBody,
    );
    return res['cards'];
  }

  /* ===================
   * THIRD PARTY
   * ===================
   */

  Future<String> sendAppleAuthToken(String idToken) async {
    final requestBody = {
      'id_token': idToken,
      'return_session_token': true,
    };
    final responseBody =
        await _request('POST', '/session/apple', body: requestBody);
    return responseBody['session_token'];
  }

  /* ===================
   * OTHER ENDPOINT
   * ===================
   */

  Future<String?> uploadFile(
    Authenticator auth,
    String fileType,
    String base64Data,
  ) async {
    final requestBody = {
      'filetype': fileType,
      'content': base64Data,
    };
    final responseBody =
        await _request('POST', '/file', auth: auth, body: requestBody);
    return responseBody['path'];
  }

  Future<dynamic> _request(
    String method,
    String path, {
    Authenticator? auth,
    dynamic body,
    dio.Options? options,
  }) async {
    options ??= dio.Options(
      contentType: 'application/json',
      method: method,
      responseType: dio.ResponseType.bytes,
      validateStatus: (status) {
        if (status == null) return false;
        final access = (status ~/ 100);
        return access == 2;
      },
    );

    await auth?.authenticate(options);
    try {
      final response =
          await _dio.request(endpoint + path, data: body, options: options);
      return jsonDecode(utf8.decode(response.data));
    } on dio.DioException catch (error) {
      if (error.response?.data != null) {
        var data = jsonDecode(utf8.decode(error.response?.data));
        await _dio.post(
          '/app/crash',
          data: {
            "message":
                "${data['status']} - ${data['message']} - ${data['endpoint']} - ${data['session_token']}"
          },
        );
        throw CustomError.fromJson(data).getErrorType;
      } else {
        throw CustomError(
          message: "checkYourConnection",
          errorStatus: 'request_error',
          endpointPath: path,
        );
      }
    }
  }
}
