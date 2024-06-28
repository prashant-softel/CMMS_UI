import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableActionButton extends StatelessWidget {
  const TableActionButton({
    Key? key,
    this.label,
    this.onPress,
    this.icon,
    this.message,
    required this.color,
  }) : super(key: key);

  final String? label;
  final Function()? onPress;
  final IconData? icon;
  final Color color;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: InkWell(
        onTap: onPress,
        child: Container(
          margin: EdgeInsets.all(4.0.h),
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: color,
          ),
          child: Row(
            children: [
              icon != null
                  ? Tooltip(
                      //height: 10,
                      message: message, //'Text',
                      showDuration: const Duration(microseconds: 10),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      ),
                      textStyle: Styles.white12.copyWith(
                        color: Colors.white,
                      ),
                      // preferBelow: true,
                      verticalOffset: 25,
                      child: Icon(icon, color: Colors.white, size: 14))
                  : SizedBox.shrink(),
              // Center(
              //   child: icon != null ? Dimens.boxWidth2 : SizedBox.shrink(),
              // ),
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
