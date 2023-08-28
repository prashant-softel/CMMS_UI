import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/return_mrs/return_mrs_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';

class ReturnMrsListContentWeb extends StatefulWidget {
  ReturnMrsListContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ReturnMrsListContentWeb> createState() =>
      _ReturnMrsListContentWebState();
}

class _ReturnMrsListContentWebState extends State<ReturnMrsListContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReturnMrsListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(() => Column(children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 227, 224, 224),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                        child: Text(" / STOCK MANAGEMENT",
                            style: Styles.greyMediumLight12),
                      ),
                      Text(" / RETURN MRS LIST",
                          style: Styles.greyMediumLight12),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(children: [
                      Container(
                        width: Get.width * 7,
                        margin: EdgeInsets.only(left: 10, top: 30),
                        height: Get.height,
                        child: Card(
                          color: Color.fromARGB(255, 245, 248, 250),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Return Material Requsition Slip",
                                      style: Styles.blackBold16,
                                    ),
                                    Spacer(),
                                    // Row(
                                    //   children: [
                                    //     CustomRichText(title: 'Date Range'),
                                    //     Dimens.boxWidth10,
                                    //     CustomTextFieldForStock(
                                    //       width:
                                    //           MediaQuery.of(context).size.width / 5,
                                    //       numberTextField: true,
                                    //       onTap: () {
                                    //         controller
                                    //                 .openFromDateToStartDatePicker =
                                    //             !controller
                                    //                 .openFromDateToStartDatePicker;
                                    //         controller
                                    //             .update(['stock_Mangement_Date']);
                                    //       },
                                    //       hintText:
                                    //           '${controller.formattedTodate.toString()} To ${controller.formattedFromdate.toString()}',
                                    //     ),
                                    //   ],
                                    // ),
                                    // Dimens.boxWidth15,
                                    ActionButton(
                                      icon: Icons.add,
                                      label: "Add New",
                                      onPressed: () {
                                        Get.toNamed(Routes.mrsReturnScreen);
                                      },
                                      color: ColorValues.addNewColor,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () {},
                                        text: 'Copy'),
                                  ),
                                  Container(
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () {},
                                        text: 'Excel'),
                                  ),
                                  Container(
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () {},
                                        text: 'PDF'),
                                  ),
                                  Container(
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appLightBlueColor,
                                      onPressed: () {},
                                      text: 'columnVisibility'.tr,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
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
                                        contentPadding:
                                            Dimens.edgeInsets10_0_0_0,
                                        hintText: 'search'.tr,
                                        hintStyle: Styles.grey12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              controller.mrsList!.isEmpty
                                  ? Expanded(
                                      child: ScrollableTableView(
                                        columns: [
                                          "MRS ID",
                                          "MRS Details",
                                          "Order Date",
                                          "Activity",
                                          "Where Used",
                                          "Action",
                                        ].map((column) {
                                          return TableViewColumn(
                                            label: column,
                                            minWidth: Get.width * 0.16,
                                          );
                                        }).toList(),
                                        rows: [
                                          ...List.generate(
                                            controller.mrsList!.length,
                                            (index) {
                                              return [
                                                "",
                                                '',
                                                '',
                                                '',
                                                '',
                                                '',
                                              ];
                                            },
                                          ),
                                        ].map((record) {
                                          return TableViewRow(
                                            height: 80,
                                            cells: record.map((value) {
                                              return TableViewCell(
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          );
                                        }).toList(),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                        margin: Dimens.edgeInsets15,
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
                                        child: ScrollableTableView(
                                            paginationController:
                                                controller.paginationController,
                                            columns: [
                                              "MRS ID",
                                              "MRS Details",
                                              "Order Date",
                                              "Activity",
                                              "Where Used",
                                              "Action",
                                            ].map((column) {
                                              return TableViewColumn(
                                                label: column,
                                                minWidth: Get.width * 0.13,
                                              );
                                            }).toList(),
                                            rows: controller.mrsList!
                                                .map(
                                                    (mrsListDetails) =>
                                                        TableViewRow(
                                                            height: 60,
                                                            cells: [
                                                              TableViewCell(
                                                                  child: Column(
                                                                children: [
                                                                  Text(
                                                                    '${mrsListDetails?.id}',
                                                                  ),
                                                                  Dimens
                                                                      .boxHeight10,
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          Dimens
                                                                              .edgeInsets8_2_8_2,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            // controller
                                                                            //             .mrsList!
                                                                            //             .firstWhere(
                                                                            //               (e) => e?.id == mrsListDetails!.id,
                                                                            //               orElse: () => ReturnMrsListModel(id: 00),
                                                                            //             )
                                                                            //             ?.status ==
                                                                            //         322
                                                                            //     ? ColorValues
                                                                            //         .rejectedStatusColor
                                                                            //     : controller
                                                                            //                 .mrsList!
                                                                            //                 .firstWhere(
                                                                            //                   (e) => e?.id == mrsListDetails!.id,
                                                                            //                   orElse: () => ReturnMrsListModel(id: 00),
                                                                            //                 )
                                                                            //                 ?.status ==
                                                                            //             321
                                                                            //         ? ColorValues
                                                                            //             .submitColor
                                                                            //         : controller.mrsList!
                                                                            //                     .firstWhere(
                                                                            //                       (e) => e?.id == mrsListDetails!.id,
                                                                            //                       orElse: () => ReturnMrsListModel(id: 00),
                                                                            //                     )
                                                                            //                     ?.status ==
                                                                            //                 323
                                                                            //             ? ColorValues.approveStatusColor
                                                                            //             : controller.mrsList!
                                                                            //                         .firstWhere(
                                                                            //                           (e) => e?.id == mrsListDetails!.id,
                                                                            //                           orElse: () => ReturnMrsListModel(id: 00),
                                                                            //                         )
                                                                            //                         ?.status ==
                                                                            //                     324
                                                                            //                 ? ColorValues.issueStatusColor
                                                                            //                 : controller.mrsList!
                                                                            //                             .firstWhere(
                                                                            //                               (e) => e?.id == mrsListDetails!.id,
                                                                            //                               orElse: () => ReturnMrsListModel(id: 00),
                                                                            //                             )
                                                                            //                             ?.status ==
                                                                            //                         326
                                                                            //                     ? ColorValues.approveStatusColor
                                                                            //                     : controller.mrsList!
                                                                            //                                 .firstWhere(
                                                                            //                                   (e) => e?.id == mrsListDetails!.id,
                                                                            //                                   orElse: () => ReturnMrsListModel(id: 00),
                                                                            //                                 )
                                                                            //                                 ?.status ==
                                                                            //                             325
                                                                            //                         ? ColorValues.rejectedStatusColor
                                                                            //  :
                                                                            ColorValues.addNewColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(4),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        '${mrsListDetails?.status_short}',
                                                                        style: Styles
                                                                            .white10
                                                                            .copyWith(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )),
                                                              TableViewCell(
                                                                  child: Text(
                                                                      "Requested by:${mrsListDetails?.requested_by_name ?? ""}\nIssued by:${mrsListDetails?.approver_name ?? ""}")),
                                                              TableViewCell(
                                                                  child: Text(
                                                                      '${mrsListDetails?.requestd_date}')),
                                                              TableViewCell(
                                                                  child: Text(
                                                                      '${mrsListDetails?.activity}')),
                                                              TableViewCell(
                                                                  child: Text(
                                                                '${mrsListDetails?.whereUsedType}',
                                                              )),
                                                              TableViewCell(
                                                                  child: Wrap(
                                                                      children: [
                                                                    TableActionButton(
                                                                      color: ColorValues
                                                                          .viewColor,
                                                                      icon: Icons
                                                                          .remove_red_eye_outlined,
                                                                      message:
                                                                          "View",
                                                                      onPress:
                                                                          () {
                                                                        final _flutterSecureStorage =
                                                                            const FlutterSecureStorage();

                                                                        _flutterSecureStorage.delete(
                                                                            key:
                                                                                "mrsId");
                                                                        int mrsId =
                                                                            mrsListDetails?.id ??
                                                                                0;
                                                                        if (mrsId !=
                                                                            null) {
                                                                          Get.toNamed(
                                                                              Routes.returnMrsView,
                                                                              arguments: {
                                                                                'mrsId': mrsId
                                                                              });
                                                                        }
                                                                      },
                                                                    ),
                                                                    TableActionButton(
                                                                      color: ColorValues
                                                                          .editColor,
                                                                      icon: Icons
                                                                          .edit,
                                                                      message:
                                                                          'edit',
                                                                      onPress:
                                                                          () {
                                                                        final _flutterSecureStorage =
                                                                            const FlutterSecureStorage();

                                                                        _flutterSecureStorage.delete(
                                                                            key:
                                                                                "mrsId");
                                                                        int mrsId =
                                                                            mrsListDetails?.id ??
                                                                                0;
                                                                        if (mrsId !=
                                                                            null) {
                                                                          Get.toNamed(
                                                                              Routes.mrsReturnScreen,
                                                                              arguments: mrsId);
                                                                        }
                                                                      },
                                                                    ),
                                                                    // controller.mrsList!
                                                                    //                 .firstWhere(
                                                                    //                   (e) => e?.id == mrsListDetails!.id,
                                                                    //                   orElse: () => MrsListModel(id: 00),
                                                                    //                 )
                                                                    //                 ?.status ==
                                                                    //             321 &&
                                                                    //         controller.mrsList!
                                                                    //                 .firstWhere(
                                                                    //                   (e) => e?.id == mrsListDetails!.id,
                                                                    //                   orElse: () => MrsListModel(id: 00),
                                                                    //                 )
                                                                    //                 ?.approval_status ==
                                                                    //             0
                                                                    //     ?
                                                                    TableActionButton(
                                                                      color: ColorValues
                                                                          .approveColor,
                                                                      icon: Icons
                                                                          .check,
                                                                      message:
                                                                          'Approve',
                                                                      onPress:
                                                                          () {
                                                                        final _flutterSecureStorage =
                                                                            const FlutterSecureStorage();

                                                                        _flutterSecureStorage.delete(
                                                                            key:
                                                                                "mrsId");
                                                                        int mrsId =
                                                                            mrsListDetails?.id ??
                                                                                0;
                                                                        if (mrsId !=
                                                                            null) {
                                                                          Get.toNamed(
                                                                              Routes.approverReturnMrs,
                                                                              arguments: {
                                                                                'mrsId': mrsId
                                                                              });
                                                                        }
                                                                      },
                                                                    ),
                                                                    //     : Dimens.box0,
                                                                    // controller.mrsList!
                                                                    //             .firstWhere(
                                                                    //               (e) => e?.id == mrsListDetails!.id,
                                                                    //               orElse: () => MrsListModel(id: 00),
                                                                    //             )
                                                                    //             ?.status ==
                                                                    //         323
                                                                    //     ?
                                                                    // TableActionButton(
                                                                    //   color: ColorValues
                                                                    //       .issueColor,
                                                                    //   icon: Icons.report,
                                                                    //message: 'issue',
                                                                    //   onPress: () {
                                                                    //     int mrsId =
                                                                    //         mrsListDetails
                                                                    //                 ?.id ??
                                                                    //             0;
                                                                    //     if (mrsId != null) {
                                                                    //       Get.toNamed(
                                                                    //           Routes
                                                                    //               .mrsIssueScreen,
                                                                    //           arguments:
                                                                    //               mrsId);
                                                                    //     }
                                                                    //   },
                                                                    // ),
                                                                    //     : Dimens.box0,
                                                                    // controller.mrsList!
                                                                    //                 .firstWhere(
                                                                    //                   (e) => e?.id == mrsListDetails!.id,
                                                                    //                   orElse: () => MrsListModel(id: 00),
                                                                    //                 )
                                                                    //                 ?.status ==
                                                                    //             321 &&
                                                                    //         controller.mrsList!
                                                                    //                 .firstWhere(
                                                                    //                   (e) => e?.id == mrsListDetails!.id,
                                                                    //                   orElse: () => MrsListModel(id: 00),
                                                                    //                 )
                                                                    //                 ?.approval_status ==
                                                                    //             0
                                                                    //     ?
                                                                    TableActionButton(
                                                                      color: ColorValues
                                                                          .rejectColor,
                                                                      icon: Icons
                                                                          .close,
                                                                      message:
                                                                          'Reject',
                                                                      onPress:
                                                                          () {
                                                                        final _flutterSecureStorage =
                                                                            const FlutterSecureStorage();

                                                                        _flutterSecureStorage.delete(
                                                                            key:
                                                                                "mrsId");

                                                                        int mrsId =
                                                                            mrsListDetails?.id ??
                                                                                0;
                                                                        if (mrsId !=
                                                                            null) {
                                                                          Get.toNamed(
                                                                              Routes.approverReturnMrs,
                                                                              arguments: {
                                                                                'mrsId': mrsId
                                                                              });
                                                                        }
                                                                      },
                                                                    ),
                                                                  ]))
                                                            ]))
                                                .toList()),
                                      ),
                                    ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: ValueListenableBuilder(
                                    valueListenable:
                                        controller.paginationController,
                                    builder: (context, value, child) {
                                      return Row(children: [
                                        Text(
                                            "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
                                        Row(children: [
                                          IconButton(
                                            onPressed: controller
                                                        .paginationController
                                                        .currentPage <=
                                                    1
                                                ? null
                                                : () {
                                                    controller
                                                        .paginationController
                                                        .previous();
                                                  },
                                            iconSize: 20,
                                            splashRadius: 20,
                                            icon: Icon(
                                              Icons.arrow_back_ios_new_rounded,
                                              color: controller
                                                          .paginationController
                                                          .currentPage <=
                                                      1
                                                  ? Colors.black26
                                                  : Theme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: controller
                                                        .paginationController
                                                        .currentPage >=
                                                    controller
                                                        .paginationController
                                                        .pageCount
                                                ? null
                                                : () {
                                                    controller
                                                        .paginationController
                                                        .next();
                                                  },
                                            iconSize: 20,
                                            splashRadius: 20,
                                            icon: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: controller
                                                          .paginationController
                                                          .currentPage >=
                                                      controller
                                                          .paginationController
                                                          .pageCount
                                                  ? Colors.black26
                                                  : Theme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        ]),
                                      ]);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // if (controller.openFromDateToStartDatePicker)
                      //   Positioned(
                      //     right: 150,
                      //     top: 85,
                      //     child: DatePickerWidget(
                      //       selectionMode: DateRangePickerSelectionMode.range,
                      //       monthCellStyle: DateRangePickerMonthCellStyle(
                      //         todayCellDecoration: BoxDecoration(
                      //             shape: BoxShape.circle,
                      //             color: ColorValues.appDarkBlueColor),
                      //       ), // last date of this year
                      //       // controller: DateRangePickerController(),
                      //       initialSelectedRange: PickerDateRange(
                      //         controller.fromDate.value,
                      //         controller.toDate.value,
                      //       ),

                      //       onSubmit: (value) {
                      //         print('po valu ${value.toString()}');
                      //         PickerDateRange? data = value as PickerDateRange;

                      //         var pickUpDate =
                      //             DateTime.parse(data.startDate.toString());
                      //         controller.fromDate.value = pickUpDate;
                      //         var dropDate =
                      //             DateTime.parse(data.endDate.toString());
                      //         dropDate != null
                      //             ? controller.toDate.value = dropDate
                      //             : controller.toDate.value = pickUpDate;

                      //         controller.getMrsListByDate();
                      //         controller.openFromDateToStartDatePicker =
                      //             !controller.openFromDateToStartDatePicker;
                      //         controller.update(['stock_Mangement_Date']);

                      //         // Get.toNamed(
                      //         //   Routes.stockManagementGoodsOrdersScreen,
                      //         // );
                      //       },
                      //     ),
                      //   ),
                    ]),
                  ),
                ),
              ]));
        });
  }
}
