import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/vegetation_list_plan_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:cmms/app/vegetation_plan_list/vegetation_plan_list_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
        id: "stock_Management_Date",
        builder: (controller) {
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
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
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
                                      // Get.offNamed(
                                      //     Routes.moduleCleaningPlanning);
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
                                // PopupMenuButton<String>(
                                //   tooltip: "",
                                //   elevation: 25.0,
                                //   child: Container(
                                //     height: 35,
                                //     margin: EdgeInsets.only(left: 10),
                                //     padding: EdgeInsets.only(
                                //         top: 4, bottom: 4, right: 8, left: 8),
                                //     decoration: BoxDecoration(
                                //       color: ColorValues.appLightBlueColor,
                                //       borderRadius: BorderRadius.circular(5),
                                //     ),
                                //     child: Text(
                                //       'Column Visibility',
                                //       style: TextStyle(
                                //         color: Colors.white,
                                //         fontSize: 16,
                                //         fontWeight: FontWeight.w400,
                                //       ),
                                //     ),
                                //   ),
                                //   itemBuilder: (BuildContext context) =>
                                //       <PopupMenuEntry<String>>[]..addAll(
                                //             controller.columnVisibility.value
                                //                 .entries
                                //                 .map((e) {
                                //           return PopupMenuItem<String>(
                                //               child: ValueListenableBuilder(
                                //                   valueListenable: controller
                                //                       .columnVisibility,
                                //                   builder: (context, value,
                                //                       child) {
                                //                     return Row(
                                //                       children: [
                                //                         Checkbox(
                                //                           value: value[e.key],
                                //                           onChanged:
                                //                               (newValue) {
                                //                             controller
                                //                                 .setColumnVisibility(
                                //                                     e.key,
                                //                                     newValue!);
                                //                           },
                                //                         ),
                                //                         Text(e.key),
                                //                       ],
                                //                     );
                                //                   }));
                                //         })),
                                //   onSelected: (String value) {
                                //     // Handle column selection
                                //   },
                                // ),
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
                                    // onChanged: (value) =>
                                    //     controller.search(value),
                                    decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 0.0,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 0.0,
                                        ),
                                      ),
                                      contentPadding: Dimens.edgeInsets05_10,
                                      hintText: 'search'.tr,
                                      hintStyle: Styles.grey16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
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
  );
}

class VegetationPlanListDataSource extends DataTableSource {
  late final VegetationPlanListController controller;

  late List<VegetationPlanListModel?> filteredVegetationList;
  VegetationPlanListDataSource(this.controller) {
    filtersVegetationPlan();
  }

  void filtersVegetationPlan() {}
  DataRow? getRow(int index) {
    final VegetationListDetails = filteredVegetationList[index];
    var cellsBuffer = [
      "planId"
          '${VegetationListDetails?.title ?? ''}',
      '${VegetationListDetails?.noOfCleaningDays ?? ''}',
      '${VegetationListDetails?.createdBy ?? ''}',
      '${VegetationListDetails?.frequency ?? ''}',
      '${VegetationListDetails?.status ?? ''}',
      'Actions',
    ];

    var cells = [];
    int i = 0;

    for (var entry in controller.columnVisibility.value.entries) {
      if (entry.key == "search") {
        return null;
      }
      if (entry.value) {
        cells.add(cellsBuffer[i]);
      }
      i++;
    }
    cells.add('Actions');

    return DataRow.byIndex(
      index: index,
      cells: cells.map((value){
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
              ],
            )
            : Text(value.toString()),
          )
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
