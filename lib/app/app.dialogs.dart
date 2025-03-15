// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/card_creation/card_creation_dialog.dart';
import '../ui/dialogs/card_rating/card_rating_dialog.dart';
import '../ui/dialogs/custom/custom_dialog.dart';

enum DialogType {
  custom,
  cardCreation,
  cardRating,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.custom: (context, request, completer) =>
        CustomDialog(request: request, completer: completer),
    DialogType.cardCreation: (context, request, completer) =>
        CardCreationDialog(request: request, completer: completer),
    DialogType.cardRating: (context, request, completer) =>
        CardRatingDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
