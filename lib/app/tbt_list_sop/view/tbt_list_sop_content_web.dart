import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/tbt_list_sop/tbt_list_sop_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/dropdown_web.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TBTSOPListContentWeb extends GetView<TBTSOPListController> {
  TBTSOPListContentWeb({Key? key}) : super(key: key);
  final TBTSOPListController controller = Get.find();

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
                  Text(" / TBT SOP List", style: Styles.greyLight14)
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
                        ? 'Close TBT SOP'
                        : 'Open TBT SOP',
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
                      width: (Get.width * .403),
                      margin: EdgeInsets.only(left: 30, top: 10),
                      height: Get.height / 1.8,
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
                                      "Add TBT SOP",
                                      style: Styles.blackBold16,
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
                                              title: 'TBT Type: '),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.040,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,

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
                                                    color:
                                                        ColorValues.whiteColor,
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 0.0,
                                                    spreadRadius: 0.0,
                                                  ),
                                                ],
                                                dropdownList:
                                                    controller.jobTypeList,
                                                isValueSelected: controller
                                                    .isJobTypeListSelected
                                                    .value,
                                                selectedValue: controller
                                                    .selectedJobType.value,
                                                onValueChanged:
                                                    controller.onValueChanged,
                                              ),
                                            ),

                                            // LoginCustomTextfield(),
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
                                          child:
                                              CustomRichText(title: 'Title '),
                                        ),
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: LoginCustomTextfield(
                                                textController: controller
                                                    .titleTextFieldCtrlr,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .deny(
                                                    RegExp('[\'^]'),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // CustomRichText(title: 'Facility: '),
                                    // SizedBox(
                                    //   width: 5,
                                    // ),
                                    // SizedBox(
                                    //   width: MediaQuery.of(context)
                                    //           .size
                                    //           .width /
                                    //       1.82,
                                    //   child: DropdownWebWidget(
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.black26,
                                    //     offset: const Offset(
                                    //       5.0,
                                    //       5.0,
                                    //     ),
                                    //     blurRadius: 5.0,
                                    //     spreadRadius: 1.0,
                                    //   ),
                                    //   BoxShadow(
                                    //     color: ColorValues
                                    //         .whiteColor,
                                    //     offset: const Offset(
                                    //         0.0, 0.0),
                                    //     blurRadius: 0.0,
                                    //     spreadRadius: 0.0,
                                    //   ),
                                    // ],
                                    //     dropdownList:
                                    //         controller.facilityList,
                                    //     isValueSelected: controller
                                    //         .isFacilitySelected.value,
                                    //     selectedValue: controller
                                    //         .selectedFacility.value,
                                    //     onValueChanged:
                                    //         controller.onValueChanged,
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: CustomRichText(
                                              title: 'Description '),
                                        ),
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: LoginCustomTextfield(
                                                textController: controller
                                                    .descriptionTextFieldCtrlr,
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: CustomRichText(
                                            title: 'View JSA File ',
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 45,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  7.1,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 227, 224, 224),
                                                  width: 1,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                            255, 236, 234, 234)
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 2),
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    controller.fileName.value ==
                                                            ""
                                                        ? 'File Name'
                                                        : controller
                                                            .fileName.value,
                                                    maxLines: 3,
                                                    textAlign: TextAlign.center,
                                                    style: Styles.greyLight14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Dimens.boxWidth5,
                                            Container(
                                              height: 35,
                                              width: 95,
                                              child: CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                text: "Browse",
                                                // style: TextStyle(fontSize: 8),
                                                size: 12,
                                                onPressed: () async {
                                                  final result =
                                                      await FilePicker.platform
                                                          .pickFiles();
                                                  if (result != null) {
                                                    // for (var file in result.files) {
                                                    controller.fileName.value =
                                                        result
                                                            .files.single.name;
                                                    controller.fileBytes =
                                                        result
                                                            .files.single.bytes;
                                                    //controller.filePath.value = file.;
                                                    print({
                                                      "filepathes",
                                                      controller.fileName.value
                                                    });
                                                    // }
                                                  }
                                                },
                                              ),
                                            ),
                                            Dimens.boxWidth5,
                                            Container(
                                              height: 35,
                                              width: 95,
                                              child: CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.greenColor,
                                                text: 'Upload',
                                                size: 12,
                                                onPressed: () {
                                                  if (controller.fileBytes ==
                                                          null ||
                                                      controller
                                                          .fileBytes!.isEmpty) {
                                                    // Show an error message indicating no file is selected
                                                    Fluttertoast.showToast(
                                                      msg:
                                                          "Please select a file",
                                                      fontSize: 16.0,
                                                    );
                                                  } else {
                                                    // File bytes are present, proceed with the upload
                                                    controller
                                                        .browseFiles(
                                                            fileBytes:
                                                                controller
                                                                    .fileBytes,
                                                            position: 0)
                                                        .then((value) {
                                                      controller
                                                          .isSuccessDialog();

                                                      Fluttertoast.showToast(
                                                        msg:
                                                            "File uploaded successfully",
                                                        fontSize: 16.0,
                                                      );
                                                    });
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: CustomRichText(
                                            title: 'View SOP File ',
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 45,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  7.1,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 227, 224, 224),
                                                  width: 1,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                            255, 236, 234, 234)
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 2),
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    controller.fileName2
                                                                .value ==
                                                            ""
                                                        ? 'File Name'
                                                        : controller
                                                            .fileName2.value,
                                                    maxLines: 3,
                                                    textAlign: TextAlign.center,
                                                    style: Styles.greyLight14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Dimens.boxWidth5,
                                            Container(
                                              height: 35,
                                              width: 95,
                                              child: CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                text: "Browse",
                                                size: 12,
                                                onPressed: () async {
                                                  final result =
                                                      await FilePicker.platform
                                                          .pickFiles();
                                                  if (result != null) {
                                                    // for (var file in result.files) {
                                                    controller.fileName2.value =
                                                        result
                                                            .files.single.name;
                                                    controller.fileBytes2 =
                                                        result
                                                            .files.single.bytes;
                                                    //controller.filePath.value = file.;
                                                    //  print({"filepathes", fileBytes});
                                                    // }
                                                  }
                                                },
                                              ),
                                            ),
                                            Dimens.boxWidth5,
                                            Container(
                                              height: 35,
                                              width: 95,
                                              child: CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.greenColor,
                                                text: 'Upload',
                                                size: 12,
                                                onPressed: () {
                                                  if (controller.fileBytes2 ==
                                                          null ||
                                                      controller.fileBytes2!
                                                          .isEmpty) {
                                                    // Show an error message indicating no file is selected
                                                    Fluttertoast.showToast(
                                                      msg:
                                                          "Please select a file",
                                                      fontSize: 16.0,
                                                    );
                                                  } else {
                                                    // File bytes are present, proceed with the upload
                                                    controller
                                                        .browseFiles(
                                                            fileBytes:
                                                                controller
                                                                    .fileBytes2,
                                                            position: 1)
                                                        .then((value) {
                                                      controller
                                                          .isSuccessDialog2();
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            "File uploaded successfully",
                                                        fontSize: 16.0,
                                                      );
                                                    });
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     CustomRichText(
                                    //         title: 'Require SOP/JSA: '),
                                    //     SizedBox(
                                    //       width: 5,
                                    //     ),
                                    //     Checkbox(
                                    //       value: controller
                                    //           .isCheckedRequire.value,
                                    //       onChanged: (bool? value) {
                                    //         controller.requiretoggleCheckbox();
                                    //       },
                                    //     ),
                                    //   ],
                                    // ),
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
                                    width: (Get.width * .1),
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
                                    width: 200,
                                    child: controller.selectedItem == null
                                        ? CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .createSOP()
                                                  .then((value) {
                                                print("value,$value");
                                                if (value == true)
                                                  controller
                                                      .issuccessCreatechecklist();
                                              });
                                            },
                                            text: 'Create SOP List')
                                        : CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .updateSop(controller
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
                  Expanded(
                    child: Container(
                      width: Get.width * 7,
                      margin: EdgeInsets.only(left: 10, top: 10),
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
                                "List of TBT SOP",
                                style: Styles.blackBold16,
                              ),
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
                                //       backgroundColor: ColorValues.appLightBlueColor,
                                //       onPressed: () {
                                //         FlutterClipboard.copy(controller
                                //                 // .preventiveCheckList![0]
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
                                //   child: CustomElevatedButton(backgroundColor: ColorValues.appLightBlueColor, onPressed: () {}, text: 'Excel'),
                                // ),
                                // Container(
                                //   height: 45,
                                //   margin: EdgeInsets.only(left: 10),
                                //   child: CustomElevatedButton(backgroundColor: ColorValues.appLightBlueColor, onPressed: () {}, text: 'PDF'),
                                // ),
                                // Container(
                                //   height: 45,
                                //   margin: EdgeInsets.only(left: 10),
                                //   child: CustomElevatedButton(
                                //     backgroundColor: ColorValues.appLightBlueColor,
                                //     onPressed: () {},
                                //     text: 'columnVisibility'.tr,
                                //   ),
                                // )
                              ],
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            controller.sopPermitList.isEmpty
                                ? Expanded(
                                    child: DataTable2(
                                      columns: [
                                        DataColumn2(
                                          label: Text(
                                            "Sr.No.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          size: ColumnSize.S,
                                        ),
                                        DataColumn2(
                                          label: Text(
                                            "Title",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          size: ColumnSize.L,
                                        ),
                                        DataColumn2(
                                          label: Text(
                                            "Job Type Name",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          size: ColumnSize.L,
                                        ),
                                        DataColumn2(
                                          label: Text(
                                            "Action",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          size: ColumnSize.S,
                                        ),
                                      ],
                                      rows: [],
                                    ),
                                  )
                                : Expanded(
                                    child: DataTable2(
                                      columns: [
                                        DataColumn2(
                                          label: Text(
                                            "Sr.No.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          size: ColumnSize.S,
                                        ),
                                        DataColumn2(
                                          label: Text(
                                            "Title",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          size: ColumnSize.L,
                                        ),
                                        DataColumn2(
                                          label: Text(
                                            "Job Type Name",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          size: ColumnSize.L,
                                        ),
                                        DataColumn2(
                                          label: Text(
                                            "Action",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          size: ColumnSize.S,
                                        ),
                                      ],
                                      rows: controller.sopPermitList
                                          .map((jobSOPListDetails) {
                                        return DataRow2(
                                          cells: [
                                            DataCell(Text(
                                                '${jobSOPListDetails.id}')),
                                            DataCell(Text(
                                                '${jobSOPListDetails.name}')),
                                            DataCell(Text(
                                                '${jobSOPListDetails.jobTypeName}')),
                                            DataCell(
                                              Wrap(
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  TableActionButton(
                                                    color:
                                                        ColorValues.editColor,
                                                    icon: Icons.edit,
                                                    message: 'Edit',
                                                    onPress: () {
                                                      controller.selectedItem =
                                                          jobSOPListDetails;
                                                      controller
                                                          .titleTextFieldCtrlr
                                                          .text = controller
                                                              .selectedItem
                                                              ?.name ??
                                                          '';
                                                      controller
                                                          .descriptionTextFieldCtrlr
                                                          .text = controller
                                                              .selectedItem
                                                              ?.description ??
                                                          '';
                                                      controller
                                                          .isContainerVisible
                                                          .value = true;
                                                    },
                                                  ),
                                                  TableActionButton(
                                                    color:
                                                        ColorValues.deleteColor,
                                                    icon: Icons.delete,
                                                    message: 'Delete',
                                                    onPress: () {
                                                      controller.isDeleteDialog(
                                                        business_id:
                                                            '${jobSOPListDetails.id}',
                                                        business:
                                                            jobSOPListDetails
                                                                .name,
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList(),
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
