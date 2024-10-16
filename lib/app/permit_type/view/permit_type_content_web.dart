import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/permit_type/permit_type_controller.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/dropdown_web.dart';

class PermitTypeContentWeb extends GetView<PermitTypeController> {
  PermitTypeContentWeb({Key? key}) : super(key: key);

  final PermitTypeController controller = Get.find();

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
                      Get.offAllNamed(Routes.breakdown);
                    },
                    child: Text(" / BREAKDOWN MAINTENANCE",
                        style: Styles.greyLight14),
                  ),
                  Text(" / PERMIT TYPE CHECKLIST", style: Styles.greyLight14)
                ],
              ),
            ),
            varUserAccessModel.value.access_list!
                        .where((e) =>
                            e.feature_id ==
                                UserAccessConstants.kPermitchecklistFeatureId &&
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
                              ? 'Close Permit Checklist'
                              : 'Open Permit Checklist',
                        );
                      }),
                    ),
                  )
                : Dimens.box0,
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: controller.isContainerVisible.value,
                    child: Container(
                      width: (Get.width * .3),
                      margin: EdgeInsets.only(left: 10, top: 30),
                      height: Get.height / 2.5,
                      child: Card(
                        color: Color.fromARGB(255, 251, 252, 253),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Text(
                              //     '${varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.add == 1).length}'),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 10, top: 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Create Permit Type Checklist",
                                        style: Styles.blackBold16,
                                      ),
                                      SizedBox(
                                        height: 15,
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
                                                        ? "Permit Checklist added Successfully in the List."
                                                        : "Permit Checklist updated Successfully in the List."
                                                    : "Facility not added",
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
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: CustomRichText(
                                                  title: 'Facility Name')),
                                          Container(
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
                                            child: Container(
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .20),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                child: Obx(
                                                  () => DropdownWebWidget(
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
                                                    controller: controller,
                                                    dropdownList:
                                                        controller.facilityList,
                                                    isValueSelected: controller
                                                        .isFacilitySelected
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedFacility.value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
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
                                          Expanded(
                                              child: CustomRichText(
                                                  title: 'Title')),
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
                                              focusNode:
                                                  controller.titleFocusNode,
                                              scrollController: controller
                                                  .titleScrollController,
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
                                                        .isNameInvalid.value
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
                                                        .isNameInvalid.value
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
                                                        .isNameInvalid.value
                                                    ? "Required field"
                                                    : null,
                                                hintStyle:
                                                    TextStyle(height: 2.0),
                                              ),
                                              onChanged: (value) {
                                                if (value.trim().length > 1) {
                                                  controller.isNameInvalid
                                                      .value = false;
                                                } else {
                                                  controller.isNameInvalid
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
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: CustomRichText(
                                                  title: 'Description')),
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
                                              focusNode:
                                                  controller.descFocusNode,
                                              scrollController: controller
                                                  .descScrollController,
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
                                                hintStyle:
                                                    TextStyle(height: 2.0),
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
                                        height: 20,
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
                                      width: (Get.width * .08),
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
                                      height: 40,
                                      child: controller.selectedItem == null
                                          ? CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appDarkBlueColor,
                                              onPressed: () {
                                                controller
                                                    .createPermitType()
                                                    .then((value) {
                                                  print("value,$value");
                                                  if (value == true)
                                                    controller
                                                        .issuccessCreatechecklist();
                                                });
                                              },
                                              text: 'Create Permit')
                                          : CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appDarkBlueColor,
                                              onPressed: () {
                                                controller
                                                    .updatePermitType(controller
                                                        .selectedItem?.id)
                                                    .then((value) {
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
                      ),
                    ),
                  ),
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
                              child: Row(
                                children: [
                                  Text(
                                    "List of Permit Checklist",
                                    style: Styles.blackBold16,
                                  ),
                                  Spacer()
                                ],
                              ),
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
                                //                 .typePermitList[0]
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
                            controller.typePermitList.isEmpty == true &&
                                    controller.isLoading == false
                                ? Center(child: Text("No Data"))
                                : controller.isLoading.value == true
                                    ? Center(child: Text("Data Loading......"))
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
                                                "Sr.No.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: Text(
                                                "Title",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: Text(
                                                "Description",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            DataColumn2(
                                              fixedWidth: 100,
                                              label: Text(
                                                "Action",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller.typePermitList.length,
                                            (index) {
                                              return DataRow(
                                                // index: index,
                                                cells: [
                                                  DataCell(Text(
                                                      (index + 1).toString())),
                                                  DataCell(Text(controller
                                                      .typePermitList[index]!
                                                      .name
                                                      .toString())),
                                                  DataCell(Text(controller
                                                      .typePermitList[index]!
                                                      .description
                                                      .toString())),
                                                  DataCell(Row(
                                                    children: [
                                                      varUserAccessModel.value
                                                                  .access_list!
                                                                  .where((e) =>
                                                                      e.feature_id ==
                                                                          UserAccessConstants
                                                                              .kPermitchecklistFeatureId &&
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
                                                                    .toggleContainer();
                                                                controller.selectedItem = controller
                                                                    .typePermitList
                                                                    .firstWhere((element) =>
                                                                        "${element?.id}" ==
                                                                        controller
                                                                            .typePermitList[index]!
                                                                            .id
                                                                            .toString());
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
                                                                        .selectedFacility
                                                                        .value =
                                                                    controller.onFetchNameFromId(
                                                                        controller
                                                                            .selectedItem
                                                                            ?.id)!;
                                                                print(
                                                                    "${controller.selectedFacility.value}");
                                                              },
                                                            )
                                                          : Dimens.box0,
                                                      varUserAccessModel.value
                                                                  .access_list!
                                                                  .where((e) =>
                                                                      e.feature_id ==
                                                                          UserAccessConstants
                                                                              .kPermitchecklistFeatureId &&
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
                                                                    checklist_id: controller
                                                                        .typePermitList[
                                                                            index]!
                                                                        .id
                                                                        .toString(),
                                                                    checklist: controller
                                                                        .typePermitList[
                                                                            index]!
                                                                        .name);
                                                              },
                                                            )
                                                          : Dimens.box0,
                                                    ],
                                                  )),
                                                ],
                                              );
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
    );
  }
}
