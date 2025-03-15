import '../../utils/helper/custom_extensions.dart';
import '../../utils/helper/edge_insets_helper.dart';
import 'package:flutter/material.dart';

class CustomSettingsCard extends StatelessWidget {
  const CustomSettingsCard(
      {super.key,
      required this.onTapCallback,
      required this.title,
      required this.subtitle,
      required this.icon});
  final void Function() onTapCallback;
  final dynamic title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: getPaddingOnly(bottom: 8),
      child: GestureDetector(
        onTap: onTapCallback,
        child: ListTile(
          trailing: Icon(icon),
          title: title is String
              ? Text(
                  title,
                  style: context.theme.textTheme.titleMedium,
                )
              : title,
          subtitle: Text(
            subtitle,
            style: context.theme.textTheme.bodyMedium
                ?.copyWith(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
