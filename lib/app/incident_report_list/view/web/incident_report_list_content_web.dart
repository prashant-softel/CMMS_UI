import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';

import 'package:cmms/app/incident_report_list/incident_report_list_controller.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class IncidentReportListWeb extends StatefulWidget {
  IncidentReportListWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<IncidentReportListWeb> createState() => _IncidentReportListWebState();
}

class _IncidentReportListWebState extends State<IncidentReportListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IncidentReportListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => Container(
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
                                        color:
                                            Color.fromARGB(255, 227, 224, 224),
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(255, 236, 234, 234)
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
                                          child: Text(" / Incident Report",
                                              style: Styles.greyMediumLight12),
                                        ),
                                        SizedBox(
                                          width: 400,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Dimens.boxHeight20,

                                  ///
                                  SizedBox(
                                    height: 60,
                                    child: CustomAppBar(
                                      title: 'Incident Report List'.tr,
                                      action: Row(
                                        children: [
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title: 'Date Range'),
                                              Dimens.boxWidth10,
                                              CustomTextFieldForStock(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                numberTextField: true,
                                                onTap: () {
                                                  controller
                                                          .openFromDateToStartDatePicker =
                                                      !controller
                                                          .openFromDateToStartDatePicker;
                                                  controller.update(
                                                      ['stock_Mangement_Date']);
                                                },
                                                hintText:
                                                    '${controller.formattedTodate.toString()} To ${controller.formattedFromdate.toString()}',
                                              ),
                                            ],
                                          ),
                                          Dimens.boxWidth10,
                                          varUserAccessModel.value.access_list!
                                                      .where((e) =>
                                                          e.feature_id == 34 &&
                                                          e.add == 1)
                                                      .length >
                                                  0
                                              ? ActionButton(
                                                  icon: Icons.add,
                                                  label: 'Add Incident Report',
                                                  onPressed: () {
                                                    Get.toNamed(Routes
                                                        .addIncidentReportContentWeb);
                                                  },
                                                  color:
                                                      ColorValues.appGreenColor,
                                                )
                                              : Dimens.box0,
                                          Dimens.boxWidth10,
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 20,
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
                                          text: 'columnVisibility'.tr,
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'Copy'.tr,
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'Excel'.tr,
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'PDF'.tr,
                                        ),
                                      ),

                                      //Search
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 450),
                                        child: Container(
                                          width: 200,
                                          height: 35,
                                          margin: Dimens.edgeInsets0_0_16_0,
                                          child: TextField(
                                            onChanged: (value) =>
                                                controller.search(value),
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.0),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.0),
                                              ),
                                              contentPadding:
                                                  Dimens.edgeInsets10_0_0_0,
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
                                      child:
                                          GetBuilder<
                                                  IncidentReportListController>(
                                              id: 'incident_report_list',
                                              builder: (controller) {
                                                return //
                                                    Column(
                                                        //
                                                        children: [
                                                      ///
                                                      Expanded(
                                                        child:
                                                            ScrollableTableView(
                                                          // paginationController:
                                                          //     controller
                                                          //         .paginationIncidentReportController,
                                                          columns: [
                                                            'Id',
                                                            'Description',
                                                            'Block Name',
                                                            'Equipment Name',
                                                            'Approved By',
                                                            'Approved At',
                                                            'Reported By',
                                                            'Reported At',
                                                            // 'Created At',
                                                            'Status',
                                                            'action'.tr,
                                                          ].map((column) {
                                                            return TableViewColumn(
                                                              minWidth:
                                                                  Get.width *
                                                                      0.08,
                                                              label: column,
                                                            );
                                                          }).toList(),
                                                          rows: [
                                                            ...List.generate(
                                                              controller
                                                                  .incidentReportList
                                                                  .length,
                                                              (index) => [
                                                                '${controller.incidentReportList[index]!.id}',
                                                                '${controller.incidentReportList[index]!.description}',
                                                                '${controller.incidentReportList[index]!.block_name}',
                                                                '${controller.incidentReportList[index]!.equipment_name}',
                                                                '${controller.incidentReportList[index]!.approved_by}',
                                                                '${controller.incidentReportList[index]!.approved_at}',
                                                                '${controller.incidentReportList[index]!.reported_by_name}',
                                                                '${controller.incidentReportList[index]!.reported_at}',
                                                                // '${controller.incidentReportList[index].created_at}',
                                                                '${controller.incidentReportList[index]!.status}',
                                                                'Actions'
                                                              ],
                                                            ),
                                                          ].map(
                                                            (record) {
                                                              return TableViewRow(
                                                                height:
                                                                    Get.height *
                                                                        0.1,
                                                                onTap: () {},
                                                                cells:
                                                                    record.map(
                                                                  (value) {
                                                                    return TableViewCell(
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          print(
                                                                              'incidentreportiddata:${record[8]}');
                                                                          controller.viewIncidentReport(
                                                                              id: int.tryParse('${record[0]}'));
                                                                        },
                                                                        child: value ==
                                                                                'Actions'
                                                                            ? Wrap(
                                                                                children: [
                                                                                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                                    varUserAccessModel.value.access_list!.where((e) => e.feature_id == 34 && e.view == 1).length > 0
                                                                                        ? TableActionButton(
                                                                                            color: ColorValues.appDarkBlueColor,
                                                                                            icon: Icons.visibility,
                                                                                            message: 'View',
                                                                                            onPress: () {
                                                                                              controller.viewIncidentReport(id: int.tryParse('${record[0]}'));
                                                                                              // print('record:${int.tryParse('${record[0]}')}');
                                                                                            },
                                                                                          )
                                                                                        : Container(),
                                                                                    //),
                                                                                    varUserAccessModel.value.access_list!.where((e) => e.feature_id == 34 && e.edit == 1).length > 0
                                                                                        ? TableActionButton(
                                                                                            color: ColorValues.appYellowColor,
                                                                                            icon: Icons.edit,
                                                                                            message: 'Delete',
                                                                                            onPress: () {
                                                                                              controller.editIncidentReport(id: int.tryParse('${record[0]}'));
                                                                                              print('edit record:${int.tryParse('${record[0]}')}');
                                                                                            },
                                                                                          )
                                                                                        : Container()

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
                                                                                  varUserAccessModel.value.access_list!.where((e) => e.feature_id == 34 && e.approve == 1).length > 0 && record[8] == "Submitted"
                                                                                      ? Padding(
                                                                                          padding: const EdgeInsets.only(left: 15, top: 5),
                                                                                          child: TableActionButton(
                                                                                            color: ColorValues.appGreenColor,
                                                                                            icon: Icons.add,
                                                                                            message: 'Add',
                                                                                            onPress: () {
                                                                                              // Get.dialog(PermitApprovedDialog(
                                                                                              //     permitId:
                                                                                              //         _newPermitList[0]));
                                                                                              // controller.incidentReportApproveButton(incidentId: record[0]);
                                                                                              controller.viewIncidentReport(id: int.tryParse('${record[0]}'));
                                                                                            },
                                                                                          ),
                                                                                        )
                                                                                      : Container(),

                                                                                  ///Reject Button
                                                                                  varUserAccessModel.value.access_list!.where((e) => e.feature_id == 34 && e.delete == 1).length > 0 && record[8] == "Submitted"
                                                                                      ? Padding(
                                                                                          padding: const EdgeInsets.only(top: 5),
                                                                                          child: TableActionButton(
                                                                                            color: ColorValues.appRedColor,
                                                                                            icon: Icons.close,
                                                                                            message: 'Close',
                                                                                            onPress: () {
                                                                                              // Get.dialog(IncidentReportRejectDialog(id: record[0]));
                                                                                              controller.viewIncidentReport(id: int.tryParse('${record[0]}'));
                                                                                            },
                                                                                          ),
                                                                                        )
                                                                                      : Container(),

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
                                                                            : Text(value.toString()),
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
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      25),
                                                          child:
                                                              ValueListenableBuilder(
                                                                  valueListenable:
                                                                      controller
                                                                          .paginationIncidentReportController,
                                                                  builder:
                                                                      (context,
                                                                          value,
                                                                          child) {
                                                                    return Row(
                                                                      children: [
                                                                        Text(
                                                                            "${controller.paginationIncidentReportController.currentPage}  of ${controller.paginationIncidentReportController.pageCount}"),
                                                                        Row(
                                                                          children: [
                                                                            IconButton(
                                                                              onPressed: controller.paginationIncidentReportController.currentPage <= 1
                                                                                  ? null
                                                                                  : () {
                                                                                      controller.paginationIncidentReportController.previous();
                                                                                    },
                                                                              iconSize: 20,
                                                                              splashRadius: 20,
                                                                              icon: Icon(
                                                                                Icons.arrow_back_ios_new_rounded,
                                                                                color: controller.paginationIncidentReportController.currentPage <= 1 ? Colors.black26 : Theme.of(context).primaryColor,
                                                                              ),
                                                                            ),
                                                                            IconButton(
                                                                              onPressed: controller.paginationIncidentReportController.currentPage >= controller.paginationIncidentReportController.pageCount
                                                                                  ? null
                                                                                  : () {
                                                                                      controller.paginationIncidentReportController.next();
                                                                                    },
                                                                              iconSize: 20,
                                                                              splashRadius: 20,
                                                                              icon: Icon(
                                                                                Icons.arrow_forward_ios_rounded,
                                                                                color: controller.paginationIncidentReportController.currentPage >= controller.paginationIncidentReportController.pageCount ? Colors.black26 : Theme.of(context).primaryColor,
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
                if (controller.openFromDateToStartDatePicker)
                  Positioned(
                    right: 230,
                    top: 90,
                    child: DatePickerWidget(
                      selectionMode: DateRangePickerSelectionMode.range,
                      monthCellStyle: DateRangePickerMonthCellStyle(
                        todayCellDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorValues.appDarkBlueColor),
                      ), // last date of this year
                      // controller: DateRangePickerController(),
                      initialSelectedRange: PickerDateRange(
                        controller.fromDate.value,
                        controller.toDate.value,
                      ),

                      onSubmit: (value) {
                        print('po valu ${value.toString()}');
                        PickerDateRange? data = value as PickerDateRange;

                        var pickUpDate =
                            DateTime.parse(data.startDate.toString());
                        controller.fromDate.value = pickUpDate;
                        var dropDate = DateTime.parse(data.endDate.toString());
                        dropDate != null
                            ? controller.toDate.value = dropDate
                            : controller.toDate.value = pickUpDate;

                        controller.getIncidentReportListByDate();
                        controller.openFromDateToStartDatePicker =
                            !controller.openFromDateToStartDatePicker;
                        controller.update(['stock_Mangement_Date']);

                        // Get.toNamed(
                        //   Routes.stockManagementGoodsOrdersScreen,
                        // );
                      },
                    ),
                  ),
              ],
            ),
          );
        });
  }
}
