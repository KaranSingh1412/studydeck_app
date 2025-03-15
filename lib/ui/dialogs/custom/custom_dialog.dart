import 'package:studydeck_app/ui/utils/helper/custom_extensions.dart';

import '../../utils/helper/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'custom_dialog_model.dart';

class CustomDialog extends StackedView<CustomDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const CustomDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CustomDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.title ?? 'Etwas ist schief gelaufen',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      if (request.description != null) ...[
                        verticalSpaceTiny,
                        Text(
                          request.description!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          maxLines: 3,
                          softWrap: true,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => completer(DialogResponse(confirmed: true)),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        request.mainButtonTitle ?? 'Okay',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                if (request.secondaryButtonTitle != null) ...[
                  horizontalSpaceMedium,
                  Expanded(
                    child: GestureDetector(
                      onTap: () => completer(DialogResponse(confirmed: false)),
                      child: Container(
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          request.secondaryButtonTitle ?? 'Abbrechen',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  CustomDialogModel viewModelBuilder(BuildContext context) =>
      CustomDialogModel();
}
