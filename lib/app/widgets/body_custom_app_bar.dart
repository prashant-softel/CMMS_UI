import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.action,
  }) : super(key: key);

  final String? title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(7.w, 0.h, 16.w, 0.h),
      color: Colors.grey.withOpacity(.2),
      height: Dimens.fiftyFive,
      child: Row(
        children: [
          Container(
            child: Text('$title'),
          ),
          Spacer(),
          Dimens.boxWidth10,
          if (action != null) action!
        ],
      ),
    );
  }
}
