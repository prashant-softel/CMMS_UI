import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/new_permit_list/permit_status_constants.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../utils/user_access_constants.dart';
import '../../widgets/action_button.dart';
import '../../widgets/custom_elevated_button.dart';
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

            return Stack(
              children: [
                Column(
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
                              // Get.back();
                              Get.offAllNamed(Routes.breakdown);
                            },
                            child: Text(" / BREAKDOWN MAINTAINANCE",
                                style: Styles.greyMediumLight12),
                          ),
                          Text(" / PERMIT LIST",
                              style: Styles.greyMediumLight12),
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
                                        children: [
                                          Text(
                                            "Permit List ",
                                            style: Styles.blackBold16,
                                          ),
                                          Spacer(),
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
                                                    '${controller.formattedFromdate.toString()} - ${controller.formattedTodate.toString()}',
                                              ),
                                            ],
                                          ),
                                          Dimens.boxWidth10,
                                          varUserAccessModel.value.access_list!
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
                                                    controller.clearStoreData();
                                                    controller
                                                        .clearTypeStoreData();
                                                    controller
                                                        .clearisCheckedtoreData();
                                                    Get.toNamed(
                                                        Routes.newPermit);
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
                                              color:
                                                  ColorValues.appLightBlueColor,
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
                                          itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry<String>>[]
                                                ..addAll(controller
                                                    .columnVisibility
                                                    .value
                                                    .entries
                                                    .map((e) {
                                                  return PopupMenuItem<String>(
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
                                        Spacer(),
                                        Container(
                                          width: 200,
                                          height: 35,
                                          margin: Dimens.edgeInsets0_0_16_0,
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
                                    controller.newPermitList.isEmpty == true
                                        ? Center(child: Text('No data'))
                                        : Expanded(
                                            child: ValueListenableBuilder(
                                              valueListenable:
                                                  controller.columnVisibility,
                                              builder: (context, value, child) {
                                                final dataSource =
                                                    PermitListDataSource(
                                                        controller);
                                                return PaginatedDataTable2(
                                                  columnSpacing: 10,
                                                  dataRowHeight:
                                                      Get.height * 0.12,

                                                  source:
                                                      dataSource, // Custom DataSource class
                                                  headingRowHeight:
                                                      Get.height * 0.12,
                                                  minWidth:
                                                      3000, //Get.width * 1.2,
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
                                                    // buildDataColumn(
                                                    //   'PermitId',
                                                    //   'Permit Id',
                                                    //   //  ColumnSize.S,
                                                    //   controller
                                                    //       .PermitIdFilterText,
                                                    //   130,
                                                    // ),

                                                    // // buildDataColumn(
                                                    // //     "Description",
                                                    // //     "Description",
                                                    // //     // ColumnSize.M,
                                                    // //     controller
                                                    // //         .DescriptionFilterText,
                                                    // //     200),
                                                    // buildDataColumn(
                                                    //   'Description',
                                                    //   'Title',
                                                    //   //  ColumnSize.S,
                                                    //   controller
                                                    //       .DescriptionFilterText,
                                                    //   200,
                                                    // ),
                                                    // buildDataColumn(
                                                    //   'PermitTypeName',
                                                    //   'Permit Type Name',
                                                    //   //  ColumnSize.S,
                                                    //   controller
                                                    //       .PermitTypeNameFilterText,
                                                    //   200,
                                                    // ),
                                                    // buildDataColumn(
                                                    //   'EquipmentCategories',
                                                    //   'Equipment Category',
                                                    //   //  ColumnSize.S,
                                                    //   controller
                                                    //       .EquipmentCategoriesFilterText,
                                                    //   180,
                                                    // ),
                                                    // buildDataColumn(
                                                    //     "WorkingAreaName",
                                                    //     "Working Area", // ColumnSize.L,
                                                    //     controller
                                                    //         .WorkingAreaNameFilterText,
                                                    //     200),
                                                    // buildDataColumn(
                                                    //     "RequestByName",
                                                    //     "Requested By",
                                                    //     // ColumnSize.L,
                                                    //     controller
                                                    //         .RequestByNameFilterText,
                                                    //     200),
                                                    // buildDataColumn(
                                                    //     "ApprovedByName",
                                                    //     "Approved By",
                                                    //     // ColumnSize.L,
                                                    //     controller
                                                    //         .ApprovedByNameFilterText,
                                                    //     200),
                                                    // buildDataColumn(
                                                    //     "CurrentStatusShort",
                                                    //     "Status",
                                                    //     // ColumnSize.L,
                                                    //     controller
                                                    //         .CurrentStatusShortFilterText,
                                                    //     200),
                                                    // buildDataColumn(
                                                    //     "PTW Status code",
                                                    //     "Status code",
                                                    //     // ColumnSize.L,
                                                    //     controller
                                                    //         .PtwStatusFilterText,
                                                    //     200),
                                                    // buildDataColumn(
                                                    //     'Action'.tr,
                                                    //     'Actions',
                                                    //     // ColumnSize.L,
                                                    //     controller
                                                    //         .ActionFilterText,
                                                    //     230),
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
                        var dropDate = DateTime.parse(data.endDate.toString());
                        dropDate != null
                            ? controller.toDate.value = dropDate
                            : controller.toDate.value = pickUpDate;

                        controller.getNewPermitListByDate();
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

      label: //
          Column(
              mainAxisAlignment: MainAxisAlignment.center, //
              children: [
            SizedBox(
              height: Get.height * 0.05,
              child: TextField(
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 16.0, height: 1.0, color: Colors.black),
                ),
                onChanged: (value) {
                  filterText.value = value;
                },
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintText: 'Filter',
                  contentPadding: EdgeInsets.fromLTRB(
                      5, 0, 5, 0), // Reduced vertical padding
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
    var cellsBuffer = [
      // '${McExcutionListDetails?.id ?? ''}',
      "id",
      '${PermitDetails?.description ?? ''}',
      '${PermitDetails?.permitTypeName ?? ''}',
      '${PermitDetails?.equipment_categories ?? ''}',
      '${PermitDetails?.workingAreaName ?? ''}',
      '${PermitDetails?.requestByName ?? ''}\n${PermitDetails?.requestDatetime}',
      '${PermitDetails?.approvedByName ?? ''}\n${PermitDetails?.approvedDatetime}',
      '${PermitDetails?.ptwStatus ?? ''}',
      '${PermitDetails?.ptwStatus ?? ''}',

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
                                                .PTW_APPROVE //125
                                        ||
                                        controller.newPermitList
                                                .firstWhere(
                                                  (e) =>
                                                      "${e?.permitId}" ==
                                                      "${PermitDetails?.permitId}",
                                                  orElse: () => NewPermitModel(
                                                      permitId: 000),
                                                )
                                                ?.ptwStatus ==
                                            PermitStatusConstants
                                                .PTW_EXTEND_REQUEST_APPROVE //135

                                    ? ColorValues.appGreenColor
                                    : ColorValues.appRedColor,
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
                    ? Wrap(
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
                                              PermitStatusConstants.PTW_CLOSED
                                      ? TableActionButton(
                                          color: ColorValues.appDarkBlueColor,
                                          icon: Icons.visibility,
                                          message: 'View Permit',
                                          onPress: () {
                                            controller.viewNewPermitList(
                                                permitId:
                                                    PermitDetails?.permitId);
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
                                                      .PTW_REJECTED_BY_APPROVER //124
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
                                                      .PTW_CREATED
                                              //121
                                              // AppConstants.kPermitStatusCreated ///121
                                              &&
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
                                          color: ColorValues.appGreenColor,
                                          icon: Icons.add,
                                          message: controller.newPermitList
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
                                              // AppConstants.kPermitStatusCreated ///121
                                              ? 'Approve/Reject Permit'
                                              : "Approve/Reject Extend",
                                          onPress: () {
                                            controller.viewNewPermitList(
                                                permitId:
                                                    PermitDetails?.permitId);
                                          },
                                        )
                                      : Dimens.box0,

                                  ///Permit Edit button
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
                                                isChecked:
                                                    controller.isChecked.value);
                                            print(
                                                'PermitTest:${controller.newPermitListModel?.permitId}');
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
                                                  .PTW_REJECTED_BY_APPROVER //124

                                          &&
                                          varUserAccessModel.value.access_list!
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
                                          color:
                                              Color.fromARGB(255, 116, 78, 130),
                                          icon: Icons.ads_click,
                                          message: 'Re-Submit Permit',
                                          onPress: () {
                                            controller.editNewPermit(
                                                permitId:
                                                    PermitDetails?.permitId,
                                                isChecked:
                                                    controller.isChecked.value);
                                            print(
                                                'PermitTest:${controller.newPermitListModel?.permitId}');
                                          },
                                        )
                                      : Dimens.box0,

                                  ///Extend Button
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
                                                                permitId: 000),
                                                      )
                                                      ?.isExpired ==
                                                  1 ||
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
                                                                permitId: 000),
                                                      )
                                                      ?.ptwStatus ==
                                                  PermitStatusConstants
                                                      .PTW_APPROVE //125
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
                                          color: ColorValues.appDarkBlueColor,
                                          icon: Icons.expand_outlined,
                                          message: 'Extend Permit',
                                          onPress: () {
                                            // Get.dialog(PermitExtendDialog(
                                            //     permitId: PermitDetails?.permitId
                                            //         .toString()));
                                            controller.extendPermitList(
                                                permitId:
                                                    PermitDetails?.permitId);
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
                                                                permitId: 000),
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
                                          color: ColorValues.appcloseRedColor,
                                          icon: Icons.close,
                                          message: 'Close Permit',
                                          onPress: () {
                                            // Get.dialog(PermitCloseDialog(
                                            //     permitId: PermitDetails?.permitId
                                            //         .toString()));
                                            controller.closePermitRequestList(
                                                permitId:
                                                    PermitDetails?.permitId);
                                          },
                                        )
                                      : Container(),

                                  ////Permit Cancel By Approver / Cancel Permit Request
                                  varUserAccessModel.value.access_list!
                                                  .where((e) =>
                                                      e.feature_id ==
                                                          UserAccessConstants
                                                              .kPermitFeatureId &&
                                                      e.approve ==
                                                          UserAccessConstants
                                                              .kHaveApproveAccess)
                                                  .length >
                                              0 ||
                                          // varUserAccessModel.value.access_list!
                                          //         .where((e) =>
                                          //             e.feature_id ==
                                          //                 UserAccessConstants
                                          //                     .kPermitFeatureId &&
                                          //             e.edit ==
                                          //                 UserAccessConstants
                                          //                     .kHaveEditAccess)
                                          //         .length >
                                          //     0
                                          //      ||
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
                                                  .PTW_CREATED //121
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
                                                  .PTW_EXTEND_REQUEST_REJECTED ||
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
                                                  .PTW_CANCEL_REQUEST_REJECTED
                                      ? TableActionButton(
                                          color: ColorValues.appRedColor,
                                          icon: Icons.close,
                                          message: 'Cancel Permit',
                                          onPress: () {
                                            controller.cancelPermitList(
                                                permitId:
                                                    PermitDetails?.permitId);
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
                                          color:
                                              Color.fromARGB(255, 113, 15, 149),
                                          icon: Icons.approval_rounded,
                                          message: ' Approve Cancel',
                                          onPress: () {
                                            controller.viewNewPermitList(
                                                permitId:
                                                    PermitDetails?.permitId);
                                          },
                                        )
                                      : Dimens.box0

                                  // TableActionButton(
                                  //     color: ColorValues.appRedColor,
                                  //     icon: Icons.close,
                                  //     message: 'Cancel Permit',
                                  //     onPress: () {
                                  //       controller.cancelPermitList(
                                  //           permitId:
                                  //               PermitDetails?.permitId);
                                  //       // Get.dialog(PermitCancelReQuestDialog(
                                  //       //     permitId: PermitDetails?.permitId
                                  //       //         .toString()));
                                  //     },
                                  //   ),
                                ],
                              ),

                              ///Checkbox
                              // varUserAccessModel.value.access_list!
                              //                 .where((e) =>
                              //                     e.feature_id ==
                              //                         UserAccessConstants
                              //                             .kPermitFeatureId &&
                              //                     e.edit ==
                              //                         UserAccessConstants
                              //                             .kHaveEditAccess)
                              //                 .length >
                              //             0
                              // &&
                              // controller.newPermitList
                              //         .firstWhere(
                              //           (e) =>
                              //               "${e?.permitId}" ==
                              //               "${PermitDetails?.permitId}",
                              //           orElse: () =>
                              //               NewPermitModel(permitId: 000),
                              //         )
                              //         ?.ptwStatus ==
                              //     124
                              // ? Row(
                              //     children: [
                              //       Obx(
                              //         () => Checkbox(
                              //           value: controller.isChecked.value,
                              //           onChanged: (value) {
                              //             // When the checkbox is changed, update the state using the controller
                              //             controller.isChecked.value = value!;
                              //             print(
                              //                 'Checkbox Value:${controller.isChecked.value}');
                              //           },
                              //         ),
                              //       ),
                              //       Text('Re-Submit for approval'),
                              //     ],
                              //   )
                              // : Container(),
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
        controller.viewNewPermitList(permitId: PermitDetails?.permitId);
      },
    );
  }

  // @override
  // DataRow? getRow(int index) {
  //   final PermitDetails = filteredNewPermitList[index];

  //   controller.permitId.value = PermitDetails?.permitId ?? 0;

  //   return DataRow.byIndex(
  //       index: index,
  //       cells: [
  //         DataCell(
  //           Text(
  //             '${PermitDetails?.permitId ?? ''}',
  //           ),
  //         ),
  //         DataCell(
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 '${PermitDetails?.description ?? ''}',
  //               ),
  //               Container(
  //                 padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
  //                 margin: EdgeInsets.only(top: 5),
  //                 decoration: BoxDecoration(
  //                   color: controller.newPermitList
  //                                   .firstWhere(
  //                                     (e) =>
  //                                         "${e?.permitId}" ==
  //                                         "${PermitDetails?.permitId}",
  //                                     orElse: () =>
  //                                         NewPermitModel(permitId: 000),
  //                                   )
  //                                   ?.ptwStatus ==
  //                               PermitStatusConstants.PTW_CREATED //121
  //                           ||
  //                           controller.newPermitList
  //                                   .firstWhere(
  //                                     (e) =>
  //                                         "${e?.permitId}" ==
  //                                         "${PermitDetails?.permitId}",
  //                                     orElse: () =>
  //                                         NewPermitModel(permitId: 000),
  //                                   )
  //                                   ?.ptwStatus ==
  //                               PermitStatusConstants.PTW_EXTEND_REQUESTED
  //                       ? ColorValues.yellowColor
  //                       : controller.newPermitList
  //                                       .firstWhere(
  //                                         (e) =>
  //                                             "${e?.permitId}" ==
  //                                             "${PermitDetails?.permitId}",
  //                                         orElse: () =>
  //                                             NewPermitModel(permitId: 000),
  //                                       )
  //                                       ?.ptwStatus ==
  //                                   PermitStatusConstants.PTW_APPROVE //125
  //                               ||
  //                               controller.newPermitList
  //                                       .firstWhere(
  //                                         (e) =>
  //                                             "${e?.permitId}" ==
  //                                             "${PermitDetails?.permitId}",
  //                                         orElse: () =>
  //                                             NewPermitModel(permitId: 000),
  //                                       )
  //                                       ?.ptwStatus ==
  //                                   PermitStatusConstants
  //                                       .PTW_EXTEND_REQUEST_APPROVE //135

  //                           ? ColorValues.appGreenColor
  //                           : ColorValues.appRedColor,
  //                   borderRadius: BorderRadius.circular(5),
  //                 ),
  //                 child: Text(
  //                   //'${jobDetails?.status ?? ''}
  //                   ' ${PermitDetails?.current_status_short ?? ''}',
  //                   style: TextStyle(color: ColorValues.whiteColor),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),

  //         // '${PermitDetails?.id ?? ''}',
  //         ...[
  //           '${PermitDetails?.permitTypeName ?? ''}',
  //           '${PermitDetails?.equipment_categories ?? ''}',
  //           '${PermitDetails?.workingAreaName ?? ''}',
  //           '${PermitDetails?.requestByName ?? ''}\n${PermitDetails?.requestDatetime}',
  //           '${PermitDetails?.approvedByName ?? ''}\n${PermitDetails?.approvedDatetime}',
  //           '${PermitDetails?.current_status_short ?? ''}',
  //           '${PermitDetails?.ptwStatus ?? ''}',
  //           'Actions',
  //         ].map((value) {
  //           return DataCell(
  //             Padding(
  //               padding: EdgeInsets.zero,
  //               child: (value == 'Actions')
  //                   ? Column(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         Wrap(
  //                           children: [
  //                             varUserAccessModel.value.access_list!
  //                                             .where((e) =>
  //                                                 e.feature_id ==
  //                                                     UserAccessConstants
  //                                                         .kPermitFeatureId &&
  //                                                 e.view ==
  //                                                     UserAccessConstants
  //                                                         .kHaveViewAccess)
  //                                             .length >
  //                                         0 ||
  //                                     controller.newPermitList
  //                                             .firstWhere(
  //                                               (e) =>
  //                                                   "${e?.permitId}" ==
  //                                                   "${PermitDetails?.permitId}",
  //                                               orElse: () => NewPermitModel(
  //                                                   permitId: 000),
  //                                             )
  //                                             ?.ptwStatus ==
  //                                         PermitStatusConstants.PTW_CLOSED
  //                                 ? TableActionButton(
  //                                     color: ColorValues.appDarkBlueColor,
  //                                     icon: Icons.visibility,
  //                                     message: 'View Permit',
  //                                     onPress: () {
  //                                       controller.viewNewPermitList(
  //                                           permitId: PermitDetails?.permitId);
  //                                     },
  //                                   )
  //                                 : Container(),

  //                             varUserAccessModel.value.access_list!
  //                                             .where((e) =>
  //                                                 e.feature_id ==
  //                                                     UserAccessConstants
  //                                                         .kPermitFeatureId &&
  //                                                 e.approve ==
  //                                                     UserAccessConstants
  //                                                         .kHaveApproveAccess)
  //                                             .length >
  //                                         0 ||
  //                                     controller.newPermitList
  //                                                 .firstWhere(
  //                                                   (e) =>
  //                                                       "${e?.permitId}" ==
  //                                                       "${PermitDetails?.permitId}",
  //                                                   orElse: () =>
  //                                                       NewPermitModel(
  //                                                           permitId: 000),
  //                                                 )
  //                                                 ?.ptwStatus ==
  //                                             PermitStatusConstants.PTW_CREATED
  //                                         //121
  //                                         // AppConstants.kPermitStatusCreated ///121
  //                                         &&
  //                                         controller.newPermitList
  //                                                 .firstWhere(
  //                                                   (e) =>
  //                                                       "${e?.permitId}" ==
  //                                                       "${PermitDetails?.permitId}",
  //                                                   orElse: () =>
  //                                                       NewPermitModel(
  //                                                           permitId: 000),
  //                                                 )
  //                                                 ?.ptwStatus ==
  //                                             PermitStatusConstants
  //                                                 .PTW_EXTEND_REQUESTED //133

  //                                 ? TableActionButton(
  //                                     color: ColorValues.appGreenColor,
  //                                     icon: Icons.add,
  //                                     message: controller.newPermitList
  //                                                 .firstWhere(
  //                                                   (e) =>
  //                                                       "${e?.permitId}" ==
  //                                                       "${PermitDetails?.permitId}",
  //                                                   orElse: () =>
  //                                                       NewPermitModel(
  //                                                           permitId: 000),
  //                                                 )
  //                                                 ?.ptwStatus ==
  //                                             PermitStatusConstants
  //                                                 .PTW_CREATED //121
  //                                         // AppConstants.kPermitStatusCreated ///121
  //                                         ? 'Approve/Reject Permit'
  //                                         : "Approve/Reject Extend",
  //                                     onPress: () {
  //                                       controller.viewNewPermitList(
  //                                           permitId: PermitDetails?.permitId);
  //                                     },
  //                                   )
  //                                 : Dimens.box0,

  //                             ///Permit Edit button
  //                             varUserAccessModel.value.access_list!
  //                                             .where((e) =>
  //                                                 e.feature_id ==
  //                                                     UserAccessConstants
  //                                                         .kPermitFeatureId &&
  //                                                 e.add ==
  //                                                     UserAccessConstants
  //                                                         .kHaveAddAccess)
  //                                             .length >
  //                                         0 &&
  //                                     controller.newPermitList
  //                                             .firstWhere(
  //                                               (e) =>
  //                                                   "${e?.permitId}" ==
  //                                                   "${PermitDetails?.permitId}",
  //                                               orElse: () => NewPermitModel(
  //                                                   permitId: 000),
  //                                             )
  //                                             ?.ptwStatus ==
  //                                         PermitStatusConstants
  //                                             .PTW_CREATED //121
  //                                 // ||
  //                                 // controller.newPermitList
  //                                 //         .firstWhere(
  //                                 //           (e) =>
  //                                 //               "${e?.permitId}" ==
  //                                 //               "${PermitDetails?.permitId}",
  //                                 //           orElse: () =>
  //                                 //               NewPermitModel(
  //                                 //                   permitId: 000),
  //                                 //         )
  //                                 //         ?.ptwStatus ==
  //                                 //     124
  //                                 ? TableActionButton(
  //                                     color: ColorValues.appYellowColor,
  //                                     icon: Icons.edit,
  //                                     message: 'Edit Permit',
  //                                     onPress: () {
  //                                       controller.editNewPermit(
  //                                           permitId: PermitDetails?.permitId,
  //                                           isChecked:
  //                                               controller.isChecked.value);
  //                                       print(
  //                                           'PermitTest:${controller.newPermitListModel?.permitId}');
  //                                     },
  //                                   )
  //                                 : Dimens.box0,
  //                             controller.newPermitList
  //                                             .firstWhere(
  //                                               (e) =>
  //                                                   "${e?.permitId}" ==
  //                                                   "${PermitDetails?.permitId}",
  //                                               orElse: () => NewPermitModel(
  //                                                   permitId: 000),
  //                                             )
  //                                             ?.ptwStatus ==
  //                                         PermitStatusConstants
  //                                             .PTW_REJECTED_BY_APPROVER //124

  //                                     &&
  //                                     varUserAccessModel.value.access_list!
  //                                             .where((e) =>
  //                                                 e.feature_id ==
  //                                                     UserAccessConstants
  //                                                         .kPermitFeatureId &&
  //                                                 e.add ==
  //                                                     UserAccessConstants
  //                                                         .kHaveAddAccess)
  //                                             .length >
  //                                         0
  //                                 ? TableActionButton(
  //                                     color: Color.fromARGB(255, 116, 78, 130),
  //                                     icon: Icons.ads_click,
  //                                     message: 'Re-Submit Permit',
  //                                     onPress: () {
  //                                       controller.editNewPermit(
  //                                           permitId: PermitDetails?.permitId,
  //                                           isChecked:
  //                                               controller.isChecked.value);
  //                                       print(
  //                                           'PermitTest:${controller.newPermitListModel?.permitId}');
  //                                     },
  //                                   )
  //                                 : Dimens.box0,

  //                             ///Extend Button
  //                             varUserAccessModel.value.access_list!
  //                                                 .where((e) =>
  //                                                     e.feature_id ==
  //                                                         UserAccessConstants
  //                                                             .kPermitFeatureId &&
  //                                                     e.add ==
  //                                                         UserAccessConstants
  //                                                             .kHaveAddAccess)
  //                                                 .length >
  //                                             0 &&
  //                                         controller.newPermitList
  //                                                 .firstWhere(
  //                                                   (e) =>
  //                                                       "${e?.permitId}" ==
  //                                                       "${PermitDetails?.permitId}",
  //                                                   orElse: () =>
  //                                                       NewPermitModel(
  //                                                           permitId: 000),
  //                                                 )
  //                                                 ?.isExpired ==
  //                                             1 ||
  //                                     controller.newPermitList
  //                                                 .firstWhere(
  //                                                   (e) =>
  //                                                       "${e?.permitId}" ==
  //                                                       "${PermitDetails?.permitId}",
  //                                                   orElse: () =>
  //                                                       NewPermitModel(
  //                                                           permitId: 000),
  //                                                 )
  //                                                 ?.requestById ==
  //                                             varUserAccessModel
  //                                                 .value.user_id &&
  //                                         (controller.newPermitList
  //                                                 .firstWhere(
  //                                                   (e) =>
  //                                                       "${e?.permitId}" ==
  //                                                       "${PermitDetails?.permitId}",
  //                                                   orElse: () =>
  //                                                       NewPermitModel(
  //                                                           permitId: 000),
  //                                                 )
  //                                                 ?.ptwStatus ==
  //                                             PermitStatusConstants
  //                                                 .PTW_APPROVE //125
  //                                         //||
  //                                         // controller.newPermitList
  //                                         //         .firstWhere(
  //                                         //           (e) =>
  //                                         //               "${e?.permitId}" ==
  //                                         //               "${PermitDetails?.permitId}",
  //                                         //           orElse: () =>
  //                                         //               NewPermitModel(
  //                                         //                   permitId:
  //                                         //                       000),
  //                                         //         )
  //                                         //         ?.ptwStatus ==
  //                                         //     135
  //                                         )
  //                                 ? TableActionButton(
  //                                     color: ColorValues.appDarkBlueColor,
  //                                     icon: Icons.expand_outlined,
  //                                     message: 'Extend Permit',
  //                                     onPress: () {
  //                                       // Get.dialog(PermitExtendDialog(
  //                                       //     permitId: PermitDetails?.permitId
  //                                       //         .toString()));
  //                                       controller.extendPermitList(
  //                                           permitId: PermitDetails?.permitId);
  //                                     },
  //                                   )
  //                                 : Container(),

  //                             ////Approve button

  //                             ///Close Permit
  //                             varUserAccessModel.value.access_list!
  //                                                 .where((e) =>
  //                                                     e.feature_id ==
  //                                                         UserAccessConstants
  //                                                             .kPermitFeatureId &&
  //                                                     e.add ==
  //                                                         UserAccessConstants
  //                                                             .kHaveAddAccess)
  //                                                 .length >
  //                                             0 &&
  //                                         controller.newPermitList
  //                                                 .firstWhere(
  //                                                   (e) =>
  //                                                       "${e?.permitId}" ==
  //                                                       "${PermitDetails?.permitId}",
  //                                                   orElse: () =>
  //                                                       NewPermitModel(
  //                                                           permitId: 000),
  //                                                 )
  //                                                 ?.ptwStatus ==
  //                                             PermitStatusConstants
  //                                                 .PTW_CANCEL_REQUEST_REJECTED //121
  //                                     ||
  //                                     controller.newPermitList
  //                                             .firstWhere(
  //                                               (e) =>
  //                                                   "${e?.permitId}" ==
  //                                                   "${PermitDetails?.permitId}",
  //                                               orElse: () => NewPermitModel(
  //                                                   permitId: 000),
  //                                             )
  //                                             ?.ptwStatus ==
  //                                         PermitStatusConstants
  //                                             .PTW_EXTEND_REQUEST_REJECTED
  //                                 ? TableActionButton(
  //                                     color: ColorValues.appcloseRedColor,
  //                                     icon: Icons.close,
  //                                     message: 'Close Permit',
  //                                     onPress: () {
  //                                       // Get.dialog(PermitCloseDialog(
  //                                       //     permitId: PermitDetails?.permitId
  //                                       //         .toString()));
  //                                       controller.closePermitRequestList(
  //                                           permitId: PermitDetails?.permitId);
  //                                     },
  //                                   )
  //                                 : Container(),

  //                             ////Permit Cancel By Approver / Cancel Permit Request
  //                             varUserAccessModel.value.access_list!
  //                                             .where((e) =>
  //                                                 e.feature_id ==
  //                                                     UserAccessConstants
  //                                                         .kPermitFeatureId &&
  //                                                 e.approve ==
  //                                                     UserAccessConstants
  //                                                         .kHaveApproveAccess)
  //                                             .length >
  //                                         0 ||
  //                                     // varUserAccessModel.value.access_list!
  //                                     //         .where((e) =>
  //                                     //             e.feature_id ==
  //                                     //                 UserAccessConstants
  //                                     //                     .kPermitFeatureId &&
  //                                     //             e.edit ==
  //                                     //                 UserAccessConstants
  //                                     //                     .kHaveEditAccess)
  //                                     //         .length >
  //                                     //     0
  //                                     //      ||
  //                                     controller.newPermitList
  //                                             .firstWhere(
  //                                               (e) =>
  //                                                   "${e?.permitId}" ==
  //                                                   "${PermitDetails?.permitId}",
  //                                               orElse: () => NewPermitModel(
  //                                                   permitId: 000),
  //                                             )
  //                                             ?.ptwStatus ==
  //                                         PermitStatusConstants
  //                                             .PTW_APPROVE //125
  //                                     ||
  //                                     controller.newPermitList
  //                                             .firstWhere(
  //                                               (e) =>
  //                                                   "${e?.permitId}" ==
  //                                                   "${PermitDetails?.permitId}",
  //                                               orElse: () => NewPermitModel(
  //                                                   permitId: 000),
  //                                             )
  //                                             ?.ptwStatus ==
  //                                         PermitStatusConstants
  //                                             .PTW_CREATED //121
  //                                     ||
  //                                     controller.newPermitList
  //                                             .firstWhere(
  //                                               (e) =>
  //                                                   "${e?.permitId}" ==
  //                                                   "${PermitDetails?.permitId}",
  //                                               orElse: () => NewPermitModel(
  //                                                   permitId: 000),
  //                                             )
  //                                             ?.ptwStatus ==
  //                                         PermitStatusConstants
  //                                             .PTW_EXTEND_REQUEST_REJECTED ||
  //                                     controller.newPermitList
  //                                             .firstWhere(
  //                                               (e) =>
  //                                                   "${e?.permitId}" ==
  //                                                   "${PermitDetails?.permitId}",
  //                                               orElse: () => NewPermitModel(
  //                                                   permitId: 000),
  //                                             )
  //                                             ?.ptwStatus ==
  //                                         PermitStatusConstants
  //                                             .PTW_CANCEL_REQUEST_REJECTED
  //                                 ? TableActionButton(
  //                                     color: ColorValues.appRedColor,
  //                                     icon: Icons.close,
  //                                     message: 'Cancel Permit',
  //                                     onPress: () {
  //                                       controller.cancelPermitList(
  //                                           permitId: PermitDetails?.permitId);
  //                                       // Get.dialog(PermitCancelReQuestDialog(
  //                                       //     permitId: PermitDetails?.permitId
  //                                       //         .toString()));
  //                                     },
  //                                   )
  //                                 : Dimens.box0,

  //                             varUserAccessModel.value.access_list!
  //                                             .where((e) =>
  //                                                 e.feature_id ==
  //                                                     UserAccessConstants
  //                                                         .kPermitFeatureId &&
  //                                                 e.approve ==
  //                                                     UserAccessConstants
  //                                                         .kHaveApproveAccess)
  //                                             .length >
  //                                         0 &&
  //                                     controller.newPermitList
  //                                             .firstWhere(
  //                                               (e) =>
  //                                                   "${e?.permitId}" ==
  //                                                   "${PermitDetails?.permitId}",
  //                                               orElse: () => NewPermitModel(
  //                                                   permitId: 000),
  //                                             )
  //                                             ?.ptwStatus ==
  //                                         PermitStatusConstants
  //                                             .PTW_CANCEL_REQUESTED //130
  //                                 ? TableActionButton(
  //                                     color: Color.fromARGB(255, 113, 15, 149),
  //                                     icon: Icons.approval_rounded,
  //                                     message: ' Approve Cancel',
  //                                     onPress: () {
  //                                       controller.viewNewPermitList(
  //                                           permitId: PermitDetails?.permitId);
  //                                     },
  //                                   )
  //                                 : Dimens.box0

  //                             // TableActionButton(
  //                             //     color: ColorValues.appRedColor,
  //                             //     icon: Icons.close,
  //                             //     message: 'Cancel Permit',
  //                             //     onPress: () {
  //                             //       controller.cancelPermitList(
  //                             //           permitId:
  //                             //               PermitDetails?.permitId);
  //                             //       // Get.dialog(PermitCancelReQuestDialog(
  //                             //       //     permitId: PermitDetails?.permitId
  //                             //       //         .toString()));
  //                             //     },
  //                             //   ),
  //                           ],
  //                         ),

  //                         ///Checkbox
  //                         // varUserAccessModel.value.access_list!
  //                         //                 .where((e) =>
  //                         //                     e.feature_id ==
  //                         //                         UserAccessConstants
  //                         //                             .kPermitFeatureId &&
  //                         //                     e.edit ==
  //                         //                         UserAccessConstants
  //                         //                             .kHaveEditAccess)
  //                         //                 .length >
  //                         //             0
  //                         // &&
  //                         // controller.newPermitList
  //                         //         .firstWhere(
  //                         //           (e) =>
  //                         //               "${e?.permitId}" ==
  //                         //               "${PermitDetails?.permitId}",
  //                         //           orElse: () =>
  //                         //               NewPermitModel(permitId: 000),
  //                         //         )
  //                         //         ?.ptwStatus ==
  //                         //     124
  //                         // ? Row(
  //                         //     children: [
  //                         //       Obx(
  //                         //         () => Checkbox(
  //                         //           value: controller.isChecked.value,
  //                         //           onChanged: (value) {
  //                         //             // When the checkbox is changed, update the state using the controller
  //                         //             controller.isChecked.value = value!;
  //                         //             print(
  //                         //                 'Checkbox Value:${controller.isChecked.value}');
  //                         //           },
  //                         //         ),
  //                         //       ),
  //                         //       Text('Re-Submit for approval'),
  //                         //     ],
  //                         //   )
  //                         // : Container(),
  //                       ],
  //                     )
  //                   : Text(value.toString()),
  //             ),
  //           );
  //         }
  //         ).toList(),
  //       ],
  //       onSelectChanged: (_) {
  //         controller.viewNewPermitList(permitId: PermitDetails?.permitId);
  //       });
  // }

  @override
  int get rowCount => filteredNewPermitList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
