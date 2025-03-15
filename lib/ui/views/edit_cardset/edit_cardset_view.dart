import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'edit_cardset_viewmodel.dart';

class EditCardsetView extends StackedView<EditCardsetViewModel> {
  const EditCardsetView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditCardsetViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  EditCardsetViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditCardsetViewModel();
}
