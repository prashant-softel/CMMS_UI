import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatefulWidget {
  final String title;
  final int? maxline;
  final bool includeAsterisk; 

  CustomRichText({
    super.key,
    required this.title,
    this.maxline,
    this.includeAsterisk = true,
  });

  @override
  State<CustomRichText> createState() => _CustomRichTextState();
}

class _CustomRichTextState extends State<CustomRichText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: widget.maxline,
      text: TextSpan(
        text: widget.title,
        style: Styles.blackBold16,
        children: widget.includeAsterisk
            ? [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: ColorValues.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]
            : [],
      ),
    );
  }
}

class CustomRichTextMobile extends StatefulWidget {
  final String title;
  final int? maxline;

  CustomRichTextMobile({
    super.key,
    required this.title,
    this.maxline,
  });

  @override
  State<CustomRichTextMobile> createState() => _CustomRichTextMobileState();
}

class _CustomRichTextMobileState extends State<CustomRichTextMobile> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: widget.maxline,
      text: TextSpan(
        text: widget.title,
        style: TextStyle(
          color: ColorValues.blackColor,
          fontSize: Dimens.fourteen,
          fontFamily: 'Poppins',
        ),
        children:
             [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: ColorValues.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]
            
      ),
    );
  }
}
