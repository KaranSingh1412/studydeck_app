import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:studydeck_app/data/models/flashcard_set.dart';
import 'package:studydeck_app/ui/utils/helper/custom_extensions.dart';
import 'package:studydeck_app/ui/utils/helper/edge_insets_helper.dart';
import 'package:studydeck_app/ui/utils/helper/ui_helpers.dart';
import 'flashcardset_listtile_model.dart';

class FlashcardsetListtile extends StackedView<FlashcardsetListtileModel> {
  const FlashcardsetListtile({super.key, required this.flashcardSet});
  final FlashcardSet flashcardSet;

  @override
  Widget builder(BuildContext context, FlashcardsetListtileModel viewModel,
      Widget? child) {
    return GestureDetector(
      onTap: () async {
        await viewModel.navigateToFlashcardView(flashcardSet);
      },
      child: Container(
        padding: getPaddingAll(7),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          border: const Border.fromBorderSide(
            BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        child: Row(
          children: [
            horizontalSpaceSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    flashcardSet.title ?? '',
                    style: context.theme.textTheme.titleLarge,
                  ),
                  Text(
                    flashcardSet.description ?? '',
                    style: context.theme.textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  FlashcardsetListtileModel viewModelBuilder(BuildContext context) {
    return FlashcardsetListtileModel();
  }
}
