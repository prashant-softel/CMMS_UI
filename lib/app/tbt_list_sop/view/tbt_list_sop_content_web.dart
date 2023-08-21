  import 'package:clipboard/clipboard.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/tbt_list_sop/tbt_list_sop_controller.dart';
import 'package:cmms/app/tbt_type_list/tbt_type_list_controller.dart';
import 'package:cmms/app/widgets/custom_dropdown.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/dropdown_web.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';

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
                    child: Text(" / MASTERS", style: Styles.greyMediumLight12),
                  ),
                  Text(" / TBT SOP List", style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 13 && e.add == 0)
                              .length >
                          0
                      ? Container(
                          width: (Get.width * .403),
                          margin: EdgeInsets.only(left: 30, top: 10),
                          height: Get.height / 2.2,
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
                                          "Add TBT SOP ",
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
                                                        color: ColorValues.whiteColor,
                                                        offset:
                                                        const Offset(0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                    dropdownList:
                                                    controller.jobTypeList,
                                                    isValueSelected: controller
                                                        .isJobTypeListSelected.value,
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
                                                      const EdgeInsets.all(8.0),
                                                      child: Align(
                                                        alignment:
                                                        Alignment.topLeft,
                                                        child: Text(
                                                          controller.fileName
                                                              .value ==
                                                              ""
                                                              ? 'File Name'
                                                              : controller
                                                              .fileName.value,
                                                          maxLines: 3,
                                                          textAlign:
                                                          TextAlign.center,
                                                          style: Styles.greyLight14,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Dimens.boxWidth5,
                                                  Container(
                                                    height: 35,
                                                    width: 77,
                                                    child: CustomElevatedButton(
                                                      backgroundColor: ColorValues
                                                          .appDarkBlueColor,
                                                      text: "Browse",
                                                      // style: TextStyle(fontSize: 8),
                                                      size: 12,
                                                      onPressed: () async {
                                                        final result =
                                                        await FilePicker
                                                            .platform
                                                            .pickFiles();
                                                        if (result != null) {
                                                          // for (var file in result.files) {
                                                          controller
                                                              .fileName.value =
                                                              result.files.single
                                                                  .name;
                                                          controller.fileBytes =
                                                              result.files.single
                                                                  .bytes;
                                                          //controller.filePath.value = file.;
                                                          print({
                                                            "filepathes",
                                                            controller
                                                                .fileName.value
                                                          });
                                                          // }
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  Dimens.boxWidth5,
                                                  Container(
                                                    height: 35,
                                                    width: 77,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                      ColorValues.greenColor,
                                                      text: 'Upload',
                                                      size: 12,
                                                      onPressed: () {
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
                                                                msg: "file upload  Successfully",
                                                                fontSize: 16.0);
                                                        });
                                                        //  controller.savePmMapping();
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
                                                      const EdgeInsets.all(8.0),
                                                      child: Align(
                                                        alignment:
                                                        Alignment.topLeft,
                                                        child: Text(
                                                          controller.fileName2
                                                              .value ==
                                                              ""
                                                              ? 'File Name'
                                                              : controller
                                                              .fileName2.value,
                                                          maxLines: 3,
                                                          textAlign:
                                                          TextAlign.center,
                                                          style: Styles.greyLight14,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Dimens.boxWidth5,
                                                  Container(
                                                    height: 35,
                                                    width: 77,
                                                    child: CustomElevatedButton(
                                                      backgroundColor: ColorValues
                                                          .appDarkBlueColor,
                                                      text: "Browse",
                                                      size: 12,
                                                      onPressed: () async {
                                                        final result =
                                                        await FilePicker
                                                            .platform
                                                            .pickFiles();
                                                        if (result != null) {
                                                          // for (var file in result.files) {
                                                          controller
                                                              .fileName2.value =
                                                              result.files.single
                                                                  .name;
                                                          controller.fileBytes2 =
                                                              result.files.single
                                                                  .bytes;
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
                                                    width: 77,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                      ColorValues.greenColor,
                                                      text: 'Upload',
                                                      size: 12,
                                                      onPressed: () {
                                                        controller
                                                            .browseFiles(
                                                            fileBytes:
                                                            controller
                                                                .fileBytes2,
                                                            position: 1)
                                                            .then((value) {
                                                          controller
                                                              .isSuccessDialog2();

                                                          //   // Fluttertoast.showToast(
                                                          //   //     msg: "file upload  Successfully",
                                                          //   //     fontSize: 16.0);
                                                        });
                                                        //  controller.savePmMapping();
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
                                        width: (Get.width * .2) - 70,
                                        child: controller.selectedItem == null
                                            ? CustomElevatedButton(
                                            backgroundColor: ColorValues
                                                .appDarkBlueColor,
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
                                            backgroundColor: ColorValues
                                                .appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .updateSop(
                                                  controller
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
                        )
                      : Container(),
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 13 && e.view == 0)
                              .length >
                          0
                      ? Expanded(
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
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {
                                              FlutterClipboard.copy(controller
                                                      // .preventiveCheckList![0]
                                                      .toString())
                                                  .then((value) {
                                                print("copy data");
                                              });
                                            },
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
                                  controller.sopPermitList.isEmpty
                                      ? Expanded(
                                          child: ScrollableTableView(
                                            columns: [
                                              "Sr.No.",
                                              "Title",
                                              "Job Type Name",
                                              "Action",
                                            ].map((column) {
                                              return TableViewColumn(
                                                label: column,
                                                minWidth: Get.width * 0.16,
                                              );
                                            }).toList(),
                                            rows: [
                                              ...List.generate(
                                                controller.sopPermitList.length,
                                                (index) {
                                                  return [
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    // '',
                                                    // '',
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
                                            paginationController: controller
                                                .jobSOPListPaginationController,
                                            columns: [
                                              "Sr.No.",
                                              "Title",
                                              "Job Type Name",
                                              "Action"
                                            ].map((column) {
                                              return TableViewColumn(
                                                minWidth: Get.width * 0.12,
                                                label: column,
                                              );
                                            }).toList(),
                                            rows: //
                                                [
                                              ...List.generate(
                                                controller.sopPermitList.length,
                                                (index) {
                                                  var jobSOPListDetails =
                                                      controller
                                                          .sopPermitList[index];
                                                  return [
                                                    '${jobSOPListDetails.id}',
                                                    '${jobSOPListDetails.name}',
                                                    '${jobSOPListDetails.jobTypeName}',
                                                    "Action"
                                                  ];
                                                },
                                              ),
                                            ].map((_permitTypeList) {
                                              return TableViewRow(
                                                  height: 60,
                                                  cells: _permitTypeList
                                                      .map((value) {
                                                    return TableViewCell(
                                                        child: (value ==
                                                                'Checkbox')
                                                            ? Checkbox(
                                                                value: controller
                                                                    .isChecked
                                                                    .value,
                                                                onChanged:
                                                                    (val) {})
                                                            : (value ==
                                                                    "Action")
                                                                ? Wrap(
                                                                  alignment: WrapAlignment.center,
                                                                    children: [
                                                                        // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.edit == 1).length >
                                                                        //         0
                                                                        //     ?
                                                                        TableActionButton(
                                                                          color:
                                                                              ColorValues.editColor,
                                                                          icon:
                                                                              Icons.edit,
                                                                          message:
                                                                              'Edit',
                                                                          onPress:
                                                                              () {
                                                                                controller.selectedItem = controller.sopPermitList.firstWhere((element) => "${element.id}" == _permitTypeList[0]);

                                                                                controller.titleTextFieldCtrlr.text = controller.selectedItem?.name ?? '';
                                                                                controller.descriptionTextFieldCtrlr.text = controller.selectedItem?.description ?? '';
                                                                              },
                                                                        ),
                                                                        // : Container(),
                                                                        // :Container(),
                                                                        // varUserAccessModel.value.access_list!.where((e) => e.feature_name == "PM Checklist Number" && e.delete == 1).length >
                                                                        //         0
                                                                        //     ?
                                                                        TableActionButton(
                                                                          color:
                                                                              ColorValues.deleteColor,
                                                                          icon:
                                                                              Icons.delete,
                                                                          message:
                                                                              'Delete',
                                                                          onPress:
                                                                              () {
                                                                                controller.isDeleteDialog(business_id: _permitTypeList[0], business: _permitTypeList[1]);
                                                                              },
                                                                        )
                                                                        // : Container()
                                                                      ])
                                                                : Text(
                                                                    value,
                                                                  ));
                                                  }).toList());
                                            }).toList(),
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: ValueListenableBuilder(
                                        valueListenable: controller
                                            .jobSOPListPaginationController,
                                        builder: (context, value, child) {
                                          return Row(children: [
                                            Text(
                                                "${controller.jobSOPListPaginationController.currentPage}  of ${controller.jobSOPListPaginationController.pageCount}"),
                                            Row(children: [
                                              IconButton(
                                                onPressed: controller
                                                            .jobSOPListPaginationController
                                                            .currentPage <=
                                                        1
                                                    ? null
                                                    : () {
                                                        controller
                                                            .jobSOPListPaginationController
                                                            .previous();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_back_ios_new_rounded,
                                                  color: controller
                                                              .jobSOPListPaginationController
                                                              .currentPage <=
                                                          1
                                                      ? Colors.black26
                                                      : Theme.of(context)
                                                          .primaryColor,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: controller
                                                            .jobSOPListPaginationController
                                                            .currentPage >=
                                                        controller
                                                            .jobSOPListPaginationController
                                                            .pageCount
                                                    ? null
                                                    : () {
                                                        controller
                                                            .jobSOPListPaginationController
                                                            .next();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: controller
                                                              .jobSOPListPaginationController
                                                              .currentPage >=
                                                          controller
                                                              .jobSOPListPaginationController
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
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
