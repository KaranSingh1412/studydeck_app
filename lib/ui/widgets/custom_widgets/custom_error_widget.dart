import '../../widgets/custom_widgets/custom_round_button.dart';
import '../../utils/helper/ui_helpers.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key, required this.onPressRefreshButton, this.errorMessage});
  final Future Function() onPressRefreshButton;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage ?? 'couldntLoadData'),
          verticalSpaceMedium,
          CustomRoundButton(
            icon: Icons.refresh,
            onPressed: () async => await onPressRefreshButton(),
          ),
        ],
      ),
    );
  }
}
