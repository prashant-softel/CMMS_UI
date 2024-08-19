import 'package:cmms/app/app.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/escalation_matrix_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:data_table_2/data_table_2.dart';

class EscalationMatrixListWeb extends GetView<EscalationMatrixListController> {
  EscalationMatrixListWeb({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EscalationMatrixListController>(
      id: "escalator_matrix_list",
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => Stack(
              children: [
                Column(
                  children: [
                    HeaderWidget(),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
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
                              Get.offNamed(Routes.masterDashboard);
                            },
                            child: Text(" / MASTER", style: Styles.greyLight14),
                          ),
                          Text(
                            " / ESCALATION MATRIX LIST",
                            style: Styles.greyLight14,
                          ),
                          SizedBox(
                            width: 400,
                          ),
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
                            height: Get.height * .84,
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
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Escalation Matrix List",
                                          style: Styles.blackBold16,
                                        ),
                                        Spacer(),
                                        ActionButton(
                                          icon: Icons.add,
                                          color: ColorValues.addNewColor,
                                          onPressed: () {
                                            controller.clearStoreData();
                                            Get.toNamed(
                                              Routes
                                                  .addEscalatiomMatrixContentWeb,
                                            );
                                          },
                                          label: 'Set Escalation',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Dimens.boxHeight10,
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
                                                    .map(
                                                  (e) {
                                                    return PopupMenuItem<
                                                        String>(
                                                      child:
                                                          ValueListenableBuilder(
                                                        valueListenable:
                                                            controller
                                                                .columnVisibility,
                                                        builder: (
                                                          context,
                                                          value,
                                                          child,
                                                        ) {
                                                          return Row(
                                                            children: [
                                                              Checkbox(
                                                                value: value[
                                                                    e.key],
                                                                onChanged:
                                                                    (newValue) {
                                                                  controller
                                                                      .setColumnVisibility(
                                                                    e.key,
                                                                    newValue!,
                                                                  );
                                                                },
                                                              ),
                                                              Text(e.key),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                        onSelected: (String value) {},
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
                                              color: Colors.black,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            controller.search(value);
                                          },
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
                                  controller.matrixlist.isEmpty == true &&
                                          controller.isLoading == false
                                      ? Center(
                                          child: Text('No data'),
                                        )
                                      : controller.isLoading.value == true
                                          ? Center(
                                              child: Text("Data Loading......"),
                                            )
                                          : Expanded(
                                              child: ValueListenableBuilder(
                                                valueListenable:
                                                    controller.columnVisibility,
                                                builder:
                                                    (context, value, child) {
                                                  final dataSource =
                                                      EscalationListDataSource(
                                                          controller);
                                                  return PaginatedDataTable2(
                                                    dataRowHeight: 45,
                                                    source: dataSource,
                                                    minWidth: Get.width * 2,
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
                                                            .ActionFilterText,
                                                        200,
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                ],
                              ),
                            ),
                          ),
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
  }
}

DataColumn2 buildDataColumn(
  String header,
  RxString filterText,
  double? fixedWidth,
) {
  return DataColumn2(
    fixedWidth: fixedWidth,
    label: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            header,
            style: Styles.black16W500,
          ),
        ),
      ],
    ),
  );
}

class EscalationListDataSource extends DataTableSource {
  final EscalationMatrixListController controller;

  late List<EscalationMatListModel?> filteredEscalationList;

  EscalationListDataSource(this.controller) {
    filterUsers();
  }

  void filterUsers() {
    filteredEscalationList = <EscalationMatListModel?>[];
    filteredEscalationList = controller.matrixlist.where((Escalation) {
      return (Escalation.moduleId ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.ModuleIdFilterText.value.toLowerCase()) &&
          (Escalation.moduleName ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.ModuleNameFilterText.value.toLowerCase()) &&
          (Escalation.statusName ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.StatusNameFilterText.value.toLowerCase()) &&
          (Escalation.escalation?.length ?? '')
              .toString()
              .toLowerCase()
              .contains(
                  controller.NoOfEscalationFilterText.value.toLowerCase());
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    final Escalation = filteredEscalationList[index];
    var cellsBuffer = [
      '${Escalation?.moduleId ?? ''}',
      '${Escalation?.moduleName ?? ''}',
      '${Escalation?.statusName ?? ''}',
      '${Escalation?.escalation?.length ?? 0}',
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
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: (value == 'Actions')
                ? Wrap(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              TableActionButton(
                                  color: ColorValues.appDarkBlueColor,
                                  icon: Icons.visibility,
                                  message: 'View',
                                  onPress: () {
                                    controller.viewEscalationMatrix(
                                      moudle_id: Escalation?.moduleId ?? 0,
                                      status_id: Escalation?.statusId ?? 0,
                                    );
                                  }),
                              TableActionButton(
                                color: ColorValues.appYellowColor,
                                icon: Icons.edit,
                                message: 'Edit',
                                onPress: () {
                                  controller.editEscalationMatrix(
                                    moudle_id: Escalation?.moduleId ?? 0,
                                    status_id: Escalation?.statusId ?? 0,
                                  );
                                },
                              ),
                              TableActionButton(
                                color: ColorValues.draftColor,
                                icon: Icons.escalator,
                                message: 'Escalate',
                                onPress: () {
                                  controller.escalateModule(
                                    moduleId: Escalation?.moduleId ?? 0,
                                    statusId: Escalation?.statusId ?? 0,
                                  );
                                },
                              )
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
      onSelectChanged: (_) {
        controller.viewEscalationMatrix(
          moudle_id: Escalation?.moduleId ?? 0,
          status_id: Escalation?.statusId ?? 0,
        );
      },
    );
  }

  @override
  int get rowCount => filteredEscalationList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
