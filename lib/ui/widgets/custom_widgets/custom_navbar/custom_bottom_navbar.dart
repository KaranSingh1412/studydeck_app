import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:studydeck_app/ui/utils/helper/edge_insets_helper.dart';
import 'package:studydeck_app/ui/utils/helper/ui_helpers.dart';

import '../../../utils/helper/custom_extensions.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onPressedCallback,
    required this.onAddPressed,
  });
  final int currentIndex;
  final void Function(int newIndex) onPressedCallback;
  final void Function() onAddPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getPaddingOnly(
        bottom: 20,
        right: 10,
        left: 10,
      ),
      height: 100,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: context.theme.bottomNavigationBarTheme.backgroundColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey,
                ),
                boxShadow: [
                  BoxShadow(
                    color: context.theme.shadowColor,
                    blurRadius: 4,
                    spreadRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              padding: getSymmetricPadding(horizontal: 10),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      onPressedCallback(0);
                    },
                    child: Icon(
                      currentIndex == 0
                          ? FluentIcons.home_20_filled
                          : FluentIcons.home_20_regular,
                      size: 35,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onPressedCallback(1);
                    },
                    child: Icon(
                      currentIndex == 1
                          ? FluentIcons.search_20_filled
                          : FluentIcons.search_20_regular,
                      size: 35,
                    ),
                  ),
                  horizontalSpaceLarge,
                  GestureDetector(
                    onTap: () {
                      onPressedCallback(2);
                    },
                    child: Icon(
                      currentIndex == 2
                          ? FluentIcons.settings_20_filled
                          : FluentIcons.settings_20_regular,
                      size: 35,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onPressedCallback(3);
                    },
                    child: Icon(
                      currentIndex == 3
                          ? FluentIcons.person_20_filled
                          : FluentIcons.person_20_regular,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: FloatingActionButton(
              onPressed: () {
                onAddPressed();
              },
              child: const Icon(FluentIcons.add_20_regular),
            ),
          ),
        ],
      ),
    );
  }
}
