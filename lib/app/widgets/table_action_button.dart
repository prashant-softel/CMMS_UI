import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

class TableActionButton extends StatelessWidget {
  const TableActionButton({
    Key? key,
    this.label,
    this.onPress,
    this.icon,
    required this.color,
  }) : super(key: key);

  final String? label;
  final Function()? onPress;
  final IconData? icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: InkWell(
        onTap: onPress,
        child: Container(
          margin: Dimens.edgeInsets4,
          padding: Dimens.edgeInsets8_2_8_2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: color,
          ),
          child: Row(
            children: [
              icon != null
                  ? Icon(icon, color: Colors.white, size: 14)
                  : SizedBox.shrink(),
              icon != null ? Dimens.boxWidth2 : SizedBox.shrink(),
              Text(
                label ?? "",
                style: Styles.white12.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
