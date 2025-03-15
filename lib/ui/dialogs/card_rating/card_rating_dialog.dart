import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:studydeck_app/ui/utils/helper/custom_extensions.dart';
import 'package:studydeck_app/ui/utils/helper/ui_helpers.dart';

import 'card_rating_dialog_model.dart';

const double _graphicSize = 60;

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
            Text(
                'Ist diese Karte inhaltlich relevant für deinen Lernfortschritt?'),
            Row(
              children: [
                GestureDetector(
                  child: const Icon(Icons.star_outline),
                ),
                GestureDetector(
                  child: const Icon(Icons.star_outline),
                ),
                GestureDetector(
                  child: const Icon(Icons.star_outline),
                ),
                GestureDetector(
                  child: const Icon(Icons.star_outline),
                ),
                GestureDetector(
                  child: const Icon(Icons.star_outline),
                ),
              ],
            ),
            verticalSpaceSmall,
            Text('Ist diese Karte inhaltlich korrekt?'),
            Row(
              children: [
                GestureDetector(
                  child: const Icon(Icons.star_outline),
                ),
                GestureDetector(
                  child: const Icon(Icons.star_outline),
                ),
                GestureDetector(
                  child: const Icon(Icons.star_outline),
                ),
                GestureDetector(
                  child: const Icon(Icons.star_outline),
                ),
                GestureDetector(
                  child: const Icon(Icons.star_outline),
                ),
              ],
            ),
            verticalSpaceSmall,
          ],
        ),
      ),
    );
  }

  @override
  CardRatingDialogModel viewModelBuilder(BuildContext context) =>
      CardRatingDialogModel();
}
