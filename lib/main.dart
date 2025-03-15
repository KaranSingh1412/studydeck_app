import 'package:flutter/material.dart';
import 'package:studydeck_app/app/app.bottomsheets.dart';
import 'package:studydeck_app/app/app.dialogs.dart';
import 'package:studydeck_app/data/services/prefs_service.dart';
import 'package:studydeck_app/firebase_options.dart';
import 'package:studydeck_app/ui/utils/themes.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await initServices();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}

Future<void> initServices() async {
  PrefsService prefsService = locator<PrefsService>();

  await prefsService.init();
}
