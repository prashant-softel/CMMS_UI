import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/dimens.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final double? width; // Add width parameter
  final TextStyle? style;
  final double? size;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.width, // Add width parameter
    this.style,
    this.size = 16.0 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _buttonHeight = Get.height * 0.06;

    return //
        ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        maximumSize: width != null ? Size(width!, _buttonHeight) : null,
        minimumSize:
            width != null ? Size(width! / 2, _buttonHeight * 0.8) : null,
        backgroundColor: backgroundColor,
        elevation: 25.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: IntrinsicWidth(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              fontSize: size,
              fontWeight: FontWeight.w400,
            ),
          ),
        ]),
      ),
    );
  }
}
