import 'package:cmms/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/dimens.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.icon,
  }) : super(key: key);

  ///
  @override
  Widget build(BuildContext context) {
    final _buttonWidth =
        Responsive.isDesktop(context) ? (Get.width * 0.25) : (Get.width * 0.9);
    final _buttonHeight = Get.height * 0.06;

    ///
    return //
        ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        maximumSize: Size(_buttonWidth, _buttonHeight),
        minimumSize: Size(_buttonWidth / 2, _buttonHeight * 0.8),
        backgroundColor: backgroundColor,
        elevation: 25.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null
              ? Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                      size: 20,
                    ),
                    Dimens.boxWidth2,
                  ],
                )
              : Container(),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
