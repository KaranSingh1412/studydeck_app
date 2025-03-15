import '../../../../app/app.locator.dart';
import '../../../../data/services/prefs_service.dart';
import 'package:stacked/stacked.dart';

class CustomSwitchModel extends BaseViewModel {
  final PrefsService _prefsService = locator<PrefsService>();

  late bool _switchValue;
  late String _property;

  bool get switchValue => _switchValue;
  String get property => _property;

  CustomSwitchModel(String property, bool shouldSaveLocally,
      {bool? initValue}) {
    if (shouldSaveLocally) {
      _property = property;
      if (_prefsService.keyExists(_property) &&
          _prefsService.getBool(_property) != null) {
        _switchValue = _prefsService.getBool(_property)!;
      } else {
        _switchValue = false;
        _prefsService.addBool(_property, false);
      }
    } else {
      _switchValue = initValue ?? false;
    }
  }

  void setSwitchValue(bool newValue) {
    _switchValue = newValue;
    rebuildUi();
  }

  void saveInStorage(bool value) {
    _prefsService.addBool(_property, value);
  }
}
