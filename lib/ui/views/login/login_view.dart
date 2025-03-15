import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:studydeck_app/ui/utils/helper/custom_extensions.dart';
import 'package:studydeck_app/ui/utils/helper/edge_insets_helper.dart';
import 'package:studydeck_app/ui/utils/helper/ui_helpers.dart';
import 'package:studydeck_app/ui/views/login/login_view.form.dart';
import 'package:studydeck_app/ui/widgets/custom_widgets/custom_button.dart';
import 'package:studydeck_app/ui/widgets/custom_widgets/custom_text_field.dart';
import 'package:studydeck_app/ui/widgets/custom_widgets/custom_widget_layouter.dart';

import 'login_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
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
                  verticalSpaceMassive,
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  Text(
                    'Willkommen zurück!',
                    style: context.theme.textTheme.headlineMedium,
                  ),
                  Text(
                    'Deine digitale Karteikarten App',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                  verticalSpaceLarge,
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
                          label: 'Anmelden',
                        ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Noch keinen Account?'),
                      TextButton(
                        onPressed: () async {
                          await viewModel.navigateToRegister();
                        },
                        child: Text(
                          'Registrieren',
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
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void disposeForm() {
    disposeForm();
    super.disposeForm();
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
