import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/dimens.dart';

class VegetationExecutionDialog extends GetView<VegExecutionController> {
  final int? scheduleId;
  final int? cleaningDay;
  final int? is_view;
  bool expandAll = false;

  VegetationExecutionDialog({
    required this.scheduleId,
    required this.cleaningDay,
    this.is_view,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: ((context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          insetPadding: EdgeInsets.all(10),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Update For Day", style: Styles.blue20),
                  Dimens.boxWidth10,
                  Text(
                    "${cleaningDay}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Dimens.boxHeight15,
              Row(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 50),
                      Text('Remark: ', style: TextStyle(fontSize: 17)),
                      SizedBox(width: 5),
                      LoginCustomTextfield(
                        width: MediaQuery.of(context).size.width * .2,
                        textController: controller.remarkCtrlrWeb,
                      ),
                    ],
                  ),
                  Dimens.boxWidth200,
                ],
              ),
            ],
          ),
          content: Builder(
            builder: (context) {
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
                height: MediaQuery.of(context).size.height / 1.5,
                width: Get.width * .7,
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
                              child: Text(
                                "Area",
                                style: TextStyle(color: Color(0xff31576D)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Scheduled Day",
                                style: TextStyle(color: Color(0xff31576D)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Cleaned",
                                style: TextStyle(color: Color(0xff31576D)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Abandoned",
                                style: TextStyle(color: Color(0xff31576D)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Executed Day",
                                style: TextStyle(color: Color(0xff31576D)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]..addAll(
                        controller.vegTaskEquipment.map(
                          (e) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            e.isExpanded = !e.isExpanded;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                "${e?.invName}",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              e!.isExpanded
                                                  ? Icons.arrow_drop_down
                                                  : Icons.arrow_drop_up,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "${e.area}",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: IgnorePointer(
                                          ignoring: is_view == 1 ? true : false,
                                          child: Checkbox(
                                            value: e.isCleanedChecked,
                                            onChanged: (bool? value) {
                                              setState(
                                                () {
                                                  e.isCleanedChecked =
                                                      !e.isCleanedChecked;
                                                  if (e.isCleanedChecked) {
                                                    e.isAbandonedChecked =
                                                        false;
                                                  }
                                                  e.smbs?.forEach((smbItem) {
                                                    if (!controller.check
                                                        .containsKey(
                                                            smbItem.smbName)) {
                                                      smbItem.isCleanedSmbCheck =
                                                          e.isCleanedChecked;
                                                      if (e.isCleanedChecked) {
                                                        smbItem.isAbandonSmbCheck =
                                                            false;
                                                      }
                                                    }
                                                  });
                                                },
                                              );
                                              print(
                                                'Element Cancel:${e.isCleanedChecked}',
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: IgnorePointer(
                                          ignoring: is_view == 1 ? true : false,
                                          child: Checkbox(
                                            value: e.isAbandonedChecked,
                                            onChanged: (bool? value) {
                                              setState(
                                                () {
                                                  e.isAbandonedChecked =
                                                      !e.isAbandonedChecked;
                                                  if (e.isAbandonedChecked) {
                                                    e.isCleanedChecked = false;
                                                  }
                                                  e.smbs?.forEach((smbItem) {
                                                    if (!controller.check
                                                        .containsKey(
                                                            smbItem.smbName)) {
                                                      smbItem.isAbandonSmbCheck =
                                                          e.isAbandonedChecked;
                                                      if (e
                                                          .isAbandonedChecked) {
                                                        smbItem.isCleanedSmbCheck =
                                                            false;
                                                      }
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
                                    ),
                                    Expanded(flex: 1, child: Container())
                                  ],
                                ),
                                e.isExpanded
                                    ? Column(
                                        children: []..addAll(
                                            e.smbs!.map(
                                              (smbItems) {
                                                return Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Text(
                                                          smbItems.smbName ??
                                                              "",
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        "${smbItems.area}",
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        "${smbItems.scheduledDay}",
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: IgnorePointer(
                                                          ignoring: is_view ==
                                                                      1 ||
                                                                  controller
                                                                      .check
                                                                      .containsKey(
                                                                          smbItems
                                                                              .smbName)
                                                              ? true
                                                              : false,
                                                          child: Checkbox(
                                                            value: smbItems
                                                                .isCleanedSmbCheck,
                                                            onChanged:
                                                                (bool? value) {
                                                              setState(() {
                                                                smbItems.isCleanedSmbCheck =
                                                                    !smbItems
                                                                        .isCleanedSmbCheck;
                                                                if (smbItems
                                                                    .isCleanedSmbCheck) {
                                                                  smbItems.isAbandonSmbCheck =
                                                                      false;
                                                                }
                                                              });
                                                              print(
                                                                  'Element Cancel:${e.isCleanedChecked}');
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: IgnorePointer(
                                                          ignoring: is_view ==
                                                                      1 ||
                                                                  controller
                                                                      .check
                                                                      .containsKey(
                                                                          smbItems
                                                                              .smbName)
                                                              ? true
                                                              : false,
                                                          child: Checkbox(
                                                            value: smbItems
                                                                .isAbandonSmbCheck,
                                                            onChanged:
                                                                (bool? value) {
                                                              setState(() {
                                                                smbItems.isAbandonSmbCheck =
                                                                    !smbItems
                                                                        .isAbandonSmbCheck;
                                                                if (smbItems
                                                                    .isAbandonSmbCheck) {
                                                                  smbItems.isCleanedSmbCheck =
                                                                      false;
                                                                }
                                                              });
                                                              print(
                                                                  'Element Cancel:${smbItems.isAbandonSmbCheck}');
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        "${smbItems.executedDay}",
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
                            );
                          },
                        ),
                      ),
                  ),
                ),
              );
            },
          ),
          actions: [
            is_view == 1
                ? Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.redColor,
                            text: "Cancel",
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 35,
                          child: CustomElevatedButton(
                            backgroundColor:
                                const Color.fromARGB(255, 86, 116, 205),
                            text: expandAll ? 'Collapse' : 'Expand',
                            onPressed: () {
                              setState(() {
                                expandAll = !expandAll;
                                for (var item
                                    in controller.vegTaskEquipment.value) {
                                  item!.isExpanded = expandAll;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        child: CustomElevatedButton(
                          backgroundColor:
                              const Color.fromARGB(255, 86, 116, 205),
                          text: expandAll ? 'Collapse' : 'Expand',
                          onPressed: () {
                            setState(() {
                              expandAll = !expandAll;
                              for (var item
                                  in controller.vegTaskEquipment.value) {
                                item!.isExpanded = expandAll;
                              }
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 35,
                        child: CustomElevatedButton(
                          backgroundColor: ColorValues.redColor,
                          text: "Cancel",
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 35,
                        child: CustomElevatedButton(
                          backgroundColor: ColorValues.greenColor,
                          text: 'Submit',
                          onPressed: () {
                            controller.updateVegScheduleExecution(
                              scheduleId: scheduleId,
                              cleaningDay: cleaningDay,
                              remark: '${controller.remarkCtrlrWeb.text}',
                            );
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
          ],
        );
      }),
    );
  }
}
