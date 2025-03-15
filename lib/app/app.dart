import 'package:studydeck_app/data/services/auth_service.dart';
import 'package:studydeck_app/data/services/prefs_service.dart';
import 'package:studydeck_app/data/services/request_service.dart';
import 'package:studydeck_app/ui/bottom_sheets/new_cardset/new_cardset_sheet.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../ui/dialogs/custom/custom_dialog.dart';
import 'package:studydeck_app/ui/views/edit_cardset/edit_cardset_view.dart';
import 'package:studydeck_app/ui/views/flashcard/flashcard_view.dart';
import 'package:studydeck_app/data/services/flashcard_service.dart';
import 'package:studydeck_app/ui/views/login/login_view.dart';
import 'package:studydeck_app/ui/views/register/register_view.dart';
import 'package:studydeck_app/ui/views/settings/settings_view.dart';
import 'package:studydeck_app/ui/bottom_sheets/new_flashcard/new_flashcard_sheet.dart';
import 'package:studydeck_app/data/services/user_service.dart';
import 'package:studydeck_app/data/services/firebase_service.dart';
import 'package:studydeck_app/ui/dialogs/card_creation/card_creation_dialog.dart';
import 'package:studydeck_app/ui/dialogs/card_rating/card_rating_dialog.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: EditCardsetView),
    MaterialRoute(page: FlashcardView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: SettingsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: FlashcardService),
    LazySingleton(classType: RequestService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: PrefsService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirebaseService),
// @stacked-service
  ],
  dialogs: [
    StackedDialog(classType: CustomDialog),
    StackedDialog(classType: CardCreationDialog),
    StackedDialog(classType: CardRatingDialog),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NewCardsetSheet),
    StackedBottomsheet(classType: NewFlashcardSheet),
  ],
)
class App {}
