import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({
    Key? key,
    this.image = AssetConstants.cryClipart,
    this.title,
  }) : super(key: key);

  final String image;
  final String? title;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              image,
            ),
            Text(
              title ?? 'noDataFound'.tr,
              style: Styles.black16,
            ),
          ],
        ),
      );
}
