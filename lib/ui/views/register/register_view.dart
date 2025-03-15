import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:studydeck_app/ui/utils/helper/custom_extensions.dart';
import 'package:studydeck_app/ui/utils/helper/edge_insets_helper.dart';
import 'package:studydeck_app/ui/utils/helper/ui_helpers.dart';
import 'package:studydeck_app/ui/views/register/register_view.form.dart';
import 'package:studydeck_app/ui/widgets/custom_widgets/custom_button.dart';
import 'package:studydeck_app/ui/widgets/custom_widgets/custom_text_field.dart';
import 'package:studydeck_app/ui/widgets/custom_widgets/custom_widget_layouter.dart';

import 'register_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'name'),
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class RegisterView extends StackedView<RegisterViewModel> with $RegisterView {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: CustomWidgetLayouter(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: getPagesPadding(),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceLarge,
                  verticalSpaceMassive,
                  Text(
                    'Willkommen bei StudyDeck',
                    style: context.theme.textTheme.headlineMedium,
                  ),
                  Text(
                    'Deine digitale Karteikarten App',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                  verticalSpaceLarge,
                  CustomTextField(
                    controller: nameController,
                    labelInfo: 'Name',
                    hintInfo: 'Max Mustermann',
                    onValidateCallback: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte gib einen Namen ein';
                      }
                      return null;
                    },
                  ),
                  verticalSpaceMedium,
                  CustomTextField(
                    controller: emailController,
                    labelInfo: 'E-Mail',
                    hintInfo: 'mustermail@muster.de',
                    onValidateCallback: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte gib eine E-Mail ein';
                      }
                      return null;
                    },
                  ),
                  verticalSpaceMedium,
                  CustomTextField(
                    controller: passwordController,
                    labelInfo: 'Passwort',
                    hintInfo: 'Passwort',
                    isPassword: true,
                    onValidateCallback: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte gib ein Passwort ein';
                      }
                      return null;
                    },
                  ),
                  verticalSpaceMedium,
                  verticalSpaceMedium,
                  viewModel.isBusy
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          onPressedCallback: () async {
                            if (viewModel.formKey.currentState!.validate()) {
                              await viewModel.login();
                            }
                          },
                          label: 'Registrieren',
                        ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Bereits registriert?'),
                      TextButton(
                        onPressed: () async {
                          await viewModel.navigateToLogin();
                        },
                        child: Text(
                          'Anmelden',
                          style: TextStyle(
                            color: context.theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(RegisterViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(RegisterViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
