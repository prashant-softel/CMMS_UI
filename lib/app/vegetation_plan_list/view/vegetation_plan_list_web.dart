import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/vegetation_plan_list/vegetation_plan_list_controller.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:cmms/domain/models/vegetation_list_plan_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
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
  final homecontroller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VegetationPlanListController>(
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
                            Text(" / VEGETATION CONTROL PLANNING",
                                style: Styles.greyLight14)
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: Get.width * 7,
                            margin:
                                EdgeInsets.only(left: 10, top: 10, right: 10),
                            height: Get.height * .85,
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
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kVegetationControlFeatureId &&
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
                                                  Get.offNamed(Routes
                                                      .addVegetationPlanScreen);
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
                                  controller.vegetationPlanList.isEmpty ==
                                              true &&
                                          controller.isLoading == false
                                      ? Center(child: Text('No data'))
                                      : controller.isLoading.value == true
                                          ? Center(
                                              child: Text('Data Loading......'))
                                          : Expanded(
                                              child: ValueListenableBuilder(
                                                  valueListenable: controller
                                                      .columnVisibility,
                                                  builder:
                                                      (context, value, child) {
                                                    final dataSource =
                                                        VegetationPlanListDataSource(
                                                            controller);

                                                    return PaginatedDataTable2(
                                                      columnSpacing: 10,
                                                      dataRowHeight: 55,
                                                      source: dataSource,
                                                      minWidth: Get.width * 0.7,
                                                      showCheckboxColumn: false,
                                                      rowsPerPage: 10,
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
                                                              // controller.columnwidth[
                                                              //     entry.key],
                                                            ),
                                                        buildDataColumn(
                                                          'Actions',
                                                          controller
                                                              .planIdFilterText,
                                                          // 150,
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
) {
  return DataColumn2(
    onSort: header == "Actions"
        ? null // Disable sorting for "Actions"
        : (int columnIndex, bool ascending) {
            final controller = Get.find<VegetationPlanListController>();
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
                "Actions") // Don't show the sorting icon for "Actions"
              Obx(() {
                final controller = Get.find<VegetationPlanListController>();
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
          (item.statusShort ?? '')
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
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          decoration: BoxDecoration(
                            color: controller.vegetationPlanList
                                        .firstWhere(
                                          (e) =>
                                              e.planId ==
                                              VegetationListDetails!.planId,
                                          orElse: () => VegetationPlanListModel(
                                              planId: 00),
                                        )
                                        .status ==
                                    704
                                ? ColorValues.approveColor
                                : controller.vegetationPlanList
                                            .firstWhere(
                                              (e) =>
                                                  e.planId ==
                                                  VegetationListDetails!.planId,
                                              orElse: () =>
                                                  VegetationPlanListModel(
                                                      planId: 00),
                                            )
                                            .status ==
                                        702
                                    ? ColorValues.yellowColor
                                    : ColorValues.redColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            ' ${VegetationListDetails?.statusShort}',
                            style: Styles.white11.copyWith(
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
                            controller.clearStoreData();
                            int id = VegetationListDetails?.planId ?? 0;
                            if (id != 0) {
                              Get.toNamed(
                                  '${Routes.viewVegetationPlanScreen}/$id');
                            }
                          },
                        ),
                        varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kVegetationControlFeatureId &&
                                            e.edit ==
                                                UserAccessConstants
                                                    .kHaveEditAccess)
                                        .length >
                                    0 &&
                                controller.vegetationPlanList
                                        .firstWhere(
                                          (e) =>
                                              e.planId ==
                                              VegetationListDetails!.planId,
                                          orElse: () => VegetationPlanListModel(
                                              planId: 00),
                                        )
                                        .status ==
                                    702
                            ? TableActionButton(
                                color: ColorValues.editColor,
                                icon: Icons.edit,
                                message: 'Edit',
                                onPress: () {
                                  controller.clearStoreData();
                                  int id = VegetationListDetails?.planId ?? 0;
                                  if (id != 0) {
                                    Get.toNamed(
                                      Routes.addVegetationPlanScreen,
                                      arguments: {"vegid": id},
                                    );
                                  }
                                },
                              )
                            : Dimens.box0,
                        // varUserAccessModel.value.access_list!
                        //                 .where((e) =>
                        //                     e.feature_id ==
                        //                         UserAccessConstants
                        //                             .kVegetationControlFeatureId &&
                        //                     e.delete ==
                        //                         UserAccessConstants
                        //                             .kHaveEditAccess)
                        //                 .length >
                        //             0 &&
                        //         controller.vegetationPlanList
                        //                 .firstWhere(
                        //                   (e) =>
                        //                       e.planId ==
                        //                       VegetationListDetails!.planId,
                        //                   orElse: () => VegetationPlanListModel(
                        //                       planId: 00),
                        //                 )
                        //                 .status ==
                        //             702
                        //     ? TableActionButton(
                        //         color: ColorValues.deleteColor,
                        //         icon: Icons.delete,
                        //         message: 'Delete',
                        //         onPress: () {
                        //           controller.clearStoreData();
                        //           controller.isDeleteDialog(
                        //             planName: VegetationListDetails?.title,
                        //             planId: VegetationListDetails?.planId,
                        //           );
                        //         },
                        //       )
                        //     : Dimens.box0,
                        varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kVegetationControlFeatureId &&
                                            e.add ==
                                                UserAccessConstants
                                                    .kHaveAddAccess)
                                        .length >
                                    0 &&
                                controller.vegetationPlanList
                                        .firstWhere(
                                          (e) =>
                                              e.planId ==
                                              VegetationListDetails!.planId,
                                          orElse: () => VegetationPlanListModel(
                                              planId: 00),
                                        )
                                        .status ==
                                    703
                            ? TableActionButton(
                                color: Color.fromARGB(255, 116, 78, 130),
                                icon: Icons.ads_click,
                                message: 'Resubmit',
                                onPress: () {
                                  controller.clearStoreData();
                                  int id = VegetationListDetails?.planId ?? 0;
                                  if (id != 0) {
                                    Get.toNamed(Routes.addVegetationPlanScreen,
                                        arguments: {
                                          "vegid": id,
                                          "vegType": 1,
                                        });
                                  }
                                },
                              )
                            : Dimens.box0,
                        controller.vegetationPlanList
                                        .firstWhere(
                                          (e) =>
                                              e.planId ==
                                              VegetationListDetails!.planId,
                                          orElse: () => VegetationPlanListModel(
                                              planId: 00),
                                        )
                                        .status ==
                                    702 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kVegetationControlFeatureId &&
                                            e.approve ==
                                                UserAccessConstants
                                                    .kHaveApproveAccess)
                                        .length >
                                    0
                            ? TableActionButton(
                                color: ColorValues.appGreenColor,
                                icon: Icons.check,
                                message: 'Approve/Reject',
                                onPress: () {
                                  controller.clearStoreData();
                                  int id = VegetationListDetails?.planId ?? 0;
                                  if (id != 0) {
                                    Get.toNamed(
                                        '${Routes.viewVegetationPlanScreen}/$id');
                                  }
                                },
                              )
                            : Dimens.box0
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      onSelectChanged: (_) {
        controller.clearStoreData();
        int id = VegetationListDetails?.planId ?? 0;
        if (id != 0) {
          Get.toNamed('${Routes.viewVegetationPlanScreen}/$id');
        }
      },
    );
  }

  @override
  int get rowCount => filteredVegetationList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
