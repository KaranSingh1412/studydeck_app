import 'package:stacked/stacked.dart';
import 'package:studydeck_app/app/app.locator.dart';
import 'package:studydeck_app/data/services/flashcard_service.dart';

class CardRatingDialogModel extends BaseViewModel {
  final FlashcardService _flashcardService = locator<FlashcardService>();
  int _qualityRating = 0;
  int _relevanceRating = 0;
  int cardId;

  int get qualityRating => _qualityRating;
  int get relevanceRating => _relevanceRating;

  CardRatingDialogModel(this.cardId);

  void setQualityRating(int rating) {
    _qualityRating = rating;
    rebuildUi();
  }

  void setRelevanceRating(int rating) {
    _relevanceRating = rating;
    rebuildUi();
  }

  Future<bool> sendRating() async {
    if (_qualityRating == 0 || _relevanceRating == 0) {
      return false;
    }
    await _flashcardService.rateFlashcard(
        flashcardId: cardId, rating: _qualityRating, type: 'quality');
    await _flashcardService.rateFlashcard(
        flashcardId: cardId, rating: _relevanceRating, type: 'relevance');
    return true;
  }
}
