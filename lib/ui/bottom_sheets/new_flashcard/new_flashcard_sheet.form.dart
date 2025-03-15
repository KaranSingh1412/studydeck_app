// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String FrontValueKey = 'front';
const String BackValueKey = 'back';

final Map<String, TextEditingController>
    _NewFlashcardSheetTextEditingControllers = {};

final Map<String, FocusNode> _NewFlashcardSheetFocusNodes = {};

final Map<String, String? Function(String?)?>
    _NewFlashcardSheetTextValidations = {
  FrontValueKey: null,
  BackValueKey: null,
};

mixin $NewFlashcardSheet {
  TextEditingController get frontController =>
      _getFormTextEditingController(FrontValueKey);
  TextEditingController get backController =>
      _getFormTextEditingController(BackValueKey);

  FocusNode get frontFocusNode => _getFormFocusNode(FrontValueKey);
  FocusNode get backFocusNode => _getFormFocusNode(BackValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_NewFlashcardSheetTextEditingControllers.containsKey(key)) {
      return _NewFlashcardSheetTextEditingControllers[key]!;
    }

    _NewFlashcardSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _NewFlashcardSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_NewFlashcardSheetFocusNodes.containsKey(key)) {
      return _NewFlashcardSheetFocusNodes[key]!;
    }
    _NewFlashcardSheetFocusNodes[key] = FocusNode();
    return _NewFlashcardSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    frontController.addListener(() => _updateFormData(model));
    backController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    frontController.addListener(() => _updateFormData(model));
    backController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FrontValueKey: frontController.text,
          BackValueKey: backController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _NewFlashcardSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _NewFlashcardSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _NewFlashcardSheetTextEditingControllers.clear();
    _NewFlashcardSheetFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get frontValue => this.formValueMap[FrontValueKey] as String?;
  String? get backValue => this.formValueMap[BackValueKey] as String?;

  set frontValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FrontValueKey: value}),
    );

    if (_NewFlashcardSheetTextEditingControllers.containsKey(FrontValueKey)) {
      _NewFlashcardSheetTextEditingControllers[FrontValueKey]?.text =
          value ?? '';
    }
  }

  set backValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BackValueKey: value}),
    );

    if (_NewFlashcardSheetTextEditingControllers.containsKey(BackValueKey)) {
      _NewFlashcardSheetTextEditingControllers[BackValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasFront =>
      this.formValueMap.containsKey(FrontValueKey) &&
      (frontValue?.isNotEmpty ?? false);
  bool get hasBack =>
      this.formValueMap.containsKey(BackValueKey) &&
      (backValue?.isNotEmpty ?? false);

  bool get hasFrontValidationMessage =>
      this.fieldsValidationMessages[FrontValueKey]?.isNotEmpty ?? false;
  bool get hasBackValidationMessage =>
      this.fieldsValidationMessages[BackValueKey]?.isNotEmpty ?? false;

  String? get frontValidationMessage =>
      this.fieldsValidationMessages[FrontValueKey];
  String? get backValidationMessage =>
      this.fieldsValidationMessages[BackValueKey];
}

extension Methods on FormStateHelper {
  setFrontValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FrontValueKey] = validationMessage;
  setBackValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BackValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    frontValue = '';
    backValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FrontValueKey: getValidationMessage(FrontValueKey),
      BackValueKey: getValidationMessage(BackValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _NewFlashcardSheetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _NewFlashcardSheetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FrontValueKey: getValidationMessage(FrontValueKey),
      BackValueKey: getValidationMessage(BackValueKey),
    });
