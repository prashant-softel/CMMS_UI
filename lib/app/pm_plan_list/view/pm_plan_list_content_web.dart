import 'package:cmms/app/pm_plan_list/pm_plan_list_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/domain/models/pm_plan_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/table_action_button.dart';

class PmPlanListContentWeb extends StatefulWidget {
  PmPlanListContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<PmPlanListContentWeb> createState() => _PmPlanListContentWebState();
}

class _PmPlanListContentWebState extends State<PmPlanListContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PmPlanListController>(
        id: 'pmPlan_list',
        builder: (controller) {
          return Obx(() {
            final dataSource = PmPlanDataSource(controller);

            return Column(
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
                      Text(
                        "DASHBOARD",
                        style: Styles.greyLight14,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(" / Preventive Maintenance".toUpperCase(),
                            style: Styles.greyMediumLight12),
                      ),
                      Text(" / PM PLANS", style: Styles.greyMediumLight12)
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
                        margin: EdgeInsets.all(10),
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
                                        "PM Plans ",
                                        style: Styles.blackBold16,
                                      ),
                                      Spacer(),
                                      ActionButton(
                                        icon: Icons.add,
                                        label: "Add New",
                                        onPressed: () {
                                          Get.toNamed(Routes.createPmPlan);
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
                                        onChanged: (value) =>
                                            controller.search(value),
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
                                controller.pmPlanList.isEmpty == true
                                    ? Center(child: Text('No data'))
                                    : Expanded(
                                        child: ValueListenableBuilder(
                                            valueListenable:
                                                controller.columnVisibility,
                                            builder: (context, value, child) {
                                              final dataSource =
                                                  PmPlanDataSource(controller);

                                              return PaginatedDataTable2(
                                                // fixedLeftColumns: 1,
                                                // dataRowHeight: Get.height * 0.12,
                                                columnSpacing: 10,
                                                source:
                                                    dataSource, // Custom DataSource class
                                                headingRowHeight:
                                                    Get.height * 0.12,
                                                minWidth:
                                                    2000, //Get.width * 1.2,
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
                                                    controller.tittleFilterText,
                                                    150,
                                                  ),
                                                ],
                                              );
                                            }),
                                      )
                              ]),
                        ),
                      ),
                    ),
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

class PmPlanDataSource extends DataTableSource {
  final PmPlanListController controller;

  late List<PmPlanListModel?> filteredPmPlanList;

  PmPlanDataSource(this.controller) {
    filterpmPlans();
  }

  ///
  void filterpmPlans() {
    filteredPmPlanList = <PmPlanListModel?>[];
    filteredPmPlanList = controller.pmPlanList.where((pmPlan) {
      return (pmPlan?.plan_id ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.idFilterText.value.toLowerCase()) &&
          (pmPlan?.plan_name ?? '')
              .toLowerCase()
              .contains(controller.tittleFilterText.value.toLowerCase()) &&
          (pmPlan?.plan_freq_name ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.frequencyFilterText.value.toLowerCase()) &&
          (pmPlan?.updated_at ?? '').toString().toLowerCase().contains(
              controller.nextScheduleDateFilterText.value.toLowerCase()) &&
          (pmPlan?.created_by_name ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.createdByFilterText.value.toLowerCase()) &&
          (pmPlan?.created_at ?? '')
              .toLowerCase()
              .contains(controller.lastDoneDateFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final pmPlanDetails = filteredPmPlanList[index];

    controller.pmPlanId.value = pmPlanDetails?.plan_id ?? 0;
    var cellsBuffer = [
      '${pmPlanDetails?.plan_id ?? ''}',
      '${pmPlanDetails?.plan_name ?? ''}',
      '${pmPlanDetails?.created_at ?? ''}',
      '${pmPlanDetails?.updated_at ?? ''}',
      '${pmPlanDetails?.plan_freq_name ?? ''}',
      '${pmPlanDetails?.created_by_name ?? ''}',
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
                    TableActionButton(
                      color: ColorValues.viewColor,
                      icon: Icons.remove_red_eye_outlined,
                      message: 'view',
                      onPress: () {
                        final _flutterSecureStorage =
                            const FlutterSecureStorage();

                        _flutterSecureStorage.delete(key: "pmPlanId");
                        int pmPlanId = pmPlanDetails?.plan_id ?? 0;
                        if (pmPlanId != 0) {
                          // Get.toNamed(Routes.viewpmPlanDetail,
                          //     arguments: {'pmPlanId': pmPlanId});
                        }
                      },
                    ),
                    TableActionButton(
                      color: ColorValues.editColor,
                      icon: Icons.edit,
                      message: 'Edit',
                      onPress: () {
                        final _flutterSecureStorage =
                            const FlutterSecureStorage();

                        _flutterSecureStorage.delete(key: "pmPlanId");
                        int pmPlanId = pmPlanDetails?.plan_id ?? 0;
                        if (pmPlanId != 0) {
                          // Get.toNamed(Routes.addpmPlan,
                          //     arguments: {'pmPlanId': pmPlanId});
                        }
                      },
                    ),
                    TableActionButton(
                      color: ColorValues.deleteColor,
                      icon: Icons.delete,
                      message: 'Delete',
                      onPress: () {},
                    )
                  ])
                : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        final _flutterSecureStorage = const FlutterSecureStorage();

        _flutterSecureStorage.delete(key: "pmPlanId");
        // Get.toNamed(Routes.viewpmPlanDetail,
        //     arguments: {'pmPlanId': pmPlanDetails?.plan_id});
      },
    );
  }

  @override
  int get rowCount => filteredPmPlanList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
