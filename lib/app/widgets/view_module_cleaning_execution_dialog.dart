import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/view_module_cleaning_execution/view_module_cleaning_execution_controller.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/dimens.dart';
// import '../view_incident_report/view_incident_report_controller.dart';

class viewModuleCleaningExecutionDialog extends GetView {
  // int? scheduleId;
  // int? cleaningDay;
  int? waterUsed;
  String? remark;
  Schedules schedule;
  Map mappedData;
  // int? day;

  viewModuleCleaningExecutionDialog(
      {
      // required this.scheduleId,
      // required this.cleaningDay,
      required this.waterUsed,
      required this.remark,
      required this.schedule,
      required this.mappedData
      // required this.day
      });

  final viewModuleCleaningExecutionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.selectedSchedule = schedule;
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets0_0_10_0,
        title: Column(
          children: [
            Text("View Equipments", style: Styles.blue17),
            Dimens.boxHeight20,
            Row(
              children: [
                // Dimens.boxWidth10,
                // Text(
                //   "",
                //   style: TextStyle(
                //     fontSize: 15,
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Remark:', style: Styles.blue17),
                    Dimens.boxWidth20,
                    Text(
                      '${remark}',
                      style: Styles.black17,
                    )
                    // GoodsOrderTextField(
                    //   keyboardType: TextInputType.number,
                    //   // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    //   textController: controller.waterUsedCtrlrWeb,
                    // ),
                  ],
                ),

                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Water Used:', style: Styles.blue17),
                    Dimens.boxWidth20,
                    Text(
                      '${waterUsed}',
                      style: Styles.black17,
                    )
                    // GoodsOrderTextField(
                    //   keyboardType: TextInputType.number,
                    //   // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    //   textController: controller.waterUsedCtrlrWeb,
                    // ),
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

                        // Expanded(
                        //     child: Text("Day",
                        //         style: TextStyle(color: Color(0xff31576D)))),
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
                                    child: Checkbox(
                                      value: e.isCleanedChecked,
                                      onChanged: (bool? value) {
                                        // controller.toggleItemSelection(index);

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

                                        print(
                                            'Element Cancel:${e.isAbandonedChecked}');
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(flex: 1, child: Container())
                              ],
                            ),
                            true || e.isExpanded
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
                                                        ("${smbItems.smbName}"))),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        "${smbItems.moduleQuantity}")),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        "${mappedData[smbItems.smbId]?["cleaningDay"] ?? ''}")),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Checkbox(
                                                      value: mappedData[smbItems
                                                                  .smbId]?[
                                                              "isCleanedSmbCheck"] ??
                                                          true,
                                                      onChanged: (bool? value) {
                                                        // controller.toggleItemSelection(index);

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
                                                      value: mappedData[smbItems
                                                                  .smbId]?[
                                                              "isAbandonSmbCheck"] ??
                                                          true,
                                                      onChanged: (bool? value) {
                                                        // controller.toggleItemSelection(index);

                                                        print(
                                                            'Element Cancel:${smbItems.isAbandonSmbCheck}');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 1, child: Text(''))
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       height: 35,
          //       child: CustomElevatedButton(
          //         backgroundColor: ColorValues.greenColor,
          //         text: 'Submit',
          //         onPressed: () {
          //           // controller.createMcPlan();
          //           controller.updateMCScheduleExecution(scheduleId: scheduleId, cleaningDay: cleaningDay, waterUsed: waterUsed);
          //           Get.back();
          //         },
          //       ),
          //     ),
          //     Dimens.boxWidth20,
          //     Container(
          //       height: 35,
          //       child: CustomElevatedButton(
          //         backgroundColor: ColorValues.redColor,
          //         text: "Cancel",
          //         onPressed: () {
          //           final _flutterSecureStorage =
          //               // const FlutterSecureStorage();

          //               // _flutterSecureStorage.delete(
          //               // key: "userId");

          //               Get.back();
          //         },
          //       ),
          //     ),
          //   ],
          // ),
        ],
      );
    }));
  }
}
