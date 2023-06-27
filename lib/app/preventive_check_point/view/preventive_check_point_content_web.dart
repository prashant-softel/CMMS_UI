import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../constant/constant.dart';
import '../../navigators/app_pages.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textfield.dart';
import '../preventive_check_point_controller.dart';

class PreventiveCheckPointContentWeb
    extends GetView<PreventiveCheckPointController> {
  PreventiveCheckPointContentWeb({Key? key}) : super(key: key);
  final PreventiveCheckPointController controller = Get.find();

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
                    child: Text(" / PREVENTIVE MAINTENANCE",
                        style: Styles.greyMediumLight12),
                  ),
                  Text(" / CHECK POINT CREATOR",
                      style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 6 && e.add == 0)
                              .length >
                          0
                      ? Container(
                          width: (Get.width * .3),
                          margin: EdgeInsets.only(left: 30, top: 30),
                          height: Get.height / 1.8,
                          child: Card(
                            color: Color.fromARGB(255, 251, 252, 253),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10, top: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Check Point Creator",
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
                                                  "CheckPoint added Successfully in the List.",
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
                                            CustomRichText(
                                                title: 'Check List No. '),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 45,
                                                width: (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .2) -
                                                    30,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(255,
                                                              236, 234, 234)
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 2),
                                                    ),
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0),
                                                  child: CustomDropDownButton(
                                                    value: controller
                                                        .selectedchecklist
                                                        .value,
                                                    onChange: (String?
                                                        selectedValue) {
                                                      controller
                                                          .isSelectedchecklist
                                                          .value = true;
                                                      controller
                                                              .selectedchecklist
                                                              .value =
                                                          selectedValue ?? '';

                                                      controller.getCheckPointlist(
                                                          selectedchecklistId:
                                                              selectedValue
                                                                  .toString());
                                                    },
                                                    item: controller.checkList
                                                        .map<
                                                            DropdownMenuItem<
                                                                String>>((list) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: list?.id
                                                                .toString() ??
                                                            '',
                                                        child: Text(list
                                                                ?.checklist_number
                                                                .toString() ??
                                                            ''),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomRichText(
                                                title: 'Check Point'),
                                            SizedBox(
                                              width: 32,
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .2) -
                                                      30,
                                                  child: LoginCustomTextfield(
                                                    ishint: 'Enter Check Point',
                                                    textController: controller
                                                        .checkPointCtrlr,
                                                  )),
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
                                            CustomRichText(
                                                title: 'Requirement'),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .2) -
                                                      30,
                                                  child: LoginCustomTextfield(
                                                    ishint: 'Enter Requirement',
                                                    textController: controller
                                                        .requirementCtrlr,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomRichText(
                                                title: 'Image Upload?'),
                                            SizedBox(
                                              width: 35,
                                            ),
                                            Text("No"),
                                            CustomSwitchTroggle(
                                                value:
                                                    controller.isToggleOn.value,
                                                onChanged: (value) {
                                                  controller.toggle();
                                                }),
                                            Text("Yes"),
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
                                      child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appRedColor,
                                          onPressed: () {},
                                          text: 'Cancel'),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        height: 40,
                                        child: controller.selectedItem == null
                                            ? CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                onPressed: () {
                                                  controller
                                                      .createCheckpoint()
                                                      .then((value) {
                                                    if (value)
                                                      controller
                                                          .issuccessCreatecheckpont();
                                                  });
                                                },
                                                text: 'Create Check Point')
                                            : CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                onPressed: () {
                                                  controller
                                                      .updateCheckPoint(
                                                          controller
                                                              .selectedItem?.id)
                                                      .then((value) {
                                                    print("value,$value");
                                                    if (value == true)
                                                      controller
                                                          .issuccessCreatecheckpont();
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
                              .where((e) => e.feature_id == 6 && e.view == 0)
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Check Point List",
                                          style: Styles.blackBold16,
                                        ),
                                        ActionButton(
                                          icon: Icons.upload,
                                          label: 'Import Check Point',
                                          onPressed: () {
                                            Get.toNamed(Routes.importInventory);
                                          },
                                          color: ColorValues.appDarkBlueColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {},
                                            text: 'Copy'),
                                      ),
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {},
                                            text: 'Excel'),
                                      ),
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {},
                                            text: 'PDF'),
                                      ),
                                      Container(
                                        height: 45,
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
                                  controller.preventiveCheckpoint!.isEmpty
                                      ? Expanded(
                                          child: ScrollableTableView(
                                            columns: [
                                              "Check Point Id",
                                              "Check List No.",
                                              "Check Point",
                                              "Requirement",
                                              "Upload Image?",
                                              "Action",
                                            ].map((column) {
                                              return TableViewColumn(
                                                label: column,
                                                minWidth: Get.width * 0.16,
                                              );
                                            }).toList(),
                                            rows: [
                                              ...List.generate(
                                                controller.preventiveCheckpoint
                                                        ?.length ??
                                                    0,
                                                (index) {
                                                  return [
                                                    "",
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
                                          paginationController:
                                              controller.paginationController,
                                          columns: [
                                            "Check Point Id",
                                            "Check List No.",
                                            "Check Point",
                                            "Requirement",
                                            "Upload Image?",
                                            "Action",
                                          ].map((column) {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width * 0.16,
                                            );
                                          }).toList(),
                                          rows: [
                                            ...List.generate(
                                              controller.preventiveCheckpoint
                                                      ?.length ??
                                                  0,
                                              (index) {
                                                var preventiveCheckPointModelListDetails =
                                                    controller
                                                            .preventiveCheckpoint?[
                                                        index];
                                                return [
                                                  '${preventiveCheckPointModelListDetails?.id}',
                                                  '${preventiveCheckPointModelListDetails?.checklist_name}',
                                                  '${preventiveCheckPointModelListDetails?.check_point}',
                                                  '${preventiveCheckPointModelListDetails?.requirement}',
                                                  '${preventiveCheckPointModelListDetails?.is_document_required}',
                                                  'Action',
                                                ];
                                              },
                                            ),
                                          ].map((record) {
                                            return TableViewRow(
                                              height: 60,
                                              cells: record.map((value) {
                                                return TableViewCell(
                                                  child: (value == "Action")
                                                      ? Wrap(children: [
                                                          varUserAccessModel
                                                                      .value
                                                                      .access_list!
                                                                      .where((e) =>
                                                                          e.feature_id ==
                                                                              6 &&
                                                                          e.edit ==
                                                                              0)
                                                                      .length >
                                                                  0
                                                              ? TableActionButton(
                                                                  color: ColorValues
                                                                      .appLightBlueColor,
                                                                  icon: Icons
                                                                      .edit,
                                                                  label: 'Edit',
                                                                  onPress: () {
                                                                    controller.selectedItem = controller
                                                                        .preventiveCheckpoint!
                                                                        .firstWhere((element) =>
                                                                            "${element?.id}" ==
                                                                            record[0]);

                                                                    controller
                                                                            .checkPointCtrlr
                                                                            .text =
                                                                        "${controller.selectedItem?.check_point}";
                                                                    controller
                                                                        .requirementCtrlr
                                                                        .text = controller
                                                                            .selectedItem
                                                                            ?.requirement ??
                                                                        "";
                                                                    controller
                                                                        .isToggleOn
                                                                        .value = controller.selectedItem?.is_document_required ==
                                                                            1
                                                                        ? true
                                                                        : false;
                                                                  },
                                                                )
                                                              : Container(),
                                                          varUserAccessModel
                                                                      .value
                                                                      .access_list!
                                                                      .where((e) =>
                                                                          e.feature_id ==
                                                                              6 &&
                                                                          e.delete ==
                                                                              0)
                                                                      .length >
                                                                  0
                                                              ? TableActionButton(
                                                                  color: ColorValues
                                                                      .appRedColor,
                                                                  icon: Icons
                                                                      .delete,
                                                                  label:
                                                                      'Delete',
                                                                  onPress: () {
                                                                    print(
                                                                        record[
                                                                            0]);
                                                                    controller.isDeleteDialog(
                                                                        check_point:
                                                                            record[
                                                                                2],
                                                                        check_point_id:
                                                                            record[0]);
                                                                  },
                                                                )
                                                              : Container(),
                                                        ])
                                                      : (value == "0" ||
                                                              value == '1')
                                                          ? Wrap(
                                                              children: [
                                                                Text("No"),
                                                                CustomSwitchTroggle(
                                                                  value: value ==
                                                                          "1"
                                                                      ? true
                                                                      : false,
                                                                  onChanged:
                                                                      (value) {},
                                                                ),
                                                                Text("Yes"),
                                                              ],
                                                            )
                                                          : Text(value),
                                                );
                                              }).toList(),
                                            );
                                          }).toList(),
                                        )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
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
                                                  Icons
                                                      .arrow_back_ios_new_rounded,
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
                                                  Icons
                                                      .arrow_forward_ios_rounded,
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
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
