import 'package:flutter/material.dart';

EdgeInsets getPagesPadding() => const EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 8,
    );

EdgeInsets getPaddingAll(double padding) => EdgeInsets.all(padding);

EdgeInsets getSymmetricPadding({double horizontal = 0, double vertical = 0}) =>
    EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

EdgeInsets getPaddingOnly(
        {double? top, double? bottom, double? right, double? left}) =>
    EdgeInsets.only(
        top: top ?? 0, bottom: bottom ?? 0, left: left ?? 0, right: right ?? 0);
