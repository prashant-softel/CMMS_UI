import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TbtDoneMcDialog extends GetView {
  int? id;
  int? ptw_id;
  TbtDoneMcDialog({this.id, this.ptw_id});

  final AddModuleCleaningExecutionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        // contentPadding: EdgeInsets.zero,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Module Cleaning Id:",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Dimens.boxWidth10,
            Text(
              "MC${id}",
              style:
                  TextStyle(fontSize: 15, color: ColorValues.appDarkBlueColor),
            ),
          ],
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorValues.lightGreyColorWithOpacity35,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorValues.appBlueBackgroundColor,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.only(right: 30, top: 10),
            height: height / 4.7,
            // width: double.infinity,
            child: GetBuilder<AddModuleCleaningExecutionController>(
              id: 'stock_Mangement',
              builder: (controller) {
                return Column(
                  children: [
                    Spacer(),
                    Text(
                        "You unable to start the task,Please Complete the TBT first"),
                    Spacer(),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        style: Styles.darkRedElevatedButtonStyle,
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Cancel'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: Styles.greenElevatedButtonStyle,
                        onPressed: () {
                          Get.back();

                          controller.clearJobDetailStoreData();
                          controller.clearTypeStoreData();
                          controller.clearisCheckedtoreData();
                          controller.clearpmTaskValue();
                          controller.clearPermitStoreData();
                          controller.clearmcDetailsStoreData();

                          Get.toNamed(Routes.createPermit, arguments: {
                            "permitId": ptw_id,
                            "isChecked": false,
                            "type": 2,
                            "jobModel": controller.jobDetailsModel.value,
                            "pmTaskModel": controller.pmtaskViewModel.value,
                            "mcModel": controller.mcExecutionDetailsModel.value
                          });
                          // controller.assignToPmTask(id: id ?? 0);
                        },
                        child: const Text('Go for TBT'),
                      ),
                    ]),
                    Spacer(),
                  ],
                );
              },
            ),
          );
        }),
      );
    }));
  }
}
