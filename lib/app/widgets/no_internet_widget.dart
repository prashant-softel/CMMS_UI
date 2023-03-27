// coverage:ignore-file
import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Ui for No Internet widget
class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);
  static const noInternetWidgetKey = Key('no-internet-widget-key');
  @override
  Widget build(BuildContext context) => Scaffold(
        key: noInternetWidgetKey,
        backgroundColor: Colors.white12,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: ColorValues.whiteColor,
                width: Dimens.threeHundred,
                height: Dimens.hundred,
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    'internetIsNotConnected'.tr,
                    textAlign: TextAlign.center,
                    style: Styles.black15,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
