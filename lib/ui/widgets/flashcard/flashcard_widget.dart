import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:studydeck_app/data/models/flashcard.dart';
import 'package:studydeck_app/ui/utils/animations/flip_animation.dart';
import 'package:studydeck_app/ui/utils/helper/custom_extensions.dart';
import 'package:studydeck_app/ui/utils/helper/edge_insets_helper.dart';
import 'package:studydeck_app/ui/utils/helper/ui_helpers.dart';
import 'package:studydeck_app/ui/widgets/flashcard/flashcard_widget_model.dart';

class FlashcardWidget extends StackedView<FlashcardWidgetModel> {
  const FlashcardWidget(
      {super.key, required this.flashcard, required this.onDelete});
  final Flashcard flashcard;
  final VoidCallback onDelete;

  @override
  Widget builder(
      BuildContext context, FlashcardWidgetModel viewModel, Widget? child) {
    return Stack(
      children: [
        FlipAnimation(
          frontChild: Container(
            margin: getPaddingOnly(bottom: 10),
            height: 250,
            width: double.infinity,
            child: Card(
              margin: getPaddingAll(0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      viewModel.flashcard.front,
                      style: context.theme.textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          backChild: Container(
            margin: getPaddingOnly(bottom: 10),
            height: 250,
            width: double.infinity,
            child: Card(
              margin: getPaddingAll(0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      viewModel.flashcard.back,
                      style: context.theme.textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: getPaddingOnly(right: 4),
          child: Align(
            alignment: Alignment.topRight,
            child: PopupMenuButton<String>(
              enableFeedback: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        horizontalSpaceSmall,
                        Text('Bearbeiten'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'feedback',
                    child: Row(
                      children: [
                        Icon(Icons.star),
                        horizontalSpaceSmall,
                        Text('Bewerten'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        horizontalSpaceSmall,
                        Text('Löschen'),
                      ],
                    ),
                  ),
                ];
              },
              onSelected: (value) async {
                switch (value) {
                  case 'edit':
                    await viewModel.updateFlashcard();
                    break;
                  case 'feedback':
                    await viewModel.openRateDialog();
                    break;
                  case 'delete':
                    final result = await viewModel.confirmDeleteFlashcard();
                    if (result) {
                      await viewModel.deleteFlashcard(flashcard.id);
                    }
                    break;
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  FlashcardWidgetModel viewModelBuilder(BuildContext context) {
    return FlashcardWidgetModel(flashcard);
  }
}
