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

class CustomRichTextMobile extends StatelessWidget {
  String title;
  int? maxline;

  CustomRichTextMobile({
    super.key,
    required this.title,
    this.maxline,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxline,
      text: TextSpan(
          text: title,
          style: TextStyle(
            color: ColorValues.blackColor,
            fontSize: Dimens.fourteen,
            fontFamily: 'Poppins',
          ),
          children: [
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
