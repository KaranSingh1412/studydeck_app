import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:studydeck_app/app/app.locator.dart';
import 'package:studydeck_app/data/models/flashcard_set.dart';
import 'package:studydeck_app/data/services/flashcard_service.dart';
import 'package:studydeck_app/ui/bottom_sheets/new_cardset/new_cardset_sheet.form.dart';

class NewCardsetSheetModel extends FormViewModel {
  final FlashcardService _flashcardService = locator<FlashcardService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<FlashcardSet?> createCardset() async {
    if (nameValue == null ||
        nameValue!.isEmpty ||
        descriptionValue == null ||
        descriptionValue!.isEmpty) {
      return null;
    }
    setBusy(true);
    final set = await _flashcardService.createFlashcardSet(
      title: nameValue!,
      description: descriptionValue!,
    );
    setBusy(false);
    return set;
  }
}
