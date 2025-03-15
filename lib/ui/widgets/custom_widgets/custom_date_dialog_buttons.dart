import '../../utils/helper/custom_extensions.dart';
import '../../utils/helper/edge_insets_helper.dart';
import '../../utils/helper/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateDialogButton extends StatelessWidget {
  const CustomDateDialogButton(
      {super.key,
      required this.startDate,
      required this.endDate,
      required this.onTap});
  final void Function() onTap;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Card(
              margin: getPaddingOnly(top: 12),
              child: Padding(
                padding: getPaddingAll(12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      size: 25,
                    ),
                    horizontalSpaceTiny,
                    Text(
                      'start',
                      style: context.theme.textTheme.bodySmall,
                    ),
                    if (startDate != null)
                      Text(
                        DateFormat('dd.MM.yyyy', 'de').format(startDate!),
                        style: context.theme.textTheme.bodySmall,
                      )
                    else
                      const Text('...'),
                  ],
                ),
              ),
            ),
          ),
          horizontalSpaceSmall,
          Expanded(
            child: Card(
              margin: getPaddingOnly(top: 12),
              child: Padding(
                padding: getPaddingAll(12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      size: 25,
                    ),
                    horizontalSpaceTiny,
                    Text(
                      'end',
                      style: context.theme.textTheme.bodySmall,
                    ),
                    if (endDate != null)
                      FittedBox(
                        child: Text(
                          DateFormat('dd.MM.yyyy', 'de').format(endDate!),
                          style: context.theme.textTheme.bodySmall,
                        ),
                      )
                    else
                      const Text('...'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
