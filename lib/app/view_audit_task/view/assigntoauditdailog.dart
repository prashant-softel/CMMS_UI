import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/view_audit_task/view_audit_task_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignToAuditTaskDialog extends GetView {
  int? id;
  AssignToAuditTaskDialog({this.id});

  final ViewAuditTaskController controller = Get.find();

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
              "Audit Task Id:",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            // Dimens.boxWidth10,
            SizedBox(width: 10),
            Text(
              "AUD${id}",
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
            child: GetBuilder<ViewAuditTaskController>(
              id: 'stock_Mangement',
              builder: (controller) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomRichText(title: 'Assign To  '),
                        // Dimens.boxWidth10,
                        SizedBox(width: 10),
                        SizedBox(
                          height: 30,
                          width: MediaQuery.of(context).size.width / 7,
                          child: DropdownWebWidget(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                              ),
                              BoxShadow(
                                color: ColorValues.whiteColor,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                            controller: controller,
                            dropdownList: controller.assignedToList,
                            isValueSelected:
                                controller.isAssignedToSelected.value,
                            selectedValue: controller.selectedAssignedTo.value,
                            onValueChanged: controller.onDropdownValueChanged,
                          ),
                        ),
                      ],
                    ),
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
                          controller.assignToAuditTask(id: id ?? 0);
                        },
                        child: const Text('Submit'),
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
