import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TryAgain extends StatelessWidget {
  const TryAgain({Key? key, this.onTap}) : super(key: key);

  final Function()? onTap;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'somethingWentWrong'.tr,
            style: Styles.grey14,
          ),
          Dimens.boxWidth4,
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'tryAgain'.tr,
                  style: Styles.grey14,
                ),
                const Icon(
                  Icons.replay,
                  color: Colors.grey,
                  size: 18,
                ),
              ],
            ),
          )
        ],
      );
}
