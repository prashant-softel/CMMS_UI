import 'package:cmms/app/Statutory/statutory_controller.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/mis_list_of_observation/observation_list_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/get_observation_list_model.dart';
import 'package:cmms/domain/models/get_statutory_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:cmms/app/widgets/table_action_button.dart';

class ObservationListWeb extends StatefulWidget {
  ObservationListWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ObservationListWeb> createState() => _StatutoryWebState();
}

class _StatutoryWebState extends State<ObservationListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ObservationListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(
            () {
              final dataSource = ObservationListDataSource(controller);
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
                                Get.offNamed(Routes.misDashboard);
                              },
                              child: Text(" / MIS", style: Styles.greyLight14),
                            ),
                            Text(" / LIST OF OBSERVATION",
                                style: Styles.greyLight14),
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
                                          "List Of Observation",
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
                                            // controller.clearStoreData();

                                            Get.offNamed(
                                                Routes.createObservation);
                                          },
                                          color: ColorValues.addNewColor,
                                        )
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
                                                width: 0.0,
                                              ),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 0.0,
                                              ),
                                            ),
                                            contentPadding:
                                                Dimens.edgeInsets05_10,
                                            hintText: 'search'.tr,
                                            hintStyle: Styles.grey16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  controller.getObservationList.isEmpty ==
                                              true &&
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
                                                        ObservationListDataSource(
                                                            controller);

                                                    return PaginatedDataTable2(
                                                      columnSpacing: 10,
                                                      dataRowHeight: 60,
                                                      source:
                                                          dataSource, // Custom DataSource class
                                                      // headingRowHeight:
                                                      //     Get.height * 0.12,
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
                                                              .userDateFilterText,
                                                          230,
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

                                  // controller.getPmTaskListByDate();
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
  return //
      DataColumn2(
    fixedWidth: fixedWidth,
    label: Column(
        mainAxisAlignment: MainAxisAlignment.center, //
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              header,
              style: Styles.black16W500,
            ),
          ),
        ]),
  );
}

class ObservationListDataSource extends DataTableSource {
  final ObservationListController controller;

  late List<GetObservationList?> filteredGetObservationList;

  ObservationListDataSource(this.controller) {
    filtersGetStatutory();
  }

  ///
  void filtersGetStatutory() {
    filteredGetObservationList = <GetObservationList?>[];
    filteredGetObservationList =
        controller.getObservationList.where((ObservationList) {
      return (ObservationList.closer_date ?? '')
              .toString()
              .contains(controller.closerDateFilterText.value.toLowerCase()) &&
          (ObservationList.closer_date ?? '')
              .toString()
              .contains(controller.actionTakenFilterText.value.toLowerCase()) &&
          (ObservationList.corrective_action ?? '').toString().contains(
              controller.dateofObservationFilterText.value.toLowerCase()) &&
          (ObservationList.closer_date ?? '').contains(
              controller.dateofObservationFilterText.value.toLowerCase()) &&
          (ObservationList.corrective_action ?? '')
              .toString()
              .contains(controller.statusFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredGetObservationList": filteredGetObservationList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final ObservationListDetails = filteredGetObservationList[index];

    controller.ObservationId.value = ObservationListDetails?.id ?? 0;
    var cellsBuffer = [
      // '${ObservationListDetails?.id ?? ''}',
      // "id",
      '${ObservationListDetails?.month_of_observation ?? ''}',
      '${ObservationListDetails?.date_of_observation ?? ''}',
      '${ObservationListDetails?.contractor_name ?? ''}',
      '${ObservationListDetails?.location_of_observation ?? ''}',
      '${ObservationListDetails?.source_of_observation ?? ''}',
      '${ObservationListDetails?.risk_type ?? ''}',
      '${ObservationListDetails?.observation_description ?? ''}',
      '${ObservationListDetails?.corrective_action ?? ''}',
      '${ObservationListDetails?.responsible_person ?? ''}',
      '${ObservationListDetails?.target_date ?? ''}',
      '${ObservationListDetails?.action_taken ?? ''}',
      '${ObservationListDetails?.closer_date ?? ''}',
      '${ObservationListDetails?.cost_type ?? ''}',
      '${ObservationListDetails?.status ?? ''}',

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
            child: (value == 'Actions')
                ? Row(
                    children: [
                      TableActionButton(
                        color: ColorValues.viewColor,
                        icon: Icons.remove_red_eye_outlined,
                        message: 'View',
                        onPress: () {
                          // controller.clearStoreData();
                          int srId = ObservationListDetails?.id ?? 0;
                          if (srId != 0) {
                            Get.toNamed(
                              Routes.viewComplianceScreen,
                              arguments: {
                                'srId': ObservationListDetails?.id,
                              },
                            );
                          }
                        },
                      ),
                      controller.getObservationList
                                      .firstWhere(
                                        (e) =>
                                            e.id == ObservationListDetails!.id,
                                        orElse: () =>
                                            GetObservationList(id: 00),
                                      )
                                      .status ==
                                  504 &&
                              varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id ==
                                              UserAccessConstants
                                                  .kSatutoryFeatureId &&
                                          e.edit ==
                                              UserAccessConstants
                                                  .kHaveAddAccess)
                                      .length >
                                  0
                          ? TableActionButton(
                              color: ColorValues.editColor,
                              icon: Icons.edit,
                              message: 'Edit',
                              onPress: () {
                                // controller.clearStoreData();
                                int srId = ObservationListDetails?.id ?? 0;
                                if (srId != 0) {
                                  Get.toNamed(
                                    Routes.complianceScreen,
                                    arguments: {
                                      'srId': ObservationListDetails?.id,
                                    },
                                  );
                                }
                              },
                            )
                          : Dimens.box0,
                      // ObservationListDetails?.status == 'inactive'
                      //     ? TableActionButton(
                      //         color: Color.fromARGB(255, 116, 78, 130),
                      //         icon: Icons.ads_click,
                      //         message: 'Re-New',
                      //         onPress: () {
                      //           controller.clearStoreData();
                      //           int srId = ObservationListDetails?.id ?? 0;
                      //           int reNew = 1;
                      //           if (srId != 0) {
                      //             Get.toNamed(
                      //               Routes.complianceScreen,
                      //               arguments: {
                      //                 'srId': ObservationListDetails?.id,
                      //                 'reNew': reNew,
                      //               },
                      //             );
                      //           }
                      //         },
                      //       )
                      // : Dimens.box0,
                      // TableActionButton(
                      //   color: Color.fromARGB(255, 120, 110, 123),
                      //   icon: Icons.history,
                      //   message: 'History',
                      //   onPress: () {
                      //     controller.clearStoreData();
                      //     Get.toNamed(
                      //       Routes.complianceHistoryScreen,
                      //       arguments: {
                      //         "compliance_id":
                      //             ObservationListDetails?.compliance_id
                      //       },
                      //     );
                      //   },
                      // ),
                    ],
                  )
                : Text(value.toString()),
          ),
        );
      }).toList(),
      onSelectChanged: (_) {},
    );
  }

  @override
  int get rowCount => filteredGetObservationList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}


// import 'package:cmms/app/home/home_screen.dart';
// import 'package:cmms/app/home/widgets/header_widget.dart';
// import 'package:cmms/app/navigators/app_pages.dart';
// import 'package:cmms/app/theme/dimens.dart';
// import 'package:cmms/app/widgets/action_button.dart';
// import 'package:cmms/app/widgets/custom_richtext.dart';
// import 'package:cmms/app/widgets/date_picker.dart';
// import 'package:cmms/app/widgets/table_action_button.dart';
// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// import '../../../theme/color_values.dart';
// import '../../../theme/styles.dart';

// class ObservationListWeb extends StatelessWidget {
//   ObservationListWeb({Key? key});

//   final List<Map<String, dynamic>> statutoryData = [
//     {
//       'Month of Observation': 'April',
//       'Date of Observation ': '10/04/2024',
//       'Contractor Name ': 'Prashant',
//       'Location of Observation': 'Uttar Pradesh',
//       'Type of Observation ': 'Statutory Non Compliance',
//       'Source of Observation ': 'Vehicle fitness Checklist ',
//       'Risk Type ': 'Moderate',
//       'Observation Description ': 'wrong item',
//       'Corrective/Preventive Action': 'Fixing all thing',
//       'Responsible Person & Contact Number': '1234567899',
//       'Target Date ': '10/07/2024',
//       'Action Taken ': 'Action done',
//       'Closer Date ': '10/07/2024',
//       'Cost type ': 'Capex',
//       'Status': 'Open',
//     },
//     {
//       'Month of Observation': 'May',
//       'Date of Observation ': '10/05/2024',
//       'Contractor Name ': 'Tanmay',
//       'Location of Observation': 'delhi',
//       'Type of Observation ': 'Unsafe Act',
//       'Source of Observation ': 'Monitoring Checklist of Electrical  ',
//       'Risk Type ': 'Significant',
//       'Observation Description ': 'wrong item',
//       'Corrective/Preventive Action': 'Fixing all thing',
//       'Responsible Person & Contact Number': '1234567899',
//       'Target Date ': '10/07/2024',
//       'Action Taken ': 'Action done',
//       'Closer Date ': '10/07/2024',
//       'Cost type ': 'Capex',
//       'Status': 'Open',
//     },
//     {
//       'Month of Observation': 'June',
//       'Date of Observation ': '10/06/2024',
//       'Contractor Name ': 'Madhuban',
//       'Location of Observation': 'Lucknow',
//       'Type of Observation ': 'Unsafe Condition',
//       'Source of Observation ':
//           'Bird & Bat Monitoring Checklist (WIND PROJECTS)  ',
//       'Risk Type ': 'Moderate',
//       'Observation Description ': 'wrong item',
//       'Corrective/Preventive Action': 'Fixing all thing',
//       'Responsible Person & Contact Number': '1234567899',
//       'Target Date ': '10/07/2024',
//       'Action Taken ': 'Action done',
//       'Closer Date ': '10/07/2024',
//       'Cost type ': 'Opex',
//       'Status': 'Open',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     bool openFromDateToStartDatePicker = false;
//     Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 70)).obs;
//     Rx<DateTime> toDate = DateTime.now().obs;
//     // String get formattedFromdate =>
//     //     DateFormat('yyyy-MM-dd').format(fromDate.value);
//     // String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);

//     return SelectionArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Container(
//               color: Color.fromARGB(255, 234, 236, 238),
//               width: Get.width,
//               height: Get.height,
//               child: Column(
//                 children: [
//                   HeaderWidget(),
//                   Container(
//                     height: 45,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Color.fromARGB(255, 227, 224, 224),
//                         width: 1,
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 236, 234, 234)
//                               .withOpacity(0.5),
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.home,
//                           color: ColorValues.greyLightColor,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Get.offNamed(Routes.home);
//                           },
//                           child: Text(
//                             "DASHBOARD",
//                             style: Styles.greyLight14,
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Get.offNamed(Routes.misDashboard);
//                           },
//                           child: Text(" / MIS", style: Styles.greyLight14),
//                         ),
//                         Text(" / LIST OF OBSERVATION",
//                             style: Styles.greyLight14),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Container(
//                         margin: EdgeInsets.only(left: 10, top: 15, right: 10),
//                         child: Column(
//                           children: [
//                             Card(
//                               color: Color.fromARGB(255, 245, 248, 250),
//                               elevation: 10,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                         left: 20, top: 20, right: 20),
//                                     child: Row(
//                                       children: [
//                                         Text(
//                                           "List Of Observation",
//                                           style: Styles.blackBold16,
//                                         ),
//                                         Spacer(),
//                                         Row(
//                                           children: [
//                                             CustomRichText(title: 'Date Range'),
//                                             Dimens.boxWidth10,
//                                             CustomTextFieldForStock(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width /
//                                                   5,
//                                               numberTextField: true,
//                                               onTap: () {
//                                                 openFromDateToStartDatePicker =
//                                                     openFromDateToStartDatePicker;
//                                                 // update([
//                                                 //   'stock_Mangement_Date'
//                                                 // ]);
//                                               },
//                                               // hintText:
//                                               //     '${formattedFromdate.toString()} - ${formattedTodate.toString()}',
//                                             ),
//                                           ],
//                                         ),
//                                         Dimens.boxWidth10,
//                                         ActionButton(
//                                           icon: Icons.add,
//                                           label: "Add New",
//                                           onPressed: () {
//                                             // controller.clearStoreData();
//                                             // controller.clearTypeStoreData();
//                                             Get.offNamed(
//                                                 Routes.createObservation);
//                                           },
//                                           color: ColorValues.addNewColor,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Divider(
//                                     color: ColorValues.greyLightColour,
//                                   ),
//                                   Container(
//                                     color: Color.fromARGB(255, 245, 248, 250),
//                                     width: Get.width,
//                                     height: Get.height,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(16),
//                                       child: DataTable2(
//                                         headingRowHeight: 55,
//                                         columnSpacing: 5,
//                                         minWidth: 1805,
//                                         headingRowColor:
//                                             MaterialStateColor.resolveWith(
//                                           (states) {
//                                             return ColorValues.lightGreyColor;
//                                           },
//                                         ),
//                                         // horizontalMargin: 100,
//                                         // minWidth: 600,
//                                         columns: [
//                                           DataColumn2(
//                                             fixedWidth: 110,
//                                             label: Text(
//                                               'Month of\nObservation',
//                                               style: Styles.blackBold14,
//                                             ),
//                                             size: ColumnSize.L,
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 110,
//                                             label: Text(
//                                               'Date of\nObservation',
//                                               style: Styles.blackBold14,
//                                             ),
//                                             size: ColumnSize.L,
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 110,
//                                             label: Text(
//                                               'Contractor\nName',
//                                               style: Styles.blackBold14,
//                                             ),
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 120,
//                                             label: Text(
//                                               'Location of\nObservation',
//                                               style: Styles.blackBold14,
//                                             ),
//                                             size: ColumnSize.S,
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 110,
//                                             label: Text(
//                                               'Type of\nObservation',
//                                               style: Styles.blackBold14,
//                                             ),
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 110,
//                                             label: Text(
//                                               'Source of\nObservation',
//                                               style: Styles.blackBold14,
//                                             ),
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 100,
//                                             label: Text(
//                                               'Risk Type',
//                                               style: Styles.blackBold14,
//                                             ),
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 100,
//                                             label: Text(
//                                               'Observation\nDescription',
//                                               style: Styles.blackBold14,
//                                             ),
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 100,
//                                             label: Text(
//                                               'Preventive\nAction',
//                                               style: Styles.blackBold14,
//                                             ),
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 100,
//                                             label: Text(
//                                               'Contact\nNumber',
//                                               style: Styles.blackBold14,
//                                             ),
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 120,
//                                             label: Text(
//                                               'Target Date',
//                                               style: Styles.blackBold14,
//                                             ),
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 120,
//                                             label: Text(
//                                               'Action Taken',
//                                               style: Styles.blackBold14,
//                                             ),
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 100,
//                                             label: Text(
//                                               'Closer Date',
//                                               style: Styles.blackBold14,
//                                             ),
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 100,
//                                             label: Text(
//                                               'Cost type',
//                                               style: Styles.blackBold14,
//                                             ),
//                                           ),
//                                           DataColumn2(
//                                             fixedWidth: 100,
//                                             label: Text(
//                                               'Status',
//                                               style: Styles.blackBold14,
//                                             ),
//                                           ),
//                                           DataColumn2(
//                                             label: Text(
//                                               'Action',
//                                               style: Styles.blackBold14,
//                                             ),
//                                           ),
//                                         ],
//                                         rows: statutoryData.map(
//                                           (data) {
//                                             return DataRow(
//                                               cells: [
//                                                 DataCell(Text(data[
//                                                     'Month of Observation'])),
//                                                 DataCell(Text(data[
//                                                     'Date of Observation '])),
//                                                 DataCell(Text(
//                                                     data['Contractor Name '])),
//                                                 DataCell(Text(data[
//                                                     'Location of Observation'])),
//                                                 DataCell(Text(data[
//                                                     'Type of Observation '])),
//                                                 DataCell(Text(data[
//                                                     'Source of Observation '])),
//                                                 DataCell(
//                                                     Text(data['Risk Type '])),
//                                                 DataCell(Text(data[
//                                                     'Observation Description '])),
//                                                 DataCell(Text(data[
//                                                     'Corrective/Preventive Action'])),
//                                                 DataCell(Text(data[
//                                                     'Responsible Person & Contact Number'])),
//                                                 DataCell(
//                                                     Text(data['Target Date '])),
//                                                 DataCell(Text(
//                                                     data['Action Taken '])),
//                                                 DataCell(
//                                                     Text(data['Closer Date '])),
//                                                 DataCell(
//                                                     Text(data['Cost type '])),
//                                                 DataCell(Text(data['Status'])),
//                                                 DataCell(
//                                                   Row(
//                                                     children: [
//                                                       Wrap(
//                                                         children: [
//                                                           TableActionButton(
//                                                             color: ColorValues
//                                                                 .viewColor,
//                                                             icon: Icons
//                                                                 .remove_red_eye_outlined,
//                                                             message: 'View',
//                                                             onPress: () {
//                                                               int viewStatutory =
//                                                                   1;

//                                                               // Get.toNamed(
//                                                               //   Routes
//                                                               //       .complianceScreen,
//                                                               //   arguments: {
//                                                               //     'viewStatutory':
//                                                               //         viewStatutory
//                                                               //   },
//                                                               // );
//                                                             },
//                                                           ),
//                                                           TableActionButton(
//                                                             color: ColorValues
//                                                                 .editColor,
//                                                             icon: Icons.edit,
//                                                             message: 'Edit',
//                                                             onPress: () {
//                                                               // Get.toNamed(
//                                                               //   Routes
//                                                               //       .complianceScreen,
//                                                               // );
//                                                             },
//                                                           ),
//                                                         ],
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             );
//                                           },
//                                         ).toList(),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             if (openFromDateToStartDatePicker)
//               Positioned(
//                 right: 230,
//                 top: 90,
//                 child: DatePickerWidget(
//                   selectionMode: DateRangePickerSelectionMode.range,
//                   monthCellStyle: DateRangePickerMonthCellStyle(
//                     todayCellDecoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: ColorValues.appDarkBlueColor),
//                   ), // last date of this year
//                   // controller: DateRangePickerController(),
//                   initialSelectedRange: PickerDateRange(
//                     fromDate.value,
//                     toDate.value,
//                   ),

//                   onSubmit: (value) {
//                     print('po valu ${value.toString()}');
//                     PickerDateRange? data = value as PickerDateRange;

//                     var pickUpDate = DateTime.parse(data.startDate.toString());
//                     fromDate.value = pickUpDate;
//                     var dropDate = DateTime.parse(data.endDate.toString());
//                     dropDate != null
//                         ? toDate.value = dropDate
//                         : toDate.value = pickUpDate;

//                     // controller.getNewPermitListByDate();
//                     openFromDateToStartDatePicker =
//                         openFromDateToStartDatePicker;
//                     // update(['stock_Mangement_Date']);

//                     // Get.toNamed(
//                     //   Routes.stockManagementGoodsOrdersScreen,
//                     // );
//                   },
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
