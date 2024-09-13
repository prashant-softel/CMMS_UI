import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/wc_certificates_list/wc_certificates_list_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/wc_certificate_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/table_action_button.dart';

class WcCertificatesListWeb extends StatefulWidget {
  WcCertificatesListWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<WcCertificatesListWeb> createState() => _WcCertificatesListWebState();
}

class _WcCertificatesListWebState extends State<WcCertificatesListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WcCertificatesListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(
            () {
              final dataSource = WcCertificatesListDataSource(controller);
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
                                Get.offNamed(Routes.moduleCleaningDashboard);
                              },
                              child:
                                  Text(" / MASTER", style: Styles.greyLight14),
                            ),
                            Text(" / WC CERTIFICATES LIST",
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
                            height: Get.height * 0.85 - 5,
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
                                          "WC Certificates List",
                                          style: Styles.blackBold16,
                                        ),
                                        Spacer(),
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
                                      //   decoration: BoxDecoration(boxShadow: [
                                      //     BoxShadow(
                                      //       color: Colors.black26,
                                      //       offset: const Offset(2.0, 1.0),
                                      //       blurRadius: 5.0,
                                      //       spreadRadius: 1.0,
                                      //     )
                                      //   ]),
                                      //   height: 35,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //       backgroundColor:
                                      //           ColorValues.appLightBlueColor,
                                      //       onPressed: () {
                                      //         controller.export();
                                      //       },
                                      //       text: 'Excel'),
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
                                  controller.wcCertificateList.isEmpty ==
                                              true &&
                                          controller.isLoading == false
                                      ? Center(child: Text("No Data"))
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
                                                        WcCertificatesListDataSource(
                                                            controller);

                                                    return PaginatedDataTable2(
                                                      columnSpacing: 10,
                                                      dataRowHeight: 70,
                                                      source: dataSource,
                                                      minWidth: 2300,
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
                                                              controller
                                                                      .columnwidth[
                                                                  entry.key],
                                                            ),
                                                        buildDataColumn(
                                                          'Actions',
                                                          controller
                                                              .assetsIdFilterText,
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
            final controller = Get.find<WcCertificatesListController>();
            // controller.sortData(header);
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
            if (header != "Actions")
              Obx(() {
                final controller = Get.find<WcCertificatesListController>();

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

class WcCertificatesListDataSource extends DataTableSource {
  final WcCertificatesListController controller;

  late List<WcCertificatesListModel?> filteredWcCertificatesList;

  WcCertificatesListDataSource(this.controller) {
    filtersModuleCliningPlan();
  }

  ///
  void filtersModuleCliningPlan() {
    filteredWcCertificatesList = <WcCertificatesListModel?>[];
    filteredWcCertificatesList =
        controller.wcCertificateList.where((wcCertificateList) {
      return (wcCertificateList.assetId ?? '')
              .toString()
              .contains(controller.assetNameFilterText.value.toLowerCase()) &&
          (wcCertificateList.assetName ?? '').toString().contains(
              controller.categoryNameFilterText.value.toLowerCase()) &&
          (wcCertificateList.categoryName ?? '').toString().contains(
              controller.warrantyDescriptionFilterText.value.toLowerCase()) &&
          (wcCertificateList.warrantyDescription ?? '').toString().contains(
              controller.warrantyTypeNameFilterText.value.toLowerCase()) &&
          (wcCertificateList.warrantyTypeName ?? '').toString().contains(
              controller.warrantyStartDateFilterText.value.toLowerCase()) &&
          (wcCertificateList.warrantyStartDate ?? '').toString().contains(
              controller.warrantyStartDateFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredWcCertificatesList": filteredWcCertificatesList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final wcCertificatesList = filteredWcCertificatesList[index];

    controller.assetsId.value = wcCertificatesList?.assetId ?? 0;
    var cellsBuffer = [
      "asset_id",
      '${wcCertificatesList?.assetName ?? ''}',
      '${wcCertificatesList?.categoryName ?? ''}',
      '${wcCertificatesList?.warrantyDescription ?? ''}',
      '${wcCertificatesList?.warrantyTypeName ?? ''}',
      '${wcCertificatesList?.warrantyTermName ?? ''}',
      '${wcCertificatesList?.warrantyStartDate ?? ''}',
      '${wcCertificatesList?.warrantyExpiryDate ?? ''}',
      '${wcCertificatesList?.certificateNumber ?? ''}',
      '${wcCertificatesList?.warrantyProviderName ?? ''}',
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
            child: (value == 'asset_id')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WCC${wcCertificatesList?.assetId}',
                      ),
                      Dimens.boxHeight10,
                      // Container(
                      //   padding:
                      //       EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      //   decoration: BoxDecoration(
                      //     color: controller.wcCertificateList
                      //                 .firstWhere(
                      //                   (e) =>
                      //                       e.planId ==
                      //                       wcCertificatesList!.planId,
                      //                   orElse: () =>
                      //                       WcCertificatesListModel(planId: 00),
                      //                 )
                      //                 .status ==
                      //             353
                      //         ? ColorValues.approveColor
                      //         : controller.wcCertificateList
                      //                     .firstWhere(
                      //                       (e) =>
                      //                           e.planId ==
                      //                           wcCertificatesList!.planId,
                      //                       orElse: () =>
                      //                           WcCertificatesListModel(
                      //                               planId: 00),
                      //                     )
                      //                     .status ==
                      //                 351
                      //             ? ColorValues.yellowColor
                      //             : ColorValues.redColor,
                      //     borderRadius: BorderRadius.circular(4),
                      //   ),
                      //   child: Text(
                      //     '${wcCertificatesList?.status_short}',
                      //     style: Styles.white11.copyWith(
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                : (value == 'Actions')
                    ? Wrap(children: [
                        TableActionButton(
                          color: ColorValues.viewColor,
                          icon: Icons.remove_red_eye_outlined,
                          message: 'view',
                          onPress: () {
                            int id = wcCertificatesList?.assetId ?? 0;
                          },
                        ),
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {},
    );
  }

  @override
  int get rowCount => filteredWcCertificatesList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
