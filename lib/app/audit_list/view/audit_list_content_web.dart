import 'package:cmms/app/audit_list/audit_list_controller.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/table_action_button.dart';

class AuditListContentWeb extends StatefulWidget {
  AuditListContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<AuditListContentWeb> createState() => _AuditListContentWebState();
}

class _AuditListContentWebState extends State<AuditListContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuditListScreenController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(
            () {
              // final dataSource = AuditPlanPlanListDataSource(controller);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
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
                            child: Text(" / AUDIT LIST",
                                style: Styles.greyMediumLight12),
                          ),
                          Text(" / AUDIT LIST SCREEN",
                              style: Styles.greyMediumLight12)
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: Get.width * 7,
                          margin: EdgeInsets.only(left: 10, top: 30, right: 10),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Audit List Screen",
                                        style: Styles.blackBold16,
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          CustomRichText(title: 'Date Range'),
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
                                                '${controller.formattedFromdate} - ${controller.formattedTodate}',
                                          ),
                                        ],
                                      ),
                                      Dimens.boxWidth10,
                                      ActionButton(
                                        icon: Icons.add,
                                        label: "Add New",
                                        onPressed: () {
                                          Get.offNamed(Routes.createAudit);
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
                                    PopupMenuButton<String>(
                                      tooltip: "",
                                      elevation: 25.0,
                                      child: Container(
                                        height: 35,
                                        margin: EdgeInsets.only(left: 10),
                                        padding: EdgeInsets.only(
                                            top: 4,
                                            bottom: 4,
                                            right: 8,
                                            left: 8),
                                        decoration: BoxDecoration(
                                          color: ColorValues.appLightBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          'Column Visibility',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      itemBuilder: (BuildContext context) => <
                                          PopupMenuEntry<String>>[]..addAll(
                                            controller
                                                .columnVisibility.value.entries
                                                .map((e) {
                                          return PopupMenuItem<String>(
                                              child: ValueListenableBuilder(
                                                  valueListenable: controller
                                                      .columnVisibility,
                                                  builder:
                                                      (context, value, child) {
                                                    return Row(
                                                      children: [
                                                        Checkbox(
                                                          value: value[e.key],
                                                          onChanged:
                                                              (newValue) {
                                                            controller
                                                                .setColumnVisibility(
                                                                    e.key,
                                                                    newValue!);
                                                          },
                                                        ),
                                                        Text(e.key),
                                                      ],
                                                    );
                                                  }));
                                        })),
                                      onSelected: (String value) {
                                        // Handle column selection
                                      },
                                    ),
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
                                    Spacer(),
                                    Container(
                                      width: 200,
                                      height: 35,
                                      margin: Dimens.edgeInsets0_0_16_0,
                                      child: TextField(
                                        onChanged: (value) {}, // =>
                                        //       controller.search(value),
                                        decoration: InputDecoration(
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
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
                                SizedBox(
                                  height: 20,
                                ),
                                controller.auditPlanList.isEmpty
                                    ? Center(child: Text('No data'))
                                    : Expanded(
                                        child: ValueListenableBuilder(
                                            valueListenable:
                                                controller.columnVisibility,
                                            builder: (context, value, child) {
                                              final dataSource =
                                                  AuditListListDataSource(
                                                      controller);

                                              return PaginatedDataTable2(
                                                columnSpacing: 10,
                                                dataRowHeight: 70,
                                                source:
                                                    dataSource, // Custom DataSource class
                                                headingRowHeight:
                                                    Get.height * 0.12,
                                                minWidth: Get.width * 1.2,
                                                showCheckboxColumn: false,
                                                rowsPerPage:
                                                    10, // Number of rows per page
                                                availableRowsPerPage: [
                                                  10,
                                                  20,
                                                  30,
                                                  50
                                                ],
                                                columns: [
                                                  for (var entry
                                                      in value.entries)
                                                    if (entry.value)
                                                      buildDataColumn(
                                                        entry.key,
                                                        controller.filterText[
                                                            entry.key]!,
                                                        controller.columnwidth[
                                                            entry.key],
                                                      ),
                                                  buildDataColumn(
                                                    'Actions',
                                                    controller.planIdFilterText,
                                                    150,
                                                  ),
                                                ],
                                              );
                                            }),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        if (controller.openFromDateToStartDatePicker)
                          Positioned(
                            right: 150,
                            top: 85,
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
                                PickerDateRange? data =
                                    value as PickerDateRange;

                                var pickUpDate =
                                    DateTime.parse(data.startDate.toString());
                                controller.fromDate.value = pickUpDate;
                                var dropDate =
                                    DateTime.parse(data.endDate.toString());
                                dropDate != null
                                    ? controller.toDate.value = dropDate
                                    : controller.toDate.value = pickUpDate;

                                //  controller.getPmTaskListByDate();
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
                  ],
                ),
              );
            },
          );
        });
  }
}

DataColumn2 buildDataColumn(
  // String columnName,
  String header,

  /// ColumnSize columnSize,
  RxString filterText,
  double? fixedWidth,
  //  {required Function(String) onSearchCallBack}
) {
  return //
      DataColumn2(
    // size: columnSize,
    fixedWidth: fixedWidth,

    label: //
        Column(
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
          SizedBox(
            height: Get.height * 0.05,
            child: TextField(
              onChanged: (value) {
                filterText.value = value;
                //   onSearchCallBack(value);
              },
              textAlign: TextAlign.left,
              style: TextStyle(height: 1.0),
              decoration: InputDecoration(
                hintText: 'Filter',
                contentPadding:
                    EdgeInsets.fromLTRB(5, 0, 5, 0), // Reduced vertical padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              header,
              style: Styles.black16W500,
            ),
          ),
        ]),
    // ),
  );
}

class AuditListListDataSource extends DataTableSource {
  final AuditListScreenController controller;

  late List<AuditPlanListModel?> filteredAuditPlanList;

  AuditListListDataSource(this.controller) {
    filtersModuleCliningPlan();
  }

  ///
  void filtersModuleCliningPlan() {
    filteredAuditPlanList = <AuditPlanListModel?>[];
    filteredAuditPlanList = controller.auditPlanList.where((auditList) {
      // return (auditList.planId ?? '')
      //         .toString()
      //         .contains(controller.planIdFilterText.value.toLowerCase()) &&
      //     (auditList.title ?? '')
      //         .toString()
      //         .contains(controller.planTitleFilterText.value.toLowerCase()) &&
      //     (auditList.noOfCleaningDays ?? '')
      //         .toString()
      //         .contains(controller.noOfDaysFilterText.value.toLowerCase()) &&
      //     (auditList.createdBy ?? '')
      //         .toString()
      //         .contains(controller.createdByFilterText.value.toLowerCase()) &&
      //     (auditList.frequency ?? '')
      //         .toString()
      //         .contains(controller.frequencyFilterText.value.toLowerCase()) &&
      //     (auditList.status ?? '')
      //         .toString()
      //         .contains(controller.statusFilterText.value.toLowerCase());

      return (auditList.id ?? '')
              .toString()
              .contains(controller.planIdFilterText.value.toLowerCase()) &&
          (auditList.plan_number ?? '')
              .toString()
              .contains(controller.planTitleFilterText.value.toLowerCase()) &&
          (auditList.plan_number ?? '')
              .toString()
              .contains(controller.noOfDaysFilterText.value.toLowerCase()) &&
          (auditList.plan_number ?? '')
              .toString()
              .contains(controller.createdByFilterText.value.toLowerCase()) &&
          (auditList.facility_name ?? '')
              .toString()
              .contains(controller.frequencyFilterText.value.toLowerCase()) &&
          (auditList.status ?? '')
              .toString()
              .contains(controller.statusFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredAuditPlanList": filteredAuditPlanList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final AuditPlanPlanningListDetails = filteredAuditPlanList[index];

    // controller.PlanId.value = AuditPlanPlanningListDetails?.planId ?? 0;
    var cellsBuffer = [
      "planId",
      '${AuditPlanPlanningListDetails?.plan_number ?? ''}',
      '${AuditPlanPlanningListDetails?.status ?? ''}',
      '${AuditPlanPlanningListDetails?.status ?? ''}',
      '${AuditPlanPlanningListDetails?.status ?? ''}',
      '${AuditPlanPlanningListDetails?.frequency ?? ''}',
      'Actions',
    ];
    var cells = [];
    int i = 0;

    for (var entry in controller.columnVisibility.value.entries) {
      // print({"entry.value entry": entry});
      if (entry.key == "search") {
        return null;
      }
      if (entry.value) {
        // print({"entry.value removed": entry.key});
        cells.add(cellsBuffer[i]);
      }
      i++;
    }
    cells.add('Actions');

    // print({"cell": cells});
    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: (value == 'planId')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '',
                      ),
                      Dimens.boxHeight10,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: Dimens.edgeInsets8_2_8_2,
                          decoration: BoxDecoration(
                            // color: controller.AuditPlanListPlan
                            //             .firstWhere(
                            //               (e) =>
                            //                   e?.planId ==
                            //                   AuditPlanPlanningListDetails!
                            //                       .planId,
                            //               orElse: () =>
                            //                   AuditPlanListPlanModel(
                            //                       planId: 00),
                            //             )
                            //             ?.status ==
                            //         342
                            //     ? ColorValues.approveColor
                            //     : ColorValues.addNewColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '',
                            style: Styles.white10.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : (value == 'Actions')
                    ? Wrap(children: [
                        TableActionButton(
                          color: ColorValues.viewColor,
                          icon: Icons.remove_red_eye_outlined,
                          message: 'view',
                          onPress: () {
                            // int id =
                            //     AuditPlanPlanningListDetails?.planId ?? 0;
                            // if (id != 0) {
                            //   Get.toNamed(Routes.viewMcPlaning,
                            //       arguments: {'id': id});
                            // }
                          },
                        ),
                        TableActionButton(
                          color: ColorValues.editColor,
                          icon: Icons.edit,
                          message: 'Edit',
                          onPress: () {
                            // int id =
                            //     AuditPlanPlanningListDetails?.planId ?? 0;
                            // if (id != 0) {
                            //   Get.toNamed(Routes.AuditPlanPlanning,
                            //       arguments: {"id": id});
                            // }
                          },
                        ),
                        TableActionButton(
                          color: ColorValues.appGreenColor,
                          icon: Icons.add,
                          message: 'Approve/Reject',
                          onPress: () {
                            // int id =
                            //     AuditPlanPlanningListDetails?.planId ?? 0;
                            // if (id != 0) {
                            //   Get.toNamed(
                            //     Routes.viewMcPlaning,
                            //     arguments: {'id': id, "type": 1},
                            //   );
                            // }
                          },
                        ),
                        TableActionButton(
                          color: Color.fromARGB(255, 141, 183, 180),
                          icon: Icons.add,
                          // label: 'Execute',
                          message: 'Schedule Execution',
                          onPress: () {
                            // Get.dialog(AddMCExecutionDialog(
                            //   planId: AuditPlanPlanningListDetails?.planId,
                            //   frequency:
                            //       AuditPlanPlanningListDetails?.frequency,
                            // ));
                            //   int id =
                            //       AuditPlanPlanningListDetails?.planId ??
                            //           0;
                            //   if (id != 0) {
                            //     Get.toNamed(Routes.purchaseGoodsorderView,
                            //         arguments: {'id': id, "type": 1});
                            //   }
                            // },
                            // onPress: () {
                            //   controller.viewAddGoodsOrdersDetails(
                            //       planId: int.tryParse('${record[0]}'));
                          },
                        )
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      // onSelectChanged: (_) {
      //   final _flutterSecureStorage = const FlutterSecureStorage();

      //   _flutterSecureStorage.delete(key: "UserId");
      //   Get.toNamed(Routes.viewUserDetail,
      //       arguments: {'userId': UserDetails?.id});
      // },
    );
  }

  @override
  int get rowCount => filteredAuditPlanList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
