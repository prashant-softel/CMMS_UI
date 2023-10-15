import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/view/stock_management_add_goods_orders_web.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../theme/dimens.dart';
// import '../view_incident_report/view_incident_report_controller.dart';

class AddModuleCleaningExecutionDialog extends GetView {
  int? scheduleId;
  int? cleaningDay;
  int? waterUsed;
  // int? day;

  AddModuleCleaningExecutionDialog({
    required this.scheduleId,
    required this.cleaningDay,
    required this.waterUsed,
    // required this.day
  });

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
            Text("Update For Day", style: Styles.blue17),
            Dimens.boxWidth10,
            Text(
              "${cleaningDay}",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                CustomRichText(title: 'Remark: '),
                SizedBox(
                  width: 5,
                ),
                GoodsOrderTextField(
                  keyboardType: TextInputType.number,
                  // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  textController: controller.remarkCtrlrWeb,
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width / 5,
                //   child: MultiSelectDialogField(
                //     dialogWidth: 300,
                //     dialogHeight: 400,
                //     // title: 'Select Equipments',
                //     // buttonText: 'Equipment Category',
                //     initialValue:
                //         (controller.selectedEquipmentCategoryIdList.isNotEmpty)
                //             ? controller.selectedEquipmentCategoryIdList
                //             : [],
                //     items: controller.equipmentCategoryList
                //         .map(
                //           (equipmentCategory) => MultiSelectItem(
                //             equipmentCategory?.id,
                //             equipmentCategory?.name ?? '',
                //           ),
                //         )
                //         .toList(),
                //     onConfirm: (selectedOptionsList) => {
                //       controller
                //           .equipmentCategoriesSelected(selectedOptionsList),
                //       print(
                //           'Equipment list ids ${controller.selectedEquipmentCategoryIdList}')
                //     },
                //   ),
                // )
              ],
            ),
            Dimens.boxWidth200,
            Row(
              children: [
                CustomRichText(title: 'Water Used: '),
                Dimens.boxWidth20,
                GoodsOrderTextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  textController: controller.waterUsedCtrlrWeb,
                ),
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
              height: height / 1.5,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Assets",
                            style: TextStyle(color: Color(0xff31576D)),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("Modules",
                              style: TextStyle(color: Color(0xff31576D))),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("Cleaned",
                              style: TextStyle(color: Color(0xff31576D))),
                        ),
                        Expanded(
                            flex: 1,
                            child: Text("Abandoned",
                                style: TextStyle(color: Color(0xff31576D)))),
                        Expanded(
                            flex: 1,
                            child: Text("Days",
                                style: TextStyle(color: Color(0xff31576D)))),

                        // Expanded(
                        //     child: Text("Day",
                        //         style: TextStyle(color: Color(0xff31576D)))),
                      ],
                    ),
                  )
                ]..addAll(controller.equipmentList.value.map((e) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 2,
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
                                  flex: 1,
                                  child: Text(
                                    "${e.moduleQuantity}",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Checkbox(
                                      value: e.isCleanedChecked,
                                      onChanged: (bool? value) {
                                        // controller.toggleItemSelection(index);
                                        setState(
                                          () {
                                            e.isCleanedChecked =
                                                !e.isCleanedChecked!;
                                            if (e.isCleanedChecked!) {
                                              e.isAbandonedChecked = false;
                                            }
                                            e.smbs.forEach((smbItem) {
                                              smbItem.isCleanedSmbCheck =
                                                  e.isCleanedChecked;
                                              if (e.isCleanedChecked!) {
                                                smbItem.isAbandonSmbCheck =
                                                    false;
                                              }
                                            });
                                          },
                                        );
                                        print(
                                            'Element Cancel:${e.isCleanedChecked}');
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Checkbox(
                                      value: e.isAbandonedChecked,
                                      onChanged: (bool? value) {
                                        // controller.toggleItemSelection(index);
                                        setState(
                                          () {
                                            e.isAbandonedChecked =
                                                !e.isAbandonedChecked!;
                                            if (e.isAbandonedChecked!) {
                                              e.isCleanedChecked = false;
                                            }
                                            e.smbs.forEach((smbItem) {
                                              smbItem.isAbandonSmbCheck =
                                                  e.isAbandonedChecked;
                                              if (e.isAbandonedChecked!) {
                                                smbItem.isCleanedSmbCheck =
                                                    false;
                                              }
                                            });
                                          },
                                        );
                                        print(
                                            'Element Cancel:${e.isAbandonedChecked}');
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(flex: 1, child: Container())
                              ],
                            ),
                            e.isExpanded
                                ? Column(
                                    children: []..addAll(
                                        e.smbs.map(
                                          (smbItems) {
                                            return Row(
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                        smbItems.smbName ??
                                                            "")),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        "${smbItems.moduleQuantity}")),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Checkbox(
                                                      value: smbItems
                                                          .isCleanedSmbCheck,
                                                      onChanged: (bool? value) {
                                                        // controller.toggleItemSelection(index);
                                                        setState(
                                                          () {
                                                            smbItems.isCleanedSmbCheck =
                                                                !smbItems
                                                                    .isCleanedSmbCheck!;
                                                            if (smbItems
                                                                .isCleanedSmbCheck!) {
                                                              smbItems.isAbandonSmbCheck =
                                                                  false;
                                                            }
                                                          },
                                                        );

                                                        print(
                                                            'Element Cancel:${e.isCleanedChecked}');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Checkbox(
                                                      value: smbItems
                                                          .isAbandonSmbCheck,
                                                      onChanged: (bool? value) {
                                                        // controller.toggleItemSelection(index);
                                                        setState(
                                                          () {
                                                            smbItems.isAbandonSmbCheck =
                                                                !smbItems
                                                                    .isAbandonSmbCheck!;
                                                            if (smbItems
                                                                .isAbandonSmbCheck!) {
                                                              smbItems.isCleanedSmbCheck =
                                                                  false;
                                                            }
                                                          },
                                                        );

                                                        print(
                                                            'Element Cancel:${smbItems.isAbandonSmbCheck}');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        'Day 1 (15/06/2023)'))
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                  )
                                : Dimens.box0
                          ],
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
                    controller.updateMCScheduleExecution(
                        scheduleId: scheduleId,
                        cleaningDay: cleaningDay,
                        waterUsed: int.tryParse(
                            '${controller.waterUsedCtrlrWeb.text}'),
                        remark: '${controller.remarkCtrlrWeb.text}');
                    Get.back();
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
