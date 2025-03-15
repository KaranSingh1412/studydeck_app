import '../../utils/helper/custom_extensions.dart';
import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  const CustomRoundButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.radius = 21,
    this.iconSize = 24,
    this.iconColor,
  });
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;
  final double? radius;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: CircleAvatar(
        backgroundColor: context.theme.colorScheme.primary,
        radius: radius,
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
