import 'package:flutter/material.dart';

class CustomWidgetLayouter extends StatelessWidget {
  const CustomWidgetLayouter({super.key, required this.child, this.physics});
  final Widget child;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: physics,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
            minWidth: constraints.maxWidth,
          ),
          child: IntrinsicHeight(
            child: child,
          ),
        ),
      ),
    );
  }
}
