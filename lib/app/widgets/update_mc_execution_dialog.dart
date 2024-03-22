import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class UpdateMCExecutionDialog extends GetView {
  List<dynamic>? mcExecutionId;
  String? data;

  UpdateMCExecutionDialog({super.key, this.mcExecutionId, this.data});
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
          '${data}',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green),
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
                  RichText(
                    text: TextSpan(
                      text: 'MC Execution Updated Successfully with Id ',
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
                ]),
          );
        }),
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
                    Get.offAllNamed(Routes.moduleCleaningListExecution);
                    // controller.getNewPermitList(_controller.facilityId, _controller.userId);
                    // controller.getWarrantyClaimList();
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
                      controller.getTypePermitList();
                    });

                    Future.delayed(Duration(seconds: 1), () {
                      controller.getInventoryCategoryList();
                    });
                    Future.delayed(Duration(seconds: 1), () {
                      controller.getMCTaskEquipmentList(
                          controller.taskId, true);
                    });

                    if (mcExecutionId![0] != null) {
                      Future.delayed(Duration(seconds: 1), () {
                        controller.getMCExecutionDetail(
                            executionId: controller.data['id']!, facilityId:controller.facilityId);
                      });
                    }

                    // Get.offAllNamed(Routes.addModuleCleaningExecutionContentWeb);
                  },
                  child: const Text('View MC Details'),
                ),
              ),
              Dimens.boxWidth10,
            ],
          ),
        ],
      );
    }));
  }
}
