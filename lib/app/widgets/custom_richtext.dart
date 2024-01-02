import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

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
      overflow: TextOverflow.ellipsis,
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
