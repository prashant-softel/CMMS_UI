import 'package:clipboard/clipboard.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/tbt_type_list/tbt_type_list_controller.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
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
                  Text(
                    "DASHBOARD",
                    style: Styles.greyLight14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(" / MASTERS", style: Styles.greyMediumLight12),
                  ),
                  Text(" / TBT TYPE", style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 5 && e.add == 1)
                              .length >
                          0
                      ? Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Add TBT Type ",
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
                                                      ? "TBT added Successfully in the List."
                                                      : "TBT updated Successfully in the List.",
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
                                                      color:
                                                          ColorValues.whiteColor,
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
                                                          color: ColorValues
                                                              .whiteColor,
                                                          offset: const Offset(
                                                              0.0, 0.0),
                                                          blurRadius: 0.0,
                                                          spreadRadius: 0.0,
                                                        ),
                                                      ],
                                                      color:
                                                          ColorValues.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    width: (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2) -
                                                        30,
                                                    // width: MediaQuery.of(context).size.width / 1.5,/
                                                  child: Obx(
                                                        () => TextField
                                                      (
                                                      controller: controller
                                                          .titleCtrlr,
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
                                                          controller
                                                              .isTitleInvalid
                                                              .value = false;
                                                        } else {
                                                          controller
                                                              .isTitleInvalid
                                                              .value = true;
                                                        }
                                                      },
                                                    ),
                                                  ),),
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
                                                      color:
                                                          ColorValues.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    // width: MediaQuery.of(context).size.width / 2,
                                                    width: (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2) -
                                                        30,
                                                      child: Obx(
                                                            () => TextField
                                                          (
                                                          controller: controller
                                                              .descriptionCtrlr,
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
                                                                . isDescriptionInvalid

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
                                                                . isDescriptionInvalid

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
                                                                . isDescriptionInvalid

                                                                .value
                                                                ? "Required field"
                                                                : null,
                                                          ),
                                                          onChanged: (value) {
                                                            if (value.trim().length >
                                                                1) {
                                                              controller
                                                                  . isDescriptionInvalid

                                                                  .value = false;
                                                            } else {
                                                              controller
                                                                  . isDescriptionInvalid

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
                                              controller.cleardata;
                                            },
                                            text: 'Cancel')),
                                    SizedBox(
                                      width: 10,
                                    ),

                                    Container(
                                        height: 40,
                                        width: (Get.width * .2 - 50),
                                        child: controller.selectedItem == null
                                            ? CustomElevatedButton(
                                            backgroundColor: ColorValues
                                                .appDarkBlueColor,
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
                                            text: 'Create TBT Type ')
                                            : CustomElevatedButton(
                                            backgroundColor: ColorValues
                                                .appDarkBlueColor,
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
                        )
                      : Container(),
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 5 && e.view == 1)
                              .length >
                          0
                      ? Expanded(
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
                                      "List of TBT Type",
                                      style: Styles.blackBold16,
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {
                                              FlutterClipboard.copy(controller
                                                      // .preventiveCheckList![0]
                                                      .toString())
                                                  .then((value) {
                                                print("copy data");
                                              });
                                            },
                                            text: 'Copy'),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {},
                                            text: 'Excel'),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {},
                                            text: 'PDF'),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'columnVisibility'.tr,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
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
                                                      controller
                                                          .jobTypeList[index];
                                                  return [
                                                    '${jobTypeListDetails.id}',
                                                    '${jobTypeListDetails.name}',
                                                    'No Data Found',
                                                    // '${jobTypeListDetails.facilityId}',
                                                    'Checkbox',
                                                    "Action"
                                                  ];
                                                },
                                              ),
                                            ].map((_permitTypeList) {
                                              return TableViewRow(
                                                  height: 60,
                                                  cells: _permitTypeList
                                                      .map((value) {
                                                    return TableViewCell(
                                                        child: (value ==
                                                                'Checkbox')
                                                            ? Checkbox(
                                                                value: controller
                                                                    .isChecked
                                                                    .value,
                                                                onChanged:
                                                                    (val) {})
                                                            : (value ==
                                                                    "Action")
                                                                ? Wrap(
                                                          alignment: WrapAlignment.center,
                                                                    children: [
                                                                        // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.edit == 1).length >
                                                                        //         0
                                                                        //     ?
                                                                        TableActionButton(
                                                                          color:
                                                                              ColorValues.editColor,
                                                                          icon:
                                                                              Icons.edit,
                                                                          message:
                                                                              'Edit',
                                                                          onPress:
                                                                              () {
                                                                                controller.selectedItem = controller.jobTypeList.firstWhere((element) => "${element.id}" == _permitTypeList[0]);

                                                                                controller.titleCtrlr.text = controller.selectedItem?.name ?? '';
                                                                              },
                                                                        ),
                                                                        // : Container(),
                                                                        // :Container(),
                                                                        // varUserAccessModel.value.access_list!.where((e) => e.feature_name == "PM Checklist Number" && e.delete == 1).length >
                                                                        //         0
                                                                        //     ?
                                                                        TableActionButton(
                                                                          color:
                                                                              ColorValues.deleteColor,
                                                                          icon:
                                                                              Icons.delete,
                                                                          message:
                                                                              'Delete',
                                                                          onPress:
                                                                              () {
                                                                                controller.isDeleteDialog(business_id: _permitTypeList[0], business: _permitTypeList[1]);
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: ValueListenableBuilder(
                                        valueListenable: controller
                                            .jobTypeListPaginationController,
                                        builder: (context, value, child) {
                                          return Row(children: [
                                            Text(
                                                "${controller.jobTypeListPaginationController.currentPage}  of ${controller.jobTypeListPaginationController.pageCount}"),
                                            Row(children: [
                                              IconButton(
                                                onPressed: controller
                                                            .jobTypeListPaginationController
                                                            .currentPage <=
                                                        1
                                                    ? null
                                                    : () {
                                                        controller
                                                            .jobTypeListPaginationController
                                                            .previous();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_back_ios_new_rounded,
                                                  color: controller
                                                              .jobTypeListPaginationController
                                                              .currentPage <=
                                                          1
                                                      ? Colors.black26
                                                      : Theme.of(context)
                                                          .primaryColor,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: controller
                                                            .jobTypeListPaginationController
                                                            .currentPage >=
                                                        controller
                                                            .jobTypeListPaginationController
                                                            .pageCount
                                                    ? null
                                                    : () {
                                                        controller
                                                            .jobTypeListPaginationController
                                                            .next();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: controller
                                                              .jobTypeListPaginationController
                                                              .currentPage >=
                                                          controller
                                                              .jobTypeListPaginationController
                                                              .pageCount
                                                      ? Colors.black26
                                                      : Theme.of(context)
                                                          .primaryColor,
                                                ),
                                              ),
                                            ]),
                                          ]);
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
