import '../../../utils/helper/custom_extensions.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'custom_switch_model.dart';

class CustomSwitch extends StackedView<CustomSwitchModel> {
  const CustomSwitch({
    super.key,
    required this.property,
    required this.onChangedCallback,
    required this.initialValue,
    this.makeAdaptive = true,
    this.saveInStorage = false,
    this.activeImage,
    this.inactiveImage,
    this.activeColor,
  });
  final String property;
  final bool saveInStorage;
  final void Function(bool) onChangedCallback;
  final bool? initialValue;
  final bool? makeAdaptive;
  final ImageProvider? activeImage;
  final ImageProvider? inactiveImage;
  final Color? activeColor;

  @override
  Widget builder(
    BuildContext context,
    CustomSwitchModel viewModel,
    Widget? child,
  ) {
    if (makeAdaptive ?? false) {
      return Switch.adaptive(
        value: viewModel.switchValue,
        autofocus: true,
        activeColor: activeColor ?? context.theme.colorScheme.primary,
        inactiveTrackColor: Colors.grey,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onChanged: (bool newValue) {
          onChangedCallback(newValue);
          viewModel.setSwitchValue(newValue);
          if (saveInStorage) {
            viewModel.saveInStorage(newValue);
          }
        },
      );
    }
    return Switch(
      value: viewModel.switchValue,
      autofocus: true,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeColor: activeColor ?? context.theme.colorScheme.primary,
      inactiveTrackColor: Colors.blue.shade900,
      inactiveThumbColor: Colors.blue.shade900,
      activeThumbImage: activeImage,
      inactiveThumbImage: inactiveImage,
      onChanged: (bool newValue) {
        onChangedCallback(newValue);
        viewModel.setSwitchValue(newValue);
        if (saveInStorage) {
          viewModel.saveInStorage(newValue);
        }
      },
    );
  }

  @override
  CustomSwitchModel viewModelBuilder(BuildContext context) => CustomSwitchModel(
        property,
        saveInStorage,
        initValue: initialValue,
      );
}
