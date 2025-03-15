import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:studydeck_app/ui/bottom_sheets/new_flashcard/new_flashcard_sheet.form.dart';
import 'package:studydeck_app/ui/utils/helper/custom_extensions.dart';
import 'package:studydeck_app/ui/utils/helper/edge_insets_helper.dart';
import 'package:studydeck_app/ui/utils/helper/helper.dart';
import 'package:studydeck_app/ui/utils/helper/ui_helpers.dart';
import 'package:studydeck_app/ui/widgets/custom_widgets/custom_button.dart';
import 'package:studydeck_app/ui/widgets/custom_widgets/custom_text_field.dart';

import 'new_flashcard_sheet_model.dart';

@FormView(
  fields: [
    FormTextField(name: 'front'),
    FormTextField(name: 'back'),
  ],
)
class NewFlashcardSheet extends StackedView<NewFlashcardSheetModel>
    with $NewFlashcardSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const NewFlashcardSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NewFlashcardSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      height: 360,
      padding: getPagesPadding(),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 35,
                    ),
                    onPressed: () => completer!(
                        SheetResponse<Map<String, dynamic>?>(confirmed: false)),
                  ),
                  const Spacer(),
                  Text(
                    request.data is Map && request.data['flashcardId'] != null
                        ? 'Bearbeite die Karteikarte'
                        : 'Neue Karteikarte',
                    style: context.theme.textTheme.titleLarge,
                  ),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
              verticalSpaceMedium,
              CustomTextField(
                hintInfo: 'Was ist der Satz des Pythagoras?',
                labelInfo: 'Vorderseite',
                controller: frontController,
                onValidateCallback: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte füge eine Frage hinzu';
                  }
                  return null;
                },
              ),
              verticalSpaceSmall,
              CustomTextField(
                hintInfo: 'a^2 + b^2 = c^2',
                labelInfo: 'Hinterseite',
                controller: backController,
                onValidateCallback: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte füge eine Antwort hinzu';
                  }
                  return null;
                },
              ),
              verticalSpaceMedium,
              viewModel.isBusy
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                      onPressedCallback: () async {
                        final valid =
                            viewModel.formKey.currentState!.validate();
                        if (!valid) return;
                        if (request.data is Map &&
                            request.data['flashcardId'] != null) {
                          final card = await viewModel.updateFlashcard(
                            request.data['flashcardId'],
                            request.data['front'],
                            request.data['back'],
                          );
                          if (card != null) {
                            completer!(
                              SheetResponse<Map<String, dynamic>?>(
                                confirmed: true,
                                data: {
                                  'front': frontController.text,
                                  'back': backController.text
                                },
                              ),
                            );
                            if (context.mounted) {
                              showAcceptionDialog(context,
                                  'Die Karteikarte wurde erfolgreich geändert');
                            }
                            return;
                          }
                        }

                        final card = await viewModel.addFlashcard(request.data);
                        frontController.clear();
                        backController.clear();
                        if (card) {
                          completer!(SheetResponse<Map<String, dynamic>?>(
                              confirmed: true));
                        }
                      },
                      label: 'Bestätigen',
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(NewFlashcardSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
    if (request.data is Map) {
      frontController.text = request.data['front'] ?? '';
      backController.text = request.data['back'] ?? '';
    }
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(NewFlashcardSheetModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  NewFlashcardSheetModel viewModelBuilder(BuildContext context) =>
      NewFlashcardSheetModel();
}
