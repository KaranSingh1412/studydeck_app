import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:studydeck_app/ui/utils/helper/custom_extensions.dart';
import 'package:studydeck_app/ui/utils/helper/helper.dart';
import 'package:studydeck_app/ui/utils/helper/ui_helpers.dart';
import 'package:studydeck_app/ui/widgets/custom_widgets/custom_button.dart';

import 'card_rating_dialog_model.dart';

class CardRatingDialog extends StackedView<CardRatingDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const CardRatingDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CardRatingDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              request.title ?? 'Bewerte diese Karte',
              style: context.theme.textTheme.titleLarge,
            ),
            verticalSpaceMedium,
            const Text(
                'Ist diese Karte inhaltlich relevant für deinen Lernfortschritt?'),
            Row(
              children: [
                for (int i = 1; i <= 5; i++)
                  GestureDetector(
                    onTap: () => viewModel.setQualityRating(i),
                    child: Icon(
                      i <= viewModel.qualityRating
                          ? Icons.star
                          : Icons.star_outline,
                    ),
                  ),
              ],
            ),
            verticalSpaceSmall,
            const Text('Ist diese Karte inhaltlich korrekt?'),
            Row(
              children: [
                for (int i = 1; i <= 5; i++)
                  GestureDetector(
                    onTap: () => viewModel.setRelevanceRating(i),
                    child: Icon(
                      i <= viewModel.relevanceRating
                          ? Icons.star
                          : Icons.star_outline,
                    ),
                  ),
              ],
            ),
            verticalSpaceSmall,
            CustomButton(
              onPressedCallback: () async {
                final sent = await viewModel.sendRating();
                if (sent) {
                  completer(DialogResponse(confirmed: true));
                  if (context.mounted) {
                    showAcceptionDialog(
                      context,
                      'Vielen Dank für deine Bewertung!',
                    );
                  }
                }
              },
              label: const Text('Abschicken'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CardRatingDialogModel viewModelBuilder(BuildContext context) =>
      CardRatingDialogModel(request.data['cardId']);
}
