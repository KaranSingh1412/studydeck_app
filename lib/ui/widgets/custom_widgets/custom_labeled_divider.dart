import '../../utils/helper/edge_insets_helper.dart';
import '../../utils/helper/ui_helpers.dart';
import 'package:flutter/material.dart';

class CustomLabeledDivider extends StatelessWidget {
  const CustomLabeledDivider({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getSymmetricPadding(horizontal: 15),
      child: Row(
        children: [
          Expanded(child: spacedDivider()),
          Padding(
            padding: getSymmetricPadding(horizontal: 10),
            child: Text(label),
          ),
          Expanded(child: spacedDivider()),
        ],
      ),
    );
  }
}
