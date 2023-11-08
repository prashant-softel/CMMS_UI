import 'package:clipboard/clipboard.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/SPV_list/SPV_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';

class SPVListContentWeb extends GetView<SPVListController> {
  SPVListContentWeb({Key? key}) : super(key: key);
  final SPVListController controller = Get.find();

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
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child:
                        Text(" / SPV LIST ", style: Styles.greyMediumLight12),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 5 && e.add == 0)
                              .length >
                          0
                      ? Container(
                          width: (Get.width * .3),
                          margin: EdgeInsets.only(left: 30, top: 30),
                          height: Get.height / 2.4,
                          child: Card(
                            color: Color.fromARGB(255, 251, 252, 253),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                // Text(
                                //     '${varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.add == 1).length}'),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10, top: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "SPV LIST",
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
                                                  controller.isFormInvalid ==
                                                          false
                                                      ? controller.selectedItem ==
                                                              null
                                                          ? "Facility added Successfully in the List."
                                                          : "Facility updated Successfully in the List."
                                                      : "Facility is not added.",
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
                                            // Text(
                                            //   "Title",
                                            //   style: Styles.blackBold16,
                                            // ),

                                            Expanded(
                                                child: CustomRichText(
                                                    title: 'Title ')),
                                            Expanded(
                                              child: Container(
                                                margin: Dimens.edgeInsets5,
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
                                                width: (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .2) -
                                                    45,
                                                child: Obx(
                                                  () => TextField(
                                                    controller:
                                                        controller.titleCtrlr,
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
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: CustomRichText(
                                                    title: 'Description ')),
                                            Expanded(
                                              child: Container(
                                                margin: Dimens.edgeInsets5,
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
                                                width: (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .2) -
                                                    45,
                                                child: Obx(
                                                  () => TextField(
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
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                      ]),
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
                                            },
                                            text: 'Cancel')),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        width: (Get.width * .2) - 50,
                                        height: 40,
                                        child: controller.selectedItem == null
                                            ? CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                onPressed: () {
                                                  controller
                                                      .createSPVlist()
                                                      .then((value) {
                                                    print("CREATE");
                                                    print("value,$value");
                                                    if (value == true)
                                                      controller
                                                          .issuccessCreatechecklist();
                                                  });
                                                },
                                                text: 'Create SPV ')
                                            : CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                onPressed: () {
                                                  controller
                                                      .updateSPV(controller
                                                          .selectedItem?.id)
                                                      .then((value) {
                                                    print("UPDATE");
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
                              .where((e) => e.feature_id == 5 && e.view == 0)
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
                                      "List of SPV",
                                      style: Styles.blackBold16,
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Row(
                                    children: [
                                      // Container(
                                      //   height: 45,
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
                                      //   height: 45,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //       backgroundColor:
                                      //           ColorValues.appLightBlueColor,
                                      //       onPressed: () {},
                                      //       text: 'Excel'),
                                      // ),
                                      // Container(
                                      //   height: 45,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //       backgroundColor:
                                      //           ColorValues.appLightBlueColor,
                                      //       onPressed: () {},
                                      //       text: 'PDF'),
                                      // ),
                                      // Container(
                                      //   height: 45,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //     backgroundColor:
                                      //         ColorValues.appLightBlueColor,
                                      //     onPressed: () {},
                                      //     text: 'columnVisibility'.tr,
                                      //   ),
                                      // ),
                                      Spacer(),
                                      Container(
                                        width: 200,
                                        height: 40,
                                        margin: Dimens.edgeInsets0_0_16_0,
                                        child: TextField(
                                          onChanged: (value) =>
                                              controller.search(value),
                                          decoration: InputDecoration(
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
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
                                  controller.SPVList.isEmpty
                                      ? Expanded(
                                          child: ScrollableTableView(
                                            columns: [
                                              "Id ",
                                              "Name",
                                              "Description",
                                              "Action"
                                            ].map((column) {
                                              return TableViewColumn(
                                                label: column,
                                                minWidth: Get.width * 0.16,
                                              );
                                            }).toList(),
                                            rows: [
                                              ...List.generate(
                                                controller.SPVList.length ?? 0,
                                                (index) {
                                                  return ['', '', '', ''];
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
                                                .SPVListPaginationController,
                                            columns: [
                                              "Id ",
                                              "Name",
                                              "Description",
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
                                                controller.SPVList.length,
                                                (index) {
                                                  var SPVListDetails =
                                                      controller.SPVList[index];
                                                  return [
                                                    '${SPVListDetails.id}',
                                                    '${SPVListDetails.name}',
                                                    '${SPVListDetails.description}',
                                                    "Action"
                                                  ];
                                                },
                                              ),
                                            ].map((_permitTypeList) {
                                              return TableViewRow(
                                                  height: 45,
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
                                                          : (value == "Action")
                                                              ? Wrap(
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .center, // Align buttons to the center
                                                                  children: [
                                                                      // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.edit == 1).length >
                                                                      //         0
                                                                      //     ?
                                                                      Container(
                                                                        padding:
                                                                            EdgeInsets.only(bottom: 10),
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                              TableActionButton(
                                                                                color: ColorValues.editColor,
                                                                                icon: Icons.edit,
                                                                                message: 'Edit',
                                                                                onPress: () {
                                                                                  controller.selectedItem = controller.SPVList.firstWhere((element) => "${element.id}" == _permitTypeList[0]);

                                                                                  controller.titleCtrlr.text = controller.selectedItem?.name ?? '';
                                                                                  controller.descriptionCtrlr.text = controller.selectedItem?.description ?? '';
                                                                                },
                                                                              ),
                                                                              TableActionButton(
                                                                                color: ColorValues.deleteColor,
                                                                                icon: Icons.delete,
                                                                                message: 'Delete',
                                                                                onPress: () {
                                                                                  controller.isDeleteDialog(business_id: _permitTypeList[0], business: _permitTypeList[1]);
                                                                                },
                                                                              ),
                                                                            ]),
                                                                            // Container(
                                                                            //   padding: EdgeInsets.only(
                                                                            //       bottom:
                                                                            //           10),
                                                                            //   child:
                                                                            // ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      // : Container()
                                                                    ])
                                                              : Align(
                                                                  // Align the text in the center
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                      value),
                                                                ),
                                                    );
                                                  }).toList());
                                            }).toList(),
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: ValueListenableBuilder(
                                        valueListenable: controller
                                            .SPVListPaginationController,
                                        builder: (context, value, child) {
                                          return Row(children: [
                                            Text(
                                                "${controller.SPVListPaginationController.currentPage}  of ${controller.SPVListPaginationController.pageCount}"),
                                            Row(children: [
                                              IconButton(
                                                onPressed: controller
                                                            .SPVListPaginationController
                                                            .currentPage <=
                                                        1
                                                    ? null
                                                    : () {
                                                        controller
                                                                .SPVListPaginationController
                                                            .previous();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_back_ios_new_rounded,
                                                  color: controller
                                                              .SPVListPaginationController
                                                              .currentPage <=
                                                          1
                                                      ? Colors.black26
                                                      : Theme.of(context)
                                                          .primaryColor,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: controller
                                                            .SPVListPaginationController
                                                            .currentPage >=
                                                        controller
                                                            .SPVListPaginationController
                                                            .pageCount
                                                    ? null
                                                    : () {
                                                        controller
                                                                .SPVListPaginationController
                                                            .next();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: controller
                                                              .SPVListPaginationController
                                                              .currentPage >=
                                                          controller
                                                              .SPVListPaginationController
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
