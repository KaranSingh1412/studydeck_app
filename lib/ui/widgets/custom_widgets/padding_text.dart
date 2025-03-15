import '../../utils/helper/custom_extensions.dart';
import '../../utils/helper/edge_insets_helper.dart';
import 'package:flutter/material.dart';

class PaddingTitle extends StatelessWidget {
  const PaddingTitle({
    super.key,
    this.left,
    this.right,
    this.top,
    this.bottom,
    required this.text,
  });
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPaddingOnly(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      child: Text(
        text,
        style: context.theme.textTheme.titleMedium?.copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }
}
