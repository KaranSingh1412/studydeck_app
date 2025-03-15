import '../../utils/helper/custom_extensions.dart';
import '../../utils/helper/edge_insets_helper.dart';
import '../../utils/helper/ui_helpers.dart';
import 'package:flutter/material.dart';

class CustomSettingsListtile extends StatelessWidget {
  const CustomSettingsListtile(
      {super.key,
      required this.title,
      required this.trailing,
      this.onTapCallback,
      this.iconColor,
      this.textColor,
      this.setMargin = true});
  final dynamic title;
  final dynamic trailing;
  final void Function()? onTapCallback;
  final Color? iconColor;
  final Color? textColor;
  final bool setMargin;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: setMargin
          ? getPaddingOnly(
              bottom: 8,
            )
          : getPaddingAll(0),
      child: InkWell(
        onTap: onTapCallback,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: title is String
                    ? Text(
                        title,
                        style: context.theme.textTheme.titleMedium
                            ?.copyWith(color: textColor),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      )
                    : title,
              ),
              horizontalSpaceTiny,
              trailing is IconData
                  ? Icon(
                      trailing,
                      color: iconColor,
                    )
                  : trailing,
            ],
          ),
        ),
      ),
    );
  }
}
