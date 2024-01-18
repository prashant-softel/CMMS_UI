import 'package:cmms/app/app.dart';
import 'package:cmms/app/designation_List/designation_list_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';

class DesignationListContentWeb extends GetView<DesignationListController> {
  DesignationListContentWeb({Key? key}) : super(key: key);
  final DesignationListController controller = Get.find();

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
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      " / DESIGNATION LIST ",
                      style: Styles.greyLight14,
                    ),
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
                        ? 'Close Create Business'
                        : 'Open Create Business',
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
                      margin: EdgeInsets.only(left: 10, top: 15),
                      height: 230,
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
                                        "Create Designation",
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
                                                        ? "DesignationList added Successfully in the List."
                                                        : "DesignationList updated Successfully in the List."
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
                                                  title: ' Name ')),
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
                                              controller: controller.nameCtrlr,
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
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
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
                                                        borderSide: BorderSide(
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
                                                        borderSide: BorderSide(
                                                          color: ColorValues
                                                              .redColorDark,
                                                        ),
                                                      )
                                                    : null,
                                                errorText: controller
                                                        .isTitleInvalid.value
                                                    ? "Required field"
                                                    : null,
                                                // Set line height here
                                                hintStyle:
                                                    TextStyle(height: 2.0),
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
                                        ],
                                      ),
                                      Dimens.boxHeight10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: CustomRichText(
                                                  title: 'Description ')),
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
                                              controller:
                                                  controller.descriptionCtrlr,
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
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, right: 5),
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
                                                        borderSide: BorderSide(
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
                                                        borderSide: BorderSide(
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
                                                  .createDesignation()
                                                  .then((value) {
                                                print("CREATE");
                                                print("value,$value");
                                                if (value == true)
                                                  controller
                                                      .issuccessCreatemodulelist();
                                                // controller.toggleContainer();
                                              });
                                            },
                                            text: 'Create Designations ')
                                        : CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .updateDesignation(controller
                                                      .selectedItem?.id)
                                                  .then((value) {
                                                print("UPDATE");
                                                print("value,$value");
                                                if (value == true)
                                                  controller
                                                      .issuccessCreatemodulelist();
                                                controller.toggleContainer();
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
                      margin: EdgeInsets.only(right: 10, left: 10, top: 10),
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
                                    "Designation List",
                                    style: Styles.blackBold16,
                                  ),
                                  Spacer(),
                                  // Container(
                                  //   width: 300,
                                  //   height: 40,
                                  //   margin: Dimens.edgeInsets0_0_16_0,
                                  //   child: TextField(
                                  //     style: TextStyle(
                                  //       fontSize: 17.0,
                                  //       height: 1.0,
                                  //       color: Colors.black,
                                  //     ),
                                  //     onChanged: (value) =>
                                  //         controller.search(value),
                                  //     decoration: InputDecoration(
                                  //       enabledBorder: const OutlineInputBorder(
                                  //         borderSide: const BorderSide(
                                  //           color: Colors.grey,
                                  //           width: 0.0,
                                  //         ),
                                  //       ),
                                  //       focusedBorder: const OutlineInputBorder(
                                  //         borderSide: const BorderSide(
                                  //           color: Colors.grey,
                                  //           width: 0.0,
                                  //         ),
                                  //       ),
                                  //       contentPadding: Dimens.edgeInsets05_10,
                                  //       hintText: 'search'.tr,
                                  //       hintStyle: Styles.grey16,
                                  //     ),
                                  //   ),
                                  // ),
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
                                        // fixedWidth: 150,
                                        label: Text(
                                      "Designation Description",
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
                                    controller.designationList?.length ?? 0,
                                    (index) => DataRow(cells: [
                                      DataCell(Text((index + 1).toString())),
                                      DataCell(Text(controller
                                              .designationList?[index]?.name
                                              .toString() ??
                                          '')),
                                      DataCell(Text(controller
                                              .designationList?[index]
                                              ?.description ??
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
                                                        .designationList
                                                        ?.firstWhere((element) =>
                                                            "${element?.id}" ==
                                                            controller
                                                                .designationList?[
                                                                    index]
                                                                ?.id
                                                                .toString());

                                                controller.nameCtrlr.text =
                                                    controller.selectedItem
                                                            ?.name ??
                                                        '';
                                                controller.descriptionCtrlr
                                                    .text = controller
                                                        .selectedItem
                                                        ?.description ??
                                                    '';
                                                controller.isContainerVisible
                                                    .value = true;
                                                // int spvId = int.tryParse(
                                                //         designationList?.name ??
                                                //             "") ??
                                                //     0;
                                                // if (spvId != 0) {
                                                //   Get.toNamed(
                                                //       Routes.designationListScreen,
                                                //       arguments: {"spvId": spvId});
                                                // }
                                                // controller.selectedItem =
                                                //     controller.designationList.firstWhere(
                                                //         (element) =>
                                                //             "${element.id}" ==
                                                //             _permitTypeList[0]);
                                                // controller.selectedItem =
                                                //     controller.designationList.firstWhere(
                                                //         (element) =>
                                                //             "${element.id}" ==
                                                //             _permitTypeList[0]);
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
                                                      .designationList?[index]
                                                      ?.id
                                                      .toString(),
                                                  module: controller
                                                      .designationList?[index]
                                                      ?.name);
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


// import 'package:clipboard/clipboard.dart';
// import 'package:cmms/app/app.dart';
// import 'package:cmms/app/constant/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scrollable_table_view/scrollable_table_view.dart';
// import '../../widgets/custom_elevated_button.dart';
// import '../../widgets/custom_richtext.dart';
// import '../../widgets/custom_swich_toggle.dart';
// import '../designation_list_controller.dart';
// // import '../preventive_list_controller.dart';

// class DesignationListContentWeb extends GetView<DesignationListController> {
//   DesignationListContentWeb({Key? key}) : super(key: key);
//   final DesignationListController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Container(
//         color: Color.fromARGB(255, 234, 236, 238),
//         width: Get.width,
//         height: Get.height,
//         child: Column(
//           children: [
//             Container(
//               height: 45,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Color.fromARGB(255, 227, 224, 224),
//                   width: 1,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.home,
//                     color: ColorValues.greyLightColor,
//                   ),
//                   Text(
//                     "DASHBOARD",
//                     style: Styles.greyLight14,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: Text(" / MASTER", style: Styles.greyMediumLight12),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: Text(" / DESIGNATION LIST",
//                         style: Styles.greyMediumLight12),
//                   ),
//                   // Text(" / CREATE CHECKLIST NUMBER",
//                   //     style: Styles.greyMediumLight12)
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   varUserAccessModel.value.access_list!
//                               .where((e) => e.feature_id == 5 && e.add == 0)
//                               .length >
//                           0
//                       ? Container(
//                           width: (Get.width * .3),
//                           margin: EdgeInsets.only(left: 30, top: 30),
//                           height: Get.height / 2.7,
//                           child: Card(
//                             color: Color.fromARGB(255, 251, 252, 253),
//                             elevation: 10,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 10.0, right: 10, top: 10),
//                                   child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Create DesignationList",
//                                           style: Styles.blackBold16,
//                                         ),
//                                         SizedBox(
//                                           height: 30,
//                                         ),
//                                         Visibility(
//                                           visible: controller.isSuccess.value,
//                                           child: Center(
//                                             child: Wrap(
//                                               children: [
//                                                 Text(
//                                                   controller.selectedItem ==
//                                                           null
//                                                       ? "DesignationList added Successfully in the List."
//                                                       : "DesignationList updated Successfully in the List.",
//                                                   style: TextStyle(
//                                                       fontSize: 16,
//                                                       color: Color.fromARGB(
//                                                           255, 24, 243, 123)),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 5,
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Expanded(
//                                               child: CustomRichText(
//                                                   title: 'Name: '),
//                                             ),
//                                             SizedBox(
//                                               width: 70,
//                                             ),
//                                             Expanded(
//                                               child: Container(
//                                                 width: (MediaQuery.of(context)
//                                                             .size
//                                                             .width *
//                                                         .2) -
//                                                     30,
//                                                 decoration: BoxDecoration(
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                       color: Colors.black26,
//                                                       offset: const Offset(
//                                                         5.0,
//                                                         5.0,
//                                                       ),
//                                                       blurRadius: 5.0,
//                                                       spreadRadius: 1.0,
//                                                     ),
//                                                     BoxShadow(
//                                                       color: ColorValues
//                                                           .whiteColor,
//                                                       offset: const Offset(
//                                                           0.0, 0.0),
//                                                       blurRadius: 0.0,
//                                                       spreadRadius: 0.0,
//                                                     ),
//                                                   ],
//                                                   color: ColorValues.whiteColor,
//                                                   borderRadius:
//                                                       BorderRadius.circular(5),
//                                                 ),
//                                                 child: Obx(
//                                                   () => TextField(
//                                                     controller:
//                                                         controller.nameCtrlr,
//                                                     keyboardType:
//                                                         TextInputType.multiline,
//                                                     maxLines: 1,
//                                                     autofocus: false,
//                                                     decoration: InputDecoration(
//                                                       fillColor: ColorValues
//                                                           .whiteColor,
//                                                       filled: true,
//                                                       contentPadding: Dimens
//                                                           .edgeInsets05_10,
//                                                       border: InputBorder.none,
//                                                       enabledBorder:
//                                                           OutlineInputBorder(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(10.0),
//                                                         borderSide: BorderSide(
//                                                             color: Colors
//                                                                 .transparent),
//                                                       ),
//                                                       focusedBorder:
//                                                           OutlineInputBorder(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(10.0),
//                                                         borderSide: BorderSide(
//                                                             color: Colors
//                                                                 .transparent),
//                                                       ),
//                                                       focusedErrorBorder: controller
//                                                               .isTitleInvalid
//                                                               .value
//                                                           ? OutlineInputBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           5),
//                                                               borderSide:
//                                                                   BorderSide(
//                                                                 color: ColorValues
//                                                                     .redColorDark,
//                                                               ),
//                                                             )
//                                                           : InputBorder.none,
//                                                       errorBorder: controller
//                                                               .isTitleInvalid
//                                                               .value
//                                                           ? OutlineInputBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           5),
//                                                               borderSide:
//                                                                   BorderSide(
//                                                                 color: ColorValues
//                                                                     .redColorDark,
//                                                               ),
//                                                             )
//                                                           : null,
//                                                       errorText: controller
//                                                               .isTitleInvalid
//                                                               .value
//                                                           ? "Required field"
//                                                           : null,
//                                                     ),
//                                                     onChanged: (value) {
//                                                       if (value.trim().length >
//                                                           1) {
//                                                         controller
//                                                             .isTitleInvalid
//                                                             .value = false;
//                                                       } else {
//                                                         controller
//                                                             .isTitleInvalid
//                                                             .value = true;
//                                                       }
//                                                     },
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Expanded(
//                                               child: CustomRichText(
//                                                   title: 'Description: '),
//                                             ),
//                                             SizedBox(
//                                               width: 70,
//                                             ),
//                                             Expanded(
//                                               child: Container(
//                                                   width: (MediaQuery.of(context)
//                                                               .size
//                                                               .width *
//                                                           .2) -
//                                                       30,
//                                                   decoration: BoxDecoration(
//                                                     boxShadow: [
//                                                       BoxShadow(
//                                                         color: Colors.black26,
//                                                         offset: const Offset(
//                                                           5.0,
//                                                           5.0,
//                                                         ),
//                                                         blurRadius: 5.0,
//                                                         spreadRadius: 1.0,
//                                                       ),
//                                                       BoxShadow(
//                                                         color: ColorValues
//                                                             .whiteColor,
//                                                         offset: const Offset(
//                                                             0.0, 0.0),
//                                                         blurRadius: 0.0,
//                                                         spreadRadius: 0.0,
//                                                       ),
//                                                     ],
//                                                     color:
//                                                         ColorValues.whiteColor,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                   ),
//                                                   child: Obx(
//                                                     () => TextField(
//                                                       controller: controller
//                                                           .descriptionCtrlr,
//                                                       keyboardType:
//                                                           TextInputType
//                                                               .multiline,
//                                                       maxLines: 1,
//                                                       autofocus: false,
//                                                       decoration:
//                                                           InputDecoration(
//                                                         fillColor: ColorValues
//                                                             .whiteColor,
//                                                         filled: true,
//                                                         contentPadding: Dimens
//                                                             .edgeInsets05_10,
//                                                         border:
//                                                             InputBorder.none,
//                                                         enabledBorder:
//                                                             OutlineInputBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                           borderSide: BorderSide(
//                                                               color: Colors
//                                                                   .transparent),
//                                                         ),
//                                                         focusedBorder:
//                                                             OutlineInputBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10.0),
//                                                           borderSide: BorderSide(
//                                                               color: Colors
//                                                                   .transparent),
//                                                         ),
//                                                         focusedErrorBorder: controller
//                                                                 .isDescriptionInvalid
//                                                                 .value
//                                                             ? OutlineInputBorder(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             5),
//                                                                 borderSide:
//                                                                     BorderSide(
//                                                                   color: ColorValues
//                                                                       .redColorDark,
//                                                                 ),
//                                                               )
//                                                             : InputBorder.none,
//                                                         errorBorder: controller
//                                                                 .isDescriptionInvalid
//                                                                 .value
//                                                             ? OutlineInputBorder(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             5),
//                                                                 borderSide:
//                                                                     BorderSide(
//                                                                   color: ColorValues
//                                                                       .redColorDark,
//                                                                 ),
//                                                               )
//                                                             : null,
//                                                         errorText: controller
//                                                                 .isDescriptionInvalid
//                                                                 .value
//                                                             ? "Required field"
//                                                             : null,
//                                                       ),
//                                                       onChanged: (value) {
//                                                         if (value
//                                                                 .trim()
//                                                                 .length >
//                                                             1) {
//                                                           controller
//                                                               .isDescriptionInvalid
//                                                               .value = false;
//                                                         } else {
//                                                           controller
//                                                               .isDescriptionInvalid
//                                                               .value = true;
//                                                         }
//                                                       },
//                                                     ),
//                                                   )),
//                                             ),
//                                           ],
//                                         ),
//                                       ]),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                         height: 40,
//                                         width: (Get.width * .1),
//                                         child: CustomElevatedButton(
//                                             backgroundColor:
//                                                 ColorValues.appRedColor,
//                                             onPressed: () {
//                                               controller.cleardata();
//                                             },
//                                             text: 'Cancel')),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Container(
//                                         height: 40,
//                                         width: (Get.width * .2) - 70,
//                                         child: controller.selectedItem == null
//                                             ? CustomElevatedButton(
//                                                 backgroundColor: ColorValues
//                                                     .appDarkBlueColor,
//                                                 onPressed: () {
//                                                   controller
//                                                       .createDesignation()
//                                                       .then((value) {
//                                                     print("value,$value");
//                                                     if (value == true)
//                                                       controller
//                                                           .issuccessCreatemodulelist();
//                                                   });
//                                                 },
//                                                 text: 'Create Designations')
//                                             : CustomElevatedButton(
//                                                 backgroundColor: ColorValues
//                                                     .appDarkBlueColor,
//                                                 onPressed: () {
//                                                   controller
//                                                       .updateDesignation(
//                                                           controller
//                                                               .selectedItem?.id)
//                                                       .then((value) {
//                                                     print("value,$value");
//                                                     if (value == true)
//                                                       controller
//                                                           .issuccessCreatemodulelist();
//                                                   });
//                                                 },
//                                                 text: 'Update')),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       : Container(),
//                   varUserAccessModel.value.access_list!
//                               .where((e) => e.feature_id == 5 && e.view == 0)
//                               .length >
//                           0
//                       ? Expanded(
//                           child: Container(
//                             width: Get.width * 7,
//                             margin: EdgeInsets.only(left: 10, top: 30),
//                             height: Get.height,
//                             child: Card(
//                               color: Color.fromARGB(255, 251, 252, 253),
//                               elevation: 10,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: Text(
//                                       "Designation List",
//                                       style: Styles.blackBold16,
//                                     ),
//                                   ),
//                                   Divider(
//                                     color: ColorValues.greyLightColour,
//                                   ),
//                                   Row(
//                                     children: [
//                                       // Container(
//                                       //   height: 35,
//                                       //   margin: EdgeInsets.only(left: 10),
//                                       //   child: CustomElevatedButton(
//                                       //       backgroundColor:
//                                       //           ColorValues.appLightBlueColor,
//                                       //       onPressed: () {
//                                       //         FlutterClipboard.copy(controller
//                                       //                 .designationList![0]
//                                       //                 .toString())
//                                       //             .then((value) {
//                                       //           print("copy data");
//                                       //         });
//                                       //       },
//                                       //       text: 'Copy'),
//                                       // ),
//                                       // Container(
//                                       //   height: 35,
//                                       //   margin: EdgeInsets.only(left: 10),
//                                       //   child: CustomElevatedButton(
//                                       //       backgroundColor:
//                                       //           ColorValues.appLightBlueColor,
//                                       //       onPressed: () {},
//                                       //       text: 'Excel'),
//                                       // ),
//                                       // Container(
//                                       //   height: 35,
//                                       //   margin: EdgeInsets.only(left: 10),
//                                       //   child: CustomElevatedButton(
//                                       //       backgroundColor:
//                                       //           ColorValues.appLightBlueColor,
//                                       //       onPressed: () {},
//                                       //       text: 'PDF'),
//                                       // ),
//                                       // Container(
//                                       //   height: 35,
//                                       //   margin: EdgeInsets.only(left: 10),
//                                       //   child: CustomElevatedButton(
//                                       //     backgroundColor:
//                                       //         ColorValues.appLightBlueColor,
//                                       //     onPressed: () {},
//                                       //     text: 'columnVisibility'.tr,
//                                       //   ),
//                                       // )
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   controller.designationList!.isEmpty
//                                       ? Expanded(
//                                           child: ScrollableTableView(
//                                             columns: [
//                                               "Id",
//                                               "Designation Name",
//                                               "Designation Description",
//                                               "Action"
//                                             ].map((column) {
//                                               return TableViewColumn(
//                                                 label: column,
//                                                 minWidth: Get.width * 0.12,
//                                               );
//                                             }).toList(),
//                                             rows: [
//                                               ...List.generate(
//                                                 controller.designationList
//                                                         ?.length ??
//                                                     0,
//                                                 (index) {
//                                                   return ['', '', '', ''];
//                                                 },
//                                               ),
//                                             ].map((record) {
//                                               return TableViewRow(
//                                                 // height: 60,
//                                                 cells: record.map((value) {
//                                                   return TableViewCell(
//                                                     child: Text(value),
//                                                   );
//                                                 }).toList(),
//                                               );
//                                             }).toList(),
//                                           ),
//                                         )
//                                       : Expanded(
//                                           child: ScrollableTableView(
//                                             paginationController:
//                                                 controller.paginationController,
//                                             columns: [
//                                               "Id",
//                                               "Designation Name",
//                                               "Designation Description",
//                                               "Action"
//                                             ].map((column) {
//                                               return TableViewColumn(
//                                                 minWidth: Get.width * 0.10,
//                                                 label: column,
//                                               );
//                                             }).toList(),
//                                             rows: //
//                                                 [
//                                               ...List.generate(
//                                                 controller.designationList
//                                                         ?.length ??
//                                                     0,
//                                                 (index) {
//                                                   var roleListDetails =
//                                                       controller
//                                                               .designationList?[
//                                                           index];
//                                                   return [
//                                                     '${roleListDetails?.id}',
//                                                     '${roleListDetails?.name}',
//                                                     '${roleListDetails?.description}',
//                                                     'Action'
//                                                   ];
//                                                 },
//                                               ),
//                                             ].map((_designationList) {
//                                               return TableViewRow(
//                                                   height: 45,
//                                                   cells: _designationList
//                                                       .map((value) {
//                                                     return TableViewCell(
//                                                       child: (value == 'No')
//                                                           ? CustomSwitchTroggle(
//                                                               value:
//                                                                   value == 'No'
//                                                                       ? true
//                                                                       : false,
//                                                               onChanged:
//                                                                   (value) {},
//                                                             )
//                                                           : (value == "Action")
//                                                               ? Row(
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .center,
//                                                                   children: [
//                                                                       // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.edit == 1).length >
//                                                                       //     0
//                                                                       //     ?
//                                                                       TableActionButton(
//                                                                         color: ColorValues
//                                                                             .editColor,
//                                                                         icon: Icons
//                                                                             .edit,
//                                                                         message:
//                                                                             'Edit',
//                                                                         onPress:
//                                                                             () {
//                                                                           controller.selectedItem = controller.designationList!.firstWhere((element) =>
//                                                                               "${element?.id}" ==
//                                                                               _designationList[0]);
//                                                                           controller
//                                                                               .nameCtrlr
//                                                                               .text = controller
//                                                                                   .selectedItem?.name ??
//                                                                               '';
//                                                                           controller
//                                                                               .descriptionCtrlr
//                                                                               .text = controller
//                                                                                   .selectedItem?.description ??
//                                                                               '';
//                                                                         },
//                                                                       ),
//                                                                       //     : Container(),
//                                                                       // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.delete == 1).length >
//                                                                       //     0
//                                                                       //     ?
//                                                                       TableActionButton(
//                                                                         color: ColorValues
//                                                                             .deleteColor,
//                                                                         icon: Icons
//                                                                             .delete,
//                                                                         message:
//                                                                             'Delete',
//                                                                         onPress:
//                                                                             () {
//                                                                           print(
//                                                                               _designationList[0]);
//                                                                           controller.isDeleteDialog(
//                                                                               module_id: _designationList[0],
//                                                                               module: _designationList[1]);
//                                                                         },
//                                                                       )
//                                                                       // : Container()
//                                                                     ])
//                                                               : Align(
//                                                                   // Align the text in the center
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .center,
//                                                                   child: Text(
//                                                                       value),
//                                                                 ),
//                                                     );
//                                                   }).toList());
//                                             }).toList(),
//                                           ),
//                                         ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 25),
//                                     child: ValueListenableBuilder(
//                                         valueListenable:
//                                             controller.paginationController,
//                                         builder: (context, value, child) {
//                                           return Row(children: [
//                                             Text(
//                                                 "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
//                                             Row(children: [
//                                               IconButton(
//                                                 onPressed: controller
//                                                             .paginationController
//                                                             .currentPage <=
//                                                         1
//                                                     ? null
//                                                     : () {
//                                                         controller
//                                                             .paginationController
//                                                             .previous();
//                                                       },
//                                                 iconSize: 20,
//                                                 splashRadius: 20,
//                                                 icon: Icon(
//                                                   Icons
//                                                       .arrow_back_ios_new_rounded,
//                                                   color: controller
//                                                               .paginationController
//                                                               .currentPage <=
//                                                           1
//                                                       ? Colors.black26
//                                                       : Theme.of(context)
//                                                           .primaryColor,
//                                                 ),
//                                               ),
//                                               IconButton(
//                                                 onPressed: controller
//                                                             .paginationController
//                                                             .currentPage >=
//                                                         controller
//                                                             .paginationController
//                                                             .pageCount
//                                                     ? null
//                                                     : () {
//                                                         controller
//                                                             .paginationController
//                                                             .next();
//                                                       },
//                                                 iconSize: 20,
//                                                 splashRadius: 20,
//                                                 icon: Icon(
//                                                   Icons
//                                                       .arrow_forward_ios_rounded,
//                                                   color: controller
//                                                               .paginationController
//                                                               .currentPage >=
//                                                           controller
//                                                               .paginationController
//                                                               .pageCount
//                                                       ? Colors.black26
//                                                       : Theme.of(context)
//                                                           .primaryColor,
//                                                 ),
//                                               ),
//                                             ]),
//                                           ]);
//                                         }),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       : Container()
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
