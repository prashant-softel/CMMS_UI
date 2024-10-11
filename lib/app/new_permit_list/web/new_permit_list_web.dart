import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/new_permit_list/permit_status_constants.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../utils/user_access_constants.dart';
import '../../widgets/action_button.dart';
import '../../widgets/table_action_button.dart';
import '../new_permit_list_controller.dart';

class NewPermitListWeb extends StatefulWidget {
  NewPermitListWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<NewPermitListWeb> createState() => _NewPermitListWebState();
}

class _NewPermitListWebState extends State<NewPermitListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewPermitListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(() {
            final dataSource = PermitListDataSource(controller);
            return SelectionArea(
              child: Stack(
                children: [
                  Column(
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
                            controller.misPermit == 1
                                ? InkWell(
                                    onTap: () {
                                      // Get.back();
                                      Get.offAllNamed(Routes.misDashboard);
                                    },
                                    child: Text(" / HSE MIS",
                                        style: Styles.greyLight14),
                                  )
                                : InkWell(
                                    onTap: () {
                                      // Get.back();
                                      Get.offAllNamed(Routes.breakdown);
                                    },
                                    child: Text(" / BREAKDOWN MAINTAINANCE",
                                        style: Styles.greyLight14),
                                  ),
                            Text(" / PERMIT LIST", style: Styles.greyLight14),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          child: SingleChildScrollView(
                            child: Container(
                              width: Get.width * 7,
                              height: Get.height * 0.86,
                              child: Card(
                                color: Color.fromARGB(255, 245, 248, 250),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Permit List ",
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
                                                  onTap: () async {
                                                    // List<DateTime?>
                                                    //     _selectedDateRange = [
                                                    //   controller.fromDate.value,
                                                    //   controller.toDate.value
                                                    // ];
                                                    // List<DateTime?>? picked =
                                                    //     await showCalendarDatePicker2Dialog(
                                                    //   context: context,
                                                    //   config:
                                                    //       CalendarDatePicker2WithActionButtonsConfig(
                                                    //     calendarType:
                                                    //         CalendarDatePicker2Type
                                                    //             .range,
                                                    //     selectedDayHighlightColor:
                                                    //         ColorValues
                                                    //             .primaryColor,
                                                    //     selectedRangeHighlightColor:
                                                    //         ColorValues
                                                    //             .primaryColor,
                                                    //     weekdayLabelTextStyle:
                                                    //         TextStyle(
                                                    //             color: Colors
                                                    //                 .black),
                                                    //     controlsTextStyle:
                                                    //         TextStyle(
                                                    //             color: Colors
                                                    //                 .black),
                                                    //     dayTextStyle: TextStyle(
                                                    //         color:
                                                    //             Colors.black),
                                                    //     selectedDayTextStyle:
                                                    //         TextStyle(
                                                    //       color: Colors.white,
                                                    //     ),
                                                    //     yearTextStyle:
                                                    //         TextStyle(
                                                    //             color: Colors
                                                    //                 .black),
                                                    //   ),
                                                    //   dialogSize:
                                                    //       const Size(300, 400),
                                                    //   value: _selectedDateRange,
                                                    //   dialogBackgroundColor:
                                                    //       Colors.white,
                                                    // );
                                                    // if (picked != null) {
                                                    //   print("${picked[0]}");
                                                    //   print("${picked[1]}");
                                                    //   controller
                                                    //           .fromDate.value =
                                                    //       picked[0] ??
                                                    //           DateTime.now();
                                                    //   controller.toDate.value =
                                                    //       picked[1] ??
                                                    //           DateTime.now();
                                                    // }
                                                    // controller
                                                    //     .getNewPermitListByDate();
                                                    controller
                                                            .openFromDateToStartDatePicker =
                                                        !controller
                                                            .openFromDateToStartDatePicker;
                                                    controller.update([
                                                      'stock_Mangement_Date'
                                                    ]);
                                                  },
                                                  hintText:
                                                      '${controller.formattedFromdate.toString()} - ${controller.formattedTodate.toString()}',
                                                ),
                                              ],
                                            ),
                                            Dimens.boxWidth3,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kPermitFeatureId &&
                                                            e.add ==
                                                                UserAccessConstants
                                                                    .kHaveAddAccess)
                                                        .length >
                                                    0
                                                ? ActionButton(
                                                    icon: Icons.add,
                                                    label: "Add New",
                                                    onPressed: () {
                                                      controller
                                                          .clearStoreData();
                                                      controller
                                                          .clearTypeStoreData();
                                                      controller
                                                          .clearisCheckedtoreData();
                                                      Get.toNamed(
                                                          Routes.createPermit);
                                                    },
                                                    color:
                                                        ColorValues.addNewColor,
                                                  )
                                                : Dimens.box0
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
                                                  color: ColorValues
                                                      .appLightBlueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      offset: const Offset(
                                                          4.0, 2.0),
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
                                            itemBuilder:
                                                (BuildContext context) =>
                                                    <PopupMenuEntry<String>>[]
                                                      ..addAll(controller
                                                          .columnVisibility
                                                          .value
                                                          .entries
                                                          .map((e) {
                                                        return PopupMenuItem<
                                                                String>(
                                                            child:
                                                                ValueListenableBuilder(
                                                                    valueListenable:
                                                                        controller
                                                                            .columnVisibility,
                                                                    builder: (context,
                                                                        value,
                                                                        child) {
                                                                      return Row(
                                                                        children: [
                                                                          Checkbox(
                                                                            value:
                                                                                value[e.key],
                                                                            onChanged:
                                                                                (newValue) {
                                                                              controller.setColumnVisibility(e.key, newValue!);
                                                                            },
                                                                          ),
                                                                          Text(e
                                                                              .key),
                                                                        ],
                                                                      );
                                                                    }));
                                                      })),
                                            onSelected: (String value) {
                                              // Handle column selection
                                            },
                                          ),
                                          Container(
                                            decoration:
                                                BoxDecoration(boxShadow: [
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
                                                backgroundColor: ColorValues
                                                    .appLightBlueColor,
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
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 16.0,
                                                    height: 1.0,
                                                    color: Colors.black),
                                              ),
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
                                                    EdgeInsets.only(left: 3),
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
                                      controller.newPermitList.isEmpty ==
                                                  true &&
                                              controller.isLoading == false
                                          ? Center(child: Text('No data'))
                                          : controller.isLoading.value == true
                                              ? Center(
                                                  child: Text(
                                                      "Data Loading......"))
                                              : Expanded(
                                                  child: ValueListenableBuilder(
                                                    valueListenable: controller
                                                        .columnVisibility,
                                                    builder: (context, value,
                                                        child) {
                                                      final dataSource =
                                                          PermitListDataSource(
                                                              controller);
                                                      return PaginatedDataTable2(
                                                        columnSpacing: 10,
                                                        dataRowHeight:
                                                            Get.height * 0.12,
                                                        source:
                                                            dataSource, // Custom DataSource class
                                                        // headingRowHeight:
                                                        // Get.height * 0.12,
                                                        minWidth:
                                                            3000, //Get.width * 1.2,
                                                        showCheckboxColumn:
                                                            false,
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
                                                                .ActionFilterText,
                                                            150,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                )
                                    ]),
                              ),
                            ),
                          ),
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
                          var dropDate =
                              DateTime.parse(data.endDate.toString());
                          dropDate != null
                              ? controller.toDate.value = dropDate
                              : controller.toDate.value = pickUpDate;

                          controller.getNewPermitListByDate();
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['stock_Mangement_Date']);

                          // Get.toNamed(
                          //   Routes.stockManagementGoodsOrdersScreen,
                          // );
                        },
                        onCancel: () {
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['stock_Mangement_Date']);
                        },
                      ),
                    ),
                ],
              ),
            );
          });
        });
  }

  DataColumn2 buildDataColumn(
    // String columnName,
    String header,

    /// ColumnSize columnSize,
    RxString filterText,
    double? fixedWidth,
  ) {
    return //
        DataColumn2(
      // size: columnSize,
      fixedWidth: fixedWidth,
      onSort: header == "Actions"
          ? null
          : (int columnIndex, bool ascending) {
              final controller = Get.find<NewPermitListController>();
              controller.sortData(header);
            },

      label: //
          Column(
              mainAxisAlignment: MainAxisAlignment.center, //
              children: [
            Row(
              children: [
                Text(
                  header,
                  style: Styles.black16W500,
                ),
                if (header != "Actions")
                  Obx(() {
                    final controller = Get.find<NewPermitListController>();

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
          ]),
      // ),
    );
  }
}

class PermitListDataSource extends DataTableSource {
  final NewPermitListController controller;

  late List<NewPermitModel?> filteredNewPermitList;

  PermitListDataSource(this.controller) {
    filterUsers();
  }

  ///
  void filterUsers() {
    filteredNewPermitList = <NewPermitModel?>[];
    filteredNewPermitList = controller.newPermitList.where((NewPermit) {
      return (NewPermit?.permitId ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.PermitIdFilterText.value.toLowerCase()) &&
          (NewPermit?.description ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.DescriptionFilterText.value.toLowerCase()) &&
          (NewPermit?.permitType ?? '').toString().toLowerCase().contains(
              controller.PermitTypeNameFilterText.value.toLowerCase()) &&
          (NewPermit?.equipment_categories ?? '').toLowerCase().contains(
              controller.EquipmentCategoriesFilterText.value.toLowerCase()) &&
          (NewPermit?.description ?? '')
              .toLowerCase()
              .contains(controller.DescriptionFilterText.value.toLowerCase()) &&
          (NewPermit?.workingAreaName ?? '').toString().toLowerCase().contains(
              controller.WorkingAreaNameFilterText.value.toLowerCase()) &&
          (NewPermit?.requestByName ?? '').toString().toLowerCase().contains(
              controller.RequestByNameFilterText.value.toLowerCase()) &&
          (NewPermit?.approvedByName ?? '').toString().toLowerCase().contains(
              controller.ApprovedByNameFilterText.value.toLowerCase()) &&
          (NewPermit?.current_status_short ?? '').toString().toLowerCase().contains(
              controller.CurrentStatusShortFilterText.value.toLowerCase());
      //      &&
      // (NewPermit?.ptwStatus ?? '').toString().toLowerCase().contains(controller.PtwStatusFilterText.value.toLowerCase());
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final PermitDetails = filteredNewPermitList[index];

    controller.permitId.value = PermitDetails?.permitId ?? 0;
    String requestDatetime = PermitDetails?.requestDatetime != null
        ? PermitDetails!.requestDatetime.toString()
        : '';
    if (requestDatetime.length > 0) {
      requestDatetime =
          requestDatetime.substring(0, requestDatetime.length - 7);
    }
    String approvedDatetime = PermitDetails?.approvedDatetime != null
        ? PermitDetails!.approvedDatetime.toString()
        : '';
    if (approvedDatetime.length > 0) {
      approvedDatetime =
          approvedDatetime.substring(0, approvedDatetime.length - 7);
    }
    var cellsBuffer = [
      // '${McExcutionListDetails?.id ?? ''}',
      "id",
      '${PermitDetails?.description ?? ''}',
      '${PermitDetails?.permitTypeName ?? ''}',
      '${PermitDetails?.equipment_categories ?? ''}',
      '${PermitDetails?.workingAreaName ?? ''}',
      '${PermitDetails?.requestByName ?? ''}\n${requestDatetime}',
      '${PermitDetails?.approvedByName ?? ''}\n${approvedDatetime}',
      // '${PermitDetails?.ptwStatus ?? ''}',
      // '${PermitDetails?.ptwStatus ?? ''}',

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
                        'PTW${PermitDetails?.permitId}',
                      ),
                      Dimens.boxHeight10,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: controller.newPermitList
                                            .firstWhere(
                                              (e) =>
                                                  "${e?.permitId}" ==
                                                  "${PermitDetails?.permitId}",
                                              orElse: () =>
                                                  NewPermitModel(permitId: 000),
                                            )
                                            ?.ptwStatus ==
                                        PermitStatusConstants.PTW_CREATED //121
                                    ||
                                    controller.newPermitList
                                            .firstWhere(
                                              (e) =>
                                                  "${e?.permitId}" ==
                                                  "${PermitDetails?.permitId}",
                                              orElse: () =>
                                                  NewPermitModel(permitId: 000),
                                            )
                                            ?.ptwStatus ==
                                        PermitStatusConstants
                                            .PTW_EXTEND_REQUESTED
                                ? ColorValues.yellowColor
                                : (controller.newPermitList
                                                .firstWhere(
                                                  (e) =>
                                                      "${e?.permitId}" ==
                                                      "${PermitDetails?.permitId}",
                                                  orElse: () => NewPermitModel(
                                                      permitId: 000),
                                                )
                                                ?.ptwStatus ==
                                            PermitStatusConstants
                                                .PTW_APPROVE) && //125
                                        (controller.newPermitList
                                                .firstWhere(
                                                  (e) =>
                                                      "${e?.permitId}" ==
                                                      "${PermitDetails?.permitId}",
                                                  orElse: () => NewPermitModel(
                                                      permitId: 000),
                                                )
                                                ?.tbT_Done_Check ==
                                            1) //135

                                    ? ColorValues.appGreenColor
                                    : controller.newPermitList
                                                .firstWhere(
                                                  (e) =>
                                                      "${e?.permitId}" ==
                                                      "${PermitDetails?.permitId}",
                                                  orElse: () => NewPermitModel(
                                                      permitId: 000),
                                                )
                                                ?.ptwStatus ==
                                            PermitStatusConstants
                                                .PTW_REJECTED_BY_APPROVER
                                        ? ColorValues.appRedColor
                                        : controller.newPermitList
                                                    .firstWhere(
                                                      (e) =>
                                                          "${e?.permitId}" ==
                                                          "${PermitDetails?.permitId}",
                                                      orElse: () =>
                                                          NewPermitModel(
                                                              permitId: 000),
                                                    )
                                                    ?.ptwStatus ==
                                                PermitStatusConstants
                                                    .PTW_CANCEL_REQUEST_APPROVED
                                            ? ColorValues.appRedColor
                                            : controller.newPermitList
                                                        .firstWhere(
                                                          (e) =>
                                                              "${e?.permitId}" ==
                                                              "${PermitDetails?.permitId}",
                                                          orElse: () =>
                                                              NewPermitModel(
                                                                  permitId:
                                                                      000),
                                                        )
                                                        ?.tbT_Done_Check ==
                                                    0
                                                ? ColorValues.createsColor
                                                : controller.newPermitList
                                                            .firstWhere(
                                                              (e) =>
                                                                  "${e?.permitId}" ==
                                                                  "${PermitDetails?.permitId}",
                                                              orElse: () =>
                                                                  NewPermitModel(
                                                                      permitId:
                                                                          000),
                                                            )
                                                            ?.ptwStatus ==
                                                        PermitStatusConstants
                                                            .PTW_EXTEND_REQUEST_APPROVE
                                                    ? Color.fromARGB(
                                                        255, 181, 129, 179)
                                                    : controller.newPermitList
                                                                .firstWhere(
                                                                  (e) =>
                                                                      "${e?.permitId}" ==
                                                                      "${PermitDetails?.permitId}",
                                                                  orElse: () =>
                                                                      NewPermitModel(
                                                                          permitId:
                                                                              000),
                                                                )
                                                                ?.ptwStatus ==
                                                            PermitStatusConstants
                                                                .PTW_CLOSED
                                                        ? ColorValues.closeColor
                                                        : ColorValues
                                                            .appRedColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            //'${jobDetails?.status ?? ''}
                            ' ${PermitDetails?.current_status_short ?? ''}',
                            style: TextStyle(color: ColorValues.whiteColor),
                          ),
                        ),
                      ),
                    ],
                  )
                : (value == 'Actions')
                    ? controller.misPermit == 1
                        ? TableActionButton(
                            color: ColorValues.appDarkBlueColor,
                            icon: Icons.visibility,
                            message: 'View',
                            onPress: () {
                              int? permitId =
                                  controller.newPermitList[index]?.permitId;
                              controller.viewMisPermitList(
                                  permitId: permitId.toString());
                            },
                          )
                        : Wrap(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Wrap(
                                    children: [
                                      varUserAccessModel.value.access_list!
                                                      .where((e) =>
                                                          e.feature_id ==
                                                              UserAccessConstants
                                                                  .kPermitFeatureId &&
                                                          e.view ==
                                                              UserAccessConstants
                                                                  .kHaveViewAccess)
                                                      .length >
                                                  0 ||
                                              controller.newPermitList
                                                      .firstWhere(
                                                        (e) =>
                                                            "${e?.permitId}" ==
                                                            "${PermitDetails?.permitId}",
                                                        orElse: () =>
                                                            NewPermitModel(
                                                                permitId: 000),
                                                      )
                                                      ?.ptwStatus ==
                                                  PermitStatusConstants
                                                      .PTW_CLOSED
                                          ? TableActionButton(
                                              color:
                                                  ColorValues.appDarkBlueColor,
                                              icon: Icons.visibility,
                                              message: 'View Permit',
                                              onPress: () {
                                                int? permitId = controller
                                                    .newPermitList[index]
                                                    ?.permitId;
                                                controller.viewNewPermitList(
                                                    permitId:
                                                        permitId.toString());
                                              },
                                            )
                                          : Container(),

                                      varUserAccessModel.value.access_list!
                                                      .where((e) =>
                                                          e.feature_id ==
                                                              UserAccessConstants
                                                                  .kPermitFeatureId &&
                                                          e.approve ==
                                                              UserAccessConstants
                                                                  .kHaveApproveAccess)
                                                      .length >
                                                  0 &&
                                              // controller.newPermitList
                                              //         .firstWhere(
                                              //           (e) =>
                                              //               "${e?.permitId}" ==
                                              //               "${PermitDetails?.permitId}",
                                              //           orElse: () =>
                                              //               NewPermitModel(
                                              //                   permitId: 000),
                                              //         )
                                              //         ?.ptwStatus !=
                                              //     PermitStatusConstants
                                              //         .PTW_REJECTED_BY_APPROVER //124
                                              // ||
                                              // controller.newPermitList
                                              //             .firstWhere(
                                              //               (e) =>
                                              //                   "${e?.permitId}" ==
                                              //                   "${PermitDetails?.permitId}",
                                              //               orElse: () =>
                                              //                   NewPermitModel(
                                              //                       permitId: 000),
                                              //             )
                                              //             ?.ptwStatus ==
                                              //         PermitStatusConstants
                                              //             .PTW_CREATED
                                              //121
                                              // AppConstants.kPermitStatusCreated ///121
                                              // &&
                                              controller.newPermitList
                                                      .firstWhere(
                                                        (e) =>
                                                            "${e?.permitId}" ==
                                                            "${PermitDetails?.permitId}",
                                                        orElse: () =>
                                                            NewPermitModel(
                                                                permitId: 000),
                                                      )
                                                      ?.ptwStatus ==
                                                  PermitStatusConstants
                                                      .PTW_EXTEND_REQUESTED //133

                                          ? TableActionButton(
                                              color: const Color.fromRGBO(
                                                  134, 196, 102, 1),
                                              icon: Icons.check,
                                              message: "Approve/Reject Extend",
                                              onPress: () {
                                                controller.viewNewPermitList(
                                                    permitId: PermitDetails
                                                        ?.permitId
                                                        .toString());
                                              },
                                            )
                                          : Dimens.box0,
                                      varUserAccessModel.value.access_list!
                                                      .where((e) =>
                                                          e.feature_id ==
                                                              UserAccessConstants
                                                                  .kPermitFeatureId &&
                                                          e.approve ==
                                                              UserAccessConstants
                                                                  .kHaveApproveAccess)
                                                      .length >
                                                  0 &&
                                              controller.newPermitList
                                                      .firstWhere(
                                                        (e) =>
                                                            "${e?.permitId}" ==
                                                            "${PermitDetails?.permitId}",
                                                        orElse: () =>
                                                            NewPermitModel(
                                                                permitId: 000),
                                                      )
                                                      ?.ptwStatus ==
                                                  PermitStatusConstants
                                                      .PTW_CREATED
                                          ? TableActionButton(
                                              color: const Color.fromRGBO(
                                                  134, 196, 102, 1),
                                              icon: Icons.check,
                                              message: 'Approve/Reject Permit',
                                              onPress: () {
                                                controller.viewNewPermitList(
                                                    permitId: PermitDetails
                                                        ?.permitId
                                                        .toString());
                                              },
                                            )
                                          : Dimens.box0,

                                      ///Permit Edit button
                                      varUserAccessModel.value.access_list!
                                                      .where((e) =>
                                                          e.feature_id ==
                                                              UserAccessConstants
                                                                  .kPermitFeatureId &&
                                                          e.edit ==
                                                              UserAccessConstants
                                                                  .kHaveEditAccess)
                                                      .length >
                                                  0 &&
                                              controller.newPermitList
                                                      .firstWhere(
                                                        (e) =>
                                                            "${e?.permitId}" ==
                                                            "${PermitDetails?.permitId}",
                                                        orElse: () =>
                                                            NewPermitModel(
                                                                permitId: 000),
                                                      )
                                                      ?.ptwStatus ==
                                                  PermitStatusConstants
                                                      .PTW_CREATED //121
                                          // ||
                                          // controller.newPermitList
                                          //         .firstWhere(
                                          //           (e) =>
                                          //               "${e?.permitId}" ==
                                          //               "${PermitDetails?.permitId}",
                                          //           orElse: () =>
                                          //               NewPermitModel(
                                          //                   permitId: 000),
                                          //         )
                                          //         ?.ptwStatus ==
                                          //     124
                                          ? TableActionButton(
                                              color: ColorValues.appYellowColor,
                                              icon: Icons.edit,
                                              message: 'Edit Permit',
                                              onPress: () {
                                                // controller.viewNewPermitList(
                                                //     permitId:
                                                //         PermitDetails?.permitId);
                                                controller.editNewPermit(
                                                    permitId:
                                                        PermitDetails?.permitId,
                                                    isChecked: controller
                                                        .isChecked.value);
                                              },
                                            )
                                          : Dimens.box0,
                                      controller.newPermitList
                                                      .firstWhere(
                                                        (e) =>
                                                            "${e?.permitId}" ==
                                                            "${PermitDetails?.permitId}",
                                                        orElse: () =>
                                                            NewPermitModel(
                                                                permitId: 000),
                                                      )
                                                      ?.ptwStatus ==
                                                  PermitStatusConstants
                                                      .PTW_APPROVE //125

                                              &&
                                              varUserAccessModel
                                                      .value.access_list!
                                                      .where((e) =>
                                                          e.feature_id ==
                                                              UserAccessConstants
                                                                  .kPermitFeatureId &&
                                                          e.add ==
                                                              UserAccessConstants
                                                                  .kHaveAddAccess)
                                                      .length >
                                                  0 &&
                                              controller.newPermitList
                                                      .firstWhere(
                                                        (e) =>
                                                            "${e?.permitId}" ==
                                                            "${PermitDetails?.permitId}",
                                                        orElse: () =>
                                                            NewPermitModel(
                                                                permitId: 000),
                                                      )
                                                      ?.tbT_Done_Check ==
                                                  0 &&
                                              controller.newPermitList
                                                      .firstWhere(
                                                        (e) =>
                                                            "${e?.permitId}" ==
                                                            "${PermitDetails?.permitId}",
                                                        orElse: () =>
                                                            NewPermitModel(
                                                                permitId: 000),
                                                      )
                                                      ?.requestById ==
                                                  varUserAccessModel
                                                      .value.user_id
                                          ?
                                          // For date formatting

                                          TableActionButton(
                                              color: Color.fromARGB(
                                                  136, 107, 152, 211),
                                              icon: Icons.golf_course,
                                              message: 'GO For TBT',
                                              onPress: () {
                                                final newPermit = controller
                                                    .newPermitList
                                                    .firstWhere(
                                                  (e) =>
                                                      "${e?.permitId}" ==
                                                      "${PermitDetails?.permitId}",
                                                  orElse: () => NewPermitModel(
                                                      permitId: 000),
                                                );

                                                if (controller.newPermitList
                                                        .firstWhere(
                                                          (e) =>
                                                              "${e?.permitId}" ==
                                                              "${PermitDetails?.permitId}",
                                                          orElse: () =>
                                                              NewPermitModel(
                                                                  permitId:
                                                                      000),
                                                        )
                                                        ?.tbt_start ==
                                                    0) {
                                                  // Check if endDate is not null before parsing
                                                  String? startDateString =
                                                      newPermit?.startDate;
                                                  String formattedStartDate =
                                                      "Unknown Start Time";

                                                  if (startDateString != null) {
                                                    DateTime startDate =
                                                        DateTime.parse(
                                                            startDateString);
                                                    formattedStartDate =
                                                        DateFormat(
                                                                'yyyy-MM-dd HH:mm')
                                                            .format(startDate);
                                                  }

                                                  Get.defaultDialog(
                                                    title: "Alert",
                                                    middleText:
                                                        "You can't Start Task before the start time ($formattedStartDate) of the permit",
                                                    confirm: ElevatedButton(
                                                      onPressed: () =>
                                                          Get.back(),
                                                      child: Text("OK"),
                                                    ),
                                                  );
                                                } else {
                                                  // Proceed with the action
                                                  controller.editNewPermit(
                                                    permitId:
                                                        PermitDetails?.permitId,
                                                    isChecked: controller
                                                        .isChecked.value,
                                                  );
                                                }
                                              },
                                            )

                                          //  TableActionButton(
                                          //     color: Color.fromARGB(
                                          //         136, 107, 152, 211),
                                          //     icon: Icons.golf_course,
                                          //     message: 'GO For TBT',
                                          //     onPress: () {
                                          //       final newPermit = controller
                                          //           .newPermitList
                                          //           .firstWhere(
                                          //         (e) =>
                                          //             "${e?.permitId}" ==
                                          //             "${PermitDetails?.permitId}",
                                          //         orElse: () =>
                                          //             NewPermitModel(permitId: 000),
                                          //       );

                                          //       if (newPermit?.tbt_start == 1) {
                                          //         Get.defaultDialog(
                                          //           title: "Alert",
                                          //           middleText:
                                          //               "You can't Start Task before the start time of the permit",
                                          //           confirm: ElevatedButton(
                                          //             onPressed: () => Get.back(),
                                          //             child: Text("OK"),
                                          //           ),
                                          //         );
                                          //       } else {
                                          //         controller.editNewPermit(
                                          //           permitId:
                                          //               PermitDetails?.permitId,
                                          //           isChecked:
                                          //               controller.isChecked.value,
                                          //         );
                                          //       }
                                          //     },
                                          //   )
                                          : Dimens.box0,
                                      controller.newPermitList
                                                      .firstWhere(
                                                        (e) =>
                                                            "${e?.permitId}" ==
                                                            "${PermitDetails?.permitId}",
                                                        orElse: () =>
                                                            NewPermitModel(
                                                                permitId: 000),
                                                      )
                                                      ?.ptwStatus ==
                                                  PermitStatusConstants
                                                      .PTW_REJECTED_BY_APPROVER //124
                                              ||
                                              controller.newPermitList
                                                          .firstWhere(
                                                            (e) =>
                                                                "${e?.permitId}" ==
                                                                "${PermitDetails?.permitId}",
                                                            orElse: () =>
                                                                NewPermitModel(
                                                                    permitId:
                                                                        000),
                                                          )
                                                          ?.ptwStatus ==
                                                      PermitStatusConstants
                                                          .PTW_CANCEL_REQUEST_APPROVED &&
                                                  varUserAccessModel
                                                          .value.access_list!
                                                          .where((e) =>
                                                              e.feature_id ==
                                                                  UserAccessConstants
                                                                      .kPermitFeatureId &&
                                                              e.add ==
                                                                  UserAccessConstants
                                                                      .kHaveAddAccess)
                                                          .length >
                                                      0
                                          ? TableActionButton(
                                              color: Color.fromARGB(
                                                  255, 116, 78, 130),
                                              icon: Icons.ads_click,
                                              message: 'Re-Submit Permit',
                                              onPress: () {
                                                controller.editNewPermit(
                                                    permitId:
                                                        PermitDetails?.permitId,
                                                    isChecked: controller
                                                        .isChecked.value);
                                              },
                                            )
                                          : Dimens.box0,

                                      ///Extend Button
                                      // varUserAccessModel.value.access_list!
                                      //                     .where((e) =>
                                      //                         e.feature_id ==
                                      //                             UserAccessConstants
                                      //                                 .kPermitFeatureId &&
                                      //                         e.edit ==
                                      //                             UserAccessConstants
                                      //                                 .kHaveEditAccess)
                                      //                     .length >
                                      //                 0 &&
                                      //             controller.newPermitList
                                      //                     .firstWhereOrNull(
                                      //                       (e) =>
                                      //                           "${e?.permitId}" ==
                                      //                           "${PermitDetails?.permitId}",
                                      //                     )
                                      //                     ?.jc_status !=
                                      //                 158 &&
                                      //             controller.newPermitList
                                      //                     .firstWhere(
                                      //                       (e) =>
                                      //                           "${e?.permitId}" ==
                                      //                           "${PermitDetails?.permitId}",
                                      //                       orElse: () =>
                                      //                           NewPermitModel(
                                      //                               permitId:
                                      //                                   000),
                                      //                     )
                                      //                     ?.isExpired ==
                                      //                 0 ||
                                      controller.newPermitList
                                                      .firstWhere(
                                                        (e) =>
                                                            "${e?.permitId}" ==
                                                            "${PermitDetails?.permitId}",
                                                        orElse: () =>
                                                            NewPermitModel(
                                                                permitId: 000),
                                                      )
                                                      ?.requestById ==
                                                  varUserAccessModel
                                                      .value.user_id &&
                                              (controller.newPermitList
                                                          .firstWhere(
                                                            (e) =>
                                                                "${e?.permitId}" ==
                                                                "${PermitDetails?.permitId}",
                                                            orElse: () =>
                                                                NewPermitModel(
                                                                    permitId:
                                                                        000),
                                                          )
                                                          ?.ptwStatus ==
                                                      PermitStatusConstants
                                                          .PTW_APPROVE //125
                                                  &&
                                                  controller.newPermitList
                                                          .firstWhere(
                                                            (e) =>
                                                                "${e?.permitId}" ==
                                                                "${PermitDetails?.permitId}",
                                                            orElse: () =>
                                                                NewPermitModel(
                                                                    permitId:
                                                                        000),
                                                          )
                                                          ?.tbT_Done_Check ==
                                                      1 &&
                                                  (controller.newPermitList
                                                          .firstWhere(
                                                            (e) =>
                                                                "${e?.permitId}" ==
                                                                "${PermitDetails?.permitId}",
                                                            orElse: () =>
                                                                NewPermitModel(
                                                                    permitId:
                                                                        000),
                                                          )
                                                          ?.jc_id !=
                                                      0) &&
                                                  (controller.newPermitList
                                                          .firstWhere(
                                                            (e) =>
                                                                "${e?.permitId}" ==
                                                                "${PermitDetails?.permitId}",
                                                            orElse: () =>
                                                                NewPermitModel(
                                                                    permitId:
                                                                        000),
                                                          )
                                                          ?.isExpired ==
                                                      0) &&
                                                  (controller.newPermitList
                                                              .firstWhere(
                                                                (e) =>
                                                                    "${e?.permitId}" ==
                                                                    "${PermitDetails?.permitId}",
                                                                orElse: () =>
                                                                    NewPermitModel(
                                                                        permitId:
                                                                            000),
                                                              )
                                                              ?.jc_status ==
                                                          152)
                                                      // controller.isOneHour(controller
                                                      //             .newPermitList
                                                      //             .firstWhere(
                                                      //               (e) =>
                                                      //                   "${e?.permitId}" ==
                                                      //                   "${PermitDetails?.permitId}",
                                                      //             )
                                                      //             ?.endDate ??
                                                      //         "")
                                                      ==
                                                      true
                                              //||
                                              // controller.newPermitList
                                              //         .firstWhere(
                                              //           (e) =>
                                              //               "${e?.permitId}" ==
                                              //               "${PermitDetails?.permitId}",
                                              //           orElse: () =>
                                              //               NewPermitModel(
                                              //                   permitId:
                                              //                       000),
                                              //         )
                                              //         ?.ptwStatus ==
                                              //     135
                                              )
                                          ? TableActionButton(
                                              color:
                                                  ColorValues.appDarkBlueColor,
                                              icon: Icons.expand_outlined,
                                              message: 'Extend Permit',
                                              onPress: () {
                                                // Get.dialog(PermitExtendDialog(
                                                //     permitId: PermitDetails?.permitId
                                                //         .toString()));
                                                controller.extendPermitList(
                                                    permitId: PermitDetails
                                                        ?.permitId);
                                              },
                                            )
                                          : Container(),

                                      ////Approve button

                                      ///Close Permit
                                      varUserAccessModel.value.access_list!
                                                          .where((e) =>
                                                              e.feature_id ==
                                                                  UserAccessConstants
                                                                      .kPermitFeatureId &&
                                                              e.add ==
                                                                  UserAccessConstants
                                                                      .kHaveAddAccess)
                                                          .length >
                                                      0 &&
                                                  controller.newPermitList
                                                          .firstWhere(
                                                            (e) =>
                                                                "${e?.permitId}" ==
                                                                "${PermitDetails?.permitId}",
                                                            orElse: () =>
                                                                NewPermitModel(
                                                                    permitId:
                                                                        000),
                                                          )
                                                          ?.ptwStatus ==
                                                      PermitStatusConstants
                                                          .PTW_CANCEL_REQUEST_REJECTED //121
                                              ||
                                              controller.newPermitList
                                                      .firstWhere(
                                                        (e) =>
                                                            "${e?.permitId}" ==
                                                            "${PermitDetails?.permitId}",
                                                        orElse: () =>
                                                            NewPermitModel(
                                                                permitId: 000),
                                                      )
                                                      ?.ptwStatus ==
                                                  PermitStatusConstants
                                                      .PTW_EXTEND_REQUEST_REJECTED
                                          ? TableActionButton(
                                              color:
                                                  ColorValues.appcloseRedColor,
                                              icon: Icons.close,
                                              message: 'Close Permit',
                                              onPress: () {
                                                // Get.dialog(PermitCloseDialog(
                                                //     permitId: PermitDetails?.permitId
                                                //         .toString()));
                                                controller
                                                    .closePermitRequestList(
                                                        permitId: PermitDetails
                                                            ?.permitId);
                                              },
                                            )
                                          : Container(),

                                      ////Permit Cancel By Approver / Cancel Permit Request
                                      (controller.newPermitList
                                                      .firstWhere(
                                                        (e) =>
                                                            "${e?.permitId}" ==
                                                            "${PermitDetails?.permitId}",
                                                        orElse: () =>
                                                            NewPermitModel(
                                                                permitId: 000),
                                                      )
                                                      ?.ptwStatus !=
                                                  PermitStatusConstants
                                                      .PTW_CANCEL_REQUEST_APPROVED) &&
                                              controller.newPermitList
                                                      .firstWhere(
                                                        (e) =>
                                                            "${e?.permitId}" ==
                                                            "${PermitDetails?.permitId}",
                                                        orElse: () =>
                                                            NewPermitModel(
                                                                permitId: 000),
                                                      )
                                                      ?.ptwStatus !=
                                                  PermitStatusConstants
                                                      .PTW_CLOSED &&
                                              (varUserAccessModel
                                                          .value.access_list!
                                                          .where((e) =>
                                                              e.feature_id ==
                                                                  UserAccessConstants
                                                                      .kPermitFeatureId &&
                                                              e.approve ==
                                                                  UserAccessConstants
                                                                      .kHaveApproveAccess)
                                                          .length >
                                                      0
                                                  //126
                                                  ||
                                                  varUserAccessModel
                                                          .value.access_list!
                                                          .where((e) =>
                                                              e.feature_id ==
                                                                  UserAccessConstants
                                                                      .kPermitFeatureId &&
                                                              e.edit ==
                                                                  UserAccessConstants
                                                                      .kHaveEditAccess)
                                                          .length >
                                                      0 ||
                                                  controller.newPermitList
                                                          .firstWhere(
                                                            (e) =>
                                                                "${e?.permitId}" ==
                                                                "${PermitDetails?.permitId}",
                                                            orElse: () =>
                                                                NewPermitModel(
                                                                    permitId:
                                                                        000),
                                                          )
                                                          ?.ptwStatus ==
                                                      PermitStatusConstants
                                                          .PTW_APPROVE //125
                                                  ||
                                                  controller.newPermitList
                                                          .firstWhere(
                                                            (e) =>
                                                                "${e?.permitId}" ==
                                                                "${PermitDetails?.permitId}",
                                                            orElse: () =>
                                                                NewPermitModel(
                                                                    permitId:
                                                                        000),
                                                          )
                                                          ?.ptwStatus ==
                                                      PermitStatusConstants
                                                          .PTW_CREATED //121
                                                  ||
                                                  controller.newPermitList
                                                          .firstWhere(
                                                            (e) =>
                                                                "${e?.permitId}" ==
                                                                "${PermitDetails?.permitId}",
                                                            orElse: () =>
                                                                NewPermitModel(
                                                                    permitId:
                                                                        000),
                                                          )
                                                          ?.ptwStatus ==
                                                      PermitStatusConstants
                                                          .PTW_EXTEND_REQUEST_REJECTED ||
                                                  controller.newPermitList
                                                          .firstWhere(
                                                            (e) =>
                                                                "${e?.permitId}" ==
                                                                "${PermitDetails?.permitId}",
                                                            orElse: () =>
                                                                NewPermitModel(
                                                                    permitId:
                                                                        000),
                                                          )
                                                          ?.ptwStatus ==
                                                      PermitStatusConstants
                                                          .PTW_CANCEL_REQUEST_REJECTED)
                                          ? TableActionButton(
                                              color: ColorValues.appRedColor,
                                              icon: Icons.close,
                                              message: 'Cancel Permit',
                                              onPress: () {
                                                controller.cancelPermitList(
                                                    permitId: PermitDetails
                                                        ?.permitId);
                                                // Get.dialog(PermitCancelReQuestDialog(
                                                //     permitId: PermitDetails?.permitId
                                                //         .toString()));
                                              },
                                            )
                                          : Dimens.box0,

                                      varUserAccessModel.value.access_list!
                                                      .where((e) =>
                                                          e.feature_id ==
                                                              UserAccessConstants
                                                                  .kPermitFeatureId &&
                                                          e.approve ==
                                                              UserAccessConstants
                                                                  .kHaveApproveAccess)
                                                      .length >
                                                  0 &&
                                              controller.newPermitList
                                                      .firstWhere(
                                                        (e) =>
                                                            "${e?.permitId}" ==
                                                            "${PermitDetails?.permitId}",
                                                        orElse: () =>
                                                            NewPermitModel(
                                                                permitId: 000),
                                                      )
                                                      ?.ptwStatus ==
                                                  PermitStatusConstants
                                                      .PTW_CANCEL_REQUESTED //130
                                          ? TableActionButton(
                                              color: Color.fromARGB(
                                                  255, 113, 15, 149),
                                              icon: Icons.approval_rounded,
                                              message: ' Approve Cancel',
                                              onPress: () {
                                                controller.viewNewPermitList(
                                                    permitId: PermitDetails
                                                        ?.permitId
                                                        .toString());
                                              },
                                            )
                                          : Dimens.box0
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        controller.viewNewPermitList(
            permitId: PermitDetails?.permitId.toString());
      },
    );
  }

  @override
  int get rowCount => filteredNewPermitList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
