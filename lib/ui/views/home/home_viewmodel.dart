import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:studydeck_app/app/app.bottomsheets.dart';
import 'package:studydeck_app/app/app.locator.dart';
import 'package:studydeck_app/app/app.router.dart';
import 'package:studydeck_app/data/models/flashcard_set.dart';
import 'package:studydeck_app/data/services/flashcard_service.dart';
import 'package:studydeck_app/ui/utils/helper/helper.dart';

class HomeViewModel extends FutureViewModel<List<FlashcardSet>?>
    with IndexTrackingStateHelper {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FlashcardService _flashcardService = locator<FlashcardService>();

  @override
  Future<List<FlashcardSet>?> futureToRun() async {
    return _flashcardService.getFlashcardSets();
  }

  Future<void> navigateToNewCard() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.newCardset,
      barrierDismissible: true,
    );

    if (response?.confirmed ?? false) {
      await initialise();
    }
  }

  Future<void> deleteFlashcardSet(int setId) async {
    await _flashcardService.deleteFlashcardSet(setId);
    data?.removeWhere((element) => element.id == setId);
  }

  Future<bool> confirmDelete() async {
    final response = showCustomDialog(
        'Dieser Vorgang kann nicht rückgängig gemacht werden',
        title: 'Bist du dir sicher?',
        secondaryButtonTitle: 'Abbrechen');
    return response;
  }

  Future<void> navigateToSettings() async {
    await _navigationService.navigateToSettingsView();
  }
}
