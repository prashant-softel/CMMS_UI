import 'package:cmms/app/app.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class EscalationMatrixListWeb extends GetView<EscalationMatrixListController> {
  EscalationMatrixListWeb({super.key});

  final EscalationMatrixListController controller = Get.find();

  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: HeaderWidget(),
              elevation: 0,
            ),
      // drawer: //
      //     (Responsive.isMobile(context) || Responsive.isTablet(context))
      //         ? Dimens.box0 //ResponsiveSideMenu()
      //         : HomeDrawer(),
      body: Row(
        children: [
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? Dimens.box0
              : HomeDrawer(),
          Expanded(
            child: Container(
                color: ColorValues.lightBlueishColor,
                child: DefaultTabController(
                  length: 3,
                  child: Column(children: [
                    ///

                    Container(
                      height: 45,
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
                            "DASHBOARD",
                            style: Styles.greyLight14,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(" / Escalation Matrix List",
                                style: Styles.greyMediumLight12),
                          ),
                          // Text(" / Create Checklist Number",
                          //     style: Styles.greyMediumLight12)
                          SizedBox(
                            width: 400,
                          ),
                          // ActionButton(
                          //   icon: Icons.calendar_month,
                          //   label: 'December 3rd 2022',
                          //   // onPress: () {
                          //   //   // Get.to(() => AddInventory());
                          //   //   // _buildStartDateField_mobile(context);
                          //   // },
                          //   color: Colors.green,
                          //   onPressed: () {},
                          // ),
                        ],
                      ),
                    ),
                    Dimens.boxHeight20,

                    ///
                    SizedBox(
                      height: 60,
                      child: CustomAppBar(
                        title: 'Escalation Matrix List'.tr,
                        action: Row(
                          children: [
                            // ActionButton(
                            //   icon: Icons.all_inbox,
                            //   label: 'All',
                            //   onPressed: () {},
                            //   color: Colors.blue,
                            // ),
                            // Dimens.boxWidth10,
                            // ActionButton(
                            //   icon: Icons.close,
                            //   label: 'Closed',
                            //   onPressed: () {
                            //     // var file = "assets/files/Fixed Asset Imports.xlsx";
                            //     // var bytes = File(file).readAsBytesSync();
                            //     // var excel = Excel.decodeBytes(bytes);

                            //     // for (var table in excel.tables.keys) {
                            //     //   print(table); //sheet Name
                            //     //   print(excel.tables[table]?.maxCols);
                            //     //   print(excel.tables[table]?.maxRows);
                            //     //   for (var row in excel.tables[table]!.rows) {
                            //     //     print("QWERTY $row");
                            //     //   }
                            //     // }
                            //   },
                            //   color: Colors.green,
                            // ),
                            // CustomTextField(
                            //   label: 'Select Date & Time:',
                            //   suffixIcon: Icon(
                            //     Icons.calendar_month,
                            //   ),
                            //   // textController:
                            //   //     controller.categoryTextController,
                            //   textController: controller
                            //       .incidentReportListDateTimeCtrlrWeb,

                            //   onTap: () {
                            //     pickDateTime_web(context);
                            //   },
                            // ),

                            ///From and To Date Range

                            // Container(
                            //   height: 30,
                            //   child: CustomElevatedButton(
                            //     backgroundColor:
                            //         ColorValues.appLightBlueColor,
                            //     onPressed: () async {
                            //       await Get.dialog(
                            //         Padding(
                            //           padding: const EdgeInsets.only(
                            //               left: 350,
                            //               right: 350,
                            //               top: 200,
                            //               bottom: 200),
                            //           child: Container(
                            //             color: ColorValues.whiteColor,
                            //             child: SfDateRangePicker(
                            //               cancelText: "CANCEL",
                            //               confirmText: "Ok",
                            //               showActionButtons: true,
                            //               initialSelectedRange:
                            //                   PickerDateRange(
                            //                 controller.fromDate.value,
                            //                 controller.toDate.value,
                            //               ),
                            //               selectionMode:
                            //                   DateRangePickerSelectionMode
                            //                       .range,
                            //               monthCellStyle:
                            //                   DateRangePickerMonthCellStyle(
                            //                 todayCellDecoration:
                            //                     BoxDecoration(
                            //                         shape: BoxShape.circle,
                            //                         color: ColorValues
                            //                             .appDarkBlueColor),
                            //               ),
                            //               onSubmit: (value) {
                            //                 PickerDateRange? data =
                            //                     value as PickerDateRange;

                            //                 var pickUpDate = DateTime.parse(
                            //                     data.startDate.toString());
                            //                 controller.fromDate.value =
                            //                     pickUpDate;
                            //                 var dropDate = DateTime.parse(
                            //                     data.endDate.toString());
                            //                 dropDate != null
                            //                     ? controller.toDate.value =
                            //                         dropDate
                            //                     : controller.toDate.value =
                            //                         pickUpDate;
                            //                 Get.back();
                            //                 // controller
                            //                 //     .getIncidentReportListByDate();
                            //               },
                            //               onCancel: () => Get.back(),
                            //             ),
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //     text:
                            //         'From Date: ${controller.formattedFromdate.toString()}  To Date: ${controller.formattedTodate.toString()}',
                            //   ),
                            // ),

                            Dimens.boxWidth10,
                            ActionButton(
                              icon: Icons.add,
                              label: 'Add Escalation Matrix',
                              onPressed: () {
                                Get.toNamed(
                                    Routes.addEscalatiomMatrixContentWeb);
                              },
                              color: ColorValues.appGreenColor,
                            ),
                            Dimens.boxWidth10,
                            // ActionButton(
                            //   icon: Icons.close,
                            //   lable: 'retireAsset'.tr,
                            //   onPress: () async {
                            //     // ByteData data = await rootBundle
                            //     //     .load("assets/files/Fixed Asset Imports.xlsx");
                            //     // var bytes = data.buffer
                            //     //     .asUint8List(data.offsetInBytes, data.lengthInBytes);
                            //     // var excel = Excel.decodeBytes(bytes);

                            //     // for (var table in excel.tables.keys) {
                            //     //   print(table); //sheet Name
                            //     //   print(excel.tables[table]?.maxCols);
                            //     //   print(excel.tables[table]?.maxRows);
                            //     //   for (var row in excel.tables[table]!.rows) {
                            //     //     print("QWERTY $row");
                            //     //   }
                            //     // }
                            //   },
                            //   color: Colors.red,
                            // ),
                          ],
                        ),
                      ),
                    ),

                    ///
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Container(
                    //     width: 400,
                    //     child: TabBar(
                    //       tabs: [
                    //         CustomTabBar(
                    //           label: 'listView'.tr,
                    //           icon: Icons.menu,
                    //         ),
                    //         CustomTabBar(
                    //           label: 'treeView'.tr,
                    //           icon: Icons.account_tree_sharp,
                    //         ),
                    //         CustomTabBar(
                    //           label: 'mapView'.tr,
                    //           icon: Icons.location_on,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    ///
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          margin: EdgeInsets.only(left: 10),
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'columnVisibility'.tr,
                          ),
                        ),
                        Container(
                          height: 35,
                          margin: EdgeInsets.only(left: 10),
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'Copy'.tr,
                          ),
                        ),
                        Container(
                          height: 35,
                          margin: EdgeInsets.only(left: 10),
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'Excel'.tr,
                          ),
                        ),
                        Container(
                          height: 35,
                          margin: EdgeInsets.only(left: 10),
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'PDF'.tr,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 450),
                          child: Container(
                            width: 200,
                            height: 40,
                            margin: Dimens.edgeInsets0_0_16_0,
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                contentPadding: Dimens.edgeInsets10_0_0_0,
                                hintText: 'search'.tr,
                                hintStyle: Styles.grey12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    ///

                    Expanded(
                      child: Container(
                        child: GetBuilder<EscalationMatrixListController>(
                            id: 'escalator_matrix_list',
                            builder: (controller) {
                              return //
                                  Column(children: [
                                ///

                                Expanded(
                                  child: ScrollableTableView(
                                    // paginationController: controller
                                    //     .paginationEscalationMatrixController,
                                    columns: [
                                      'Module',
                                      'Status',
                                      'action'.tr,
                                    ].map((column) {
                                      return TableViewColumn(
                                        minWidth: Get.width * 0.27,
                                        label: column,
                                      );
                                    }).toList(),
                                    rows: [
                                      // ...List.generate(
                                      //   controller
                                      //       .incidentReportList.length,
                                      //   (index) => [
                                      //     // AssetName(

                                      //     //    '${controller.warrantyClaimList[index].wc_id}',
                                      //     //   // 'dummy data',
                                      //     //   1,
                                      //     // ),
                                      //     // index + 1,
                                      //     '${controller.incidentReportList[index].id}',
                                      //     '${controller.incidentReportList[index].description}',
                                      //     '${controller.incidentReportList[index].equipment_name}',
                                      //     '${controller.incidentReportList[index].approved_by}',
                                      //     '${controller.incidentReportList[index].approved_at}',
                                      //     '${controller.incidentReportList[index].block_name}',
                                      //     '${controller.incidentReportList[index].created_at}',
                                      //     '${controller.incidentReportList[index].status}',
                                      //     'Actions'
                                      //   ],
                                      // ),
                                      ["Job", "Created", "Actions"],
                                      ["Job", "Assigned", "Actions"],
                                      ["Job", "Linked", "Actions"],
                                      ["Job Card", "Approved", "Actions"],
                                      ["Incident", "Linked", "Actions"],
                                      ["Job", "Created", "Actions"]
                                    ].map(
                                      (record) {
                                        return TableViewRow(
                                          height: Get.height * 0.1,
                                          onTap: () {},
                                          cells: record.map(
                                            (value) {
                                              return TableViewCell(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    print(
                                                        'incidentreportiddata:$value');
                                                    // controller.viewIncidentReport(
                                                    //     id: int.tryParse(
                                                    //         '${record[0]}'));
                                                  },
                                                  child:
                                                      // value.runtimeType
                                                      //             .toString() ==
                                                      //         'AssetName'
                                                      //     ? Builder(builder: (context) {
                                                      //         final val =
                                                      //             value as AssetName;
                                                      //         return Column(
                                                      //           children: [
                                                      //             Align(
                                                      //               alignment: Alignment
                                                      //                   .centerLeft,
                                                      //               child: Padding(
                                                      //                 padding: Dimens
                                                      //                     .edgeInsets8,
                                                      //                 child: Text(
                                                      //                     '${val.name}'),
                                                      //               ),
                                                      //             ),
                                                      //             Spacer(),
                                                      //             Align(
                                                      //               alignment: Alignment
                                                      //                   .centerRight,
                                                      //               child: Container(
                                                      //                 padding: Dimens
                                                      //                     .edgeInsets8_2_8_2,
                                                      //                 decoration:
                                                      //                     BoxDecoration(
                                                      //                   // color: val.requirementStatus ==
                                                      //                   //         1
                                                      //                   //     ? Colors.red
                                                      //                   //     : Colors
                                                      //                   //         .green,
                                                      //                   borderRadius:
                                                      //                       BorderRadius
                                                      //                           .circular(
                                                      //                               4),
                                                      //                 ),
                                                      //                 child: Text(
                                                      //                   // val.name == 1
                                                      //                   //     ? 'requirementRejected'
                                                      //                   //         .tr
                                                      //                   //     : 'requirementAccepted'
                                                      //                   //         .tr,
                                                      //                   // style: Styles
                                                      //                   //     .white10
                                                      //                   //     .copyWith(
                                                      //                   //   color: Colors
                                                      //                   //       .white,
                                                      //                   // ),
                                                      //                   '',

                                                      //                 ),
                                                      //               ),
                                                      //             ),
                                                      //             Dimens.boxHeight10,
                                                      //           ],
                                                      //         );
                                                      //       })
                                                      //     :
                                                      value == 'Actions'
                                                          ? Wrap(
                                                              children: [
                                                                Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      TableActionButton(
                                                                        color: ColorValues
                                                                            .appDarkBlueColor,
                                                                        icon: Icons
                                                                            .visibility,
                                                                        onPress:
                                                                            () {
                                                                          controller.viewEscalationMatrix(id: 0);
                                                                          // print('record:${int.tryParse('${record[0]}')}');
                                                                        },
                                                                      ),
                                                                      //),

                                                                      TableActionButton(
                                                                        color: ColorValues
                                                                            .appYellowColor,
                                                                        icon: Icons
                                                                            .edit,
                                                                        onPress:
                                                                            () {
                                                                          // controller.editIncidentReport(id: int.tryParse('${record[0]}'));
                                                                          // print('edit record:${int.tryParse('${record[0]}')}');
                                                                        },
                                                                      ),

                                                                      TableActionButton(
                                                                        color: Colors
                                                                            .red,
                                                                        icon: Icons
                                                                            .delete,
                                                                        onPress:
                                                                            () {
                                                                          // Get.dialog(IncidentReportRejectDialog(id: record[0]));
                                                                          // controller.viewNewPermitList(permitId: int.tryParse(_newPermitList[0]));
                                                                        },
                                                                      ),

                                                                      //),

                                                                      // TableActionButton(
                                                                      //   color: Colors.red,
                                                                      //   icon:
                                                                      //       Icons.delete,
                                                                      //   label: 'Delete',
                                                                      //   onPress: () {},
                                                                      // ),
                                                                      //),
                                                                    ]),

                                                                // TableActionButton(
                                                                //   color: Colors.green,
                                                                //   icon: Icons
                                                                //       .visibility,
                                                                //   label:
                                                                //       'Approve Request',
                                                                //   onPress: () {},
                                                                // ),
                                                                // TableActionButton(
                                                                //   color: Colors.red,
                                                                //   icon: Icons
                                                                //       .visibility,
                                                                //   label:
                                                                //       'Reject Request',
                                                                //   onPress: () {},
                                                                // ),
                                                              ],
                                                            )
                                                          : Text(
                                                              value.toString()),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),

                                // paginated
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: ValueListenableBuilder(
                                        valueListenable: controller
                                            .paginationEscalationMatrixController,
                                        builder: (context, value, child) {
                                          return Row(
                                            children: [
                                              Text(
                                                  "${controller.paginationEscalationMatrixController.currentPage}  of ${controller.paginationEscalationMatrixController.pageCount}"),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: controller
                                                                .paginationEscalationMatrixController
                                                                .currentPage <=
                                                            1
                                                        ? null
                                                        : () {
                                                            controller
                                                                .paginationEscalationMatrixController
                                                                .previous();
                                                          },
                                                    iconSize: 20,
                                                    splashRadius: 20,
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_back_ios_new_rounded,
                                                      color: controller
                                                                  .paginationEscalationMatrixController
                                                                  .currentPage <=
                                                              1
                                                          ? Colors.black26
                                                          : Theme.of(context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: controller
                                                                .paginationEscalationMatrixController
                                                                .currentPage >=
                                                            controller
                                                                .paginationEscalationMatrixController
                                                                .pageCount
                                                        ? null
                                                        : () {
                                                            controller
                                                                .paginationEscalationMatrixController
                                                                .next();
                                                          },
                                                    iconSize: 20,
                                                    splashRadius: 20,
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      color: controller
                                                                  .paginationEscalationMatrixController
                                                                  .currentPage >=
                                                              controller
                                                                  .paginationEscalationMatrixController
                                                                  .pageCount
                                                          ? Colors.black26
                                                          : Theme.of(context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                ),

                                ///
                              ]);

                              //);
                            }),
                      ),
                    ),
                  ]),
                )),
          ),
        ],
      ),
    );
  }

  /// For Incident Report List Screen Date Time
  // Future pickDateTime_web(BuildContext context) async {
  //   var dateTime = controller.selectedIncidentReportListDateTimeWeb.value;
  //   final date = await pickDate_web(context);
  //   if (date == null) {
  //     return;
  //   }

  //   final time = await pickTime_web(context);
  //   if (time == null) {
  //     return;
  //   }

  //   dateTime = DateTime(
  //     date.year,
  //     date.month,
  //     date.day,
  //     time.hour,
  //     time.minute,
  //   );
  //   controller.selectedIncidentReportListDateTimeWeb.value = dateTime;
  //   controller.incidentReportListDateTimeCtrlrWeb
  //     ..text = DateFormat('yyyy-MM-dd HH:mm').format(dateTime)
  //     ..selection = TextSelection.fromPosition(
  //       TextPosition(
  //         offset: controller.incidentReportListDateTimeCtrlrWeb.text.length,
  //         affinity: TextAffinity.upstream,
  //       ),
  //     );
  //   print(
  //       'FailureDateTime:${controller.incidentReportListDateTimeCtrlrWeb.text}');
  //   controller.incidentReportListDateTimeCtrlrWebBuffer =
  //       DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  // }

  // Future<DateTime?> pickDate_web(BuildContext context) async {
  //   DateTime? dateTime = controller.selectedIncidentReportListDateTimeWeb.value;
  //   //final initialDate = DateTime.now();
  //   final newDate = await showDatePicker(
  //     context: context,
  //     initialDate: dateTime,
  //     firstDate: DateTime(DateTime.now().year - 5),
  //     lastDate: DateTime(DateTime.now().year + 5),
  //   );

  //   if (newDate == null) return null;

  //   return newDate;
  // }

  // Future<TimeOfDay?> pickTime_web(BuildContext context) async {
  //   DateTime dateTime = controller.selectedIncidentReportListDateTimeWeb.value;
  //   //final initialTime = TimeOfDay(hour: 12, minute: 0);
  //   final newTime = await showTimePicker(
  //       context: context,
  //       initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
  //       builder: (BuildContext context, Widget? child) {
  //         return Theme(
  //           data: ThemeData.light(),
  //           child: child!,
  //         );
  //       });

  //   if (newTime == null) {
  //     return null;
  //   }

  //   return newTime;
  // }
}

//  Widget _buildStartDateField_mobile(BuildContext context) {
//   return Column(//
//       children: [
//     Align(
//       alignment: Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10),
//         child: RichText(
//           text: TextSpan(
//               text: 'Start Date: ', style: Styles.blackBold16, children: []
//               ),
//         ),
//       ),
//     ),
//     Dimens.boxHeight5,
//     Padding(
//       padding: const EdgeInsets.only(right: 10, left: 10),
//       child: Container(
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               offset: const Offset(
//                 5.0,
//                 5.0,
//               ),
//               blurRadius: 5.0,
//               spreadRadius: 1.0,
//             ), //BoxShadow
//             BoxShadow(
//               color: ColorValues.whiteColor,
//               offset: const Offset(0.0, 0.0),
//               blurRadius: 0.0,
//               spreadRadius: 0.0,
//             ), //BoxShadow
//           ],
//           color: ColorValues.whiteColor,
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width / 1.1,
//           child: TextField(

//             onTap: () {
//               pickDateTime_mobile(context);
//             },
//             controller: controller.startDateTimeCtrlr,
//             autofocus: false,
//             decoration: InputDecoration(
//               fillColor: ColorValues.whiteColor,
//               filled: true,
//               contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
//               border: InputBorder.none,
//               enabledBorder: InputBorder.none,
//               focusedBorder: InputBorder.none,
//               // focusedErrorBorder:
//               //     controller.isJobTitleInvalid.value
//               //         ? OutlineInputBorder(
//               //             borderRadius:
//               //                 BorderRadius.circular(5),
//               //             borderSide: BorderSide(
//               //               color: ColorsValue.redColorDark,
//               //             ),
//               //           )
//               //         : InputBorder.none,
//               // errorBorder:
//               //     controller.isJobTitleInvalid.value
//               //         ? OutlineInputBorder(
//               //             borderRadius:
//               //                 BorderRadius.circular(5),
//               //             borderSide: BorderSide(
//               //               color: ColorsValue.redColorDark,
//               //             ),
//               //           )
//               //         : null,
//               // errorText: controller.isJobTitleInvalid.value
//               //     ? "Required field"
//               //     : null,
//             ),
//             onChanged: (value) {
//               // if (value.trim().length > 3) {
//               //   controller.isJobTitleInvalid.value = false;
//               // } else {
//               //   controller.isJobTitleInvalid.value = true;
//               // }
//             },
//           ),
//         ),
//       ),
//     ),
//     Dimens.boxHeight20,
//   ]);
// }
// Future pickDateTime_mobile(BuildContext context) async {
//   var dateTime = controller.selectedBreakdownTime.value;
//   final date = await pickDate_mobile(context);
//   if (date == null) {
//     return;
//   }

//   final time = await pickTime_mobile(context);
//   if (time == null) {
//     return;
//   }

//   dateTime = DateTime(
//     date.year,
//     date.month,
//     date.day,
//     time.hour,
//     time.minute,
//   );
//   controller.selectedBreakdownTime.value = dateTime;
//   controller.startDateTimeCtrlr
//     ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
//     ..selection = TextSelection.fromPosition(
//       TextPosition(
//         offset: controller.startDateTimeCtrlr.text.length,
//         affinity: TextAffinity.upstream,
//       ),
//     );
// }

// // Future<DateTime?> pickDate_mobile(BuildContext context) async {
// //   DateTime? dateTime = controller.selectedBreakdownTime.value;
// //   //final initialDate = DateTime.now();
// //   final newDate = await showDatePicker(
// //     context: context,
// //     initialDate: dateTime,
// //     firstDate: DateTime(DateTime.now().year - 5),
// //     lastDate: DateTime(DateTime.now().year + 5),
// //   );

// //   if (newDate == null) return null;

// //   return newDate;
// // }

// Future<TimeOfDay?> pickTime_mobile(BuildContext context) async {
//   DateTime dateTime = controller.selectedBreakdownTime.value;
//   //final initialTime = TimeOfDay(hour: 12, minute: 0);
//   final newTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: ThemeData.light(),
//           child: child!,
//         );
//       });

//   if (newTime == null) {
//     return null;
//   }

//   return newTime;
// }
