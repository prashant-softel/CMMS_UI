import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

class CustomTitleTextfield extends StatelessWidget {
  const CustomTitleTextfield({
    Key? key,
    required this.title,
    required this.isMandatory,
  }) : super(key: key);

  final String title;
  final bool isMandatory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimens.edgeInsets20_10_20_10,
      child: Row(
        children: [
          CustomTitle(
            title: title,
            isMandatory: true,
          ),
          Dimens.boxWidth10,
          CustomTextField(),
        ],
      ),
    );
  }
}
