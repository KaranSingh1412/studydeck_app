import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:studydeck_app/ui/utils/helper/custom_extensions.dart';
import 'package:studydeck_app/ui/utils/helper/edge_insets_helper.dart';
import 'package:studydeck_app/ui/utils/helper/ui_helpers.dart';
import 'package:studydeck_app/ui/widgets/flashcardset_listtile/flashcardset_listtile.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kartensets",
          style: context.theme.textTheme.titleLarge,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: getPaddingOnly(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.settings,
                size: 35,
              ),
              onPressed: () async {
                await viewModel.navigateToSettings();
              },
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        child: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : viewModel.data!.isEmpty
                ? Padding(
                    padding: getSymmetricPadding(
                      horizontal: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Noch keine Kartensets vorhanden',
                          style: context.theme.textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                        verticalSpaceTiny,
                        const Text(
                            'Klicke auf das Plus um ein neues Kartenset zu erstellen'),
                        verticalSpaceSmall,
                        const Icon(Icons.add_circle_outline),
                      ],
                    ),
                  )
                : ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: getSymmetricPadding(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final flashcardSet = viewModel.data![index];
                          return Dismissible(
                            key: Key(flashcardSet.id.toString()),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: Colors.transparent,
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            onDismissed: (direction) async {
                              await viewModel
                                  .deleteFlashcardSet(flashcardSet.id!);
                            },
                            confirmDismiss: (direction) async {
                              return await viewModel.confirmDelete();
                            },
                            child: Padding(
                              padding: getPaddingOnly(bottom: 10),
                              child: FlashcardsetListtile(
                                flashcardSet: flashcardSet,
                              ),
                            ),
                          );
                        },
                        itemCount: viewModel.data!.length,
                      ),
                    ],
                  ),
        onRefresh: () async {
          await viewModel.initialise();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await viewModel.navigateToNewCard();
        },
        child: const Icon(Icons.add),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: CustomBottomNavBar(
      //     currentIndex: viewModel.currentIndex,
      //     onPressedCallback: viewModel.setIndex,
      //     onAddPressed: () async {
      //       await viewModel.navigateToNewCard();
      //     },
      //   ),
      // ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
