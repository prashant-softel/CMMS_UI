import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/vegetation_execution_plan_list/veg_execution_list_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:cmms/domain/models/veg_task_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class VegExecutionListWeb extends StatefulWidget {
  const VegExecutionListWeb({super.key});

  @override
  State<VegExecutionListWeb> createState() => _VegExecutionListWebState();
}

class _VegExecutionListWebState extends State<VegExecutionListWeb> {
  final homecontroller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VegExecutionListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(
            () {
              return SelectionArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderWidget(),
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
                            InkWell(
                              onTap: () {
                                Get.offNamed(Routes.home);
                              },
                              child: Text(
                                "DASHBOARD",
                                style: Styles.greyLight14,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.offNamed(Routes.vegetationDashboard);
                              },
                              child: Text(" / VEGETATION CONTROL",
                                  style: Styles.greyLight14),
                            ),
                            Text(" / VEGETATION EXECUTION LIST",
                                style: Styles.greyLight14)
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: Get.width * 7,
                            margin:
                                EdgeInsets.only(left: 10, top: 15, right: 10),
                            height: Get.height * .85 - 5,
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
                                          "Vegetation Plan Execution",
                                          style: Styles.blackBold16,
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            CustomRichText(
                                                title: 'Date Range',
                                                includeAsterisk: false),
                                            Dimens.boxWidth2,
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
                                                  '${controller.formattedFromdate} To ${controller.formattedTodate}',
                                            ),
                                          ],
                                        ),
                                        //  ActionButton(
                                        //           icon: Icons.add,
                                        //           label: "Add New",
                                        //           onPressed: () {
                                        //             Get.offNamed(Routes
                                        //                 .updateGoodsOrdersDetailsScreen);
                                        //           },
                                        //           color: ColorValues.addNewColor,
                                        //         )
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
                                              color:
                                                  ColorValues.appLightBlueColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  offset:
                                                      const Offset(4.0, 2.0),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0,
                                                ),
                                              ]),
                                          child: Text(
                                            'Column Visibility',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry<String>>[]..addAll(
                                                  controller.columnVisibility
                                                      .value.entries
                                                      .map((e) {
                                                return PopupMenuItem<String>(
                                                    child:
                                                        ValueListenableBuilder(
                                                            valueListenable:
                                                                controller
                                                                    .columnVisibility,
                                                            builder: (context,
                                                                value, child) {
                                                              return Row(
                                                                children: [
                                                                  Checkbox(
                                                                    value: value[
                                                                        e.key],
                                                                    onChanged:
                                                                        (newValue) {
                                                                      controller.setColumnVisibility(
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

                                      // Container(
                                      //   height: 35,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //       backgroundColor:
                                      //           ColorValues.appLightBlueColor,
                                      //       onPressed: () {},
                                      //       text: 'Copy'),
                                      // ),
                                      // Container(
                                      //   height: 35,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //       backgroundColor:
                                      //           ColorValues.appLightBlueColor,
                                      //       onPressed: () {},
                                      //       text: 'Excel'),
                                      // ),
                                      // Container(
                                      //   height: 35,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //       backgroundColor:
                                      //           ColorValues.appLightBlueColor,
                                      //       onPressed: () {},
                                      //       text: 'PDF'),
                                      // ),
                                      Container(
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: const Offset(2.0, 1.0),
                                            blurRadius: 5.0,
                                            spreadRadius: 1.0,
                                          )
                                        ]),
                                        height: 35,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {
                                              controller.export();
                                            },
                                            text: 'Excel'),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 300,
                                        height: 40,
                                        margin: Dimens.edgeInsets0_0_7_0,
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black),
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
                                                Dimens.edgeInsets05_10,
                                            hintText: 'search'.tr,
                                            hintStyle: Styles.grey12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  controller.vegTaskList.isEmpty == true &&
                                          controller.isLoading == false
                                      ? Center(child: Text('No data'))
                                      : controller.isLoading.value == true
                                          ? Center(
                                              child: Text("Data Loading......"))
                                          : Expanded(
                                              child: ValueListenableBuilder(
                                                  valueListenable: controller
                                                      .columnVisibility,
                                                  builder:
                                                      (context, value, child) {
                                                    final dataSource =
                                                        VegExcutionListDataSource(
                                                            controller);

                                                    return PaginatedDataTable2(
                                                      columnSpacing: 10,
                                                      dataRowHeight: 60,
                                                      source:
                                                          dataSource, // Custom DataSource class
                                                      /// headingRowHeight:
                                                      //      Get.height * 0.12,
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
                                                              controller
                                                                      .filterText[
                                                                  entry.key]!,
                                                              controller
                                                                      .columnwidth[
                                                                  entry.key],
                                                            ),
                                                        buildDataColumn(
                                                          'Actions',
                                                          controller
                                                              .vegExecutionFilterText,
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
                                selectionMode:
                                    DateRangePickerSelectionMode.range,
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

                                  controller.getVegExcustionListByDate();
                                  controller.openFromDateToStartDatePicker =
                                      false;
                                  controller.update(['stock_Mangement_Date']);
                                },
                                onCancel: () {
                                  controller.openFromDateToStartDatePicker =
                                      false;
                                  controller.update(['stock_Mangement_Date']);
                                },
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}

DataColumn2 buildDataColumn(
  String header,
  RxString filterText,
  double? fixedWidth,
) {
  return DataColumn2(
    fixedWidth: fixedWidth,
    onSort: header == "Actions"
        ? null
        : (int columnIndex, bool ascending) {
            final controller = Get.find<VegExecutionListController>();
            controller.sortData(header);
          },
    label: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              header,
              style: Styles.black16W500,
            ),
            if (header !=
                "Actions") // Display sorting icon only for sortable columns
              Obx(() {
                final controller = Get.find<VegExecutionListController>();
                return AnimatedRotation(
                  turns: controller.currentSortColumn.value == header
                      ? (controller.isAscending.value ? 0.5 : 0.0)
                      : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: Icon(
                    Icons.expand_more,
                    size: 20,
                  ),
                );
              }),
          ],
        ),
      ],
    ),
  );
}

class VegExcutionListDataSource extends DataTableSource {
  final VegExecutionListController controller;

  late List<VegTaskListModel?> filteredVegExcutionList;

  VegExcutionListDataSource(this.controller) {
    filtersVegExcution();
  }

  ///
  void filtersVegExcution() {
    filteredVegExcutionList = <VegTaskListModel?>[];
    filteredVegExcutionList = controller.vegTaskList.where((VegExcutionList) {
      return (VegExcutionList!.id ?? '')
              .toString()
              .contains(controller.IDFilterText.value.toLowerCase()) &&
          (VegExcutionList.title ?? '')
              .toString()
              .contains(controller.titleFilterText.value.toLowerCase()) &&
          (VegExcutionList.planId ?? '')
              .toString()
              .contains(controller.frequencyFilterText.value.toLowerCase()) &&
          (VegExcutionList.frequency ?? '')
              .toString()
              .contains(controller.noOfDaysFilterText.value.toLowerCase()) &&
          (VegExcutionList.noOfDays ?? '')
              .toString()
              .contains(controller.startDateFilterText.value.toLowerCase()) &&
          (VegExcutionList.startDate ?? '')
              .toString()
              .contains(controller.doneDateFilterText.value.toLowerCase()) &&
          (VegExcutionList.doneDate ?? '')
              .contains(controller.statusFilterText.value.toLowerCase()) &&
          (VegExcutionList.status_short ?? '')
              .toString()
              .contains(controller.frequencyFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredVegExcutionList": filteredVegExcutionList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final VegExcutionListDetails = filteredVegExcutionList[index];

    controller.Id.value = VegExcutionListDetails?.id ?? 0;
    var cellsBuffer = [
      // '${VegExcutionListDetails?.id ?? ''}',
      "id",
      '${VegExcutionListDetails?.title ?? ''}',
      "vcPlanId",
      '${VegExcutionListDetails?.responsibility ?? ''}',
      '${VegExcutionListDetails?.frequency ?? ''}',
      '${VegExcutionListDetails?.noOfDays ?? ''}',
      VegExcutionListDetails?.startDate == "0001-01-01"
          ? "-"
          : '${VegExcutionListDetails?.startDate ?? ''}',

      VegExcutionListDetails?.status == 727
          ? '${VegExcutionListDetails?.abondond_done_date ?? ''}'
          : (VegExcutionListDetails?.doneDate == "0001-01-01"
              ? "-"
              : '${VegExcutionListDetails?.doneDate ?? ''}'),

      // '${VegExcutionListDetails?.status ?? ''}',

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
            child: (value == 'id')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VE${VegExcutionListDetails?.id}',
                      ),
                      Dimens.boxHeight10,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                            color: controller.vegTaskList
                                        .firstWhere(
                                          (e) =>
                                              e?.id ==
                                              VegExcutionListDetails!.id,
                                          orElse: () =>
                                              VegTaskListModel(id: 00),
                                        )
                                        ?.status ==
                                    301
                                ? ColorValues.approveColor
                                : ColorValues.addNewColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${VegExcutionListDetails?.status_short}',
                            style: Styles.white11.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : (value == 'vcPlanId')
                    ? Text(
                        'VC ${VegExcutionListDetails?.planId}',
                      )
                    : (value == 'Actions')
                        ? Wrap(
                            children: [
                              TableActionButton(
                                color: ColorValues.appDarkBlueColor,
                                icon: Icons.remove_red_eye_outlined,
                                message: 'View',
                                onPress: () {
                                  int executionId =
                                      VegExcutionListDetails?.id ?? 0;
                                  int planId =
                                      VegExcutionListDetails?.planId ?? 0;
                                  controller.executeVegetation(
                                    executionId,
                                    planId,
                                  );
                                },
                              ),
                              // varUserAccessModel.value.access_list!
                              //             .where((e) =>
                              //                 e.feature_id ==
                              //                     UserAccessConstants
                              //                         .kVegetationControlexeFeatureId &&
                              //                 e.edit ==
                              //                     UserAccessConstants
                              //                         .kHaveEditAccess)
                              //             .length >
                              //         0
                              //     ? TableActionButton(
                              //         color: ColorValues.appYellowColor,
                              //         icon: Icons.edit,
                              //         message: 'Edit',
                              //         onPress: () {},
                              //       )
                              // : Dimens.box0,
                              // varUserAccessModel.value.access_list!
                              //             .where((e) =>
                              //                 e.feature_id ==
                              //                     UserAccessConstants
                              //                         .kVegetationControlexeFeatureId &&
                              //                 e.approve ==
                              //                     UserAccessConstants
                              //                         .kHaveApproveAccess)
                              //             .length >
                              //         0
                              //     ? TableActionButton(
                              //         color: ColorValues.appGreenColor,
                              //         icon: Icons.add,
                              //         message: 'Start/End',
                              //         onPress: () {
                              //           int executionId =
                              //               VegExcutionListDetails?.id ?? 0;
                              //           int planId =
                              //               VegExcutionListDetails?.planId ?? 0;
                              //           controller.executeVegetation(
                              //             executionId,
                              //             planId,
                              //           );
                              //         },
                              //       )
                              //     : Dimens.box0,
                            ],
                          )
                        : Text(
                            value.toString(),
                          ),
          ),
        );
      }).toList(),
      onSelectChanged: (_) {
        int executionId = VegExcutionListDetails?.id ?? 0;
        int planId = VegExcutionListDetails?.planId ?? 0;
        controller.executeVegetation(executionId, planId);
      },
    );
  }

  @override
  int get rowCount => filteredVegExcutionList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
