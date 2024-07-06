import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class StartMcExecutionMessageDialog extends GetView {
  String? createPermitData;
  String? data;
  List<dynamic>? startMCId;

  StartMcExecutionMessageDialog(
      {super.key, this.createPermitData, this.data, this.startMCId});
  final AddModuleCleaningExecutionController controller = Get.find();

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
              ? 'Start MC Execution'
              : 'Start MC Schedule Execution',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

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
                      Text('${data} ',
                          style: TextStyle(color: Colors.green),
                          textAlign: TextAlign.center),
                      Text('with id '),
                      Text(
                        '${startMCId}',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ]),
          );
        }),
        actions: [
          Center(
            child: Row(
              children: [
                Spacer(),
                ElevatedButton(
                  style: Styles.darkBlueElevatedButtonStyle,
                  onPressed: () {
                    Get.offAllNamed(Routes.moduleCleaningListExecution);
                    // _controller.getMCTaskList(_controller.facilityId, _controller.formattedTodate, _controller.formattedFromdate, true);

                    Get.back();
                  },
                  child: const Text('Execution List'),
                ),
                Spacer(),
                ElevatedButton(
                  style: Styles.darkBlueElevatedButtonStyle,
                  onPressed: () {
                    controller.setMcId();

                    controller.getFacilityList();
                    controller.getInventoryCategoryList();
                    controller.getMCExecutionDetail(
                        executionId: controller.mcid.value,
                        facilityId: controller.facilityId);
                    controller.getMCTaskEquipmentList(
                        controller.mcid.value, true);
                    //  });

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
