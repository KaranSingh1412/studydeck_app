import 'package:stacked/stacked.dart';
import 'package:studydeck_app/data/services/prefs_service.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PrefsService _prefsService = locator<PrefsService>();

  Future runStartupLogic() async {
    if (_prefsService.isSetToken()) {
      print(_prefsService.getSessionToken());
      // only checks if token is set TODO: check if token is valid
      await _navigationService.replaceWithHomeView();
      return;
    } else {
      await _navigationService.replaceWithLoginView();
    }
  }
}
