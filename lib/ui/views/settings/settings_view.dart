import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:studydeck_app/ui/utils/helper/edge_insets_helper.dart';
import 'package:studydeck_app/ui/widgets/custom_widgets/custom_settings_card.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Einstellungen'),
      ),
      body: viewModel.isBusy
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                await viewModel.initialise();
              },
              child: Padding(
                padding: getPagesPadding(),
                child: ListView(
                  children: [
                    CustomSettingsCard(
                      title: 'Namen ändern',
                      subtitle: viewModel.data!.name ?? '',
                      icon: Icons.badge_outlined,
                      onTapCallback: () {},
                    ),
                    CustomSettingsCard(
                      title: 'E-Mail ändern',
                      subtitle: viewModel.data!.email ?? '',
                      icon: Icons.mail_outline_rounded,
                      onTapCallback: () {},
                    ),
                    CustomSettingsCard(
                      title: 'Passwort zurücksetzen',
                      subtitle: '**********',
                      icon: Icons.lock_outline_rounded,
                      onTapCallback: () {},
                    ),
                    // Text(viewModel.data!.id.toString()),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
