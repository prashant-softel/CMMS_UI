import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

import '../theme/color_values.dart';
import '../theme/styles.dart';

class CustomRichText extends StatelessWidget {
  String title;
  int? maxline;

  CustomRichText({
    super.key,
    required this.title,
    this.maxline,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxline,
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
