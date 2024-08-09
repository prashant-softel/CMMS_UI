import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartVegExecutionMessageDialog extends GetView {
  final String? data;
  final List<dynamic>? startVegId;

  StartVegExecutionMessageDialog({super.key, this.data, this.startVegId});
  final VegExecutionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          data == "Plan Execution started"
              ? 'Start Vegetation Plan Execution'
              : 'Start Vegetation Execution',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${data} ',
                        style: TextStyle(color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                      Text('with id '),
                      Text(
                        '${startVegId}',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          Center(
            child: Row(
              children: [
                Spacer(),
                ElevatedButton(
                  style: Styles.darkBlueElevatedButtonStyle,
                  onPressed: () {
                    Get.offAllNamed(Routes.vegExecutionListScreen);
                    // _controller.getMCTaskList(_controller.facilityId, _controller.formattedTodate, _controller.formattedFromdate, true);

                    Get.back();
                  },
                  child: const Text('Execution List'),
                ),
                Spacer(),
                ElevatedButton(
                  style: Styles.darkBlueElevatedButtonStyle,
                  onPressed: () {
                    controller.setVegId();

                    controller.getVegExecutionDetail(
                      executionId: controller.vegexe.value,
                      facilityId: controller.facilityId.value,
                    );
                    controller.getVegTaskEquipmentList(
                      executionId: controller.vegexe.value,
                      facilityId: controller.facilityId.value,
                    );
                    controller.getAssignedToList(); //  });

                    Get.back();
                  },
                  child: const Text('View Execution'),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      );
    }));
  }
}
