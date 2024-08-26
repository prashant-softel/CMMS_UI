import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/list_of_plantation/plantation_list_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/get_plantation_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:cmms/app/widgets/table_action_button.dart';

class PlantationListWeb extends StatefulWidget {
  PlantationListWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<PlantationListWeb> createState() => _PlantationListWebState();
}

class _PlantationListWebState extends State<PlantationListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlantationListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(
            () {
              final dataSource = PlantationListSource(controller);
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
                                Get.offAllNamed(Routes.misDashboard);
                              },
                              child: Text(" / MIS", style: Styles.greyLight14),
                            ),
                            Text(" / LIST OF PLANTATION DATA",
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
                                          "List Of Plantation Data",
                                          style: Styles.blackBold16,
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            CustomRichText(title: 'Date Range'),
                                            // Dimens.boxWidth10,
                                            SizedBox(width: 10),
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
                                        // Dimens.boxWidth10,
                                        SizedBox(width: 10),
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kGoodsFeatureId &&
                                                        e.add ==
                                                            UserAccessConstants
                                                                .kHaveApproveAccess)
                                                    .length >
                                                0
                                            ? ActionButton(
                                                icon: Icons.add,
                                                label: "Add New",
                                                onPressed: () {
                                                  controller.clearStoreData();

                                                  Get.offNamed(Routes
                                                      .createplantationdataScreen);
                                                },
                                                color: ColorValues.addNewColor,
                                              )
                                            : Dimens.box0,
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
                                              // controller.export();
                                            },
                                            text: 'Excel'),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 300,
                                        height: 40,
                                        // margin: Dimens.edgeInsets0_0_16_0,
                                        margin: EdgeInsets.only(right: 5),
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
                                  controller.plantationList.isEmpty ==
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
                                                        PlantationListSource(
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

                                  // controller.getGOListByDate();
                                  controller.openFromDateToStartDatePicker =
                                      false;
                                  controller.update(['stock_Mangement_Date']);

                                  // Get.toNamed(
                                  //   Routes.stockManagementGoodsOrdersScreen,
                                  // );
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

class PlantationListSource extends DataTableSource {
  final PlantationListController controller;

  late List<GetPlantationList?> filteredGetPlantationList;

  PlantationListSource(this.controller) {
    filtersPlantation();
  }

  ///
  void filtersPlantation() {
    filteredGetPlantationList = <GetPlantationList?>[];
    filteredGetPlantationList =
        controller.plantationList.where((plantationList) {
      return (plantationList.id ?? '')
          .toString()
          .contains(controller.monthnameFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredGetPlantationList": filteredGetPlantationList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final PlantationDataDetails = filteredGetPlantationList[index];

    controller.planatationId.value = PlantationDataDetails?.id ?? 0;
    var cellsBuffer = [
      '${PlantationDataDetails?.saplingsPlanted ?? ''}',
      '${PlantationDataDetails?.saplingsSurvived ?? ''}',
      '${PlantationDataDetails?.saplingsDied ?? ''}',
      '${PlantationDataDetails?.month_name ?? ''}',
      '${PlantationDataDetails?.createdAt ?? ''}',
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
                ? Wrap(children: [
                    varUserAccessModel.value.access_list!
                                .where((e) =>
                                    e.feature_id ==
                                        UserAccessConstants.kGoodsFeatureId &&
                                    e.view ==
                                        UserAccessConstants.kHaveApproveAccess)
                                .length >
                            0
                        ? TableActionButton(
                            color: ColorValues.viewColor,
                            icon: Icons.remove_red_eye_outlined,
                            message: 'View',
                            onPress: () {
                              controller.clearStoreData();
                              // int goId =
                              //     OccupationallistDetails?.id ?? 0;
                              // if (goId != 0) {
                              //   Get.toNamed(Routes.viewGoodsOrders,
                              //       arguments: {
                              //         'goId': goId,
                              //         "goType": 1
                              //       });
                              // }
                            },
                          )
                        : Dimens.box0,
                    varUserAccessModel.value.access_list!
                                .where((e) =>
                                    e.feature_id ==
                                        UserAccessConstants.kGoodsFeatureId &&
                                    e.edit ==
                                        UserAccessConstants.kHaveApproveAccess)
                                .length >
                            0
                        ? TableActionButton(
                            color: ColorValues.editColor,
                            icon: Icons.edit,
                            message: 'Edit',
                            onPress: () {
                              controller.clearStoreData();
                              // int goId = OccupationallistDetails?.id ?? 0;
                              // if (goId != 0) {
                              //   Get.toNamed(
                              //       Routes
                              //           .updateGoodsOrdersDetailsScreen,
                              //       arguments: {"goId": goId});
                              // }
                            },
                          )
                        : Dimens.box0,
                  ])
                : Text(value.toString()),
          ),
        );
      }).toList(),
    );
  }

  @override
  int get rowCount => filteredGetPlantationList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
