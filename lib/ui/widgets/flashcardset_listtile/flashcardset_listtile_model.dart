import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:studydeck_app/app/app.locator.dart';
import 'package:studydeck_app/app/app.router.dart';
import 'package:studydeck_app/data/models/flashcard_set.dart';

class FlashcardsetListtileModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> navigateToFlashcardView(FlashcardSet flashcardSet) async {
    await _navigationService.navigateToFlashcardView(
        flashcardSet: flashcardSet);
  }
}
