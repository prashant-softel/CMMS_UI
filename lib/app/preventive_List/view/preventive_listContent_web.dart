import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/preventive_List/preventive_list_controller.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';

class PreventiveChecklistListContentWeb
    extends GetView<PreventiveListController> {
  PreventiveChecklistListContentWeb({Key? key}) : super(key: key);
  final PreventiveListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final dataSource = CheckListDataSource(controller);
      return SelectionArea(
        child: Container(
          color: Color.fromARGB(255, 234, 236, 238),
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        controller.type.value == AppConstants.kPM
                            ? Get.offNamed(Routes.preventive)
                            : controller.type.value == AppConstants.kAudit
                                ? Get.offNamed(Routes.audit)
                                : controller.type.value ==
                                        AppConstants.kEvaluation
                                    ? Get.offNamed(Routes.evaluation)
                                    : Get.offNamed(Routes.misDashboard);
                      },
                      child: controller.type.value == AppConstants.kPM
                          ? Text(" / PREVENTIVE MAINTENANCE",
                              style: Styles.greyLight14)
                          : controller.type.value == AppConstants.kAudit
                              ? Text(" / AUDIT", style: Styles.greyLight14)
                              : controller.type.value ==
                                      AppConstants.kEvaluation
                                  ? Text(" / EVALUATION",
                                      style: Styles.greyLight14)
                                  : Text(" / MIS", style: Styles.greyLight14),
                    ),
                    Text(" / CREATE CHECKLIST NUMBER",
                        style: Styles.greyLight14),
                  ],
                ),
              ),
              varUserAccessModel.value.access_list!
                          .where((e) =>
                              e.feature_id ==
                                  UserAccessConstants.kPMchecklistFeatureId &&
                              e.add == UserAccessConstants.kHaveAddAccess)
                          .length >
                      0
                  ? Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: ElevatedButton(
                        style: Styles.navyBlueElevatedButtonStyle,
                        onPressed: () {
                          controller.toggleContainer();
                        },
                        child: Obx(() {
                          return Text(
                            controller.isContainerVisible.value
                                ? 'Close Create Checklist'
                                : 'Open Create Checklist',
                          );
                        }),
                      ),
                    )
                  : Dimens.box0,
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // varUserAccessModel.value.access_list!
                    //             .where((e) => e.feature_id == 5 && e.add == 0)
                    //             .length >
                    //         0
                    //     ?

                    Visibility(
                      visible: controller.isContainerVisible.value,
                      child: Container(
                        width: (Get.width * .3),
                        margin: EdgeInsets.only(left: 10, top: 25),
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 251, 252, 253),
                        ),
                        // height: MediaQuery.of(context).size.width * 0.2,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Text(
                              //     '${varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.add == 1).length}'),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, top: 10),
                                child: SingleChildScrollView(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Create Checklist",
                                          style: Styles.blackBold16,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Visibility(
                                          visible: controller.isSuccess.value,
                                          child: Center(
                                            child: Wrap(
                                              children: [
                                                Text(
                                                  controller.selectedItem ==
                                                          null
                                                      ? "CheckList added Successfully in the List."
                                                      : "CheckList updated Successfully in the List.",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                          255, 24, 243, 123)),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  CustomRichText(
                                                      title: 'CheckList:'),
                                                  Dimens.boxHeight15,

                                                  // Visibility(
                                                  //   visible: controller.type != 4,
                                                  // child:
                                                  CustomRichText(
                                                      title:
                                                          'Equipment Category: '),
                                                  // ),
                                                  Dimens.boxHeight20,

                                                  CustomRichText(
                                                      title: 'Frequency: '),
                                                  Dimens.boxHeight20,
                                                  Text(
                                                    "Manpower: ",
                                                    style: Styles.blackBold16,
                                                  ),
                                                  Dimens.boxHeight20,
                                                  Text(
                                                    "Duration(in Min.): ",
                                                    style: Styles.blackBold16,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Dimens.boxWidth10,
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .6),
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            offset:
                                                                const Offset(
                                                              5.0,
                                                              5.0,
                                                            ),
                                                            blurRadius: 5.0,
                                                            spreadRadius: 1.0,
                                                          ),
                                                          BoxShadow(
                                                            color: ColorValues
                                                                .whiteColor,
                                                            offset:
                                                                const Offset(
                                                                    0.0, 0.0),
                                                            blurRadius: 0.0,
                                                            spreadRadius: 0.0,
                                                          ),
                                                        ],
                                                        color: ColorValues
                                                            .whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child:
                                                          LoginCustomTextfield(
                                                        textController: controller
                                                            .checklistNumberCtrlr,

                                                        //validate
                                                        errorController: controller
                                                                .ischecklistNumberInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .ischecklistNumberInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .ischecklistNumberInvalid
                                                                .value = true;
                                                          }
                                                        },

                                                        focusNode: controller
                                                            .checklistFocus,
                                                        scroll: controller
                                                            .checklistScroll,
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .deny(
                                                            RegExp('[\'^]'),
                                                          )
                                                        ],
                                                      )),
                                                  Dimens.boxHeight10,

                                                  // Visibility(
                                                  //    visible: controller.type != 4,
                                                  // child:
                                                  DropdownWebWidget(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            6,
                                                    controller: controller,
                                                    dropdownList: controller
                                                        .equipmentCategoryList,
                                                    isValueSelected: controller
                                                        .isSelectedequipment
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedequipment
                                                        .value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                  // ),
                                                  Dimens.boxHeight10,
                                                  DropdownWebWidget(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            6,
                                                    controller: controller,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black26,
                                                        offset: const Offset(
                                                          5.0,
                                                          5.0,
                                                        ),
                                                        blurRadius: 5.0,
                                                        spreadRadius: 1.0,
                                                      ),
                                                      BoxShadow(
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                    dropdownList: controller
                                                        .frequencyList,
                                                    isValueSelected: controller
                                                        .isSelectedfrequency
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedfrequency
                                                        .value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                  Dimens.boxHeight10,
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            offset:
                                                                const Offset(
                                                              5.0,
                                                              5.0,
                                                            ),
                                                            blurRadius: 5.0,
                                                            spreadRadius: 1.0,
                                                          ),
                                                          BoxShadow(
                                                            color: ColorValues
                                                                .whiteColor,
                                                            offset:
                                                                const Offset(
                                                                    0.0, 0.0),
                                                            blurRadius: 0.0,
                                                            spreadRadius: 0.0,
                                                          ),
                                                        ],
                                                        color: ColorValues
                                                            .whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              6,
                                                      child:
                                                          LoginCustomTextfield(
                                                        textController:
                                                            controller
                                                                .manpowerCtrlr,
                                                      )),
                                                  Dimens.boxHeight10,
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            offset:
                                                                const Offset(
                                                              5.0,
                                                              5.0,
                                                            ),
                                                            blurRadius: 5.0,
                                                            spreadRadius: 1.0,
                                                          ),
                                                          BoxShadow(
                                                            color: ColorValues
                                                                .whiteColor,
                                                            offset:
                                                                const Offset(
                                                                    0.0, 0.0),
                                                            blurRadius: 0.0,
                                                            spreadRadius: 0.0,
                                                          ),
                                                        ],
                                                        color: ColorValues
                                                            .whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              6,
                                                      child:
                                                          LoginCustomTextfield(
                                                        textController:
                                                            controller
                                                                .durationCtrlr,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                      ]),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: (Get.width * .1),
                                    height: 40,
                                    child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appRedColor,
                                        onPressed: () {
                                          controller.cleardata();
                                          controller.isContainerVisible.value =
                                              false;
                                        },
                                        text: 'Cancel'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: (Get.width * .15),
                                    height: 40,
                                    child: controller.selectedItem == null
                                        ? Container(
                                            width: (Get.width * .15),
                                            height: 40,
                                            child: CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                onPressed: () {
                                                  controller
                                                      .createChecklistNumber()
                                                      .then(
                                                    (value) {
                                                      print("CREATE");
                                                      print("value,$value");
                                                      if (value == true) {
                                                        controller
                                                            .issuccessCreatechecklist();
                                                        // Close the Create SPV container
                                                        controller
                                                            .toggleContainer();
                                                      }
                                                    },
                                                  );
                                                },
                                                text: 'Create CheckList'))
                                        : CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .updateChecklistNumber(
                                                      controller
                                                          .selectedItem?.id)
                                                  .then(
                                                (value) {
                                                  print("UPDATE");
                                                  print("value,$value");
                                                  if (value == true)
                                                    controller
                                                        .issuccessCreatechecklist();
                                                  controller.toggleContainer();
                                                },
                                              );
                                            },
                                            text: 'Update',
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        width: Get.width * 7,
                        margin: EdgeInsets.only(right: 10, left: 10, top: 20),
                        height: Get.height,
                        child: Card(
                          color: Color.fromARGB(255, 251, 252, 253),
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
                                      "Check List",
                                      style: Styles.blackBold16,
                                    ),
                                    Spacer(),
                                    // Container(
                                    //   width: 300,
                                    //   height: 40,
                                    //   margin: Dimens.edgeInsets0_0_7_0,
                                    //   child: TextField(
                                    //     style: TextStyle(
                                    //         fontSize: 14.0,
                                    //         height: 1.0,
                                    //         color: Colors.black),
                                    //     onChanged: (value) =>
                                    //         controller.search(value),
                                    //     decoration: InputDecoration(
                                    //       enabledBorder:
                                    //           const OutlineInputBorder(
                                    //         borderSide: const BorderSide(
                                    //           color: Colors.grey,
                                    //           width: 0.0,
                                    //         ),
                                    //       ),
                                    //       focusedBorder:
                                    //           const OutlineInputBorder(
                                    //         borderSide: const BorderSide(
                                    //           color: Colors.grey,
                                    //           width: 0.0,
                                    //         ),
                                    //       ),
                                    //       contentPadding:
                                    //           Dimens.edgeInsets05_10,
                                    //       hintText: 'search'.tr,
                                    //       hintStyle: Styles.grey16,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
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
                                  Spacer(),
                                  Container(
                                    width: 300,
                                    height: 40,
                                    margin: EdgeInsets.only(right: 5),
                                    child: TextField(
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          height: 1.0,
                                          color: Colors.black),
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
                                        contentPadding: Dimens.edgeInsets05_10,
                                        hintText: 'search'.tr,
                                        hintStyle: Styles.grey16,
                                      ),
                                    ),
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
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              controller.preventiveCheckList!.isEmpty == true &&
                                      controller.isLoading == false
                                  ? Center(child: Text("No data"))
                                  : controller.isLoading.value == true
                                      ? Center(
                                          child: Text("Data Loading......"))
                                      : Expanded(
                                          child: ValueListenableBuilder(
                                              valueListenable:
                                                  controller.columnVisibility,
                                              builder: (context, value, child) {
                                                final dataSource =
                                                    CheckListDataSource(
                                                        controller);

                                                return PaginatedDataTable2(
                                                  columnSpacing: 10,
                                                  source: dataSource,

                                                  minWidth: 2000,
                                                  showCheckboxColumn: false,
                                                  rowsPerPage:
                                                      10, // Number of rows per page
                                                  availableRowsPerPage: [
                                                    10,
                                                    20,
                                                    30,
                                                    50
                                                  ],
                                                  border: TableBorder.all(
                                                      color: Color.fromARGB(
                                                          255, 206, 229, 234)),
                                                  columns: [
                                                    for (var entry
                                                        in value.entries)
                                                      if (entry.value)
                                                        buildDataColumn(
                                                          entry.key,
                                                          controller
                                                                  .columnwidth[
                                                              entry.key],
                                                        ),
                                                    buildDataColumn(
                                                      'Actions',
                                                      150,
                                                    ),
                                                  ],
                                                );
                                              })),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  DataColumn2 buildDataColumn(
    String header,
    double? fixedWidth,
  ) {
    return DataColumn2(
      fixedWidth: fixedWidth,
      label: Column(
          mainAxisAlignment: MainAxisAlignment.center, //
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                header,
                style: Styles.black15W600,
              ),
            ),
          ]),
    );
  }
}

class CheckListDataSource extends DataTableSource {
  final PreventiveListController controller;

  late List<PreventiveCheckListModel?> checkList;

  CheckListDataSource(this.controller) {
    filterUsers();
  }
  void filterUsers() {
    checkList = <PreventiveCheckListModel?>[];
    checkList = controller.preventiveCheckList!.where((User) {
      return (User?.id ?? '')
          .toString()
          .toLowerCase()
          .contains(controller.idFilterText.value.toLowerCase());
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});

    final checklistDetails = checkList[index];

    var cellsBuffer = [
      '${index + 1}',
      'CL${checklistDetails?.id ?? ''}',
      '${checklistDetails?.name ?? ''}',
      'Active Status',
      '${checklistDetails?.category_name ?? ''}',
      '${checklistDetails?.frequency_name ?? ''}',
      '${checklistDetails?.manPower ?? ''}',
      '${checklistDetails?.duration ?? ''}',
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
                                        UserAccessConstants
                                            .kPMchecklistFeatureId &&
                                    e.edit ==
                                        UserAccessConstants.kHaveEditAccess)
                                .length >
                            0
                        ? TableActionButton(
                            color: ColorValues.editColor,
                            icon: Icons.edit,
                            message: 'Edit',
                            onPress: () {
                              controller.selectedItem =
                                  controller.preventiveCheckList!.firstWhere(
                                (element) =>
                                    "${element!.id}" ==
                                    controller.preventiveCheckList![index]?.id
                                        .toString(),
                              );

                              controller.checklistNumberCtrlr.text =
                                  controller.selectedItem?.name ?? '';
                              controller.durationCtrlr.text = controller
                                      .selectedItem?.duration
                                      .toString() ??
                                  '';

                              controller.manpowerCtrlr.text = controller
                                      .selectedItem?.manPower
                                      .toString() ??
                                  '';
                              controller.selectedfrequency.value =
                                  controller.selectedItem?.frequency_name ?? '';
                              controller.selectedequipment.value = controller
                                      .selectedItem?.category_name
                                      .toString() ??
                                  '';
                              controller.selectedEquipmentId =
                                  controller.selectedItem?.category_id ?? 0;
                              controller.selectedfrequencyId =
                                  controller.selectedItem?.frequency_id ?? 0;
                              controller.isContainerVisible.value = true;
                            },
                          )
                        : Dimens.box0,
                    varUserAccessModel.value.access_list!
                                .where((e) =>
                                    e.feature_id ==
                                        UserAccessConstants
                                            .kPMchecklistFeatureId &&
                                    e.delete ==
                                        UserAccessConstants.kHaveDeleteAccess)
                                .length >
                            0
                        ? TableActionButton(
                            color: ColorValues.deleteColor,
                            icon: Icons.delete,
                            message: 'Delete',
                            onPress: () {
                              controller.isDeleteDialog(
                                  checklist_id: controller
                                      .preventiveCheckList![index]?.id
                                      .toString(),
                                  checklist: controller
                                      .preventiveCheckList![index]?.name);

                              // controller.isContainerVisible.value = true;
                            },
                          )
                        : Dimens.box0
                  ])
                : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
    );
  }

  @override
  int get rowCount => checkList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
