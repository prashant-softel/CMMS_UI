import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/vegetation_plan_list/vegetation_plan_list_controller.dart';
import 'package:cmms/domain/models/vegetation_list_plan_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/table_action_button.dart';

class VegetationPlanListWeb extends StatefulWidget {
  VegetationPlanListWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<VegetationPlanListWeb> createState() => _VegetationPlanListWebState();
}

class _VegetationPlanListWebState extends State<VegetationPlanListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VegetationPlanListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(
            () {
              final dataSource = VegetationPlanListDataSource(controller);
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
                          Text(" / VEGETATION CONTROL PLANNING",
                              style: Styles.greyLight14)
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
                                        "Vegetation Plan List",
                                        style: Styles.blackBold16,
                                      ),
                                      Spacer(),
                                      Dimens.boxWidth10,
                                      ActionButton(
                                        icon: Icons.add,
                                        label: "Add New",
                                        onPressed: () {
                                          Get.offNamed(
                                              Routes.addVegetationPlanScreen);
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
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<String>>[]..addAll(
                                                controller.columnVisibility
                                                    .value.entries
                                                    .map((e) {
                                              return PopupMenuItem<String>(
                                                  child: ValueListenableBuilder(
                                                      valueListenable:
                                                          controller
                                                              .columnVisibility,
                                                      builder: (context, value,
                                                          child) {
                                                        return Row(
                                                          children: [
                                                            Checkbox(
                                                              value:
                                                                  value[e.key],
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
                                  height: 20,
                                ),
                                controller.vegetationPlanList.isEmpty
                                    ? Center(child: Text('No data'))
                                    : Expanded(
                                        child: ValueListenableBuilder(
                                            valueListenable:
                                                controller.columnVisibility,
                                            builder: (context, value, child) {
                                              final dataSource =
                                                  VegetationPlanListDataSource(
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

class VegetationPlanListDataSource extends DataTableSource {
  final VegetationPlanListController controller;

  late List<VegetationPlanListModel?> filteredVegetationList;

  VegetationPlanListDataSource(this.controller) {
    filtersVegetationPlan();
  }

  ///
  void filtersVegetationPlan() {
    filteredVegetationList = <VegetationPlanListModel?>[];
    filteredVegetationList = controller.vegetationPlanList.where((item) {
      return (item.planId ?? '')
              .toString()
              .contains(controller.planIdFilterText.value.toLowerCase()) &&
          (item.title ?? '')
              .toString()
              .contains(controller.planTitleFilterText.value.toLowerCase()) &&
          (item.noOfCleaningDays ?? '')
              .toString()
              .contains(controller.noOfDaysFilterText.value.toLowerCase()) &&
          (item.createdBy ?? '')
              .toString()
              .contains(controller.createdByFilterText.value.toLowerCase()) &&
          (item.frequency ?? '')
              .toString()
              .contains(controller.frequencyFilterText.value.toLowerCase()) &&
          (item.status ?? '')
              .toString()
              .contains(controller.statusFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredVegetationList": filteredVegetationList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final VegetationListDetails = filteredVegetationList[index];

    controller.PlanId.value = VegetationListDetails?.planId ?? 0;
    var cellsBuffer = [
      "planId",
      '${VegetationListDetails?.title ?? ''}',
      '${VegetationListDetails?.noOfCleaningDays ?? ''}',
      '${VegetationListDetails?.createdBy ?? ''}',
      '${VegetationListDetails?.frequency ?? ''}',
      // '${VegetationListDetails?.status ?? ''}',

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
                        'VC ${VegetationListDetails?.planId}',
                      ),
                      Dimens.boxHeight10,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: Dimens.edgeInsets8_2_8_2,
                          decoration: BoxDecoration(
                            color: ColorValues.addNewColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            ' ${VegetationListDetails?.status}',
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
                          onPress: () {},
                        ),
                        TableActionButton(
                          color: ColorValues.editColor,
                          icon: Icons.edit,
                          message: 'Edit',
                          onPress: () {},
                        ),
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
    );
  }

  @override
  int get rowCount => filteredVegetationList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
