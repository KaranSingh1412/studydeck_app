import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:studydeck_app/ui/utils/helper/custom_extensions.dart';
import 'package:studydeck_app/ui/utils/helper/ui_helpers.dart';

import 'card_creation_dialog_model.dart';

class CardCreationDialog extends StackedView<CardCreationDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const CardCreationDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CardCreationDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Erstellungsmethode auswählen',
              style: context.theme.textTheme.titleMedium,
              textAlign: TextAlign.left,
            ),
            verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      completer(
                        DialogResponse<String?>(
                            confirmed: true, data: 'generate'),
                      );
                    },
                    child: Column(
                      children: [
                        const Text(
                          '✨',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        verticalSpaceTiny,
                        Text(
                          'Karteikarten generieren',
                          style: context.theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpaceMedium,
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      completer(
                        DialogResponse<String?>(
                            confirmed: true, data: 'create'),
                      );
                    },
                    child: Column(
                      children: [
                        const Icon(
                          Icons.add,
                        ),
                        verticalSpaceTiny,
                        Text(
                          'Karteikarte\nerstellen',
                          style: context.theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  CardCreationDialogModel viewModelBuilder(BuildContext context) =>
      CardCreationDialogModel();
}
