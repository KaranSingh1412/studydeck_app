// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/new_cardset/new_cardset_sheet.dart';
import '../ui/bottom_sheets/new_flashcard/new_flashcard_sheet.dart';

enum BottomSheetType {
  newCardset,
  newFlashcard,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.newCardset: (context, request, completer) =>
        NewCardsetSheet(request: request, completer: completer),
    BottomSheetType.newFlashcard: (context, request, completer) =>
        NewFlashcardSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
