import './utils/initialized.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService with Initialized<PrefsService> {
  SharedPreferences? _storage;

  @override
  Future<void> onInit() async {
    _storage = await SharedPreferences.getInstance();
  }

  SharedPreferences? get storage => _storage;

  void _addString(String name, String value) {
    assertInit();
    _storage!.setString(name, value);
  }

  void _addInt(String name, int value) {
    assertInit();
    _storage!.setInt(name, value);
  }

  void addBool(String key, bool newalue) {
    assertInit();
    _storage!.setBool(key, newalue);
  }

  String _getString(String key) {
    assertInit();
    if (keyExists(key)) return _storage!.getString(key)!;
    return '';
  }

  int _getInt(String key) {
    assertInit();
    if (keyExists(key)) return _storage!.getInt(key)!;
    return 0;
  }

  bool? getBool(String key) {
    assertInit();
    return _storage!.getBool(key);
  }

  void _deleteObject(String name) {
    assertInit();
    _storage!.remove(name);
  }

  bool keyExists(String name) {
    assertInit();
    return _storage!.get(name) != null;
  }

  void setSessionToken(String token) {
    _addString('session_token', token);
  }

  void deleteSessionToken() {
    _deleteObject('session_token');
  }

  void clearStorage() {
    bool firstRun = getBool('firstRun') ?? true;
    _storage!.clear();
    addBool('firstRun', firstRun);
  }

  //============================================================================

  String? getSessionToken() {
    assertInit();
    return _storage!.getString('session_token');
  }

  bool isSetToken() {
    assertInit();
    return _storage!.getString('session_token') != null &&
        _storage!.getString('session_token')! != '';
  }

  int? getUserId() {
    if (getSessionToken() == null) return null;
    return int.tryParse(getSessionToken()!.split('-').first);
  }

  void setDarkmode(bool darkmode) {
    addBool('darkmode', darkmode);
  }

  bool? get isDarkmode {
    return getBool('darkmode');
  }
}
