import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../type_of_obs_controller.dart';
// import '../preventive_list_controller.dart';

class TypeOfObsWeb extends GetView<TypeOfObsController> {
  TypeOfObsWeb({Key? key}) : super(key: key);
  final TypeOfObsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Obx(
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
                    Text(" / TYPE OF OBSERVATION", style: Styles.greyLight14),
                    // Text(" / CREATE CHECKLIST NUMBER",
                    //     style: Styles.greyMediumLight12)
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 10, top: 10),
              //   child: ElevatedButton(
              //     style: Styles.navyBlueElevatedButtonStyle,
              //     onPressed: () {
              //       controller.toggleContainer();
              //     },
              //     child: Obx(() {
              //       return Text(
              //         controller.isContainerVisible.value
              //             ? 'Close  Type Of Observation'
              //             : 'Open  Type Of Observation',
              //       );
              //     }),
              //   ),
              // ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // varUserAccessModel.value.access_list!
                    //             .where((e) => e.feature_id == 5 && e.add == 0)
                    //             .length >
                    //         0
                    // ?
                    Visibility(
                      visible: controller.isContainerVisible.value,
                      child: Container(
                        width: (Get.width * .3),
                        margin: EdgeInsets.only(left: 15, top: 20),
                        height: Get.height / 2.5,
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
                                        "Create Type Of Observation",
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
                                                    ? "Type Of Observation added Successfully in the List."
                                                    : "Type Of Observation updated Successfully in the List.",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 24, 243, 123)),
                                              ),
                                              SizedBox(
                                                height: 15,
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
                                                title:
                                                    'Observation Name: '),
                                          ),
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
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  height: 1.0,
                                                  color: Colors.black),
                                              controller: controller.titleCtrlr,
                                              focusNode: controller.rnameFocus,
                                              scrollController:
                                                  controller.rnameScroll,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              autofocus: false,
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
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .deny(
                                                  RegExp('[\'^]'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: CustomRichText(
                                                title: 'Description: '),
                                          ),
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
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  height: 1.0,
                                                  color: Colors.black),
                                              controller:
                                                  controller.descriptionCtrlr,
                                              focusNode: controller.rdescFocus,
                                              scrollController:
                                                  controller.rdescScroll,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              autofocus: false,
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
                                        height: 15,
                                      ),
                                      Row(
                                          // children: [
                                          // Expanded(
                                          //   child: CustomRichText(
                                          //       title: 'Status: '),
                                          // ),
                                          //   SizedBox(
                                          //     width: 4,
                                          //   ),
                                          //   // Checkbox(
                                          //   //   value: controller
                                          //   //       .isCheckedRequire.value,
                                          //   //   onChanged: (bool? value) {
                                          //   //     controller
                                          //   //         .requiretoggleCheckbox();
                                          //   //     print(
                                          //   //         'Checkbox:${controller.isCheckedRequire.value}');
                                          //   //   },
                                          //   // ),
                                          // ],
                                          ),
                                      SizedBox(
                                        height: 15,
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
                                            controller.cleardata();
                                            controller.toggleContainer();
                                          },
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
                                                    .createTypeOfObservationList()
                                                    .then((value) {
                                                  print("value,$value");
                                                  if (value == true)
                                                    controller
                                                        .issuccessCreatemodulelist();
                                                });
                                              },
                                              text: 'Create Type Of Obs')
                                          : CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appDarkBlueColor,
                                              onPressed: () {
                                                controller
                                                    .updatetypeOfObs(controller
                                                        .selectedItem?.id)
                                                    .then((value) {
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
                    // : Container(),
                    // varUserAccessModel.value.access_list!
                    //             .where((e) => e.feature_id == 5 && e.view == 1)
                    //             .length >
                    //         0
                    //     ?
                    Expanded(
                      child: Container(
                        width: Get.width * 7,
                        margin: EdgeInsets.only(left: 10, top: 20),
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
                                  "Type Of Observation List",
                                  style: Styles.blackBold16,
                                ),
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
                                  //                 .TypeOfObsList![0]
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
                              controller.TypeOfObsList.isEmpty == true &&
                                      controller.isLoading == false
                                  ? Center(child: Text("No Data"))
                                  : controller.isLoading.value == true
                                      ? Center(
                                          child: Text("Data Loading......"))
                                      : Expanded(
                                          child: DataTable2(
                                            key: UniqueKey(),
                                            dataRowHeight: 50,
                                            columnSpacing: 10,
                                            border: TableBorder.all(
                                                color: Color.fromARGB(
                                                    255, 206, 229, 234)),
                                            columns: [
                                              DataColumn2(
                                                  fixedWidth: 100,
                                                  label: Text(
                                                    "Id",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              DataColumn2(
                                                  // fixedWidth: 700,
                                                  label: Text(
                                                "Name",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  // fixedWidth: 300,
                                                  label: Text(
                                                "Description",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  fixedWidth: 200,
                                                  label: Text(
                                                    "Action",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                            ],
                                            rows: List.generate(
                                              controller.TypeOfObsList.length ??
                                                  0,
                                              (index) {
                                                var TypeOfObsListDetails =
                                                    controller
                                                        .TypeOfObsList[index];
                                                return DataRow(cells: [
                                                  DataCell(Text(
                                                      '${TypeOfObsListDetails?.id}')),
                                                  DataCell(Text(
                                                      '${TypeOfObsListDetails?.name}')),
                                                  DataCell(Text(
                                                      '${TypeOfObsListDetails?.description}')),
                                                  DataCell(Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TableActionButton(
                                                        color: ColorValues
                                                            .editColor,
                                                        icon: Icons.edit,
                                                        message: 'Edit',
                                                        onPress: () {
                                                          controller
                                                              .selectedItem = controller
                                                                  .TypeOfObsList
                                                              .firstWhere((element) =>
                                                                  "${element?.id}" ==
                                                                  '${TypeOfObsListDetails?.id}');
                                                          controller.titleCtrlr
                                                              .text = controller
                                                                  .selectedItem
                                                                  ?.name ??
                                                              '';
                                                          controller
                                                              .descriptionCtrlr
                                                              .text = controller
                                                                  .selectedItem
                                                                  ?.description ??
                                                              '';
                                                          controller
                                                              .isContainerVisible
                                                              .value = true;
                                                        },
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              8), // Add space between buttons
                                                      TableActionButton(
                                                        color: ColorValues
                                                            .deleteColor,
                                                        icon: Icons.delete,
                                                        message: 'Delete',
                                                        onPress: () {
                                                          print(
                                                              '${TypeOfObsListDetails?.id}');
                                                          controller.isDeleteDialog(
                                                              business_id:
                                                                  '${TypeOfObsListDetails?.id}',
                                                              business:
                                                                  '${TypeOfObsListDetails?.name}');
                                                        },
                                                      ),
                                                    ],
                                                  )),
                                                ]);
                                              },
                                            ),
                                          ),
                                        ),
                            ],
                          ),
                        ),
                      ),
                    )
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
