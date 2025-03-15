import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:studydeck_app/app/app.locator.dart';
import 'package:studydeck_app/data/models/flashcard.dart';
import 'package:studydeck_app/data/services/flashcard_service.dart';
import 'package:studydeck_app/ui/bottom_sheets/new_flashcard/new_flashcard_sheet.form.dart';

class NewFlashcardSheetModel extends FormViewModel {
  final FlashcardService _flashcardService = locator<FlashcardService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<bool> addFlashcard(int setId) async {
    if (frontValue == null || backValue == null) {
      return false;
    }
    setBusy(true);
    final flashcard = await _flashcardService.addFlashcard(setId,
        question: frontValue!, answer: backValue!);
    setBusy(false);
    return flashcard != null;
  }

  Future<Flashcard?> updateFlashcard(
      int flashcardId, String front, String back) async {
    setBusy(true);
    final flashcard = await _flashcardService.updateFlashcard(flashcardId,
        question: front, answer: back);
    setBusy(false);
    return flashcard;
  }
}
