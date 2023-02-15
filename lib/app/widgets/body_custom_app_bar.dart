import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.action,
    this.backgroundColor,
  }) : super(key: key);

  final String? title;
  final Widget? action;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimens.edgeInsets16_0_16_0,
      color: backgroundColor ?? Colors.grey.withOpacity(.2),
      height: Dimens.fiftyFive,
      child: Row(
        children: [
          Container(
            child: Text(
              '$title',
              style: Styles.blackBold15.copyWith(
                color: Color.fromARGB(255, 32, 93, 123),
              ),
            ),
          ),
          Spacer(),
          Dimens.boxWidth10,
          if (action != null) action!
        ],
      ),
    );
  }
}
