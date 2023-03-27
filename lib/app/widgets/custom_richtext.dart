import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';

// import '../theme/colors_value.dart';
import '../theme/styles.dart';

class CustomRichText extends StatelessWidget {
  String title;

  CustomRichText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(text: title, style: Styles.blackBold16, children: [
        TextSpan(
          text: '*',
          style: TextStyle(
            color: ColorValues.orangeColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
