import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:studydeck_app/data/models/flashcard.dart';
import 'package:studydeck_app/data/models/flashcard_set.dart';
import 'package:studydeck_app/ui/utils/helper/custom_extensions.dart';
import 'package:studydeck_app/ui/utils/helper/edge_insets_helper.dart';
import 'package:studydeck_app/ui/utils/helper/ui_helpers.dart';
import 'package:studydeck_app/ui/widgets/flashcard/flashcard_widget.dart';

import 'flashcard_viewmodel.dart';

class FlashcardView extends StackedView<FlashcardViewModel> {
  const FlashcardView({Key? key, required this.flashcardSet}) : super(key: key);
  final FlashcardSet flashcardSet;

  @override
  Widget builder(
    BuildContext context,
    FlashcardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(flashcardSet.title ?? ''),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Row(
          children: [
            Icon(Icons.add),
            horizontalSpaceSmall,
            Text('Neue Karteikarte'),
          ],
        ),
        onPressed: () async {
          await viewModel.addFlashcard();
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await viewModel.initialise();
        },
        child: Padding(
          padding: getPagesPadding(),
          child: ListView(
            children: [
              Text(
                flashcardSet.description ?? '',
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
              verticalSpaceMedium,
              if (viewModel.isBusy)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else if (viewModel.data?.flashcards?.isEmpty ?? true)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpaceMedium,
                    Text(
                      'Noch keine Karteikarten vorhanden',
                      style: context.theme.textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    verticalSpaceSmall,
                    const Text(
                      'Klicke auf das Plus um ein neues Kartenset zu erstellen',
                      textAlign: TextAlign.center,
                    ),
                    verticalSpaceMedium,
                    GestureDetector(
                      onTap: () async {
                        await viewModel.addFlashcard();
                      },
                      child: const Icon(
                        Icons.add_circle_outline,
                        size: 50,
                      ),
                    ),
                  ],
                )
              else
                for (Flashcard flashcard in viewModel.data?.flashcards ?? [])
                  FlashcardWidget(
                    flashcard: flashcard,
                    onDelete: () {
                      viewModel.removeCard(flashcard.id);
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  FlashcardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FlashcardViewModel(flashcardSet: flashcardSet);
}
