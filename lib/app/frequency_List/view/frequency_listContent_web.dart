import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_swich_toggle.dart';
import '../frequency_list_controller.dart';

class FrequencyListContentWeb extends GetView<FrequencyListController> {
  FrequencyListContentWeb({Key? key}) : super(key: key);
  final FrequencyListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Obx(
        () => Container(
          color: Color.fromARGB(255, 234, 236, 238),
          width: Get.width,
          height: Get.height,
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
                        Get.offNamed(Routes.masterDashboard);
                      },
                      child: Text(" / MASTERS", style: Styles.greyLight14),
                    ),
                    Text(" / FREQUENCY NUMBER", style: Styles.greyLight14)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // varUserAccessModel.value.access_list!
                    //             .where((e) => e.feature_id == 5 && e.add == 0)
                    //             .length >
                    //         0
                    //     ?
                    Container(
                      width: (Get.width * .3),
                      margin: EdgeInsets.only(left: 30, top: 30),
                      height: Get.height / 2.25,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Create FrequencyList",
                                      style: Styles.blackBold16,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Visibility(
                                      visible: controller.isSuccess.value,
                                      child: Center(
                                        child: Wrap(
                                          children: [
                                            Text(
                                              controller.selectedItem == null
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
                                      // mainAxisAlignment:
                                      // MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child:
                                                CustomRichText(title: 'Name:')),
                                        // SizedBox(
                                        //   width: 70,
                                        // ),
                                        Expanded(
                                          child: Container(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2) -
                                                30,
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
                                                  color: ColorValues.whiteColor,
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
                                            child: Obx(
                                              () => TextField(
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16.0,
                                                      height: 1.0,
                                                      color: Colors.black),
                                                ),
                                                controller: controller
                                                    .checklistNumberCtrlr,
                                                focusNode: controller.nameFocus,
                                                scrollController:
                                                    controller.nameScroll,
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
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedErrorBorder: controller
                                                          .isTitleInvalid.value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : InputBorder.none,
                                                  errorBorder: controller
                                                          .isTitleInvalid.value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : null,
                                                  errorText: controller
                                                          .isTitleInvalid.value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller.isTitleInvalid
                                                        .value = false;
                                                  } else {
                                                    controller.isTitleInvalid
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
                                      height: 10,
                                    ),
                                    Row(
                                      // mainAxisAlignment:
                                      // MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Days"
                                            ": ",
                                            style: Styles.black16,
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 60,
                                        // ),
                                        Expanded(
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
                                                  color: ColorValues.whiteColor,
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
                                            child: Obx(
                                              () => TextField(
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16.0,
                                                      height: 1.0,
                                                      color: Colors.black),
                                                ),
                                                controller:
                                                    controller.manpowerCtrlr,
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
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedErrorBorder: controller
                                                          .isDescriptionInvalid
                                                          .value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
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
                                                                  .circular(5),
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
                                                  if (value.trim().length > 1) {
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
                                        // ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
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
                                        onPressed: () {},
                                        text: 'Cancel')),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 40,
                                    width: (Get.width * .2) - 70,
                                    child: controller.selectedItem == null
                                        ? CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .createChecklistNumber()
                                                  .then((value) {
                                                print("value,$value");
                                                if (value == true)
                                                  controller
                                                      .issuccessCreatechecklist();
                                              });
                                            },
                                            text: 'Create Frequency List')
                                        : CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              // controller
                                              //     .updateChecklistNumber(
                                              //         controller
                                              //             .selectedItem?.id)
                                              //     .then((value) {
                                              //   print("value,$value");
                                              //   if (value == true)
                                              //     controller
                                              //         .issuccessCreatechecklist();
                                              // });
                                            },
                                            text: 'Update')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // : Container(),
                    // varUserAccessModel.value.access_list!
                    //             .where((e) => e.feature_id == 5 && e.view == 0)
                    //             .length >
                    //         0
                    //     ?
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
                                  "Frequency List",
                                  style: Styles.blackBold16,
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              Row(
                                children: [
                                  // Container(
                                  //   height: 35,
                                  //   margin: EdgeInsets.only(left: 10),
                                  //   child: CustomElevatedButton(
                                  //       backgroundColor:
                                  //           ColorValues.appLightBlueColor,
                                  //       onPressed: () {
                                  //         FlutterClipboard.copy(controller
                                  //                 .frequencyList![0]
                                  //                 .toString())
                                  //             .then((value) {
                                  //           print("copy data");
                                  //         });
                                  //       },
                                  //       text: 'Copy'),
                                  // ),
                                  // Container(
                                  //   height: 35,
                                  //   margin: EdgeInsets.only(left: 10),
                                  //   child: CustomElevatedButton(
                                  //       backgroundColor:
                                  //           ColorValues.appLightBlueColor,
                                  //       onPressed: () {},
                                  //       text: 'Excel'),
                                  // ),
                                  // Container(
                                  //   height: 35,
                                  //   margin: EdgeInsets.only(left: 10),
                                  //   child: CustomElevatedButton(
                                  //       backgroundColor:
                                  //           ColorValues.appLightBlueColor,
                                  //       onPressed: () {},
                                  //       text: 'PDF'),
                                  // ),
                                  // Container(
                                  //   height: 35,
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
                              SizedBox(
                                height: 20,
                              ),
                              controller.frequencyList!.isEmpty
                                  ? Expanded(
                                      child: ScrollableTableView(
                                        columns: [
                                          "Id",
                                          "Name ",
                                          "Days",
                                          "Status ",
                                        ].map((column) {
                                          return TableViewColumn(
                                            label: column,
                                            minWidth: Get.width * 0.16,
                                          );
                                        }).toList(),
                                        rows: [
                                          ...List.generate(
                                            controller.frequencyList?.length ??
                                                0,
                                            (index) {
                                              return [
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
                                        paginationController:
                                            controller.paginationController,
                                        columns: [
                                          "Id",
                                          "Name",
                                          "Days",
                                          "Status"
                                        ].map((column) {
                                          return TableViewColumn(
                                            minWidth: Get.width * 0.12,
                                            label: column,
                                          );
                                        }).toList(),
                                        rows: //
                                            [
                                          ...List.generate(
                                            controller.frequencyList?.length ??
                                                0,
                                            (index) {
                                              var frequencyListModelListDetails =
                                                  controller
                                                      .frequencyList?[index];
                                              return [
                                                '${frequencyListModelListDetails?.id}',
                                                '${frequencyListModelListDetails?.name}',
                                                '${frequencyListModelListDetails?.days}',
                                                '${frequencyListModelListDetails?.status}',
                                              ];
                                            },
                                          ),
                                        ].map((_preventiveCheckList) {
                                          return TableViewRow(
                                              height: 45,
                                              cells: _preventiveCheckList
                                                  .map((value) {
                                                return TableViewCell(
                                                    child: (value == 'No')
                                                        ? CustomSwitchTroggle(
                                                            value: value == 'No'
                                                                ? true
                                                                : false,
                                                            onChanged:
                                                                (value) {},
                                                          )
                                                        : (value == "Action")
                                                            ? Wrap(children: [
                                                                varUserAccessModel
                                                                            .value
                                                                            .access_list!
                                                                            .where((e) =>
                                                                                e.feature_id == 5 &&
                                                                                e.edit == 0)
                                                                            .length >
                                                                        0
                                                                    ? TableActionButton(
                                                                        color: ColorValues
                                                                            .appLightBlueColor,
                                                                        icon: Icons
                                                                            .edit,
                                                                        message:
                                                                            'Edit',
                                                                        onPress:
                                                                            () {
                                                                          controller.selectedItem = controller.frequencyList!.firstWhere((element) =>
                                                                              "${element?.id}" ==
                                                                              _preventiveCheckList[0]);

                                                                          // controller.checklistNumberCtrlr.text = controller.selectedItem?.checklist_number ?? '';
                                                                          // controller.durationCtrlr.text = "${controller.selectedItem?.duration}";
                                                                          // controller.manpowerCtrlr.text = "${controller.selectedItem?.manPower}";
                                                                          // controller.selectedfrequency.value = controller.selectedItem?.frequency_name ?? "";
                                                                          // controller.selectedequipment.value = controller.selectedItem?.category_name ?? "";
                                                                          // controller.selectedEquipmentId = controller.selectedItem?.category_id ?? 0;
                                                                          // controller.selectedfrequencyId = controller.selectedItem?.frequency_id ?? 0;
                                                                        },
                                                                      )
                                                                    : Container(),
                                                                varUserAccessModel
                                                                            .value
                                                                            .access_list!
                                                                            .where((e) =>
                                                                                e.feature_id == 5 &&
                                                                                e.delete == 0)
                                                                            .length >
                                                                        0
                                                                    ? TableActionButton(
                                                                        color: ColorValues
                                                                            .appRedColor,
                                                                        icon: Icons
                                                                            .delete,
                                                                        message:
                                                                            'Delete',
                                                                        onPress:
                                                                            () {
                                                                          print(
                                                                              _preventiveCheckList[0]);
                                                                          // controller.isDeleteDialog(checklist_id: _preventiveCheckList[0], checklist: _preventiveCheckList[1]);
                                                                        },
                                                                      )
                                                                    : Container()
                                                              ])
                                                            : Text(
                                                                value,
                                                              ));
                                              }).toList());
                                        }).toList(),
                                      ),
                                    ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: ValueListenableBuilder(
                                    valueListenable:
                                        controller.paginationController,
                                    builder: (context, value, child) {
                                      return Row(children: [
                                        Text(
                                            "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
                                        Row(children: [
                                          IconButton(
                                            onPressed: controller
                                                        .paginationController
                                                        .currentPage <=
                                                    1
                                                ? null
                                                : () {
                                                    controller
                                                        .paginationController
                                                        .previous();
                                                  },
                                            iconSize: 20,
                                            splashRadius: 20,
                                            icon: Icon(
                                              Icons.arrow_back_ios_new_rounded,
                                              color: controller
                                                          .paginationController
                                                          .currentPage <=
                                                      1
                                                  ? Colors.black26
                                                  : Theme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: controller
                                                        .paginationController
                                                        .currentPage >=
                                                    controller
                                                        .paginationController
                                                        .pageCount
                                                ? null
                                                : () {
                                                    controller
                                                        .paginationController
                                                        .next();
                                                  },
                                            iconSize: 20,
                                            splashRadius: 20,
                                            icon: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: controller
                                                          .paginationController
                                                          .currentPage >=
                                                      controller
                                                          .paginationController
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
                    // : Container()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
