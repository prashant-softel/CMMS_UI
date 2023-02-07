import 'package:cmms/app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopupMenuWidget extends StatelessWidget {
  PopupMenuWidget({
    Key? key,
    this.iconPath,
    this.menuName,
    this.color,
    this.iconData,
    this.textStyle,
    this.onTap,
    this.iconHeight,
    this.iconWidth,
  }) : super(key: key);

  final String? iconPath;
  final String? menuName;
  final Color? color;
  final IconData? iconData;
  final TextStyle? textStyle;
  final Function()? onTap;
  final double? iconHeight;
  final double? iconWidth;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: kIsWeb ? Dimens.twenty : Dimens.twentyEight,
            height: kIsWeb ? Dimens.twenty : Dimens.eighteen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconData != null
                    ? Icon(
                        iconData!,
                        color: color,
                        size: Dimens.eighteen,
                      )
                    : iconPath!.contains('svg')
                        ? SvgPicture.asset(
                            iconPath!,
                            width: iconWidth ?? Dimens.eighteen,
                            height: iconHeight ?? Dimens.eighteen,
                            fit: BoxFit.contain,
                            color: color!,
                          )
                        : Image.asset(
                            iconPath!,
                            width: iconWidth ?? Dimens.eighteen,
                            height: iconHeight ?? Dimens.eighteen,
                            fit: BoxFit.contain,
                            color: color!,
                          ),
              ],
            ),
          ),
          kIsWeb ? Dimens.boxWidth7 : Dimens.boxWidth2,
          Flexible(
            child: Text(
              menuName!.toString(),
              style: textStyle,
            ),
          ),
        ],
      );
}
