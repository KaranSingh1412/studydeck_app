import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:studydeck_app/data/services/auth_service.dart';
import 'package:studydeck_app/data/services/utils/exceptions.dart';
import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import 'custom_extensions.dart';
import 'edge_insets_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:another_flushbar/flushbar.dart';

final NavigationService _navService = locator<NavigationService>();
final DialogService _dialogService = locator<DialogService>();
final AuthService _authService = locator<AuthService>();

Widget backButton(
    {double? size = 35, Color? color, IconData? icon = Icons.arrow_back}) {
  return GestureDetector(
    child: Icon(
      icon,
      size: size,
      color: color,
    ),
    onTap: () {
      _navService.back();
    },
  );
}

PreferredSizeWidget dummyAppbar() {
  return AppBar(
    toolbarHeight: 0,
  );
}

PreferredSizeWidget appBarWithBackButton() {
  return AppBar(
    leading: Padding(
      padding: getPaddingOnly(left: 20),
      child: backButton(),
    ),
  );
}

Future showCustomModalBottomSheet(
    {required BuildContext context,
    required Widget Function(BuildContext) builder}) {
  return showModalBottomSheet(
    context: context,
    builder: builder,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
  );
}

Future<bool> showCustomDialog(String errorMessage,
    {String? title,
    String? mainButtonTitle,
    String? secondaryButtonTitle}) async {
  final response = await _dialogService.showCustomDialog(
    variant: DialogType.custom,
    title: title ?? 'Etwas ist schief gelaufen',
    description: errorMessage,
    mainButtonTitle: mainButtonTitle ?? 'Okay',
    secondaryButtonTitle: secondaryButtonTitle,
  );
  return response?.confirmed ?? false;
}

void showAcceptionDialog(BuildContext context, String message) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    duration: const Duration(seconds: 2),
    message: message,
    forwardAnimationCurve: Curves.easeIn,
    reverseAnimationCurve: Curves.easeOut,
    backgroundColor: context.theme.snackBarTheme.backgroundColor!,
    margin: getPaddingAll(8),
    borderRadius: BorderRadius.circular(20),
  ).show(context);
}

String timestampToTime(String timestamp, BuildContext context) {
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
  return DateFormat('HH:mm', 'de').format(date);
}

String timestampToDate(String timestamp, BuildContext context) {
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
  return DateFormat('EEEE, dd.MM.yyyy', 'de')
      .format(date); //'${date.day}.${date.month}.${date.year}';
}

Color hexToColor(String hexString) {
  return Color(int.parse(hexString, radix: 16) + 0xFF000000);
}

void goBack() {
  _navService.back();
}

Future<dynamic> request(
    {required Future<dynamic> onExecute,
    Future<dynamic>? Function(Object error)? onError,
    bool showDialog = true}) async {
  try {
    return await onExecute;
  } on LoginStateException catch (error) {
    if (onError != null) await onError(error);
    return await _authService.logout();
  } on RequestException catch (error) {
    if (onError != null) await onError(error);
    if (showDialog) await showCustomDialog(error.message);
    return null;
  } on FormatException catch (error) {
    if (onError != null) await onError(error);
    if (showDialog) await showCustomDialog('backend error ${error.message}');
    log(error.message);
  } catch (error) {
    if (onError != null) await onError(error);
    if (showDialog) await showCustomDialog(error.toString());
    log(error.toString());
    return null;
  }
}
