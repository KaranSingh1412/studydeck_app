import '../../utils/helper/custom_extensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.label,
      required this.onPressedCallback,
      this.invert = false,
      this.radius = 20,
      this.width = double.infinity,
      this.height = 50,
      this.color,
      this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      this.fontSize});
  final dynamic label;
  final bool invert;
  final double? fontSize;
  final double radius;
  final double width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final void Function()? onPressedCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: !invert
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1.0,
                  spreadRadius: .5,
                  color: color ??
                      context.theme.elevatedButtonTheme.style!.backgroundColor!
                          .resolve({WidgetState.selected})!,
                ),
              ],
            )
          : const BoxDecoration(),
      child: ElevatedButton(
        onPressed: onPressedCallback,
        style: invert
            ? ElevatedButton.styleFrom(
                foregroundColor: color ?? context.theme.colorScheme.primary,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
                enableFeedback: true,
                textStyle: context.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize,
                    color: color ?? context.theme.colorScheme.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(
                    color: color ?? context.theme.colorScheme.primary,
                    width: 1,
                  ),
                ),
              ).copyWith(elevation: const WidgetStatePropertyAll(0))
            : context.theme.elevatedButtonTheme.style?.copyWith(
                textStyle: WidgetStatePropertyAll(
                  context.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize,
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                    color ?? context.theme.colorScheme.primary),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),
                ),
              ),
        child: Padding(
          padding: padding,
          child: label is String
              ? FittedBox(
                  child: Text(
                    label,
                  ),
                )
              : label,
        ),
      ),
    );
  }
}
