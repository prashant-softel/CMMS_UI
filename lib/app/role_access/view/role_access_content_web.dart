import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/role_access/rele_access_controller.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

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
                      child: Text(" / MASTER", style: Styles.greyLight14),
                    ),
                    Text(" / ROLE ACCESS ", style: Styles.greyLight14)
                  ],
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Container(
                    width: Get.width,
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    height: Get.height * .85 - 10,
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
                            margin: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Text(
                                  'Role: ',
                                  style: Styles.blackBold14,
                                ),
                                Dimens.boxWidth20,
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width * .2),
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
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ],
                                    controller: controller,
                                    dropdownList: controller.roleList,
                                    isValueSelected:
                                        controller.isSelectedRole.value,
                                    selectedValue:
                                        controller.selectedRole.value,
                                    onValueChanged: controller.onValueChanged,
                                  ),
                                ),
                                // Spacer(),
                                // // Dimens.boxWidth15,
                                // Text(
                                //   'Apply to Existing User: ',
                                //   style: Styles.blackBold14,
                                // ),
                                // Dimens.boxWidth10,
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 8.0),
                                //   child: CustomSwitchTroggle(
                                //       value: controller.isExistingusers.value,
                                //       onChanged: (value) {
                                //         controller.existingusertoggle();
                                //       }),
                                // ),
                                Spacer(),
                                // Dimens.boxWidth15,
                                Text(
                                  'Apply to Role: ',
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
                                  height: Get.height * .55,
                                  width: Get.width,
                                  margin: Dimens.edgeInsets15,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorValues
                                          .lightGreyColorWithOpacity35,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            ColorValues.appBlueBackgroundColor,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: controller.accesslevel.length > 0
                                      ? DataTable2(
                                          columns: [
                                              DataColumn2(
                                                  fixedWidth: 200,
                                                  label: Text(
                                                    "Module Name",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              DataColumn2(
                                                  label: Text(
                                                "Add",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  label: Text(
                                                "Edit",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  label: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  label: Text(
                                                "View",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  label: Text(
                                                "Self View",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  label: Text(
                                                "Issue",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  label: Text(
                                                "Approve",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ],
                                          rows: controller.accesslevel
                                              .map((getAccesslevelDetails) =>
                                                  DataRow(cells: [
                                                    DataCell(
                                                      Obx(() {
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
                                                    DataCell(
                                                      Obx(() {
                                                        return _rowItem(
                                                            getAccesslevelDetails
                                                                ?.add.value,
                                                            onCheck: (val) {
                                                          getAccesslevelDetails
                                                                  ?.add.value =
                                                              val == true
                                                                  ? 1
                                                                  : 0;
                                                        });
                                                      }),
                                                    ),
                                                    DataCell(
                                                      Obx(() {
                                                        return _rowItem(
                                                            getAccesslevelDetails
                                                                ?.edit.value,
                                                            onCheck: (val) {
                                                          getAccesslevelDetails
                                                                  ?.edit.value =
                                                              val == true
                                                                  ? 1
                                                                  : 0;
                                                        });
                                                      }),
                                                    ),
                                                    DataCell(Obx(() {
                                                      return _rowItem(
                                                          getAccesslevelDetails
                                                              ?.delete.value,
                                                          onCheck: (val) {
                                                        getAccesslevelDetails
                                                                ?.delete.value =
                                                            val == true ? 1 : 0;
                                                      });
                                                    })),
                                                    DataCell(Obx(() {
                                                      return _rowItem(
                                                          getAccesslevelDetails
                                                              ?.view.value,
                                                          onCheck: (val) {
                                                        getAccesslevelDetails
                                                                ?.view.value =
                                                            val == true ? 1 : 0;
                                                      });
                                                    })),
                                                    DataCell(Obx(() {
                                                      return _rowItem(
                                                          getAccesslevelDetails
                                                              ?.selfView.value,
                                                          onCheck: (val) {
                                                        getAccesslevelDetails
                                                                ?.selfView
                                                                .value =
                                                            val == true ? 1 : 0;
                                                      });
                                                    })),
                                                    DataCell(Obx(() {
                                                      return _rowItem(
                                                          getAccesslevelDetails
                                                              ?.issue.value,
                                                          onCheck: (val) {
                                                        getAccesslevelDetails
                                                                ?.issue.value =
                                                            val == true ? 1 : 0;
                                                      });
                                                    })),
                                                    DataCell(Obx(() {
                                                      return _rowItem(
                                                          getAccesslevelDetails
                                                              ?.approve.value,
                                                          onCheck: (val) {
                                                        getAccesslevelDetails
                                                                ?.approve
                                                                .value =
                                                            val == true ? 1 : 0;
                                                      });
                                                    })),
                                                  ]))
                                              .toList())
                                      : Dimens.box0),
                              Container(
                                // margin: EdgeInsets.only(bottom: 15, top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id ==
                                                        UserAccessConstants
                                                            .kMasterFeatureId &&
                                                    e.edit ==
                                                        UserAccessConstants
                                                            .kHaveEditAccess)
                                                .length >
                                            0
                                        ? Container(
                                            height: 35,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.greenColor,
                                              text: 'Submit',
                                              onPressed: () {
                                                //controller.addUser();
                                                controller.saveRoleAccess();
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text("Success"),
                                                      content: Text(
                                                          "Role updated successfully!"),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .popUntil((route) =>
                                                                    route
                                                                        .isFirst);
                                                            controller.update();
                                                          },
                                                          child: Text("OK"),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          )
                                        : Dimens.box0,
                                    Dimens.boxWidth20,
                                    Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        backgroundColor: ColorValues.redColor,
                                        text: "Cancel",
                                        onPressed: () {
                                          Get.offAndToNamed(
                                              Routes.masterDashboard);
                                        },
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
      ),
    );
  }
}
