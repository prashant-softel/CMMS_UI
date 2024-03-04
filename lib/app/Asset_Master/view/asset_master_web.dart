import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../asset_master_Controller.dart';
// import '../mrs_Details_Controller.dart';
// import '../preventive_list_controller.dart';

class AssetMasterWeb extends GetView<AssetMasterController> {
  AssetMasterWeb({Key? key}) : super(key: key);
  final AssetMasterController controller = Get.find();

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
                        Get.offNamed(Routes.stockManagementDashboardScreen);
                      },
                      child: Text(" / STOCK MANAGEMENT",
                          style: Styles.greyLight14),
                    ),
                    Text(" / ASSET MASTER LIST", style: Styles.greyLight14),
                    // Text(" / CREATE CHECKLIST NUMBER",
                    //     style: Styles.greyMediumLight12)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // varUserAccessModel.value.access_list!
                    //     .where((e) => e.feature_id == 5 && e.add == 1)
                    //     .length >
                    //     0
                    //     ? Container(
                    //   width: (Get.width * .3),
                    //   margin: EdgeInsets.only(left: 30, top: 30),
                    //   height: Get.height/1.85,
                    //   child: Card(
                    //     color: Color.fromARGB(255, 251, 252, 253),
                    //     elevation: 10,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //     ),
                    //     child: Column(
                    //       children: [
                    //         // Text(
                    //         //     '${varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.add == 1).length}'),
                    //         Padding(
                    //           padding: const EdgeInsets.only(
                    //               left: 10.0, right: 10, top: 10),
                    //           child: Column(
                    //               crossAxisAlignment:
                    //               CrossAxisAlignment.start,
                    //               children: [
                    //                 Text(
                    //                   "Create Modulelist",
                    //                   style: Styles.blackBold16,
                    //                 ),
                    //                 SizedBox(
                    //                   height: 30,
                    //                 ),
                    //                 Visibility(
                    //                   visible: controller.isSuccess.value,
                    //                   child: Center(
                    //                     child: Wrap(
                    //                       children: [
                    //                         Text(
                    //                           controller.selectedItem ==
                    //                               null
                    //                               ? "ModuleList added Successfully in the List."
                    //                               : "ModuleList updated Successfully in the List.",
                    //                           style: TextStyle(
                    //                               fontSize: 16,
                    //                               color: Color.fromARGB(
                    //                                   255, 24, 243, 123)),
                    //                         ),
                    //                         SizedBox(
                    //                           height: 5,
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment:
                    //                   MainAxisAlignment.spaceBetween,
                    //                   children: [
                    //                     CustomRichText(title: 'Module Name: '),
                    //                     SizedBox(
                    //                       width: 70,
                    //                     ),
                    //                     Expanded(
                    //                       child: Container(
                    //                           width: (MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                               .2) -
                    //                               30,
                    //                           decoration: BoxDecoration(
                    //                             boxShadow: [
                    //                               BoxShadow(
                    //                                 color: Colors.black26,
                    //                                 offset: const Offset(
                    //                                   5.0,
                    //                                   5.0,
                    //                                 ),
                    //                                 blurRadius: 5.0,
                    //                                 spreadRadius: 1.0,
                    //                               ),
                    //                               BoxShadow(
                    //                                 color: ColorValues
                    //                                     .whiteColor,
                    //                                 offset: const Offset(
                    //                                     0.0, 0.0),
                    //                                 blurRadius: 0.0,
                    //                                 spreadRadius: 0.0,
                    //                               ),
                    //                             ],
                    //                             color:
                    //                             ColorValues.whiteColor,
                    //                             borderRadius:
                    //                             BorderRadius.circular(
                    //                                 5),
                    //                           ),
                    //                           child: LoginCustomTextfield(
                    //                             textController: controller
                    //                                 .modulelistNumberCtrlr,
                    //                           )),
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 SizedBox(
                    //                   height: 10,
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment:
                    //                   MainAxisAlignment.spaceBetween,
                    //                   children: [
                    //                     CustomRichText(title: 'Feature Name: '),
                    //                     SizedBox(
                    //                       width: 70,
                    //                     ),
                    //                     Expanded(
                    //                       child: Container(
                    //                           width: (MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                               .2) -
                    //                               30,
                    //                           decoration: BoxDecoration(
                    //                             boxShadow: [
                    //                               BoxShadow(
                    //                                 color: Colors.black26,
                    //                                 offset: const Offset(
                    //                                   5.0,
                    //                                   5.0,
                    //                                 ),
                    //                                 blurRadius: 5.0,
                    //                                 spreadRadius: 1.0,
                    //                               ),
                    //                               BoxShadow(
                    //                                 color: ColorValues
                    //                                     .whiteColor,
                    //                                 offset: const Offset(
                    //                                     0.0, 0.0),
                    //                                 blurRadius: 0.0,
                    //                                 spreadRadius: 0.0,
                    //                               ),
                    //                             ],
                    //                             color:
                    //                             ColorValues.whiteColor,
                    //                             borderRadius:
                    //                             BorderRadius.circular(
                    //                                 5),
                    //                           ),
                    //                           child: LoginCustomTextfield(
                    //                             textController: controller
                    //                                 .featureCtrlr,
                    //                           )),
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 SizedBox(
                    //                   height: 30,
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                   children: [
                    //                     Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         CustomRichText(title:"Add"),
                    //                         // SizedBox(width:12),
                    //                         Row(
                    //                           mainAxisAlignment: MainAxisAlignment.center,
                    //                           children: [
                    //                             // Text("No"),
                    //                             CustomSwitchTroggle(
                    //                                 value:
                    //                                 controller.isToggleOn.value,
                    //                                 onChanged: (value) {
                    //                                   controller.toggle();
                    //                                 }),
                    //
                    //                             // Text("Yes"),
                    //                           ],
                    //                         ),
                    //
                    //                       ],
                    //                     ),
                    //
                    //                     Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                       children: [
                    //                         CustomRichText(title:"Edit"),
                    //                         SizedBox(width:12),
                    //                         Row(
                    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                           children: [
                    //                             // Text("No"),
                    //                             CustomSwitchTroggle(
                    //                                 value:
                    //                                 controller.isToggle1On.value,
                    //                                 onChanged: (value) {
                    //                                   controller.toggle1();
                    //                                 }),
                    //
                    //                             // Text("Yes"),
                    //                           ],
                    //                         ),
                    //
                    //                       ],
                    //                     ),
                    //                     Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                       children: [
                    //                         CustomRichText(title:"Delete"),
                    //                         SizedBox(width:12),
                    //                         Row(
                    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //
                    //                           children: [
                    //                             // Text("No"),
                    //                             // SizedBox(width:2),
                    //                             CustomSwitchTroggle(
                    //                                 value:
                    //                                 controller.isToggle2On.value,
                    //                                 onChanged: (value) {
                    //                                   controller.toggle2();
                    //                                 }),
                    //                             // SizedBox(width:2),
                    //
                    //                             // Text("Yes"),
                    //                           ],
                    //                         ),
                    //
                    //                       ],
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 SizedBox(
                    //                   height: 30,
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                   children: [
                    //                     Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         CustomRichText(title:"View"),
                    //                         // SizedBox(width:12),
                    //                         Row(
                    //                           mainAxisAlignment: MainAxisAlignment.center,
                    //                           children: [
                    //                             // Text("No"),
                    //                             CustomSwitchTroggle(
                    //                                 value:
                    //                                 controller.isToggle3On.value,
                    //                                 onChanged: (value) {
                    //                                   controller.toggle3();
                    //                                 }),
                    //
                    //                             // Text("Yes"),
                    //                           ],
                    //                         ),
                    //
                    //                       ],
                    //                     ),
                    //
                    //                     Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                       children: [
                    //                         CustomRichText(title:"Approve"),
                    //                         SizedBox(width:12),
                    //                         Row(
                    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                           children: [
                    //                             // Text("No"),
                    //                             CustomSwitchTroggle(
                    //                                 value:
                    //                                 controller.isToggle4On.value,
                    //                                 onChanged: (value) {
                    //                                   controller.toggle4();
                    //                                 }),
                    //
                    //                             // Text("Yes"),
                    //                           ],
                    //                         ),
                    //
                    //                       ],
                    //                     ),
                    //                     Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                       children: [
                    //                         CustomRichText(title:"Issue"),
                    //                         SizedBox(width:12),
                    //                         Row(
                    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //
                    //                           children: [
                    //                             // Text("No"),
                    //                             // SizedBox(width:2),
                    //                             CustomSwitchTroggle(
                    //                                 value:
                    //                                 controller.isToggle5On.value,
                    //                                 onChanged: (value) {
                    //                                   controller.toggle5();
                    //                                 }),
                    //                             // SizedBox(width:2),
                    //
                    //                             // Text("Yes"),
                    //                           ],
                    //                         ),
                    //
                    //                       ],
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 SizedBox(
                    //                   height: 30,
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                   children: [
                    //                     Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                       children: [
                    //                         CustomRichText(title:"SelfView"),
                    //                         SizedBox(width:12),
                    //                         Row(
                    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //
                    //                           children: [
                    //                             // Text("No"),
                    //                             // SizedBox(width:2),
                    //                             CustomSwitchTroggle(
                    //                                 value:
                    //                                 controller.isToggle6On.value,
                    //                                 onChanged: (value) {
                    //                                   controller.toggle6();
                    //                                 }),
                    //                             // SizedBox(width:2),
                    //
                    //                             // Text("Yes"),
                    //                           ],
                    //                         ),
                    //
                    //                       ],
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 SizedBox(
                    //                   height: 30,
                    //                 ),
                    //               ]),
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Container(
                    //                 height: 40,
                    //                 width: (Get.width * .1),
                    //                 child: CustomElevatedButton(
                    //                     backgroundColor:
                    //                     ColorValues.appRedColor,
                    //                     onPressed: () {},
                    //                     text: 'Cancel')),
                    //             SizedBox(
                    //               width: 10,
                    //             ),
                    //             Container(
                    //                 height: 40,
                    //                 width: (Get.width * .2) - 70,
                    //                 child: controller.selectedItem == null
                    //                     ? CustomElevatedButton(
                    //                     backgroundColor: ColorValues
                    //                         .appDarkBlueColor,
                    //                     onPressed: () {
                    //                       controller
                    //                           .createModuleListNumber()
                    //                           .then((value) {
                    //                         print("value,$value");
                    //                         if (value == true)
                    //                           controller
                    //                               .issuccessCreatemodulelist();
                    //                       });
                    //                     },
                    //                     text: 'Create Module List')
                    //                     : CustomElevatedButton(
                    //                     backgroundColor: ColorValues
                    //                         .appDarkBlueColor,
                    //                     onPressed: () {
                    //                       controller
                    //                           .updateModulelistNumber(
                    //                           controller
                    //                               .selectedItem?.)
                    //                           .then((value) {
                    //                         print("value,$value");
                    //                         if (value == true)
                    //                           controller
                    //                               .issuccessCreatemodulelist();
                    //                       });
                    //                     },
                    //                     text: 'Update')),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                    //     : Container(),
                    // varUserAccessModel.value.access_list!
                    //             .where((e) => e.feature_id == 5 && e.view == 0)
                    //             .length >
                    //         0
                    //     ?
                    Expanded(
                      child: Container(
                        width: Get.width * 7,
                        margin: EdgeInsets.only(left: 10, top: 15),
                        height: Get.height / 1.1,
                        child: Card(
                          color: Color.fromARGB(255, 251, 252, 253),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomAppBar(
                                title: 'Material Master',
                                action: Row(children: [
                                  Dimens.boxWidth10,
                                  Container(
                                    width: 300,
                                    height: 40,
                                    margin: Dimens.edgeInsets0_0_16_0,
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
                                  ActionButton(
                                    icon: Icons.add,
                                    label: 'Add Material'.tr,
                                    onPressed: () {},
                                    color: ColorValues.addNewColor,
                                  ),
                                  Dimens.boxWidth10,
                                ]),
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
                                  //                 .moduleList![0]
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
                                  // )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              controller.moduleList!.isEmpty
                                  ? Container(
                                      height: Get.height / 1.85,
                                      margin: Dimens.edgeInsets20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorValues
                                              .lightGreyColorWithOpacity35,
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorValues
                                                .appBlueBackgroundColor,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: ScrollableTableView(
                                        columns: [
                                          "MDM Code",
                                          "Material Name",
                                          "AC/DC",
                                          "Material Type",
                                          "Material Category ",
                                          "Min. Required Qty ",
                                          "Min. Reorder Qty ",
                                          "Description",
                                          "Unit Of Measurement",
                                          "Approval Required",
                                          "Action"
                                        ].map((column) {
                                          if (column == "Action") {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width *
                                                  0.08, // Set the desired width for the "Action" column
                                            );
                                          } else if (column == "Description" ||
                                              column == "Material Name") {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width *
                                                  0.25, // Set the desired width for the "Description" column
                                            );
                                          } else {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width * 0.16,
                                            );
                                          }
                                        }).toList(),
                                        rows: [
                                          ...List.generate(
                                            controller.moduleList?.length ?? 0,
                                            (index) {
                                              return [
                                                '',
                                                '',
                                                '',
                                                '',
                                                '',
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
                                  : Container(
                                      height: Get.height / 2.08,
                                      margin: Dimens.edgeInsets20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorValues
                                              .lightGreyColorWithOpacity35,
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorValues
                                                .appBlueBackgroundColor,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: ScrollableTableView(
                                        paginationController:
                                            controller.paginationController,
                                        columns: [
                                          "MDM Code",
                                          "Material Name",
                                          "AC/DC",
                                          "Material Type",
                                          "Material Category ",
                                          "Min. Required Qty ",
                                          "Min. Reorder Qty ",
                                          "Description",
                                          "Unit Of Measurement",
                                          "Approval Required",
                                          "Action"
                                        ].map((column) {
                                          if (column == "Action") {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width *
                                                  0.12, // Set the desired width for the "Action" column
                                            );
                                          } else if (column == "Description" ||
                                              column == "Material Name") {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width *
                                                  0.25, // Set the desired width for the "Description" column
                                            );
                                          } else {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width * 0.16,
                                            );
                                          }
                                        }).toList(),
                                        rows: //
                                            [
                                          ...List.generate(
                                            controller.moduleList?.length ?? 0,
                                            (index) {
                                              var moduleListDetails =
                                                  controller.moduleList?[index];
                                              return [
                                                '${moduleListDetails?.asset_code}',
                                                '${moduleListDetails?.asset_name}',
                                                'AC',
                                                '${moduleListDetails?.asset_type}',
                                                '${moduleListDetails?.cat_name}',
                                                '2',
                                                '2',
                                                '${moduleListDetails?.description}',
                                                '${moduleListDetails?.measurement}',
                                                '${moduleListDetails?.approval_required}',
                                                "Action"
                                              ];
                                            },
                                          ),
                                        ].map((_moduleList) {
                                          return TableViewRow(
                                              height: 46,
                                              cells: _moduleList.map((value) {
                                                return TableViewCell(
                                                    child: Column(children: [
                                                  Divider(
                                                    color: ColorValues
                                                        .greyLightColour,
                                                  ),
                                                  // (value == 'No')
                                                  //     ? CustomSwitchTroggle(
                                                  //   value: value ==
                                                  //       'No'
                                                  //       ? true
                                                  //       : false,
                                                  //   onChanged:
                                                  //       (value) {},
                                                  // )
                                                  //     :
                                                  (value == "Action")
                                                      ? Row(children: [
                                                          // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.edit == 1).length >
                                                          //     0
                                                          //     ?
                                                          TableActionButton(
                                                            color: ColorValues
                                                                .appLightBlueColor,
                                                            icon: Icons.edit,
                                                            message: 'Edit',
                                                            onPress: () {},
                                                          ),
                                                          //     : Container(),
                                                          // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.delete == 1).length >
                                                          //     0
                                                          //     ?
                                                          TableActionButton(
                                                            color: ColorValues
                                                                .appRedColor,
                                                            icon: Icons.delete,
                                                            message: 'Delete',
                                                            onPress: () {
                                                              print(_moduleList[
                                                                  0]);
                                                              controller.isDeleteDialog(
                                                                  module_id:
                                                                      _moduleList[
                                                                          0],
                                                                  module:
                                                                      _moduleList[
                                                                          1]);
                                                            },
                                                          )
                                                          // : Container()
                                                        ])
                                                      : Text(
                                                          value,
                                                        ),
                                                ]));
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
                    //  : Container()
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
