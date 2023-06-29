import 'package:cmms/app/app.dart';
import 'package:cmms/app/role_access/rele_access_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_swich_toggle.dart';

class RoleAccessContentWeb extends GetView<RoleAccessController> {
  RoleAccessContentWeb({Key? key}) : super(key: key);
  final RoleAccessController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Widget _rowItem(int? defaultValue, {required Function(bool) onCheck}) {
      return Checkbox(
          value: defaultValue == 1 ? true : false,
          checkColor: Colors.white,
          activeColor: ColorValues.blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(
              width: 1.0,
              color: ColorValues.blackColor,
            ),
          ),
          onChanged: (val) {
            controller.isChecked.value = val!;
            onCheck(val);
          });
    }

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
                    child: Text(" / MASTER", style: Styles.greyMediumLight12),
                  ),
                  Text(" / ROLE ACCESS ", style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  width: Get.width,
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  height: Get.height,
                  //height: Get.height - 300,

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
                          child: Text(
                            "Role Access ",
                            style: Styles.blackBold16,
                          ),
                        ),
                        Divider(
                          color: ColorValues.greyLightColour,
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Text(
                                'Role: ',
                                style: Styles.blackBold14,
                              ),
                              Dimens.boxWidth20,
                              Container(
                                width: (MediaQuery.of(context).size.width * .2),
                                child: DropdownWidget(
                                  controller: controller,
                                  dropdownList: controller.roleList,
                                  isValueSelected:
                                      controller.isSelectedRole.value,
                                  selectedValue: controller.selectedRole.value,
                                  onValueChanged: controller.onValueChanged,
                                ),
                              ),
                              Spacer(),
                              // Dimens.boxWidth15,
                              Text(
                                'Existing User: ',
                                style: Styles.blackBold14,
                              ),
                              Dimens.boxWidth10,
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: CustomSwitchTroggle(
                                    value: controller.isExistingusers.value,
                                    onChanged: (value) {
                                      controller.existingusertoggle();
                                    }),
                              ),
                              Spacer(),
                              // Dimens.boxWidth15,
                              Text(
                                'Set Role: ',
                                style: Styles.blackBold14,
                              ),
                              Dimens.boxWidth10,
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: CustomSwitchTroggle(
                                    value: controller.isSetRole.value,
                                    onChanged: (value) {
                                      controller.setRoletoggle();
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                                height: Get.height - 300,
                                width: Get.width,
                                margin: Dimens.edgeInsets15,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        ColorValues.lightGreyColorWithOpacity35,
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorValues.appBlueBackgroundColor,
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: controller.accesslevel.length > 0
                                    ? ScrollableTableView(
                                        columns: [
                                          "Module Name",
                                          "Add",
                                          "Edit",
                                          "Delete",
                                          "View",
                                          "Issue",
                                          "Approve",
                                          "Self View"
                                        ].map((column) {
                                          return TableViewColumn(
                                            label: column,
                                            // Set the width of the column to 100

                                            minWidth: Get.width * 0.95,
                                          );
                                        }).toList(),
                                        rows: controller.accesslevel
                                            .map((getAccesslevelDetails) =>
                                                TableViewRow(
                                                    height: 90,
                                                    cells: [
                                                      TableViewCell(
                                                        child: Obx(() {
                                                          return Row(
                                                            children: [
                                                              // Checkbox(
                                                              //     value: controller
                                                              //         .isCheckedmodule
                                                              //         .value,
                                                              //     checkColor:
                                                              //         Colors.white,
                                                              //     activeColor:
                                                              //         ColorValues
                                                              //             .blackColor,
                                                              //     shape:
                                                              //         RoundedRectangleBorder(
                                                              //       borderRadius:
                                                              //           BorderRadius
                                                              //               .circular(
                                                              //                   2.0),
                                                              //     ),
                                                              //     side:
                                                              //         MaterialStateBorderSide
                                                              //             .resolveWith(
                                                              //       (states) =>
                                                              //           BorderSide(
                                                              //         width: 1.0,
                                                              //         color: ColorValues
                                                              //             .blackColor,
                                                              //       ),
                                                              //     ),
                                                              //     onChanged: (val) {
                                                              //       controller
                                                              //           .accesslevel
                                                              //           .firstWhere((e) =>
                                                              //               e?.feature_name ==
                                                              //               getAccesslevelDetails
                                                              //                   ?.feature_name);
                                                              //       controller
                                                              //           .isCheckedmodule
                                                              //           .value = val!;

                                                              //       controller
                                                              //           .update();
                                                              //     }),

                                                              Dimens.boxWidth5,
                                                              Expanded(
                                                                  child: Text(
                                                                      "${getAccesslevelDetails?.feature_name}"))
                                                            ],
                                                          );
                                                        }),
                                                      ),
                                                      TableViewCell(
                                                        child: Obx(() {
                                                          return _rowItem(
                                                              getAccesslevelDetails
                                                                  ?.add.value,
                                                              onCheck: (val) {
                                                            getAccesslevelDetails
                                                                    ?.add
                                                                    .value =
                                                                val == true
                                                                    ? 1
                                                                    : 0;
                                                          });
                                                        }),
                                                      ),
                                                      TableViewCell(
                                                        child: Obx(() {
                                                          return _rowItem(
                                                              getAccesslevelDetails
                                                                  ?.edit.value,
                                                              onCheck: (val) {
                                                            getAccesslevelDetails
                                                                    ?.edit
                                                                    .value =
                                                                val == true
                                                                    ? 1
                                                                    : 0;
                                                          });
                                                        }),
                                                      ),
                                                      TableViewCell(
                                                          child: Obx(() {
                                                        return _rowItem(
                                                            getAccesslevelDetails
                                                                ?.delete.value,
                                                            onCheck: (val) {
                                                          getAccesslevelDetails
                                                                  ?.delete
                                                                  .value =
                                                              val == true
                                                                  ? 1
                                                                  : 0;
                                                        });
                                                      })),
                                                      TableViewCell(
                                                          child: Obx(() {
                                                        return _rowItem(
                                                            getAccesslevelDetails
                                                                ?.view.value,
                                                            onCheck: (val) {
                                                          getAccesslevelDetails
                                                                  ?.view.value =
                                                              val == true
                                                                  ? 1
                                                                  : 0;
                                                        });
                                                      })),
                                                      TableViewCell(
                                                          child: Obx(() {
                                                        return _rowItem(
                                                            getAccesslevelDetails
                                                                ?.issue.value,
                                                            onCheck: (val) {
                                                          getAccesslevelDetails
                                                                  ?.issue
                                                                  .value =
                                                              val == true
                                                                  ? 1
                                                                  : 0;
                                                        });
                                                      })),
                                                      TableViewCell(
                                                          child: Obx(() {
                                                        return _rowItem(
                                                            getAccesslevelDetails
                                                                ?.approve.value,
                                                            onCheck: (val) {
                                                          getAccesslevelDetails
                                                                  ?.approve
                                                                  .value =
                                                              val == true
                                                                  ? 1
                                                                  : 0;
                                                        });
                                                      })),
                                                      TableViewCell(
                                                          child: Obx(() {
                                                        return _rowItem(
                                                            getAccesslevelDetails
                                                                ?.selfView
                                                                .value,
                                                            onCheck: (val) {
                                                          getAccesslevelDetails
                                                                  ?.selfView
                                                                  .value =
                                                              val == true
                                                                  ? 1
                                                                  : 0;
                                                        });
                                                      })),
                                                    ]))
                                            .toList())
                                    : Dimens.box0),
                            Container(
                              margin: EdgeInsets.only(bottom: 40, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 35,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.greenColor,
                                      text: 'Submit',
                                      onPressed: () {
                                        //controller.addUser();
                                        //  controller.saveAccessLevel();
                                      },
                                    ),
                                  ),
                                  Dimens.boxWidth20,
                                  Container(
                                    height: 35,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.redColor,
                                      text: "Cancel",
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
