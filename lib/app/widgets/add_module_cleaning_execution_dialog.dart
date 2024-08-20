import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../theme/dimens.dart';

class AddModuleCleaningExecutionDialog extends GetView {
  int? scheduleId;
  int? cleaningDay;
  int? waterUsed;
  int? is_view;

  bool expandAll = false; // Track the expand/collapse state

  AddModuleCleaningExecutionDialog(
      {required this.scheduleId,
      required this.cleaningDay,
      required this.waterUsed,
      this.is_view});

  final AddModuleCleaningExecutionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
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
                SizedBox(width: 10),
                Text(
                  "$cleaningDay",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text('Remark: ', style: TextStyle(fontSize: 17)),
                    SizedBox(
                      width: 5,
                    ),
                    LoginCustomTextfield(
                      width: (MediaQuery.of(context).size.width * .2),
                      keyboardType: TextInputType.number,
                      textController: controller.remarkCtrlrWeb,
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    CustomRichText(title: 'Water Used: '),
                    SizedBox(
                      width: 5,
                    ),
                    LoginCustomTextfield(
                      width: (MediaQuery.of(context).size.width * .2),
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
                          child: Text("Scheduled Day",
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
                            child: Text("Executed Day",
                                style: TextStyle(color: Color(0xff31576D)))),
                      ],
                    ),
                  )
                ]..addAll(controller.equipmenTasktList.value.map((e) {
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
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
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
                                                  !e.isCleanedChecked!;
                                              if (e.isCleanedChecked!) {
                                                e.isAbandonedChecked = false;
                                              }
                                              e.smbs.forEach((smbItem) {
                                                if (!controller.check
                                                    .containsKey(
                                                        smbItem.smbName)) {
                                                  smbItem.isCleanedSmbCheck =
                                                      e.isCleanedChecked;
                                                  if (e.isCleanedChecked!) {
                                                    smbItem.isAbandonSmbCheck =
                                                        false;
                                                  }
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
                                                  !e.isAbandonedChecked!;
                                              if (e.isAbandonedChecked!) {
                                                e.isCleanedChecked = false;
                                              }
                                              e.smbs.forEach((smbItem) {
                                                if (!controller.check
                                                    .containsKey(
                                                        smbItem.smbName)) {
                                                  smbItem.isAbandonSmbCheck =
                                                      e.isAbandonedChecked;
                                                  if (e.isAbandonedChecked!) {
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
                                        e.smbs.map(
                                          (smbItems) {
                                            return Row(
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
                                                  child: Text(
                                                      "${smbItems.scheduledDay}"),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: IgnorePointer(
                                                      ignoring: is_view == 1 ||
                                                              controller.check
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
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: IgnorePointer(
                                                      ignoring: is_view == 1 ||
                                                              controller.check
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
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        "${smbItems.executedDay}")),
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
                                  in controller.equipmenTasktList.value) {
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
                                in controller.equipmenTasktList.value) {
                              item!.isExpanded = expandAll;
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 20),
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
                          if (controller.waterUsedCtrlrWeb.text.isEmpty) {
                            Get.defaultDialog(
                              title: 'Validation Error',
                              content: Text('Please enter water used.'),
                              confirm: CustomElevatedButton(
                                backgroundColor: ColorValues.greenColor,
                                text: 'OK',
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            );
                          } else {
                            controller.updateMCScheduleExecution(
                                scheduleId: scheduleId,
                                cleaningDay: cleaningDay,
                                waterUsed: int.tryParse(
                                    controller.waterUsedCtrlrWeb.text),
                                remark: controller.remarkCtrlrWeb.text);
                            Get.back();
                          }
                        },
                      ),
                    ),
                  ],
                )
        ],
      );
    }));
  }
}
