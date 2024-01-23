import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/role_List/role_list_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';

class RoleListContentWeb extends GetView<RoleListController> {
  RoleListContentWeb({Key? key}) : super(key: key);
  final RoleListController controller = Get.find();

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
                      Get.offNamed(Routes.masterDashboard);
                    },
                    child: Text(
                      " / MASTERS",
                      style: Styles.greyLight14,
                    ),
                  ),
                  Text(
                    " / ROLE LIST ",
                    style: Styles.greyLight14,
                  ),
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
                        ? 'Close Create Role'
                        : 'Open Create Role',
                  );
                }),
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
                  Visibility(
                    visible: controller.isContainerVisible.value,
                    child: Container(
                      width: (Get.width * .3),
                      margin: EdgeInsets.only(left: 30, top: 20),
                      constraints:
                          BoxConstraints(maxHeight: 240, minHeight: 220),
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
                                        "Create Rolelist",
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
                                                    ? "Role added Successfully in the List."
                                                    : "Role updated Successfully in the List.",
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
                                                  title: 'Role Name ')),
                                          Container(
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2),
                                            height: 30,
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
                                            child: TextField(
                                              controller: controller
                                                  .rolelistNumberCtrlr,
                                                  focusNode: controller.rolenameFocus,
                                                  scrollController: controller.rolenameScroll,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              autofocus: false,
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 16.0,
                                                    height: 1.0,
                                                    color: Colors.black),
                                              ),
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
                                                        .isRoleListInvalid.value
                                                    ? OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                          color: ColorValues
                                                              .redColorDark,
                                                        ),
                                                      )
                                                    : InputBorder.none,
                                                errorBorder: controller
                                                        .isRoleListInvalid.value
                                                    ? OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                          color: ColorValues
                                                              .redColorDark,
                                                        ),
                                                      )
                                                    : null,
                                                errorText: controller
                                                        .isRoleListInvalid.value
                                                    ? "Required field"
                                                    : null,
                                              ),
                                              onChanged: (value) {
                                                if (value.trim().length > 1) {
                                                  controller.isRoleListInvalid
                                                      .value = false;
                                                } else {
                                                  controller.isRoleListInvalid
                                                      .value = true;
                                                }
                                              },
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
                                      backgroundColor: ColorValues.appRedColor,
                                      onPressed: () {
                                        controller.cleardata();
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
                                        ? CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .createRoleList()
                                                  .then((value) {
                                                print("CREATE");
                                                print("value,$value");
                                                if (value == true)
                                                  controller
                                                      .issuccessCreatemodulelist();
                                              });
                                            },
                                            text: 'Create Role ')
                                        : CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .updateRoleList(controller
                                                      .selectedItem?.id)
                                                  .then((value) {
                                                print("UPDATE");
                                                print("value,$value");
                                                if (value == true)
                                                  controller
                                                      .issuccessCreatemodulelist();
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
                  Dimens.boxWidth10,
                  Expanded(
                    child: Container(
                      width: Get.width * 7,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
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
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Roles List",
                                    style: Styles.blackBold16,
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 300,
                                    height: 40,
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
                                ],
                              ),
                            ),

                            // Row(
                            //   children: [
                            //     Spacer(),

                            //   ],
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Obx(
                                () => DataTable2(
                                  key: UniqueKey(),
                                  dataRowHeight: 50,
                                  columnSpacing: 10,
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 206, 229, 234)),
                                  columns: [
                                    DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          "Sr No",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    DataColumn2(
                                        // fixedWidth: 150,
                                        label: Text(
                                      "Name",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          'Action',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                  rows: List<DataRow>.generate(
                                    controller.roleList?.length ?? 0,
                                    (index) => DataRow(cells: [
                                      DataCell(Text((index + 1).toString())),
                                      DataCell(Text(controller
                                              .roleList?[index]?.name
                                              .toString() ??
                                          '')),
                                      DataCell(Row(
                                        children: [
                                          TableActionButton(
                                              color: ColorValues.editColor,
                                              icon: Icons.edit,
                                              message: 'Edit',
                                              onPress: () {
                                                controller.selectedItem =
                                                    controller
                                                        .roleList
                                                        ?.firstWhere((element) =>
                                                            "${element?.id}" ==
                                                            controller
                                                                .roleList?[
                                                                    index]
                                                                ?.id
                                                                .toString());

                                                controller.rolelistNumberCtrlr
                                                    .text = controller
                                                        .selectedItem?.name ??
                                                    '';
                                                controller.isContainerVisible
                                                    .value = true;
                                              })
                                          // : Container(),
                                          ,
                                          TableActionButton(
                                            color: ColorValues.deleteColor,
                                            icon: Icons.delete,
                                            message: 'Delete',
                                            onPress: () {
                                              controller.isDeleteDialog(
                                                  module_id: controller
                                                      .roleList?[index]?.id
                                                      .toString(),
                                                  module: controller
                                                      .roleList?[index]?.name);
                                            },
                                          ),
                                        ],
                                      )),
                                    ]),
                                  ),
                                ),
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
