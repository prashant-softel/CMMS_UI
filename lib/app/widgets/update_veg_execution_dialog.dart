import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class UpdateVegExecutionDialog extends GetView<VegExecutionController> {
  final List<dynamic>? mcExecutionId;
  final String? data;

  UpdateVegExecutionDialog({super.key, this.mcExecutionId, this.data});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: ((context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          insetPadding: Dimens.edgeInsets10_0_10_0,
          contentPadding: EdgeInsets.zero,
          title: Text(
            '${data}',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green),
          ),
          content: Builder(
            builder: (context) {
              return Container(
                padding: Dimens.edgeInsets05_0_5_0,
                height: 50,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    RichText(
                      text: TextSpan(
                        text:
                            'Vegetation Execution Updated Successfully with Id ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '$mcExecutionId',
                            style: TextStyle(
                              color: Colors.blue, // Set the desired text color
                              fontWeight: FontWeight
                                  .bold, // Set any additional styles as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            Dimens.boxWidth10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Dimens.boxWidth10,
                Center(
                  child: ElevatedButton(
                    style: Styles.greenElevatedButtonStyle,
                    onPressed: () {
                      Get.offAllNamed(Routes.vegExecutionListScreen);
                    },
                    child: const Text('Execution List'),
                  ),
                ),
                Dimens.boxWidth10,
                Center(
                  child: ElevatedButton(
                    style: Styles.darkBlueElevatedButtonStyle,
                    onPressed: () {
                      Get.back();
                      Future.delayed(Duration(seconds: 1), () {
                        controller.getVegTaskEquipmentList(
                            facilityId: controller.facilityId.value,
                            executionId: controller.vegexe.value,
                            isLoading: true);
                      });
                      if (mcExecutionId![0] != null) {
                        Future.delayed(Duration(seconds: 1), () {
                          controller.getVegExecutionDetail(
                            executionId: controller.vegexe.value,
                            facilityId: controller.facilityId.value,
                          );
                        });
                      }
                    },
                    child: const Text('View Veg Details'),
                  ),
                ),
                Dimens.boxWidth10,
              ],
            ),
          ],
        );
      }),
    );
  }
}
