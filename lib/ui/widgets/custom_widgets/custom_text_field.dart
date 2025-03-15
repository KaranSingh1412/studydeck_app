import '../../utils/helper/custom_extensions.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.isPassword = false,
    this.hintInfo,
    this.labelInfo,
    this.errorText,
    required this.controller,
    this.focusNode,
    this.autofillHints,
    this.textInputType,
    this.autoFocus = false,
    this.maxLength,
    this.maxLines = 1,
    this.minLines = 1,
    this.prefix,
    this.contentPadding,
    this.makeBorder = true,
    this.inputAction = TextInputAction.done,
    this.prefixIcon,
    this.onChangedCallback,
    this.onTapOutside,
    this.onValidateCallback,
    this.onEditingCompleteCallback,
    this.onSubmitCallback,
  });
  final bool isPassword;
  final String? hintInfo;
  final String? labelInfo;
  final String? errorText;
  final TextEditingController controller;
  final List<String>? autofillHints;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final int? maxLength;
  final int maxLines;
  final int minLines;
  final bool autoFocus;
  final String? prefix;
  final EdgeInsetsGeometry? contentPadding;
  final bool makeBorder;
  final TextInputAction? inputAction;
  final Widget? prefixIcon;
  final void Function(String value)? onChangedCallback;
  final void Function()? onTapOutside;
  final String? Function(String? value)? onValidateCallback;
  final void Function()? onEditingCompleteCallback;
  final void Function(String? value)? onSubmitCallback;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: context.theme.textTheme.bodyMedium,
      focusNode: focusNode,
      autofocus: autoFocus,
      cursorColor: context.theme.textSelectionTheme.cursorColor,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintInfo,
        labelText: labelInfo,
        counterText: '',
        errorText: errorText,
        contentPadding: contentPadding,
        prefixText: prefix,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: makeBorder
              ? const BorderSide(color: Colors.grey)
              : BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: makeBorder
              ? BorderSide(color: context.theme.colorScheme.primary)
              : BorderSide.none,
        ),
      ),
      onEditingComplete: onEditingCompleteCallback,
      textInputAction: inputAction,
      autofillHints: autofillHints,
      autocorrect: false,
      obscureText: isPassword,
      controller: controller,
      showCursor: true,
      keyboardType: textInputType,
      maxLength: maxLength,
      onChanged: onChangedCallback,
      maxLines: maxLines,
      minLines: minLines,
      onTapOutside: (_) {
        if (onTapOutside != null) onTapOutside!();
      },
      validator: onValidateCallback,
      onFieldSubmitted: onSubmitCallback,
    );
  }
}
