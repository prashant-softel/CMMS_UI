import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/document_master/document_master_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';

class DocumentMasterContentWeb extends GetView<DocumentMasterController> {
  DocumentMasterContentWeb({Key? key}) : super(key: key);
  final DocumentMasterController controller = Get.find();

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
                      child: Text(
                        " / MASTERS",
                        style: Styles.greyLight14,
                      ),
                    ),
                    Text(
                      " / Document ",
                      style: Styles.greyLight14,
                    ),
                  ],
                ),
              ),
              varUserAccessModel.value.access_list!
                          .where((e) =>
                              e.feature_id ==
                                  UserAccessConstants.kMasterFeatureId &&
                              e.add == UserAccessConstants.kHaveAddAccess)
                          .length >
                      0
                  ? Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: ElevatedButton(
                        style: Styles.navyBlueElevatedButtonStyle,
                        onPressed: () {
                          controller.toggleContainer();
                        },
                        child: Obx(() {
                          return Text(
                            controller.isContainerVisible.value
                                ? 'Close Create Document Master'
                                : 'Open Create Document Master',
                          );
                        }),
                      ),
                    )
                  : Dimens.box0,
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
                        margin: EdgeInsets.only(left: 10, top: 30),
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
                                          "Create Document Master",
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
                                                          ? "Document Master Create Successfully in the List."
                                                          : "Document Master updated Successfully in the List."
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
                                                    title: 'Name')),
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
                                                    color:
                                                        ColorValues.whiteColor,
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
                                                    controller.titleCtrlr,
                                                focusNode:
                                                    controller.titleFocus,
                                                scrollController:
                                                    controller.titleScroll,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                autofocus: false,
                                                decoration: InputDecoration(
                                                  fillColor:
                                                      ColorValues.whiteColor,
                                                  filled: true,
                                                  contentPadding:
                                                      EdgeInsets.only(
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
                                                    color:
                                                        ColorValues.whiteColor,
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
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16.0,
                                                      height: 1.0,
                                                      color: Colors.black),
                                                ),
                                                controller:
                                                    controller.descriptionCtrlr,
                                                focusNode: controller.descFocus,
                                                scrollController:
                                                    controller.descScroll,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                autofocus: false,
                                                decoration: InputDecoration(
                                                  fillColor:
                                                      ColorValues.whiteColor,
                                                  filled: true,
                                                  contentPadding:
                                                      EdgeInsets.only(
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
                                        backgroundColor:
                                            ColorValues.appRedColor,
                                        onPressed: () {
                                          controller.cleardata();
                                          controller.isContainerVisible.value =
                                              false;
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
                                        ? Container(
                                            width: (Get.width * .15),
                                            height: 40,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appDarkBlueColor,
                                              onPressed: () {
                                                controller
                                                    .createDocumentMaster()
                                                    .then(
                                                  (value) {
                                                    print("CREATE");
                                                    print("value,$value");
                                                    if (value == true) {
                                                      controller
                                                          .issuccessCreatechecklist();
                                                      controller
                                                          .toggleContainer();
                                                    }
                                                  },
                                                );
                                              },
                                              text: 'Create Document  ',
                                            ),
                                          )
                                        : CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .updateDocumentMaster(
                                                      controller
                                                          .selectedItem?.id)
                                                  .then(
                                                (value) {
                                                  print("UPDATE");
                                                  print("value,$value");
                                                  if (value == true)
                                                    controller
                                                        .issuccessCreatechecklist();
                                                  controller.toggleContainer();
                                                },
                                              );
                                            },
                                            text: 'Update',
                                          ),
                                  ),
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
                        margin: EdgeInsets.only(right: 10, left: 10, top: 20),
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
                                      "List of Document ",
                                      style: Styles.blackBold16,
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 300,
                                      height: 40,
                                      // margin: Dimens.edgeInsets0_0_16_0,
                                      margin: EdgeInsets.only(right: 5),
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
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width: 0.0,
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width: 0.0,
                                            ),
                                          ),
                                          contentPadding:
                                              Dimens.edgeInsets05_10,
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
                              controller.DocumentMaster.isEmpty == true &&
                                      controller.isLoading == false
                                  ? Center(child: Text("No Data"))
                                  : controller.isLoading.value == true
                                      ? Center(
                                          child: Text("Data Loading......"))
                                      : Expanded(
                                          child: Obx(
                                            () => DataTable2(
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
                                                      "Sr No",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    // fixedWidth: 150,
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
                                                    fixedWidth: 100,
                                                    label: Text(
                                                      'Action',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                              ],
                                              rows: List<DataRow>.generate(
                                                controller.DocumentMaster
                                                        .length ??
                                                    0,
                                                (index) => DataRow(cells: [
                                                  DataCell(Text(
                                                      (index + 1).toString())),
                                                  DataCell(Text(controller
                                                          .DocumentMaster[index]
                                                          .name
                                                          .toString() ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .DocumentMaster[index]
                                                          .description ??
                                                      '')),
                                                  DataCell(Row(
                                                    children: [
                                                      varUserAccessModel.value
                                                                  .access_list!
                                                                  .where((e) =>
                                                                      e.feature_id ==
                                                                          UserAccessConstants
                                                                              .kMasterFeatureId &&
                                                                      e.edit ==
                                                                          UserAccessConstants
                                                                              .kHaveEditAccess)
                                                                  .length >
                                                              0
                                                          ? TableActionButton(
                                                              color: ColorValues
                                                                  .editColor,
                                                              icon: Icons.edit,
                                                              message: 'Edit',
                                                              onPress: () {
                                                                controller
                                                                    .selectedItem = controller
                                                                        .DocumentMaster
                                                                    .firstWhere(
                                                                  (element) =>
                                                                      "${element.id}" ==
                                                                      controller
                                                                          .DocumentMaster[
                                                                              index]
                                                                          .id
                                                                          .toString(),
                                                                );

                                                                controller
                                                                    .titleCtrlr
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
                                                            )
                                                          : Dimens.box0,
                                                      varUserAccessModel.value
                                                                  .access_list!
                                                                  .where((e) =>
                                                                      e.feature_id ==
                                                                          UserAccessConstants
                                                                              .kMasterFeatureId &&
                                                                      e.delete ==
                                                                          UserAccessConstants
                                                                              .kHaveDeleteAccess)
                                                                  .length >
                                                              0
                                                          ? TableActionButton(
                                                              color: ColorValues
                                                                  .deleteColor,
                                                              icon:
                                                                  Icons.delete,
                                                              message: 'Delete',
                                                              onPress: () {
                                                                controller.isDeleteDialog(
                                                                    DocumentMaster_id: controller
                                                                        .DocumentMaster[
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                    DocumentMaster: controller
                                                                        .DocumentMaster[
                                                                            index]
                                                                        .name);
                                                              },
                                                            )
                                                          : Dimens.box0
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
      ),
    );
  }
}
