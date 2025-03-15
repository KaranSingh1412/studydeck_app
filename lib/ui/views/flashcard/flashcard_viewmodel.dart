import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:studydeck_app/app/app.bottomsheets.dart';
import 'package:studydeck_app/app/app.dialogs.dart';
import 'package:studydeck_app/app/app.locator.dart';
import 'package:studydeck_app/data/models/flashcard_set.dart';
import 'package:studydeck_app/data/services/firebase_service.dart';
import 'package:studydeck_app/data/services/flashcard_service.dart';

class FlashcardViewModel extends FutureViewModel<FlashcardSet?> {
  final FlashcardService _flashcardService = locator<FlashcardService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final DialogService _dialogService = locator<DialogService>();
  final FirebaseService _firebaseService = locator<FirebaseService>();

  final FlashcardSet flashcardSet;

  FlashcardViewModel({required this.flashcardSet});

  @override
  Future<FlashcardSet?> futureToRun() async {
    return _flashcardService.getFlashcardSet(flashcardSet.id!);
  }

  Future<void> addFlashcard() async {
    final creationMethod = await _dialogService.showCustomDialog<String?, void>(
      variant: DialogType.cardCreation,
      barrierDismissible: true,
    );
    if (creationMethod?.confirmed ?? false) {
      if (creationMethod?.data == 'generate') {
        final result = await FilePicker.platform.pickFiles(
          allowedExtensions: ['pdf', 'doc', 'docx'],
          allowMultiple: false,
          dialogTitle: 'Wähle eine Datei aus',
          type: FileType.custom,
        );
        if (result == null) return;
        final file = result.files.first;
        final pdfLink = await _firebaseService.uploadFile(File(file.path!));
        if (pdfLink == null) return;
        await _flashcardService.generateFlashcards(
            setId: flashcardSet.id!, pdfLink: pdfLink);
        await initialise();
      } else {
        final response = await _bottomSheetService.showCustomSheet<void, int>(
          variant: BottomSheetType.newFlashcard,
          barrierDismissible: true,
          data: flashcardSet.id,
        );

        if (response?.confirmed ?? false) {
          await initialise();
        }
      }
    }
  }

  void removeCard(int flashcardId) {
    data?.flashcards?.removeWhere((element) => element.id == flashcardId);
  }
}
