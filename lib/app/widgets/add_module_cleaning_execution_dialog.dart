import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
// import '../view_incident_report/view_incident_report_controller.dart';

class AddModuleCleaningExecutionDialog extends GetView {
  int? scheduleId;
  int? cleaningDay;
  int? waterUsed;

  AddModuleCleaningExecutionDialog({required this.scheduleId, required this.cleaningDay, required this.waterUsed,});


  final AddModuleCleaningExecutionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets0_0_10_0,
        title: Row(
          children: [
            Text(
              "Set Equipments",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                CustomRichText(title: 'Type: '),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: MultiSelectDialogField(
                    dialogWidth: 300,
                    dialogHeight: 400,
                    // title: 'Select Equipments',
                    // buttonText: 'Equipment Category',
                    initialValue:
                        (controller.selectedEquipmentCategoryIdList.isNotEmpty)
                            ? controller.selectedEquipmentCategoryIdList
                            : [],
                    items: controller.equipmentCategoryList
                        .map(
                          (equipmentCategory) => MultiSelectItem(
                            equipmentCategory?.id,
                            equipmentCategory?.name ?? '',
                          ),
                        )
                        .toList(),
                    onConfirm: (selectedOptionsList) => {
                      controller
                          .equipmentCategoriesSelected(selectedOptionsList),
                      print(
                          'Equipment list ids ${controller.selectedEquipmentCategoryIdList}')
                    },
                  ),
                )
              ],
            ),
            Dimens.boxWidth200,
            Row(
              children: [
                CustomRichText(title: 'Water Used: '),
                Dimens.boxWidth20,
                Text('1000 ltr'),
              ],
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
              // padding: EdgeInsets.only(right: 120, top: 10),
              height: height / 1.5,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Assets",
                            style: TextStyle(color: Color(0xff31576D)),
                          ),
                        ),
                        Expanded(
                          child: Text("Modules",
                              style: TextStyle(color: Color(0xff31576D))),
                        ),
                        Expanded(
                          child: Text("Cleaned",
                              style: TextStyle(color: Color(0xff31576D))),
                        ),
                        Expanded(
                            child: Text("Abandoned",
                                style: TextStyle(color: Color(0xff31576D)))),
                        // Expanded(
                        //     child: Text("Day",
                        //         style: TextStyle(color: Color(0xff31576D)))),
                      ],
                    ),
                  )
                ]..addAll(controller.equipmentList.value.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            e.isExpanded = !e.isExpanded;
                                          },
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            "${e?.invName}",
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(e!.isExpanded
                                              ? Icons.arrow_drop_down
                                              : Icons.arrow_drop_up)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${e.moduleQuantity}",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Checkbox(
                                      value: e.isChecked,
                                      onChanged: (bool? value) {
                                        // controller.toggleItemSelection(index);
                                        setState(
                                          () {
                                            e.isChecked = !e.isChecked!;
                                          },
                                        );
                                        print('Element Cancel:${e.isChecked}');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              e.isExpanded
                                  ? Column(
                                      children: []..addAll(
                                          e.smbs.map(
                                            (smbItems) {
                                              return Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                          smbItems.smbName ??
                                                              "")),
                                                  Expanded(
                                                      child: Text(
                                                          "${smbItems.moduleQuantity}")),
                                                  Expanded(
                                                    child: Checkbox(
                                                      value: e.isChecked,
                                                      onChanged: (bool? value) {
                                                        // controller.toggleItemSelection(index);
                                                        setState(
                                                          () {
                                                            e.isChecked =
                                                                !e.isChecked!;
                                                          },
                                                        );

                                                        print(
                                                            'Element Cancel:${e.isChecked}');
                                                      },
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Checkbox(
                                                      value: e.isChecked,
                                                      onChanged: (bool? value) {
                                                        // controller.toggleItemSelection(index);
                                                        setState(
                                                          () {
                                                            e.isChecked =
                                                                !e.isChecked!;
                                                          },
                                                        );

                                                        print(
                                                            'Element Cancel:${e.isChecked}');
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                    )
                                  : Dimens.box0
                            ],
                          ),
                        );
                      }))),
              ));
        }),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.greenColor,
                  text: 'Submit',
                  onPressed: () {
                    // controller.createMcPlan();
                    controller.updateMCScheduleExecution(scheduleId: scheduleId, cleaningDay: cleaningDay, waterUsed: waterUsed);
                  },
                ),
              ),
              Dimens.boxWidth20,
              Container(
                height: 35,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.redColor,
                  text: "Cancel",
                  onPressed: () {
                    final _flutterSecureStorage =
                        // const FlutterSecureStorage();

                        // _flutterSecureStorage.delete(
                        // key: "userId");

                        Get.back();
                  },
                ),
              ),
            ],
          ),
        ],
      );
    }));
  }
}
