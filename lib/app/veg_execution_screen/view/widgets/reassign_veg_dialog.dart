import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignToVegDialog extends GetView {
  final int? id;
  AssignToVegDialog({this.id});

  final VegExecutionController controller = Get.find();

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
              "MC Id:",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            // Dimens.boxWidth10,
            SizedBox(width: 10),
            Text(
              "VE${id}",
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
            child: GetBuilder<VegExecutionController>(
              id: 'stock_Mangement',
              builder: (controller) {
                return Column(
                  children: [
                    Responsive.isDesktop(context)
                        ? Row(
                            children: [
                              CustomRichText(title: 'Assign To  '),
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
                                  selectedValue:
                                      controller.selectedAssignedTo.value,
                                  onValueChanged: controller.onValueChanged,
                                ),
                              ),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomRichText(title: 'Assign To'),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
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
                                    selectedValue:
                                        controller.selectedAssignedTo.value,
                                    onValueChanged: controller.onValueChanged,
                                  ),
                                ),
                              ],
                            ),
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
                          Get.offAllNamed(
                            Routes.vegExecutionScreen,
                          );
                          controller.assignToVeg(id: id ?? 0);
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
