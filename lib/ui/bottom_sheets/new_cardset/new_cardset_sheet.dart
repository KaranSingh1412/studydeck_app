import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:studydeck_app/ui/bottom_sheets/new_cardset/new_cardset_sheet.form.dart';
import 'package:studydeck_app/ui/utils/helper/custom_extensions.dart';
import 'package:studydeck_app/ui/utils/helper/edge_insets_helper.dart';
import 'package:studydeck_app/ui/utils/helper/ui_helpers.dart';
import 'package:studydeck_app/ui/widgets/custom_widgets/custom_button.dart';
import 'package:studydeck_app/ui/widgets/custom_widgets/custom_text_field.dart';

import 'new_cardset_sheet_model.dart';

@FormView(
  fields: [
    FormTextField(name: 'name'),
    FormTextField(name: 'description'),
  ],
)
class NewCardsetSheet extends StackedView<NewCardsetSheetModel>
    with $NewCardsetSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const NewCardsetSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NewCardsetSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      height: 360,
      padding: getPagesPadding(),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 35,
                    ),
                    onPressed: () =>
                        completer!(SheetResponse(confirmed: false)),
                  ),
                  const Spacer(),
                  Text(
                    'Neues Kartenset',
                    style: context.theme.textTheme.titleLarge,
                  ),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
              verticalSpaceMedium,
              CustomTextField(
                hintInfo: 'Name des Kartensets',
                labelInfo: 'Name',
                controller: nameController,
                onValidateCallback: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte füge einen Namen hinzu';
                  }
                  return null;
                },
              ),
              verticalSpaceSmall,
              CustomTextField(
                hintInfo: 'Beschreibung des Kartensets',
                labelInfo: 'Beschreibung',
                controller: descriptionController,
              ),
              verticalSpaceMedium,
              viewModel.isBusy
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                      onPressedCallback: () async {
                        final valid =
                            viewModel.formKey.currentState!.validate();
                        if (!valid) return;

                        final cardset = await viewModel.createCardset();
                        nameController.clear();
                        descriptionController.clear();
                        if (cardset != null) {
                          completer!(SheetResponse(confirmed: true));
                        }
                      },
                      label: 'Bestätigen',
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(NewCardsetSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void disposeForm() {
    disposeForm();
    super.disposeForm();
  }

  @override
  NewCardsetSheetModel viewModelBuilder(BuildContext context) =>
      NewCardsetSheetModel();
}
