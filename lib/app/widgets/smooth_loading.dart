import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [SmoothLoadingWidget] is a widget shows content after loaing in a animated way.
///
/// [isLoading] is the loading state
/// [child] is the content.
///
class SmoothLoadingWidget extends StatelessWidget {
  const SmoothLoadingWidget({
    Key? key,
    required this.isLoading,
    required this.child,
    this.isBottomSheet = false,
  }) : super(key: key);

  final bool? isLoading;
  final Widget? child;
  final bool? isBottomSheet;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          if (isLoading!)
            SizedBox(
              height: isBottomSheet! ? Get.height * .3 : Get.height,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          AnimatedOpacity(
            opacity: !isLoading! ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: child,
          ),
        ],
      );
}
