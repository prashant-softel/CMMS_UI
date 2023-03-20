import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/dimens.dart';

class CustomElevatedButton extends GetView {
  Color backgroundColor;
  String text;
  Function()? onPressed;
  CustomElevatedButton(
      {super.key,
      required this.backgroundColor,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: Dimens.fourteen),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
