import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/tbt_type_list/tbt_type_list_controller.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';

class TBTTypeListContentWeb extends GetView<TBTTypeListController> {
  TBTTypeListContentWeb({Key? key}) : super(key: key);
  final TBTTypeListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
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
                    color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                      Get.offAllNamed(Routes.breakdown);
                    },
                    child: Text(" / BREAKDOWN MAINTENANCE",
                        style: Styles.greyLight14),
                  ),
                  Text(" / JOB TYPE", style: Styles.greyLight14)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: ElevatedButton(
                style: Styles.navyBlueElevatedButtonStyle,
                onPressed: () {
                  controller.toggleContainer();
                },
                child: Obx(() {
                  return Text(
                    controller.isContainerVisible.value
                        ? 'Close Job Type'
                        : 'Open Job Type',
                  );
                }),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: controller.isContainerVisible.value,
                    child: Container(
                      width: (Get.width * .3),
                      margin: EdgeInsets.only(left: 30, top: 30),
                      height: Get.height / 1.6,
                      child: Card(
                        color: Color.fromARGB(255, 251, 252, 253),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            // Text(
                            //     '${varUserAccessModel.val  ue.access_list!.where((e) => e.feature_id == 5 && e.add == 1).length}'),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10, top: 10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Add JOB Type ",
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
                                              controller.selectedItem == null
                                                  ? "JOB type added Successfully in the List."
                                                  : "JOB type updated Successfully in the List.",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: CustomRichText(
                                              title: 'Facility: '),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.040,
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2) -
                                                30,
                                            child: DropdownWebWidget(
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
                                                  color: ColorValues.whiteColor,
                                                  offset:
                                                      const Offset(0.0, 0.0),
                                                  blurRadius: 0.0,
                                                  spreadRadius: 0.0,
                                                ),
                                              ],
                                              dropdownList:
                                                  controller.facilityList,
                                              isValueSelected: controller
                                                  .isFacilitySelected.value,
                                              selectedValue: controller
                                                  .selectedFacility.value,
                                              onValueChanged:
                                                  controller.onValueChanged,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: CustomRichText(
                                              title: 'Job Type Title '),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Container(
                                              decoration: BoxDecoration(
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
                                                    color:
                                                        ColorValues.whiteColor,
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 0.0,
                                                    spreadRadius: 0.0,
                                                  ),
                                                ],
                                                color: ColorValues.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2) -
                                                  30,
                                              // width: MediaQuery.of(context).size.width / 1.5,/
                                              child: Obx(
                                                () => TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      height: 1.0,
                                                      color: Colors.black),
                                                  controller:
                                                      controller.titleCtrlr,
                                                  focusNode:
                                                      controller.titleFocus,
                                                  scrollController:
                                                      controller.titleScroll,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  maxLines: 1,
                                                  autofocus: false,
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        ColorValues.whiteColor,
                                                    filled: true,
                                                    contentPadding:
                                                        Dimens.edgeInsets05_10,
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedErrorBorder:
                                                        controller
                                                                .isTitleInvalid
                                                                .value
                                                            ? OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: ColorValues
                                                                      .redColorDark,
                                                                ),
                                                              )
                                                            : InputBorder.none,
                                                    errorBorder: controller
                                                            .isTitleInvalid
                                                            .value
                                                        ? OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            borderSide:
                                                                BorderSide(
                                                              color: ColorValues
                                                                  .redColorDark,
                                                            ),
                                                          )
                                                        : null,
                                                    errorText: controller
                                                            .isTitleInvalid
                                                            .value
                                                        ? "Required field"
                                                        : null,
                                                  ),
                                                  onChanged: (value) {
                                                    if (value.trim().length >
                                                        1) {
                                                      controller.isTitleInvalid
                                                          .value = false;
                                                    } else {
                                                      controller.isTitleInvalid
                                                          .value = true;
                                                    }
                                                  },
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .deny(
                                                      RegExp('[\'^]'),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: CustomRichText(
                                              title: 'Description '),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Container(
                                                decoration: BoxDecoration(
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
                                                  color: ColorValues.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                // width: MediaQuery.of(context).size.width / 2,
                                                width: (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .2) -
                                                    30,
                                                child: Obx(
                                                  () => TextField(
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        height: 1.0,
                                                        color: Colors.black),
                                                    controller: controller
                                                        .descriptionCtrlr,
                                                    focusNode:
                                                        controller.descFocus,
                                                    scrollController:
                                                        controller.descScroll,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    maxLines: 1,
                                                    autofocus: false,
                                                    decoration: InputDecoration(
                                                      fillColor: ColorValues
                                                          .whiteColor,
                                                      filled: true,
                                                      contentPadding: Dimens
                                                          .edgeInsets05_10,
                                                      border: InputBorder.none,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent),
                                                      ),
                                                      focusedErrorBorder: controller
                                                              .isDescriptionInvalid
                                                              .value
                                                          ? OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: ColorValues
                                                                    .redColorDark,
                                                              ),
                                                            )
                                                          : InputBorder.none,
                                                      errorBorder: controller
                                                              .isDescriptionInvalid
                                                              .value
                                                          ? OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: ColorValues
                                                                    .redColorDark,
                                                              ),
                                                            )
                                                          : null,
                                                      errorText: controller
                                                              .isDescriptionInvalid
                                                              .value
                                                          ? "Required field"
                                                          : null,
                                                    ),
                                                    onChanged: (value) {
                                                      if (value.trim().length >
                                                          1) {
                                                        controller
                                                            .isDescriptionInvalid
                                                            .value = false;
                                                      } else {
                                                        controller
                                                            .isDescriptionInvalid
                                                            .value = true;
                                                      }
                                                    },
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomRichText(
                                              title: 'Require SOP/JSA: '),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Checkbox(
                                            value: controller
                                                .isCheckedRequire.value,
                                            onChanged: (bool? value) {
                                              controller
                                                  .requiretoggleCheckbox();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ]),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 40,
                                    width: (Get.width * .1),
                                    child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appRedColor,
                                        onPressed: () {
                                          controller.clearData();
                                        },
                                        text: 'Cancel')),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 40,
                                    width: 200,
                                    child: controller.selectedItem == null
                                        ? CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .createJobType()
                                                  .then((value) {
                                                print("value,$value");
                                                if (value == true)
                                                  controller
                                                      .issuccessCreatechecklist();
                                              });
                                            },
                                            text: 'Create JOB Type ')
                                        : CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .updateTbt(controller
                                                      .selectedItem?.id)
                                                  .then((value) {
                                                print("value,$value");
                                                if (value == true)
                                                  controller
                                                      .issuccessCreatechecklist();
                                              });
                                            },
                                            text: 'Update')),
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
                      margin: EdgeInsets.only(left: 10, top: 30),
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
                              child: Text(
                                "List of JOB Type",
                                style: Styles.blackBold16,
                              ),
                            ),
                            Divider(
                              color: ColorValues.greyLightColour,
                            ),
                            Row(
                              children: [
                                // Container(
                                //   margin: EdgeInsets.only(left: 10),
                                //   child: CustomElevatedButton(
                                //       backgroundColor:
                                //           ColorValues.appLightBlueColor,
                                //       onPressed: () {
                                //         FlutterClipboard.copy(controller
                                //                 // .preventiveCheckList![0]
                                //                 .toString())
                                //             .then((value) {
                                //           print("copy data");
                                //         });
                                //       },
                                //       text: 'Copy'),
                                // ),
                                // Container(
                                //   margin: EdgeInsets.only(left: 10),
                                //   child: CustomElevatedButton(
                                //       backgroundColor:
                                //           ColorValues.appLightBlueColor,
                                //       onPressed: () {},
                                //       text: 'Excel'),
                                // ),
                                // Container(
                                //   margin: EdgeInsets.only(left: 10),
                                //   child: CustomElevatedButton(
                                //       backgroundColor:
                                //           ColorValues.appLightBlueColor,
                                //       onPressed: () {},
                                //       text: 'PDF'),
                                // ),
                                // Container(
                                //   margin: EdgeInsets.only(left: 10),
                                //   child: CustomElevatedButton(
                                //     backgroundColor:
                                //         ColorValues.appLightBlueColor,
                                //     onPressed: () {},
                                //     text: 'columnVisibility'.tr,
                                //   ),
                                // )
                              ],
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            controller.jobTypeList.isEmpty
                                ? Expanded(
                                    child: ScrollableTableView(
                                      columns: [
                                        "Sr.No.",
                                        "Title",
                                        "Description",
                                        // "Facility",
                                        "Require\nSOP/JSA",
                                        "Action"
                                      ].map((column) {
                                        return TableViewColumn(
                                          label: column,
                                          minWidth: Get.width * 0.16,
                                        );
                                      }).toList(),
                                      rows: [
                                        ...List.generate(
                                          controller.jobTypeList.length,
                                          (index) {
                                            return [
                                              '',
                                              '',
                                              '',
                                              '',
                                              '',
                                              '',
                                            ];
                                          },
                                        ),
                                      ].map((record) {
                                        return TableViewRow(
                                          height: 60,
                                          cells: record.map((value) {
                                            return TableViewCell(
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        );
                                      }).toList(),
                                    ),
                                  )
                                : Expanded(
                                    child: ScrollableTableView(
                                      paginationController: controller
                                          .jobTypeListPaginationController,
                                      columns: [
                                        "Sr.No.",
                                        "Title",
                                        "Description",
                                        // "Facility",
                                        "Require\nSOP/JSA",
                                        "Action"
                                      ].map((column) {
                                        return TableViewColumn(
                                          minWidth: Get.width * 0.12,
                                          label: column,
                                        );
                                      }).toList(),
                                      rows: //
                                          [
                                        ...List.generate(
                                          controller.jobTypeList.length,
                                          (index) {
                                            var jobTypeListDetails =
                                                controller.jobTypeList[index];
                                            return [
                                              '${jobTypeListDetails.id}',
                                              '${jobTypeListDetails.name}',
                                              // 'No Data Found',
                                              '${jobTypeListDetails.description}',
                                              'Checkbox',
                                              "Action"
                                            ];
                                          },
                                        ),
                                      ].map((_permitTypeList) {
                                        return TableViewRow(
                                            height: 60,
                                            cells: _permitTypeList.map((value) {
                                              return TableViewCell(
                                                  child: (value == 'Checkbox')
                                                      ? Checkbox(
                                                          value: controller
                                                              .isChecked.value,
                                                          onChanged: (val) {})
                                                      : (value == "Action")
                                                          ? Wrap(
                                                              alignment:
                                                                  WrapAlignment
                                                                      .center,
                                                              children: [
                                                                  // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.edit == 1).length >
                                                                  //         0
                                                                  //     ?
                                                                  TableActionButton(
                                                                    color: ColorValues
                                                                        .editColor,
                                                                    icon: Icons
                                                                        .edit,
                                                                    message:
                                                                        'Edit',
                                                                    onPress:
                                                                        () {
                                                                      controller.selectedItem = controller
                                                                          .jobTypeList
                                                                          .firstWhere((element) =>
                                                                              "${element.id}" ==
                                                                              _permitTypeList[0]);

                                                                      controller
                                                                          .titleCtrlr
                                                                          .text = controller
                                                                              .selectedItem
                                                                              ?.name ??
                                                                          '';
                                                                      controller
                                                                          .descriptionCtrlr
                                                                          .text = controller
                                                                              .selectedItem
                                                                              ?.name ??
                                                                          '';
                                                                    },
                                                                  ),
                                                                  // : Container(),
                                                                  // :Container(),
                                                                  // varUserAccessModel.value.access_list!.where((e) => e.feature_name == "PM Checklist Number" && e.delete == 1).length >
                                                                  //         0
                                                                  //     ?
                                                                  TableActionButton(
                                                                    color: ColorValues
                                                                        .deleteColor,
                                                                    icon: Icons
                                                                        .delete,
                                                                    message:
                                                                        'Delete',
                                                                    onPress:
                                                                        () {
                                                                      controller.isDeleteDialog(
                                                                          business_id: _permitTypeList[
                                                                              0],
                                                                          business:
                                                                              _permitTypeList[1]);
                                                                    },
                                                                  )
                                                                  // : Container()
                                                                ])
                                                          : Text(
                                                              value,
                                                            ));
                                            }).toList());
                                      }).toList(),
                                    ),
                                  ),
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
  }
}
