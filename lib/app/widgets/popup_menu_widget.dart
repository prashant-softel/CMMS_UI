import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

class PopupMenuWidget extends StatelessWidget {
  const PopupMenuWidget({required this.showIcon, required this.title});

  final bool showIcon;
  final String title;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showIcon
              ? Icon(
                  Icons.check,
                  color: ColorsValue.whiteColor,
                )
              : Dimens.box0,
          Dimens.boxWidth10,
          Flexible(
            child: Text(
              title,
              style: Styles.blackNormal15,
            ),
          ),
        ],
      );
}
