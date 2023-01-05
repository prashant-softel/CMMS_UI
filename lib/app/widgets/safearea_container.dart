import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/smooth_loading_two.dart';
import 'package:flutter/material.dart';

/// [SafeAreaContainer] creates a widget that avoids operating system interfaces.
///
///
class SafeAreaContainer extends StatelessWidget {
  const SafeAreaContainer({
    Key? key,
    required this.child,
    this.top = true,
    this.left = true,
    this.right = true,
    this.bottom = true,
    this.keyboardDownWhenClickOutside = true,
  }) : super(key: key);

  final Widget child;
  final bool top;
  final bool left;
  final bool right;
  final bool bottom;
  final bool keyboardDownWhenClickOutside;

  @override
  Widget build(BuildContext context) => SafeArea(
        bottom: bottom,
        left: left,
        right: right,
        top: top,
        child: SmoothLoadingWidgetTwo(
          onAnimationCompleted: () {},
          child: GestureDetector(
            behavior:
                keyboardDownWhenClickOutside ? HitTestBehavior.opaque : null,
            onPanDown: keyboardDownWhenClickOutside
                ? (_) {
                    var currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  }
                : null,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              margin: Dimens.edgeInsets16_0_16_0,
              child: child,
            ),
          ),
        ),
      );
}
