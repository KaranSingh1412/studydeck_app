import 'package:studydeck_app/app/app.locator.dart';
import 'package:studydeck_app/data/models/flashcard.dart';
import 'package:studydeck_app/data/models/flashcard_set.dart';
import 'package:studydeck_app/data/services/auth_service.dart';
import 'package:studydeck_app/data/services/request_service.dart';
import 'package:studydeck_app/ui/utils/helper/helper.dart';

class FlashcardService {
  final RequestService _requestService = locator<RequestService>();
  final AuthService _authService = locator<AuthService>();

  Future<List<FlashcardSet>?> getFlashcardSets() async {
    return await request(
      onExecute:
          _requestService.getFlashcardSets(_authService.getAuthenticator()),
    );
  }

  Future<FlashcardSet?> getFlashcardSet(int id) async {
    return await request(
      onExecute: _requestService.getFlashcardSet(
        _authService.getAuthenticator(),
        id,
      ),
    );
  }

  Future<FlashcardSet?> createFlashcardSet(
      {required String title, required String description}) async {
    return await request(
      onExecute: _requestService.createFlashcardSet(
        _authService.getAuthenticator(),
        title,
        description,
      ),
    );
  }

  Future<bool> deleteFlashcardSet(int id) async {
    return await request(
      onExecute: _requestService.deleteFlashcardSet(
        _authService.getAuthenticator(),
        id,
      ),
    );
  }

  Future<FlashcardSet?> updateFlashcardSet(int id,
      {String? title, String? description}) async {
    return await request(
      onExecute: _requestService.updateFlashcardSet(
        _authService.getAuthenticator(),
        id,
        title: title,
        description: description,
      ),
    );
  }

  Future<Flashcard?> addFlashcard(int setId,
      {required String question, required String answer}) async {
    return await request(
      onExecute: _requestService.addFlashcard(
        _authService.getAuthenticator(),
        setId,
        question: question,
        answer: answer,
      ),
    );
  }

  Future<bool> deleteFlashcard(int flashcardId) async {
    return await request(
      onExecute: _requestService.deleteFlashcard(
        _authService.getAuthenticator(),
        flashcardId,
      ),
    );
  }

  Future<Flashcard?> updateFlashcard(int flashcardId,
      {String? question, String? answer}) async {
    return await request(
      onExecute: _requestService.updateFlashcard(
        _authService.getAuthenticator(),
        flashcardId,
        question: question,
        answer: answer,
      ),
    );
  }

  Future<List<int>?> generateFlashcards(
      {required String pdfLink, required int setId}) async {
    return await request(
      onExecute: _requestService.generateFlashcards(
        _authService.getAuthenticator(),
        setId: setId,
        pdfLink: pdfLink,
      ),
    );
  }

  Future<bool> rateFlashcard(
      {required int flashcardId,
      required int rating,
      required String type}) async {
    return await request(
      onExecute: _requestService.rateFlashcard(
        _authService.getAuthenticator(),
        cardId: flashcardId,
        rating: rating,
        type: type,
      ),
    );
  }
}
