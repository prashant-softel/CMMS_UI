import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.icon,
    required this.color, 
    // required Future<Null> Function() onPress,
  }) : super(key: key);
  final String label;
  final IconData? icon;
  final Function() onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: color,
        ),
        height: Dimens.thirtyFive,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.black.withOpacity(.1),
              ),
              height: Dimens.thirtyFive,
              width: Dimens.fourty,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: Dimens.edgeInsets8,
              child: Text(
                label,
                style: Styles.white12.copyWith(
                  color: Theme.of(context).textTheme.displaySmall!.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
