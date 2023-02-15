import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.title,
    required this.isMandatory,
  }) : super(key: key);

  final String title;
  final bool isMandatory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title :',
          style: Styles.black12,
        ),
        Dimens.boxWidth5,
        if (isMandatory == true)
          Text(
            '*',
            style: Styles.black12.copyWith(
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
