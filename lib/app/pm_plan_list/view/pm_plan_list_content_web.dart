import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/pm_plan_list/pm_plan_list_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/pm_plan_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
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

            return SelectionArea(
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
                            Get.offNamed(Routes.preventive);
                          },
                          child: Text(" / Preventive Maintenance".toUpperCase(),
                              style: Styles.greyLight14),
                        ),
                        Text(" / PM PLANS", style: Styles.greyLight14)
                      ],
                    ),
                  ),
                  Expanded(
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
                                    varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id ==
                                                        UserAccessConstants
                                                            .kPmPlanFeatureId &&
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
                                              Get.toNamed(Routes.createPmPlan);
                                            },
                                            color: ColorValues.addNewColor,
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
                                          top: 4, bottom: 4, right: 8, left: 8),
                                      decoration: BoxDecoration(
                                          color: ColorValues.appLightBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: const Offset(4.0, 2.0),
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
                                              controller.columnVisibility.value
                                                  .entries
                                                  .map((e) {
                                            return PopupMenuItem<String>(
                                                child: ValueListenableBuilder(
                                                    valueListenable: controller
                                                        .columnVisibility,
                                                    builder: (context, value,
                                                        child) {
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
                                  // Container(
                                  //   height: 35,
                                  //   margin: EdgeInsets.only(left: 10),
                                  //   child: CustomElevatedButton(
                                  //       backgroundColor:
                                  //           ColorValues.appLightBlueColor,
                                  //       onPressed: () {},
                                  //       text: 'Copy'),
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
                                        contentPadding:
                                            EdgeInsets.only(left: 3),
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
                              // controller.pmPlanList.isEmpty == true &&
                              //         controller.isLoading == false
                              //     ? Center(child: Text("No data"))
                              // : controller.isLoading.value == true
                              //     ? Center(
                              //         child: Text("Data Loading......"))
                              // :
                              Expanded(
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
                                        // headingRowHeight: Get.height * 0.12,
                                        minWidth: 2000, //Get.width * 1.2,
                                        showCheckboxColumn: false,
                                        rowsPerPage:
                                            10, // Number of rows per page
                                        availableRowsPerPage: [10, 20, 30, 50],
                                        columns: [
                                          for (var entry in value.entries)
                                            if (entry.value)
                                              buildDataColumn(
                                                entry.key,
                                                controller
                                                    .filterText[entry.key]!,
                                                controller
                                                    .columnwidth[entry.key],
                                              ),
                                          buildDataColumn(
                                            'Actions',
                                            controller.tittleFilterText,
                                            200,
                                          ),
                                        ],
                                      );
                                    }),
                              )
                            ]),
                      ),
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
    //  {required Function(String) onSearchCallBack}
  ) {
    return //
        DataColumn2(
      // size: columnSize,
      fixedWidth: fixedWidth,
      onSort: header == "Actions"
          ? null
          : (int columnIndex, bool ascending) {
              final controller = Get.find<PmPlanListController>();
              controller.sortData(header);
            },

      label: //
          Column(
              mainAxisAlignment: MainAxisAlignment.center, //
              children: [
            // SizedBox(
            //   height: Get.height * 0.05,
            //   child: TextField(
            //     style: GoogleFonts.lato(
            //       textStyle: TextStyle(
            //           fontSize: 16.0, height: 1.0, color: Colors.black),
            //     ),
            //     onChanged: (value) {
            //       filterText.value = value;
            //       //   onSearchCallBack(value);
            //     },
            //     textAlign: TextAlign.left,
            //     decoration: InputDecoration(
            //       hintText: 'Filter',
            //       contentPadding: EdgeInsets.fromLTRB(
            //           5, 0, 5, 0), // Reduced vertical padding
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //     ),
            //   ),
            // ),

            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     header,
            //     style: Styles.black16W500,
            //   ),
            // ),
            Row(
              children: [
                Text(
                  header,
                  style: Styles.black16W500,
                ),
                if (header != "Actions")
                  Obx(() {
                    final controller = Get.find<PmPlanListController>();

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
      'pmPlanId', // '${pmPlanDetails?.plan_id ?? ''}',
      '${pmPlanDetails?.plan_name ?? ''}',
      '${pmPlanDetails?.plan_date ?? ''}',
      '${pmPlanDetails?.next_schedule_date ?? ''}',
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
            child: (value == 'pmPlanId')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PMP${pmPlanDetails?.plan_id}',
                      ),
                      Dimens.boxHeight5,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          decoration: BoxDecoration(
                            color: controller.pmPlanList
                                        .firstWhere(
                                          (e) =>
                                              e?.plan_id ==
                                              pmPlanDetails?.plan_id,
                                          orElse: () =>
                                              PmPlanListModel(plan_id: 00),
                                        )
                                        ?.status_id ==
                                    406
                                ? ColorValues.rejectedStatusColor
                                : controller.pmPlanList
                                            .firstWhere(
                                              (e) =>
                                                  e?.plan_id ==
                                                  pmPlanDetails?.plan_id,
                                              orElse: () =>
                                                  PmPlanListModel(plan_id: 00),
                                            )
                                            ?.status_id ==
                                        401
                                    ? ColorValues.appLightBlueColor
                                    : controller.pmPlanList
                                                .firstWhere(
                                                  (e) =>
                                                      e?.plan_id ==
                                                      pmPlanDetails?.plan_id,
                                                  orElse: () => PmPlanListModel(
                                                      plan_id: 00),
                                                )
                                                ?.status_id ==
                                            405
                                        ? ColorValues.approveStatusColor
                                        : ColorValues.addNewColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${pmPlanDetails?.status_name}',
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
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPmPlanFeatureId &&
                                        e.view ==
                                            UserAccessConstants.kHaveViewAccess)
                                    .length >
                                0
                            ? TableActionButton(
                                color: ColorValues.viewColor,
                                icon: Icons.remove_red_eye_outlined,
                                message: 'View',
                                onPress: () {
                                  controller.clearStoreData();

                                  // final _flutterSecureStorage =
                                  //     const FlutterSecureStorage();

                                  // _flutterSecureStorage.delete(key: "pmPlanId");
                                  int pmPlanId = pmPlanDetails?.plan_id ?? 0;
                                  Get.toNamed(Routes.viewPmPlanScreen,
                                      arguments: {'pmPlanId': pmPlanId});
                                },
                              )
                            : Dimens.box0,
                        controller.pmPlanList
                                            .firstWhere(
                                              (e) =>
                                                  e?.plan_id ==
                                                  pmPlanDetails!.plan_id,
                                              orElse: () =>
                                                  PmPlanListModel(plan_id: 00),
                                            )
                                            ?.status_id ==
                                        401 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kPmPlanFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0 ||
                                controller.pmPlanList
                                            .firstWhere(
                                              (e) =>
                                                  e?.plan_id ==
                                                  pmPlanDetails!.plan_id,
                                              orElse: () =>
                                                  PmPlanListModel(plan_id: 00),
                                            )
                                            ?.status_id ==
                                        406 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kPmPlanFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0
                            ? TableActionButton(
                                color: ColorValues.editColor,
                                icon: Icons.edit,
                                message: 'Edit',
                                onPress: () {
                                  controller.clearStoreData();

                                  // final _flutterSecureStorage =
                                  //     const FlutterSecureStorage();

                                  // _flutterSecureStorage.delete(key: "pmPlanId");
                                  int pmPlanId = pmPlanDetails?.plan_id ?? 0;
                                  Get.toNamed(Routes.createPmPlan,
                                      arguments: {'pmPlanId': pmPlanId});
                                },
                              )
                            : Dimens.box0,
                        controller.pmPlanList
                                        .firstWhere(
                                          (e) =>
                                              e?.plan_id ==
                                              pmPlanDetails?.plan_id,
                                          orElse: () =>
                                              PmPlanListModel(plan_id: 00),
                                        )
                                        ?.status_id ==
                                    401 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kPmPlanFeatureId &&
                                            e.approve ==
                                                UserAccessConstants
                                                    .kHaveApproveAccess)
                                        .length >
                                    0
                            ? TableActionButton(
                                color: ColorValues.approveColor,
                                icon: Icons.check,
                                message: 'Approve/Reject',
                                onPress: () {
                                  controller.clearStoreData();

                                  // final _flutterSecureStorage =
                                  //     const FlutterSecureStorage();

                                  // _flutterSecureStorage.delete(key: "pmPlanId");
                                  int pmPlanId = pmPlanDetails?.plan_id ?? 0;
                                  Get.toNamed(Routes.viewPmPlanScreen,
                                      arguments: {'pmPlanId': pmPlanId});
                                },
                              )
                            : Dimens.box0,
                        (controller.pmPlanList
                                            .firstWhere(
                                              (e) =>
                                                  e?.plan_id ==
                                                  pmPlanDetails?.plan_id,
                                              orElse: () =>
                                                  PmPlanListModel(plan_id: 00),
                                            )
                                            ?.status_id ==
                                        401 &&
                                    varUserAccessModel.value.access_list!
                                            .where(
                                              (e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kPmPlanFeatureId &&
                                                  e.delete ==
                                                      UserAccessConstants
                                                          .kHaveDeleteAccess,
                                            )
                                            .length >
                                        0 ||
                                controller.pmPlanList
                                            .firstWhere(
                                              (e) =>
                                                  e?.plan_id ==
                                                  pmPlanDetails?.plan_id,
                                              orElse: () =>
                                                  PmPlanListModel(plan_id: 00),
                                            )
                                            ?.status_id ==
                                        406 &&
                                    varUserAccessModel.value.access_list!
                                            .where(
                                              (e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kPmPlanFeatureId &&
                                                  e.delete ==
                                                      UserAccessConstants
                                                          .kHaveDeleteAccess,
                                            )
                                            .length >
                                        0)
                            ? TableActionButton(
                                color: ColorValues.deleteColor,
                                icon: Icons.delete,
                                message: 'Delete',
                                onPress: () {
                                  controller.isDeleteDialog(
                                    planName: pmPlanDetails?.plan_name,
                                    planId: pmPlanDetails?.plan_id.toString(),
                                  );
                                },
                              )
                            : Dimens.box0
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        controller.clearStoreData();

        // final _flutterSecureStorage = const FlutterSecureStorage();

        // _flutterSecureStorage.delete(key: "pmPlanId");
        varUserAccessModel.value.access_list!
                    .where((e) =>
                        e.feature_id == UserAccessConstants.kPmPlanFeatureId &&
                        e.view == UserAccessConstants.kHaveViewAccess)
                    .length >
                0
            ? Get.toNamed(Routes.viewPmPlanScreen,
                arguments: {'pmPlanId': pmPlanDetails?.plan_id})
            : null;
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
