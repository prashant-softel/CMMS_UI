import 'package:cmms/app/create_kaizens/create_kaizens_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KaizenCreatedDialog extends GetView<CreateKaizensDataController> {
  const KaizenCreatedDialog({
    this.kaizenId,
    this.message,
    super.key,
  });

  ///
  final int? kaizenId;
  final String? message;

  ///
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets00_04_04_04,
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Kaizen Saved',
        textAlign: TextAlign.center,
      ),
      content: Builder(builder: (context) {
        return Container(
          padding: Dimens.edgeInsets05_0_5_0,
          height: Get.height / 5,
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, //
              children: [
                Divider(
                  color: ColorValues.greyLightColour,
                  thickness: 1,
                ),
                Dimens.boxHeight10,
                Center(
                  child: Text(
                    message ?? '',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Dimens.boxHeight10,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, //
                    children: [
                      ElevatedButton(
                        style: Styles.navyBlueElevatedButtonStyle,
                        onPressed: () {
                          Get.toNamed(Routes.kaizensListScreen);
                        },
                        child: const Text('Kaizens List'),
                      ),
                      Dimens.boxWidth5,
                      ElevatedButton(
                        style: Styles.greenElevatedButtonStyle,
                        onPressed: () {
                          // controller.clearStoreData();
                            // Get.back();
                          Get.offNamed(Routes.createkaizensScreen);
                        },
                        child: const Text('Add New Kaizens'),
                      ),
                    ]),
              ]),
        );
      }),
      actions: [],
    );
  }

  ///
}
