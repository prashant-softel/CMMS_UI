import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WarrantyClaimListWeb extends GetView<WarrantyClaimController> {
  WarrantyClaimListWeb({super.key});

  final WarrantyClaimController controller = Get.find();

  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
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
            child: Obx(
              () => Container(
                  color: ColorValues.lightBlueishColor,
                  child: DefaultTabController(
                      length: 3,
                      child: Column(children: [
                        ///

                        Container(
                          height: 65,
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
                                child: Text(" / Inventory",
                                    style: Styles.greyMediumLight12),
                              ),
                              Text(" / Warranty Claim List",
                                  style: Styles.greyMediumLight12),
                              // Text(" / Create Checklist Number",
                              //     style: Styles.greyMediumLight12)
                              SizedBox(
                                width: 350,
                              ),
                            ],
                          ),
                        ),
                        Dimens.boxHeight30,

                        ///
                        CustomAppBar(
                          title: 'Warranty Claim List'.tr,
                          action: Row(
                            children: [
                              Container(
                                height: 30,
                                child: CustomElevatedButton(
                                  backgroundColor:
                                      ColorValues.appLightBlueColor,
                                  onPressed: () async {
                                    await Get.dialog(
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 350,
                                            right: 350,
                                            top: 200,
                                            bottom: 200),
                                        child: Container(
                                          color: ColorValues.whiteColor,
                                          child: SfDateRangePicker(
                                            cancelText: "CANCEL",
                                            confirmText: "Ok",
                                            showActionButtons: true,
                                            initialSelectedRange:
                                                PickerDateRange(
                                              controller.fromDate.value,
                                              controller.toDate.value,
                                            ),
                                            selectionMode:
                                                DateRangePickerSelectionMode
                                                    .range,
                                            monthCellStyle:
                                                DateRangePickerMonthCellStyle(
                                              todayCellDecoration:
                                                  BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: ColorValues
                                                          .appDarkBlueColor),
                                            ),
                                            onSubmit: (value) {
                                              PickerDateRange? data =
                                                  value as PickerDateRange;

                                              var pickUpDate = DateTime.parse(
                                                  data.startDate.toString());
                                              controller.fromDate.value =
                                                  pickUpDate;
                                              var dropDate = DateTime.parse(
                                                  data.endDate.toString());
                                              dropDate != null
                                                  ? controller.toDate.value =
                                                      dropDate
                                                  : controller.toDate.value =
                                                      pickUpDate;
                                              Get.back();
                                              controller
                                                  .getWarrantyClaimtListByDate();
                                            },
                                            onCancel: () => Get.back(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  text:
                                      'From Date: ${controller.formattedFromdate.toString()}  To Date: ${controller.formattedTodate.toString()}',
                                ),
                              ),
                              Dimens.boxWidth10,
                              ActionButton(
                                icon: Icons.add,
                                label: 'Add Warranty Claim',
                                onPressed: () {
                                  Get.toNamed(Routes.newWarrantyClaimList);
                                },
                                color: ColorValues.appGreenColor,
                              ),
                              Dimens.boxWidth10,
                            ],
                          ),
                        ),

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
                                text: 'PDF'.tr,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 620),
                              child: Container(
                                width: 200,
                                height: 35,
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
                            child: GetBuilder<WarrantyClaimController>(
                                id: 'warranty_claim_list',
                                builder: (controller) {
                                  return //
                                      Column(
                                          //
                                          children: [
                                        ///
                                        Expanded(
                                          child: ScrollableTableView(
                                            paginationController: controller
                                                .paginationWarrantyController,
                                            columns: [
                                              'WC Id',
                                              'Date of Claim',
                                              'Warranty Claim Title',
                                              'Equipment Serial No.',
                                              'Equipment Category',
                                              'Equipment Name',
                                              // 'Warranty Description',
                                              'Estimated Cost',
                                              // 'Quantity',
                                              'Status',
                                              'action'.tr,
                                            ].map((column) {
                                              return TableViewColumn(
                                                minWidth: Get.width * 0.1,
                                                label: column,
                                              );
                                            }).toList(),
                                            rows: [
                                              ...List.generate(
                                                controller
                                                    .warrantyClaimList.length,
                                                (index) => [
                                                  // AssetName(

                                                  //    '${controller.warrantyClaimList[index].wc_id}',
                                                  //   // 'dummy data',
                                                  //   1,
                                                  // ),
                                                  // index + 1,
                                                  '${controller.warrantyClaimList[index].wc_id}',
                                                  '${controller.warrantyClaimList[index].date_of_claim}',
                                                  '${controller.warrantyClaimList[index].warranty_claim_title}',
                                                  '${controller.warrantyClaimList[index].equipment_sr_no}',
                                                  '${controller.warrantyClaimList[index].equipment_category}',
                                                  '${controller.warrantyClaimList[index].equipment_name}',
                                                  // '${controller.warrantyClaimList[index].warranty_description}',
                                                  '${controller.warrantyClaimList[index].estimated_cost}',
                                                  // '${controller.warrantyClaimList[index].quantity}',
                                                  '${controller.warrantyClaimList[index].status}',
                                                  'Actions'
                                                ],
                                              ),
                                            ].map(
                                              (record) {
                                                return TableViewRow(
                                                  height: Get.height * 0.08,
                                                  cells: record.map(
                                                    (value) {
                                                      return TableViewCell(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            print(
                                                                'warrantyiddata:$value');
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
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              TableActionButton(
                                                                                color: ColorValues.appDarkBlueColor,
                                                                                icon: Icons.visibility,
                                                                                onPress: () {
                                                                                  controller.viewWarrantyClaim(wc_id: int.tryParse('${record[0]}'));
                                                                                  print('record:${int.tryParse('${record[0]}')}');
                                                                                },
                                                                              ),
                                                                              //),

                                                                              TableActionButton(
                                                                                color: ColorValues.appYellowColor,
                                                                                icon: Icons.edit,
                                                                                onPress: () {
                                                                                  controller.editWarrantyClaim(wc_id: int.tryParse('${record[0]}'));
                                                                                  print('edit record:${int.tryParse('${record[0]}')}');
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
                                                                  : Text(value
                                                                      .toString()),
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
                                                    .paginationWarrantyController,
                                                builder:
                                                    (context, value, child) {
                                                  return Row(
                                                    children: [
                                                      Text(
                                                          "${controller.paginationWarrantyController.currentPage}  of ${controller.paginationWarrantyController.pageCount}"),
                                                      Row(
                                                        children: [
                                                          IconButton(
                                                            onPressed: controller
                                                                        .paginationWarrantyController
                                                                        .currentPage <=
                                                                    1
                                                                ? null
                                                                : () {
                                                                    controller
                                                                        .paginationWarrantyController
                                                                        .previous();
                                                                  },
                                                            iconSize: 20,
                                                            splashRadius: 20,
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_back_ios_new_rounded,
                                                              color: controller
                                                                          .paginationWarrantyController
                                                                          .currentPage <=
                                                                      1
                                                                  ? Colors
                                                                      .black26
                                                                  : Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                            ),
                                                          ),
                                                          IconButton(
                                                            onPressed: controller
                                                                        .paginationWarrantyController
                                                                        .currentPage >=
                                                                    controller
                                                                        .paginationWarrantyController
                                                                        .pageCount
                                                                ? null
                                                                : () {
                                                                    controller
                                                                        .paginationWarrantyController
                                                                        .next();
                                                                  },
                                                            iconSize: 20,
                                                            splashRadius: 20,
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_forward_ios_rounded,
                                                              color: controller
                                                                          .paginationWarrantyController
                                                                          .currentPage >=
                                                                      controller
                                                                          .paginationWarrantyController
                                                                          .pageCount
                                                                  ? Colors
                                                                      .black26
                                                                  : Theme.of(
                                                                          context)
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
                        )
                      ]))),
            ),
          ),
        ],
      ),
    );
  }

  /// For WC List Screen Date Time
  Future pickDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedwarrantyClaimListDateTimeWeb.value;
    final date = await pickDate_web(context);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    controller.selectedwarrantyClaimListDateTimeWeb.value = dateTime;
    controller.warrantyClaimListDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.warrantyClaimListDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print(
        'FailureDateTime:${controller.warrantyClaimListDateTimeCtrlrWeb.text}');
    controller.warrantyClaimListDateTimeCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedwarrantyClaimListDateTimeWeb.value;
    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime_web(BuildContext context) async {
    DateTime dateTime = controller.selectedwarrantyClaimListDateTimeWeb.value;
    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }
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
