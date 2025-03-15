import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:studydeck_app/app/app.bottomsheets.dart';
import 'package:studydeck_app/app/app.dialogs.dart';
import 'package:studydeck_app/app/app.locator.dart';
import 'package:studydeck_app/data/models/flashcard.dart';
import 'package:studydeck_app/data/services/flashcard_service.dart';
import 'package:studydeck_app/ui/utils/helper/helper.dart';

class FlashcardWidgetModel extends BaseViewModel {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final DialogService _dialogService = locator<DialogService>();
  final FlashcardService _flashcardService = locator<FlashcardService>();

  final Flashcard _flashcard;

  FlashcardWidgetModel(this._flashcard);

  Flashcard get flashcard => _flashcard;

  Future<void> updateFlashcard() async {
    final response = await _bottomSheetService
        .showCustomSheet<Map<String, dynamic>?, Map<String, dynamic>?>(
      variant: BottomSheetType.newFlashcard,
      barrierDismissible: true,
      data: {
        'flashcardId': _flashcard.id,
        'front': _flashcard.front,
        'back': _flashcard.back,
      },
    );

    if (response?.confirmed ?? false) {
      _flashcard.front = response?.data?['front'];
      _flashcard.back = response?.data?['back'];
      rebuildUi();
    }
  }

  Future<bool> confirmDeleteFlashcard() async {
    final response = await showCustomDialog(
      'Möchtest du die Karteikarte wirklich löschen?',
      title: 'Karteikarte löschen',
      secondaryButtonTitle: 'Abbrechen',
    );
    return response;
  }

  Future<void> deleteFlashcard(int flashcardId) async {
    await _flashcardService.deleteFlashcard(flashcardId);
    rebuildUi();
  }

  Future<void> openRateDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.cardRating,
      barrierDismissible: true,
      data: {'cardId': _flashcard.id},
    );
  }
}
