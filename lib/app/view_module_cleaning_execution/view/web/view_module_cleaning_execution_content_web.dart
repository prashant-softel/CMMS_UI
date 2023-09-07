// import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_module_cleaning_execution/view_module_cleaning_execution_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ViewModuleCleaningExecutionContentWeb
    extends GetView<viewModuleCleaningExecutionController> {
  ViewModuleCleaningExecutionContentWeb({super.key});

  // final homeController = Get.find<HomeController>();
  final viewModuleCleaningExecutionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            // margin: Dimens.edgeInsets16,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(.3)),
            ),
            constraints: BoxConstraints(
              maxWidth: 1100,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        color: Color.fromARGB(255, 227, 224, 224),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 236, 234, 234)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: ColorValues.greyLightColor,
                        ),
                        Text(
                          "Dashboard",
                          style: Styles.greyLight14,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(" / Module Cleaning Execution List",
                              style: Styles.greyMediumLight12),
                        ),
                        Text(" / View Module Cleaning Execution",
                            style: Styles.greyMediumLight12)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    // width: MediaQuery.of(context).size.width / 1,
                    // height: MediaQuery.of(context).size.height / 0.8,
                    child: Card(
                      // color: Colors.lightBlue.shade50,
                      child: Wrap(
                        children: [
                          GetBuilder<viewModuleCleaningExecutionController>(
                              id: 'vew-module-cleaning-execution',
                              builder: (controller) {
                                return Obx(
                                  () => Column(
                                    children: [
                                      CustomAppBar(
                                        title:
                                            'View Module Cleaning Execution'
                                                .tr,
                                      ),
                                      Dimens.boxHeight24,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              CustomRichText(
                                                  title: 'Plan Title: '),
                                              Dimens.boxHeight20,
                                              CustomRichText(
                                                  title: 'Frequency: '),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ' ${controller.mcExecutionDetailsModel.value?.title}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 92, 163)),
                                              ),
                                              Dimens.boxHeight15,
                                              Text(
                                                ' ${controller.mcExecutionDetailsModel.value?.frequency}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 92, 163)),
                                              ),
                                            ],
                                          ),
                                          Dimens.boxWidth30,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              CustomRichText(
                                                  title: 'Planned By: '),
                                              Dimens.boxHeight20,
                                              CustomRichText(
                                                  title: 'Start Date: '),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ' ${controller.mcExecutionDetailsModel.value?.plannedBy}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 92, 163)),
                                              ),
                                              Dimens.boxHeight15,
                                              Text(
                                                ' ${controller.startedAtDateTimeCtrlrWeb.text}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 92, 163)),
                                              ),
                                            ],
                                          ),
                                          Dimens.boxWidth30,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              CustomRichText(
                                                  title:
                                                      'Planning Date & Time: '),
                                              Dimens.boxHeight20,
                                              CustomRichText(
                                                  title:
                                                      'Execution started by: '),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ' ${controller.plannedAtDateTimeCtrlrWeb.text}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 92, 163)),
                                              ),
                                              Dimens.boxHeight15,
                                              Text(
                                                ' ${controller.mcExecutionDetailsModel.value?.startedBy}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 92, 163)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),

                                      Dimens.boxHeight50,

                                      ///Schedule Execution
                                      SizedBox(
                                        height:  ((controller
                                                                  .listSchedules
                                                                  ?.length ??
                                                              0) *
                                                          40) +
                                                      220,
                                        width: MediaQuery.of(context)
                                                .size
                                                .width /
                                            1.45,
                                        child: Center(
                                          child: Container(
                                             margin: Dimens.edgeInsets16,
                                            height: Get.height,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(.3)),
                                               boxShadow: [
                                            BoxShadow(
                                              color: ColorValues
                                                  .appBlueBackgroundColor,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                            ),
                                            constraints: BoxConstraints(
                                              maxWidth: 1100,
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                 
                                                   Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Schedule Execution",
                                                    style: Styles.blue700,
                                                  ),
                                                ],
                                              ),
                                              ),
                                               Divider(
                                              color:
                                                  ColorValues.greyLightColour,
                                              ),
                                                  Dimens.boxHeight10,
                                                  Wrap(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                1.5,
                                                            child: Container(
                                                              height:
                                                                  Get.height / 4.5,
                                                              child: Column(
                                                                  //
                                                                  children: [
                                                                    Expanded(
                                                                      child: //
                                                                          ScrollableTableView(
                                                                                 // paginationController: controller.equipmentNamepaginationController,
                                                                               columns:
                                                                              [
                                                                            "Schedule Id",
                                                                            "Execution Id",
                                                                            "Days",
                                                                            "Scheduled Module",
                                                                            "Cleaned",
                                                                            "Abandoned",
                                                                            "Pending",
                                                                            "Type",
                                                                            "Water Used",
                                                                            "Start Date",
                                                                            "End Date",
                                                                          "Remark",
                                                                            "Status",
                                                                            'Execution'.tr,
                                                                              ].map((column) {
                                                                            return TableViewColumn(
                                                                            minWidth: Get.width * 0.1,
                                                                              label: column == "Schedule Id"
                                                                                  ? "Schedule Id"
                                                                                  :column == "Execution Id"
                                                                                      ? "Execution Id"
                                                                                  :column == "Days"
                                                                                      ? "Days"
                                                                                  : column == "Scheduled Module"
                                                                                      ? "Scheduled Module"
                                                                                  : column == "Cleaned"
                                                                                      ? "Cleaned"
                                                                                  : column == "Abandoned"
                                                                                      ? "Abandoned"
                                                                                  : column == "Pending"
                                                                                      ? "Pending"
                                                                                  : column == "Type"
                                                                                      ? "Type"
                                                                                  : column == "Water Used"
                                                                                      ? "Water Used"
                                                                                  : column == "Start Date"
                                                                                      ? "Start Date"
                                                                                  : column == "End Date"
                                                                                      ? "End Date"
                                                                                : column == "Remark"
                                                                                    ? "Remark"
                                                                                   : column == "Status"
                                                                                      ? "Status"
                                                                                      : "Execution",
                                                                            );
                                                                                }).toList(),
                                                                               rows: //
                                                                              [
                                                                            ...List.generate(
                                                                              ///controller.selectedEquipmentNameIdList
                                                                              controller.listSchedules?.length ?? 0,
                                                                          
                                                                              (index) {
                                                                                var schedulesDetails = controller.listSchedules![index];
                                                                          
                                                                                //_jobId = jobDetails?.id;
                                                                          
                                                                                // controller.id.value = employeeNameDetails?.id ?? 0;
                                                                                // print('schedule5:${controller}');
                                                                                return [
                                                                                  '${schedulesDetails?.scheduleId ?? ''}',
                                                                                  '${schedulesDetails?.executionId ?? ''}',
                                                                                  '${schedulesDetails?.cleaningDay ?? ''}',
                                                                                  '${schedulesDetails?.scheduledModules ?? ''}',
                                                                                  '${schedulesDetails?.cleanedModules ?? ''}',
                                                                                  '${schedulesDetails?.abandonedModules ?? ''}',
                                                                                  '${schedulesDetails?.pendingModules ?? ''}',
                                                                                  '${schedulesDetails?.cleaningTypeName ?? ''}',
                                                                                  '${schedulesDetails?.waterUsed ?? ''}',
                                                                                  '${schedulesDetails?.execution_date ?? ''}',
                                                                                  '${schedulesDetails?.execution_date ?? ''}',
                                                                                '${schedulesDetails?.remark ?? ''}',
                                                                                  '${schedulesDetails?.status_short ?? ''}',
                                                                                  'Execution'
                                                                                ];
                                                                              },
                                                                            ),
                                                                             ].map((_record) {
                                                                            return TableViewRow(
                                                                                onTap: () => {
                                                                                      print('ZERO = ${_record[0]}')
                                                                                    },
                                                                                height: 25,
                                                                                cells: _record.map((value) {
                                                                                  return TableViewCell(
                                                                                    //key: ,
                                                                                    child: (value == 'Execution')
                                                                                        ? Wrap(
                                                                                            children: [
                                                                                              TableActionButton(
                                                                                                color: ColorValues.appDarkBlueColor,
                                                                                                icon: Icons.remove_red_eye_outlined,
                                                                                                message: 'View',
                                                                                                onPress: () {
                                                                                                  // controller.showNewPermitListDetails(
                                                                                                  //     controller.permitId.value);
                                                                                                },
                                                                                              ),
                                                                                              // TableActionButton(
                                                                                              //   color: ColorValues.purpleColor,
                                                                                              //   icon: Icons.add,
                                                                                              //   label: 'Job Card',
                                                                                              //   onPress: () {
                                                                                              //     // controller.goToJobCardScreen(
                                                                                              //     //   int.tryParse(_newPermitList[0]),
                                                                                              //     // );
                                                                                              //   },
                                                                                              // ),
                                                                                              // TableActionButton(
                                                                                              //   color: Colors.blue,
                                                                                              //   icon: Icons.edit,
                                                                                              //   label: 'Edit PTW',
                                                                                              //   onPress: () {},
                                                                                              // ),
                                                                                              // TableActionButton(
                                                                                              //   color: Colors.green,
                                                                                              //   icon: Icons.visibility,
                                                                                              //   label: 'Approve Request',
                                                                                              //   onPress: () {},
                                                                                              // ),
                                                                                              // TableActionButton(
                                                                                              //   color: Colors.red,
                                                                                              //   icon: Icons.visibility,
                                                                                              //   label: 'Reject Request',
                                                                                              //   onPress: () {},
                                                                                              // ),
                                                                                            ],
                                                                                          )
                                                                                        : Text(value.toString()),
                                                                                  );
                                                                                }).toList());
                                                                                                                                                }).toList(),
                                                                                                                                              ),
                                                                          ),
                                                                    
                                            
                                                                    /// PAGINATION
                                                                   
                                                                  ]),
                                                            ),
                                                          ),
                                            
                                                          // SizedBox(
                                                          //   width: MediaQuery.of(context)
                                                          //           .size
                                                          //           .width /
                                                          //       1.2,
                                                          //   child:
                                                          //       Divider(
                                                          //     thickness:
                                                          //         2,
                                                          //   ),
                                                          // ),
                                                          // SizedBox(
                                                          //   height: 50,
                                                          // ),
                                                          // Center(
                                                          //     child: Text(
                                                          //         'List will appear here')
                                                          //         )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      

                                      ///MC Execution History
                                      Container(
                                        margin: Dimens.edgeInsets20,
                                        height: ((controller
                                                                  .historyList
                                                                  ?.length ??
                                                              0) *
                                                          50) +
                                                      120,
                                        width: MediaQuery.of(context)
                                                .size
                                                .width /
                                            1.5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorValues
                                                .lightGreyColorWithOpacity35,
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorValues
                                                  .appBlueBackgroundColor,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "MC Execution History ",
                                                    style: Styles.blue700,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color:
                                                  ColorValues.greyLightColour,
                                            ),
                                            Expanded(
                                              child: Theme(
                                                 data: ThemeData(
                                                              scrollbarTheme: ScrollbarThemeData(
                                                                  isAlwaysShown:
                                                                      false,
                                                                  thumbColor: MaterialStateProperty.all<
                                                                          Color>(
                                                                      Colors
                                                                          .transparent))),
                                                child: ScrollableTableView(
                                                  columns: [
                                                    "Time Stamp",
                                                    "Posted By",
                                                    "Comment",
                                                    "Location",
                                                    "Status",
                                                  ].map((column) {
                                                    return TableViewColumn(
                                                      label: column,
                                                      minWidth:
                                                      Get.width * 0.13,
                                                    );
                                                  }).toList(),
                                                  rows: [
                                                    ...List.generate(
                                                      controller.historyList
                                                              ?.length ??
                                                          0,
                                                      (index) {
                                                        var getHistoryListDetails =
                                                            controller
                                                                    .historyList?[
                                                                index];
                                                        return [
                                                          '${getHistoryListDetails?.createdAt}',
                                                          '${getHistoryListDetails?.createdByName ?? ''}',
                                                          '${getHistoryListDetails?.comment ?? ''}',
                                                          '--',
                                                          '${getHistoryListDetails?.status_name ?? ''}',
                                                        ];
                                                      },
                                                    ),
                                                  ].map((record) {
                                                    return TableViewRow(
                                                      height: 45,
                                                      cells:
                                                          record.map((value) {
                                                        return TableViewCell(
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 150,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          CustomElevatedButton(
                                            backgroundColor: Colors.red,
                                            onPressed: () {
                                              // controller.saveAsDraft();
                                            },
                                            text: 'Cancel',
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            height: 28,
                                            child: CustomElevatedButton(
                                              icon: Icons.print_outlined,
                                              backgroundColor: ColorValues
                                                  .appDarkBlueColor,
                                              text: "Print",
                                              onPressed: () {
                                                // controller.printScreen();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
