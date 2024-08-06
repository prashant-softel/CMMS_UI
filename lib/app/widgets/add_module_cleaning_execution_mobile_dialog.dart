import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../theme/dimens.dart';

class AddModuleCleaningExecutionMobileDialog extends GetView {
  final int? scheduleId;
  final int? cleaningDay;
  final int? waterUsed;
  final int? is_view;

  AddModuleCleaningExecutionMobileDialog({
    required this.scheduleId,
    required this.cleaningDay,
    required this.waterUsed,
    this.is_view,
  });

  final AddModuleCleaningExecutionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 10),
          contentPadding: EdgeInsets.all(10),
          titlePadding: EdgeInsets.all(10),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Update For Day", style: Styles.blue20),
                  SizedBox(width: 10),
                  Text(
                    "$cleaningDay",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Text('Remark: ', style: TextStyle(fontSize: 17)),
                  ),
                  Expanded(
                    child: LoginCustomTextfield(
                      width: MediaQuery.of(context).size.width * 0.4,
                      textController: controller.remarkCtrlrWeb,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text('Water Used: ', style: TextStyle(fontSize: 17)),
                  ),
                  Expanded(
                    child: LoginCustomTextfield(
                      width: MediaQuery.of(context).size.width * 0.2,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      textController: controller.waterUsedCtrlrWeb,
                    ),
                  ),
                ],
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                      3: FlexColumnWidth(1),
                      4: FlexColumnWidth(1),
                      5: FlexColumnWidth(1),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              // Increased height to prevent wrapping
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  "Assets",
                                  style: TextStyle(
                                    color: Color(0xff31576D),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              // Increased height to prevent wrapping
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  "Modules",
                                  style: TextStyle(
                                    color: Color(0xff31576D),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              height:
                                  130, // Increased height to prevent wrapping
                              child: Center(
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "Scheduled Day",
                                    style: TextStyle(
                                      color: Color(0xff31576D),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              // Increased height to prevent wrapping
                              child: Center(
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "Cleaned",
                                    style: TextStyle(
                                      color: Color(0xff31576D),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              // Increased height to prevent wrapping
                              child: Center(
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "Abandoned",
                                    style: TextStyle(
                                      color: Color(0xff31576D),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              // Increased height to prevent wrapping
                              child: Center(
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "Executed Day",
                                    style: TextStyle(
                                      color: Color(0xff31576D),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ...controller.equipmenTasktList.value.map((e) {
                  return Column(
                    children: [
                      Table(
                        columnWidths: {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(1),
                          3: FlexColumnWidth(1),
                          4: FlexColumnWidth(1),
                          5: FlexColumnWidth(1),
                        },
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      e.isExpanded = !e.isExpanded;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "${e?.invName}",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Icon(e!.isExpanded
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_drop_up)
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    "${e.moduleQuantity}",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              TableCell(child: Container()),
                              TableCell(
                                child: Center(
                                  child: IgnorePointer(
                                    ignoring: is_view == 1,
                                    child: Checkbox(
                                      value: e.isCleanedChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          e.isCleanedChecked =
                                              !e.isCleanedChecked!;
                                          if (e.isCleanedChecked!) {
                                            e.isAbandonedChecked = false;
                                          }
                                          e.smbs.forEach((smbItem) {
                                            if (!controller.check
                                                .containsKey(smbItem.smbName)) {
                                              smbItem.isCleanedSmbCheck =
                                                  e.isCleanedChecked;
                                              if (e.isCleanedChecked!) {
                                                smbItem.isAbandonSmbCheck =
                                                    false;
                                              }
                                            }
                                          });
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: IgnorePointer(
                                    ignoring: is_view == 1,
                                    child: Checkbox(
                                      value: e.isAbandonedChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          e.isAbandonedChecked =
                                              !e.isAbandonedChecked!;
                                          if (e.isAbandonedChecked!) {
                                            e.isCleanedChecked = false;
                                          }
                                          e.smbs.forEach((smbItem) {
                                            if (!controller.check
                                                .containsKey(smbItem.smbName)) {
                                              smbItem.isAbandonSmbCheck =
                                                  e.isAbandonedChecked;
                                              if (e.isAbandonedChecked!) {
                                                smbItem.isCleanedSmbCheck =
                                                    false;
                                              }
                                            }
                                          });
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(child: Container())
                            ],
                          ),
                        ],
                      ),
                      if (e.isExpanded)
                        Column(
                          children: e.smbs.map((smbItems) {
                            return Table(
                              columnWidths: {
                                0: FlexColumnWidth(2),
                                1: FlexColumnWidth(1),
                                2: FlexColumnWidth(1),
                                3: FlexColumnWidth(1),
                                4: FlexColumnWidth(1),
                                5: FlexColumnWidth(1),
                              },
                              children: [
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(smbItems.smbName ?? ""),
                                    ),
                                    TableCell(
                                      child: Center(
                                        child:
                                            Text("${smbItems.moduleQuantity}"),
                                      ),
                                    ),
                                    TableCell(
                                      child: Center(
                                        child: Text("${smbItems.scheduledDay}"),
                                      ),
                                    ),
                                    TableCell(
                                      child: Center(
                                        child: IgnorePointer(
                                          ignoring: is_view == 1 ||
                                              controller.check.containsKey(
                                                  smbItems.smbName),
                                          child: Checkbox(
                                            value: smbItems.isCleanedSmbCheck,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                smbItems.isCleanedSmbCheck =
                                                    !smbItems
                                                        .isCleanedSmbCheck!;
                                                if (smbItems
                                                    .isCleanedSmbCheck!) {
                                                  smbItems.isAbandonSmbCheck =
                                                      false;
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Center(
                                        child: IgnorePointer(
                                          ignoring: is_view == 1 ||
                                              controller.check.containsKey(
                                                  smbItems.smbName),
                                          child: Checkbox(
                                            value: smbItems.isAbandonSmbCheck,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                smbItems.isAbandonSmbCheck =
                                                    !smbItems
                                                        .isAbandonSmbCheck!;
                                                if (smbItems
                                                    .isAbandonSmbCheck!) {
                                                  smbItems.isCleanedSmbCheck =
                                                      false;
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Center(
                                        child: Text("${smbItems.executedDay}"),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }).toList(),
                        )
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
          actions: [
            is_view == 1
                ? Center(
                    child: Container(
                      height: 35,
                      child: CustomElevatedButton(
                        backgroundColor: ColorValues.redColor,
                        text: "Cancel",
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  )
                : Row(
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
                      SizedBox(width: 20),
                      Container(
                        height: 35,
                        child: CustomElevatedButton(
                          backgroundColor: ColorValues.greenColor,
                          text: 'Submit',
                          onPressed: () {
                            controller.updateMCScheduleExecution(
                              scheduleId: scheduleId,
                              cleaningDay: cleaningDay,
                              waterUsed: int.tryParse(
                                  controller.waterUsedCtrlrWeb.text),
                              remark: controller.remarkCtrlrWeb.text,
                            );
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
          ],
        );
      },
    );
  }
}
