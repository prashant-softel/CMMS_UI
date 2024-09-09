import 'dart:convert';

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/job_card_details/views/widgets/tbt_done_dialog.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/job_card_approve_dialog.dart';
import 'package:cmms/app/widgets/job_card_reject_dialog.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/file_upload_controller.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../../widgets/custom_divider.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/file_upload_details_widget_web.dart';
import '../../../widgets/file_upload_with_dropzone_widget.dart';
import '../../../widgets/history_table_widget_web.dart';
import '../../job_card_details_controller.dart';
import '../widgets/isolated_assets_widget.dart';
import '../widgets/loto_applied_assets_widget.dart';
import '../widgets/transposed_table.dart';

class JobCardDetailsContentWeb extends GetView<JobCardDetailsController> {
  JobCardDetailsContentWeb({super.key});
  Future<bool?> showConfirmationDialog(
      BuildContext context, String message) async {
    return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  ///
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  ///
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return
          //
          Column(
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
                    Get.offNamed(Routes.goToJobCardList);
                  },
                  child:
                      Text(" / JOB CARD LIST", style: Styles.greyMediumLight12),
                ),
                Text(" / JOB CARD DETAILS ", style: Styles.greyMediumLight12)
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: Get.height,
              padding: Dimens.edgeInsets10,
              margin: Dimens.edgeInsets5,
              decoration: BoxDecoration(
                color: ColorValues.whiteColor,
                // border: Border.all(jobli
                //   color: ColorValues.appDarkBlueColor,
                //   style: BorderStyle.solid,
                //   width: 3,
                // ),
              ),
              child: //
                  Obx(() {
                try {
                  return //

                      ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //
                          children: [
                            /// TABLE - PLANT DETAILS
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("JOB CARD DETAIL ",
                                    style: Styles.blackBold16),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 5),
                                    margin: EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      color: controller.jobCardDetailsModel
                                                  .value?.status ==
                                              151
                                          ? ColorValues.createsColor
                                          : controller.jobCardDetailsModel.value
                                                      ?.status ==
                                                  152
                                              ? ColorValues.startColor
                                              : controller.jobCardDetailsModel
                                                          .value?.status ==
                                                      153
                                                  ? Color.fromARGB(
                                                      255, 181, 129, 179)
                                                  : controller.jobCardDetailsModel
                                                              .value?.status ==
                                                          155
                                                      ? ColorValues
                                                          .waitingForApproveStatusColor
                                                      : ColorValues
                                                          .lightBlueColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      " ${controller.jobCardDetailsModel.value?.statusShort ?? ""}",
                                    )),
                              ],
                            ),
                            Divider(
                              color: ColorValues.greyLightColour,
                            ),
                            Container(
                              margin: Dimens.edgeInsets40_0_40_0,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      // Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("Job Card Id:",
                                                  style: Styles.black14),
                                              SizedBox(width: 2),
                                              Text(
                                                  " JC${controller.jobCardId.value}",
                                                  style: Styles.blue14)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("Asset Category Name:",
                                                  style: Styles.black14),
                                              SizedBox(width: 2),
                                              Text(
                                                  " ${controller.jobCardDetailsModel.value?.assetCategoryName != null ? controller.jobCardDetailsModel.value?.assetCategoryName?.map<String>((item) => item.equipmentName.toString()).toList() : []}",
                                                  maxLines: 3,
                                                  style: Styles.blue14)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("Job Id:",
                                                  style: Styles.black14),
                                              SizedBox(width: 2),
                                              Text(
                                                  " JOB${controller.jobCardDetailsModel.value?.jobId ?? ""}",
                                                  style: Styles.blue14)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("PTW Id:",
                                                  style: Styles.black14),
                                              SizedBox(width: 2),
                                              Text(
                                                  " PTW${controller.jobCardDetailsModel.value?.ptwId ?? ""}",
                                                  style: Styles.blue14)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("Created By:",
                                                  style: Styles.black14),
                                              SizedBox(width: 2),
                                              Text(
                                                  " ${controller.jobCardDetailsModel.value?.createdBy ?? ""}",
                                                  style: Styles.blue14),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // Dimens.boxWidth10,

                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("Plant Name:",
                                                  style: Styles.black14),
                                              SizedBox(width: 2),
                                              Text(
                                                  " ${controller.jobCardDetailsModel.value?.createdBy ?? ""}",
                                                  style: Styles.blue14),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("JC Title:",
                                                  style: Styles.black14),
                                              SizedBox(width: 2),
                                              Text(
                                                  " ${controller.jobCardDetailsModel.value?.title ?? ""}",
                                                  maxLines: 2,
                                                  style: Styles.blue14)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("JC Closed By Name:",
                                                  style: Styles.black14),
                                              SizedBox(width: 2),
                                              Text(
                                                  " ${controller.jobCardDetailsModel.value?.jcClosedByName ?? ""}",
                                                  style: Styles.blue14)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("JC Start By Name:",
                                                  style: Styles.black14),
                                              SizedBox(width: 2),
                                              Text(
                                                  " ${controller.jobCardDetailsModel.value?.jcStartByName ?? ""}",
                                                  style: Styles.blue14)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("JC Approved By Name:",
                                                  style: Styles.black14),
                                              SizedBox(width: 2),
                                              Text(
                                                  " ${controller.jobCardDetailsModel.value?.jcApprovedByName ?? ""}",
                                                  style: Styles.blue14)
                                            ],
                                          ),
                                        ],
                                      ),
                                      // Dimens.boxWidth10,
                                      SizedBox(width: 10),

                                      Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(children: [
                              Text('Plant Details :',
                                  style: Styles.blackBold16),
                            ]),
                            TransposedTable(controller.plantDetails),
                            // Dimens.boxHeight20,
                            SizedBox(height: 20),

                            /// TABLE - JOB DETAILS
                            Row(//
                                children: [
                              Text('Job Details :', style: Styles.blackBold16),
                            ]),
                            TransposedTable(controller.jobDetails),
                            // Dimens.boxHeight20,
                            SizedBox(height: 20),

                            /// TABLE - PERMIT DETAILS
                            Row(//
                                children: [
                              Text('Permit Details :',
                                  style: Styles.blackBold16),
                            ]),
                            TransposedTable(controller.permitDetails),
                            // Dimens.boxHeight20,
                            SizedBox(height: 20),

                            /// ISOLATED ASSETS TABLE WIDGET
                            (controller.isolationAssetsCategoryList.isNotEmpty)
                                ? IsolatedAssetsWidget()
                                : Dimens.boxHeight0,

                            /// LOTO APPLIED ASSETS TABLE WIDGET
                            (controller.lotoAppliedAssets.isNotEmpty)
                                ? LotoAppliedAssetsWidget()
                                // : Dimens.boxHeight20,
                                : SizedBox(height: 20),
                            // CustomDivider(),

                            /// EMPLOYEE TABL
                            // controller.employeesDeployed.length > 0
                            //     ? Container()
                            //     :
                            DeployedTeam(),

                            // EmployeeTableWidget(
                            //     controller: controller, isWeb: true),
                            // Dimens.boxHeight20,
                            SizedBox(height: 20),

                            // CustomDivider(),

                            /// FILE UPLOAD WIDGET
                            controller.jobCardDetailsModel.value!.status == 158
                                ? Dimens.box0
                                : Container(
                                    height: Get.height * 0.2,
                                    width: Get.width,
                                    child: Row(//
                                        children: [
                                      Expanded(
                                        flex: 2,
                                        child: FileUploadWidgetWithDropzone(),
                                      ),
                                      // Dimens.boxWidth10,
                                      SizedBox(width: 10),
                                      Expanded(
                                          flex: 8,
                                          child: FileUploadDetailsWidgetWeb2()),
                                    ]),
                                  ),
                            // Dimens.boxHeight20,
                            SizedBox(height: 20),
                            CustomDivider(),
                            // Dimens.boxHeight20,
                            SizedBox(height: 20),
                            controller.allFiles.length > 0
                                ? Container(
                                    margin: Dimens.edgeInsets20,
                                    height: ((controller.allFiles.length ?? 0) *
                                            40) +
                                        130,
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
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'All Files Uploaded',
                                                style: Styles.blue700,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: DataTable2(
                                            border: TableBorder.all(
                                              color: Color.fromARGB(
                                                  255, 206, 229, 234),
                                            ),
                                            columns: [
                                              DataColumn(
                                                label: Text(
                                                  "File Description",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  "View Image",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                            rows: List<DataRow>.generate(
                                              controller.allFiles.length ?? 0,
                                              (index) => DataRow(
                                                cells: [
                                                  DataCell(Text(
                                                    controller.allFiles[index]
                                                            ?.description
                                                            .toString() ??
                                                        '',
                                                  )),
                                                  DataCell(
                                                    // Text("View Image"),
                                                    Wrap(
                                                      children: [
                                                        TableActionButton(
                                                          color: ColorValues
                                                              .appDarkBlueColor,
                                                          icon:
                                                              Icons.visibility,
                                                          message: 'View Image',
                                                          onPress: () async {
                                                            // String baseUrl =
                                                            //     "http://65.0.20.19/CMMS_API/";
                                                            String baseUrl =
                                                                'http://172.20.43.18:82/';
                                                            String fileName = controller
                                                                    .allFiles[
                                                                        index]
                                                                    ?.fileName ??
                                                                "";
                                                            String fullUrl =
                                                                baseUrl +
                                                                    fileName;
                                                            if (await canLaunch(
                                                                fullUrl)) {
                                                              await launch(
                                                                  fullUrl);
                                                            } else {
                                                              throw 'Could not launch $fullUrl';
                                                            }
                                                            // String baseUrl = 'http://172.20.43.18:82/';
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Dimens.box0,
                            // Dimens.boxHeight10,
                            SizedBox(height: 10),
                            controller.listMrsByTaskId!.isEmpty
                                ? Dimens.box0
                                : Container(
                                    margin: Dimens.edgeInsets20,
                                    height: 300,
                                    // width: MediaQuery.of(context).size.width / 1.2,
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
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Material Used For ",
                                                style: Styles.blue700,
                                              ),
                                              controller.jobCardDetailsModel
                                                          .value!.status ==
                                                      158
                                                  ? Dimens.box0
                                                  : GestureDetector(
                                                      onTap: () {
                                                        controller.addRowItem();
                                                      },
                                                      child: Container(
                                                        height: 25,
                                                        width: 70,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorValues
                                                              .addNewColor,
                                                          border: Border.all(
                                                            color: ColorValues
                                                                .lightGreyColorWithOpacity35,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            " + Add ",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Obx(() {
                                            return DataTable2(
                                              minWidth: 2000,
                                              dataRowHeight: 70,
                                              columnSpacing: 10,
                                              border: TableBorder.all(
                                                  color: Color.fromARGB(
                                                      255, 206, 229, 234)),
                                              columns: [
                                                DataColumn2(
                                                    fixedWidth: 250,
                                                    label: Text(
                                                      "Material Name",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 250,
                                                    label: Text(
                                                      "Equipment",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 100,
                                                    label: Text(
                                                      "Sr No.",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 150,
                                                    label: Text(
                                                      "MDM Code",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 120,
                                                    label: Text(
                                                      "Material Type",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 100,
                                                    label: Text(
                                                      "Issued Qty",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 100,
                                                    label: Text(
                                                      "Used Qty",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 130,
                                                    label: Text(
                                                      "Consumed  Qty",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 70,
                                                    label: Text(
                                                      "Action",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                              ],
                                              rows: controller.rowItem.value
                                                  .map((record) {
                                                return DataRow(
                                                  // height: 130,
                                                  cells: record.map((mapData) {
                                                    return DataCell(
                                                      (mapData['key'] ==
                                                              "Drop_down")
                                                          ? DropdownWebStock(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              dropdownList: controller
                                                                  .cmmrsItems!
                                                                  .where((item) =>
                                                                      item?.issued_qty !=
                                                                      item?.used_qty)
                                                                  .toList()
                                                                  .obs,
                                                              selectedValue:
                                                                  mapData[
                                                                      "value"],
                                                              onValueChanged: (list,
                                                                  selectedValue) {
                                                                mapData["value"] =
                                                                    selectedValue;
                                                                controller.dropdownMapperData[
                                                                        selectedValue] =
                                                                    list.firstWhere(
                                                                  (element) =>
                                                                      element
                                                                          .name ==
                                                                      selectedValue,
                                                                  orElse: () =>
                                                                      null,
                                                                );
                                                                Future.delayed(
                                                                    Duration
                                                                        .zero,
                                                                    () {
                                                                  //  setState(() {});
                                                                });
                                                              },
                                                            )
                                                          : (mapData['key'] ==
                                                                  "Drop_down_eq")
                                                              ? DropdownWebStock(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  dropdownList: controller
                                                                      .workingAreaList!
                                                                      .where(
                                                                          (p0) {
                                                                        return !controller
                                                                            .rowItem
                                                                            .map((p0) =>
                                                                                p0[0]["value"])
                                                                            .contains(p0.name);
                                                                      })
                                                                      .toList()
                                                                      .obs,
                                                                  selectedValue:
                                                                      mapData[
                                                                          "value"],
                                                                  onValueChanged:
                                                                      (list,
                                                                          selectedValue) {
                                                                    // print('paifcghb:${controller.assetList}');
                                                                    // print({selectedValue: selectedValue});
                                                                    mapData["value"] =
                                                                        selectedValue;
                                                                    controller.dropdownMapperDataworkingArea[selectedValue] = list.firstWhere(
                                                                        (element) =>
                                                                            element.name ==
                                                                            selectedValue,
                                                                        orElse:
                                                                            null);
                                                                    Future.delayed(
                                                                        Duration
                                                                            .zero,
                                                                        () {
                                                                      //  setState(() {});
                                                                    });
                                                                  },
                                                                )
                                                              : (mapData['key'] ==
                                                                      "Sr_No")
                                                                  ? Text(
                                                                      "${controller.dropdownMapperData[record[0]['value']]?.serial_number ?? ""}")
                                                                  : (mapData['key'] ==
                                                                          "code")
                                                                      ? Text(
                                                                          "${controller.dropdownMapperData[record[0]['value']]?.asset_MDM_code ?? ""}")
                                                                      : (mapData['key'] ==
                                                                              "Material_Type")
                                                                          ? Text(
                                                                              "${controller.dropdownMapperData[record[0]['value']]?.asset_type ?? ""}")
                                                                          : (mapData['key'] == "Action ")
                                                                              ? Padding(
                                                                                  padding: EdgeInsets.only(top: 10),
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      TableActionButton(
                                                                                        color: ColorValues.appRedColor,
                                                                                        icon: Icons.delete,
                                                                                        label: '',
                                                                                        message: '',
                                                                                        onPress: () {
                                                                                          controller.rowItem.remove(record);
                                                                                        },
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              : (mapData['key'] == "Issued_Qty")
                                                                                  ? Text("${(controller.dropdownMapperData[record[0]['value']]?.issued_qty ?? 0)}")
                                                                                  : (mapData['key'] == "Used_Qty")
                                                                                      ? Text("${(controller.dropdownMapperData[record[0]['value']]?.used_qty ?? 0)}")
                                                                                      : (mapData['key'] == "Consumed_Qty")
                                                                                          ? Padding(
                                                                                              padding: const EdgeInsets.only(top: 10),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  boxShadow: [
                                                                                                    BoxShadow(
                                                                                                      color: Colors.black26,
                                                                                                      offset: const Offset(5.0, 5.0),
                                                                                                      blurRadius: 5.0,
                                                                                                      spreadRadius: 1.0,
                                                                                                    ),
                                                                                                  ],
                                                                                                  color: ColorValues.whiteColor,
                                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                                ),
                                                                                                child: LoginCustomTextfield(
                                                                                                  width: Get.width * 0.4,
                                                                                                  keyboardType: TextInputType.number,
                                                                                                  inputFormatters: <TextInputFormatter>[
                                                                                                    FilteringTextInputFormatter.digitsOnly
                                                                                                  ],
                                                                                                  // maxLines: 1,
                                                                                                  textController: TextEditingController(text: mapData["value"] ?? ''),
                                                                                                  onChanged: (txt) {
                                                                                                    int intialQty = int.tryParse(mapData['intialQty'] ?? "") ?? 0;
                                                                                                    num issuedQty = controller.dropdownMapperData[record[0]['value']]?.issued_qty ?? 0;
                                                                                                    mapData["value"] = txt;

                                                                                                    var data = controller.rowItem.value.where((element) => element[0]['value'] == record[0]['value']);

                                                                                                    int totalconsumed = 0;
                                                                                                    data.forEach((element) {
                                                                                                      totalconsumed = (totalconsumed + (int.tryParse("${element[7]['value']}") ?? 0));
                                                                                                    });

                                                                                                    if (txt.isNotEmpty) {
                                                                                                      if (totalconsumed > issuedQty) {
                                                                                                        setState(() {
                                                                                                          txt = intialQty.toString();
                                                                                                          mapData['value'] = intialQty.toString();
                                                                                                        });
                                                                                                        Fluttertoast.showToast(msg: "Enter appropriate consumed quantity.");
                                                                                                      }
                                                                                                    } else if (txt.isEmpty) {
                                                                                                      txt = intialQty.toString();
                                                                                                    }
                                                                                                    mapData["value"] = txt;
                                                                                                  },
                                                                                                ),
                                                                                              ))
                                                                                          : Text(mapData['value'] ?? ''),
                                                    );
                                                  }).toList(),
                                                );
                                              }).toList(),
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                  )
                            // : controller.listMrsByTaskId!.length > 0
                            //     ? Container(
                            //         margin: Dimens.edgeInsets20,
                            //         height:
                            //             controller.listMrsByTaskId!.length > 0
                            //                 ? ((controller.listMrsByTaskId
                            //                                 ?.length ??
                            //                             0) *
                            //                         40) +
                            //                     150
                            //                 : 55,
                            //         decoration: BoxDecoration(
                            //           border: Border.all(
                            //             color: ColorValues
                            //                 .lightGreyColorWithOpacity35,
                            //             width: 1,
                            //           ),
                            //           boxShadow: [
                            //             BoxShadow(
                            //               color: ColorValues
                            //                   .appBlueBackgroundColor,
                            //               spreadRadius: 2,
                            //               blurRadius: 5,
                            //               offset: Offset(0, 2),
                            //             ),
                            //           ],
                            //         ),
                            //         child: Column(
                            //           children: [
                            //             Container(
                            //               alignment: Alignment.topLeft,
                            //               padding: EdgeInsets.all(10),
                            //               child: Text(
                            //                 "Material Issue / Used",
                            //                 style: Styles.blue700,
                            //               ),
                            //             ),
                            //             Expanded(
                            //               child: DataTable2(
                            //                 border: TableBorder.all(
                            //                     color: Color.fromARGB(
                            //                         255, 206, 229, 234)),
                            //                 columns: [
                            //                   DataColumn2(
                            //                       fixedWidth: 100,
                            //                       label: Text(
                            //                         "Job Card Id",
                            //                         style: TextStyle(
                            //                             fontSize: 15,
                            //                             fontWeight:
                            //                                 FontWeight.bold),
                            //                       )),
                            //                   DataColumn2(
                            //                       fixedWidth: 130,
                            //                       label: Text(
                            //                         "MRS ID",
                            //                         style: TextStyle(
                            //                             fontSize: 15,
                            //                             fontWeight:
                            //                                 FontWeight.bold),
                            //                       )),
                            //                   DataColumn2(
                            //                       // fixedWidth: 200,
                            //                       label: Text(
                            //                     "Mrs Items List ",
                            //                     style: TextStyle(
                            //                         fontSize: 15,
                            //                         fontWeight:
                            //                             FontWeight.bold),
                            //                   )),
                            //                   DataColumn2(
                            //                       //  fixedWidth: 300,
                            //                       label: Text(
                            //                     "Status",
                            //                     style: TextStyle(
                            //                         fontSize: 15,
                            //                         fontWeight:
                            //                             FontWeight.bold),
                            //                   )),
                            //                   DataColumn2(
                            //                       fixedWidth: 300,
                            //                       label: Text(
                            //                         'Action',
                            //                         style: TextStyle(
                            //                             fontSize: 15,
                            //                             fontWeight:
                            //                                 FontWeight.bold),
                            //                       )),
                            //                 ],
                            //                 rows: List<DataRow>.generate(
                            //                   controller.listMrsByTaskId
                            //                           ?.length ??
                            //                       0,
                            //                   (index) => DataRow(cells: [
                            //                     DataCell(Text(controller
                            //                             .listMrsByTaskId?[
                            //                                 index]
                            //                             ?.jobCardId
                            //                             .toString() ??
                            //                         '')),
                            //                     DataCell(Text(controller
                            //                                 .listMrsByTaskId?[
                            //                                     index]
                            //                                 ?.is_mrs_return ==
                            //                             0
                            //                         ? "MRS${controller.listMrsByTaskId?[index]?.mrsId.toString() ?? ''}"
                            //                         : "RMRS${controller.listMrsByTaskId?[index]?.mrs_return_ID.toString() ?? ''}")),
                            //                     DataCell(Text(controller
                            //                             .listMrsByTaskId?[
                            //                                 index]
                            //                             ?.mrsItems ??
                            //                         '')),
                            //                     DataCell(Text(controller
                            //                             .listMrsByTaskId?[
                            //                                 index]
                            //                             ?.status_short ??
                            //                         '')),
                            //                     DataCell(Row(
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment
                            //                               .spaceEvenly,
                            //                       children: [
                            //                         TableActionButton(
                            //                             color: ColorValues
                            //                                 .viewColor,
                            //                             icon: Icons
                            //                                 .remove_red_eye,
                            //                             message: "View MRS",
                            //                             onPress: () {
                            //                               // controller
                            //                               //     .clearMrsIdStoreData();
                            //                               String mrsId = controller
                            //                                       .listMrsByTaskId?[
                            //                                           index]
                            //                                       ?.mrsId
                            //                                       .toString() ??
                            //                                   "";
                            //                               String rmrsId = controller
                            //                                       .listMrsByTaskId?[
                            //                                           index]
                            //                                       ?.mrs_return_ID
                            //                                       .toString() ??
                            //                                   "";

                            //                               print({
                            //                                 "mrsId": mrsId
                            //                               });
                            //                               rmrsId == "0"
                            //                                   ? Get.toNamed(
                            //                                       Routes
                            //                                           .mrsViewScreen,
                            //                                       arguments: {
                            //                                           'mrsId':
                            //                                               int.tryParse("$mrsId"),
                            //                                           'type':
                            //                                               1
                            //                                         })
                            //                                   : Get.toNamed(
                            //                                       Routes
                            //                                           .approverReturnMrs,
                            //                                       arguments: {
                            //                                           'mrsId':
                            //                                               rmrsId,
                            //                                           'type':
                            //                                               1
                            //                                         });
                            //                               ;
                            //                               // String mrsId = controller
                            //                               //         .listMrsByJobId?[
                            //                               //             index]
                            //                               //         ?.mrsId
                            //                               //         .toString() ??
                            //                               //     "";
                            //                               // print({
                            //                               //   "mrsId": mrsId
                            //                               // });
                            //                               // Get.toNamed(
                            //                               //     Routes
                            //                               //         .mrsViewScreen,
                            //                               //     arguments: {
                            //                               //       'mrsId': int
                            //                               //           .tryParse(
                            //                               //               "$mrsId"),
                            //                               //       'type': 1
                            //                               //     });
                            //                             }),
                            //                         controller
                            //                                         .listMrsByTaskId?[
                            //                                             index]
                            //                                         ?.status ==
                            //                                     323 ||
                            //                                 controller
                            //                                         .listMrsByTaskId?[
                            //                                             index]
                            //                                         ?.status ==
                            //                                     321 ||
                            //                                 controller
                            //                                         .listMrsByTaskId?[
                            //                                             index]
                            //                                         ?.status ==
                            //                                     324
                            //                             ? Dimens.box0
                            //                             : TableActionButton(
                            //                                 color: ColorValues
                            //                                     .editColor,
                            //                                 icon: Icons.edit,
                            //                                 message:
                            //                                     "Edit MRS",
                            //                                 onPress: () {
                            //                                   // controller
                            //                                   //     .clearMrsIdStoreData();
                            //                                   String mrsId = controller
                            //                                           .listMrsByTaskId?[
                            //                                               index]
                            //                                           ?.mrsId
                            //                                           .toString() ??
                            //                                       "";
                            //                                   String rmrsId = controller
                            //                                           .listMrsByTaskId?[
                            //                                               index]
                            //                                           ?.mrs_return_ID
                            //                                           .toString() ??
                            //                                       "";

                            //                                   print({
                            //                                     "mrsId": mrsId
                            //                                   });
                            //                                   rmrsId == "0"
                            //                                       ? Get.toNamed(
                            //                                           Routes
                            //                                               .editMrs,
                            //                                           arguments: {
                            //                                               'mrsId':
                            //                                                   int.tryParse("$mrsId"),
                            //                                               'type':
                            //                                                   1
                            //                                             })
                            //                                       : Get.toNamed(
                            //                                           Routes
                            //                                               .editReturnMrs,
                            //                                           arguments:
                            //                                               int.tryParse(rmrsId));
                            //                                   ;
                            //                                 })
                            //                       ],
                            //                     )),
                            //                   ]),
                            //                 ),
                            //               ),
                            //             ),

                            //             // Expanded(
                            //             //   child: ScrollableTableView(
                            //             //     columns: [
                            //             //       "Job Card ID",
                            //             //       "Mrs ID",
                            //             //       "Mrs Items List ",
                            //             //       "Status",
                            //             //       "Action",
                            //             //     ].map((column) {
                            //             //       return TableViewColumn(
                            //             //         label: column,
                            //             //         minWidth: Get.width * 0.15,
                            //             //       );
                            //             //     }).toList(),
                            //             //     rows: [
                            //             //       ...List.generate(
                            //             //         controller.listMrsByJobId
                            //             //                 ?.length ??
                            //             //             0,
                            //             //         (index) {
                            //             //           var getJobsLinkedMrsList =
                            //             //               controller
                            //             //                       .listMrsByJobId?[
                            //             //                   index];
                            //             //           return [
                            //             //             '${getJobsLinkedMrsList?.jobCardId}',
                            //             //             '${getJobsLinkedMrsList?.mrsId}',
                            //             //             '${getJobsLinkedMrsList?.mrsItems ?? ''}',
                            //             //             '${getJobsLinkedMrsList?.status_short ?? ''}',
                            //             //             'Action',
                            //             //           ];
                            //             //         },
                            //             //       ),
                            //             //     ].map((record) {
                            //             //       return TableViewRow(
                            //             //         height: 40,
                            //             //         cells: record.map((value) {
                            //             //           return TableViewCell(
                            //             //               child:
                            //             //                   value == 'Action'
                            //             //                       ? Row(
                            //             //                           children: [
                            //             //                             TableActionButton(
                            //             //                                 color: ColorValues
                            //             //                                     .viewColor,
                            //             //                                 icon: Icons
                            //             //                                     .remove_red_eye,
                            //             //                                 message:
                            //             //                                     "View MRS",
                            //             //                                 onPress:
                            //             //                                     () {
                            //             //                                   final _flutterSecureStorage = const FlutterSecureStorage();

                            //             //                                   _flutterSecureStorage.delete(key: "mrsId");
                            //             //                                   String mrsId = record[1];
                            //             //                                   if (mrsId != null) {
                            //             //                                     print({
                            //             //                                       "mrsId": mrsId
                            //             //                                     });
                            //             //                                     Get.toNamed(Routes.mrsViewScreen, arguments: {
                            //             //                                       'mrsId': int.tryParse("$mrsId")
                            //             //                                     });
                            //             //                                   }
                            //             //                                 }),
                            //             //                             TableActionButton(
                            //             //                                 color: ColorValues
                            //             //                                     .editColor,
                            //             //                                 icon: Icons
                            //             //                                     .edit,
                            //             //                                 message:
                            //             //                                     "Edit MRS",
                            //             //                                 onPress:
                            //             //                                     () {
                            //             //                                   final _flutterSecureStorage = const FlutterSecureStorage();

                            //             //                                   _flutterSecureStorage.delete(key: "mrsId");
                            //             //                                   String mrsId = record[1];
                            //             //                                   if (mrsId != null) {
                            //             //                                     print({
                            //             //                                       "mrsId": mrsId
                            //             //                                     });
                            //             //                                     Get.toNamed(Routes.editMrs, arguments: {
                            //             //                                       'mrsId': int.tryParse("$mrsId")
                            //             //                                     });
                            //             //                                   }
                            //             //                                 })
                            //             //                           ],
                            //             //                         )
                            //             //                       : Text(
                            //             //                           value));
                            //             //         }).toList(),
                            //             //       );
                            //             //     }).toList(),
                            //             //   ),
                            //             // ),
                            //           ],
                            //         ),
                            //       )
                            //     : Dimens.box0,
                            // Dimens.boxHeight20,
                            ,
                            SizedBox(height: 20),
                            Row(//
                                children: [
                              Text('History', style: Styles.blackBold16),
                            ]),

                            ///HISTORY
                            (controller.historyList != null &&
                                    controller.historyList!.isNotEmpty)
                                ? Container(
                                    margin: Dimens.edgeInsets20,
                                    height:
                                        ((controller.historyList?.length ?? 0) *
                                                40) +
                                            120,
                                    child: //
                                        HistoryTableWidgetWeb(
                                      historyList: controller.historyList,
                                    ),
                                  )
                                //  )
                                : //
                                Dimens.box0,

                            /// DESCRIPTION OF WORK DONE
                            (controller.jobCardDetailsModel.value!.status ==
                                    151)
                                ? Container()
                                : Row(children: [
                                    Text('Description of work done: '),
                                    Expanded(
                                      child: TextField(
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black),
                                        ),
                                        controller: controller
                                            .descriptionOfWorkDoneCtrlr,
                                        // enabled: controller.isJobCardStarted.value,
                                        decoration: InputDecoration(
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  ColorValues.appLightGreyColor,
                                              width: 1.0,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  ColorValues.appLightBlueColor,
                                              width: 1.0,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  ColorValues.appLightBlueColor,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        keyboardType: TextInputType.multiline,
                                        minLines: 5,
                                        maxLines: null,
                                      ),
                                    ),
                                  ]),

                            // Dimens.boxHeight20,
                            SizedBox(height: 20),

                            /// START JOB CARD BUTTON
                            controller
                                            .jobCardDetailsModel.value!.status ==
                                        151 &&
                                    controller.permitList
                                            ?.firstWhere((element) =>
                                                element.permitId != null)
                                            .status ==
                                        125
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center, //
                                    children: [
                                        CustomElevatedButton(
                                          text: 'Start',
                                          onPressed: () {
                                            var employeesNotDeployed =
                                                controller.employeesDeployed
                                                        .value.length ==
                                                    0;
                                            bool anyEmployeeNotSelected = false;
                                            if (employeesNotDeployed == false) {
                                              anyEmployeeNotSelected = controller
                                                  .employeesDeployed.value
                                                  .any((employeeList) =>
                                                      employeeList.any((employee) =>
                                                          employee['key'] ==
                                                              "Employee Name" &&
                                                          employee['value'] ==
                                                              "Please Select"));
                                            }

                                            var permitCondition = controller
                                                    .permitList
                                                    ?.firstWhere((element) =>
                                                        element.permitId !=
                                                        null)
                                                    .tbTDoneCheck ==
                                                1;

                                            if ((permitCondition &&
                                                    anyEmployeeNotSelected ==
                                                        true &&
                                                    employeesNotDeployed ==
                                                        false ||
                                                permitCondition &&
                                                    employeesNotDeployed ==
                                                        true)) {
                                              Get.defaultDialog(
                                                radius: 5,
                                                title: 'Alert',
                                                middleText:
                                                    'Please select team members!',
                                                textConfirm: 'OK',
                                                onConfirm: () {
                                                  Get.back(); // Close the dialog
                                                },
                                                buttonColor:
                                                    ColorValues.appGreenColor,
                                                confirmTextColor: Colors.white,
                                              );
                                            } else if ((controller.permitList
                                                        ?.firstWhere(
                                                            (element) =>
                                                                element
                                                                    .permitId !=
                                                                null)
                                                        .tbTDoneCheck ==
                                                    1) &&
                                                // employeesNotDeployed == true &&
                                                anyEmployeeNotSelected ==
                                                    false &&
                                                employeesNotDeployed == false) {
                                              controller.startJobCard(
                                                jcCard:
                                                    controller.jobCardId.value,
                                                fileIds:
                                                    dropzoneController.fileIds,
                                              );
                                            } else if (controller.permitList
                                                        ?.firstWhere(
                                                            (element) =>
                                                                element
                                                                    .permitId !=
                                                                null)
                                                        .tbTDoneCheck ==
                                                    0 &&
                                                controller.permitList
                                                        ?.firstWhere(
                                                            (element) =>
                                                                element
                                                                    .permitId !=
                                                                null)
                                                        .tbt_start ==
                                                    0) {
                                              Get.defaultDialog(
                                                  radius: 5,
                                                  title: 'Alert',
                                                  middleText:
                                                      'Unable to start task due to permit taken for date and time ',
                                                  textConfirm: 'OK',
                                                  onConfirm: () {
                                                    Get.back(); // Close the dialog
                                                    // Get.offAllNamed(Routes.pmTask);
                                                  },
                                                  buttonColor:
                                                      ColorValues.appGreenColor,
                                                  confirmTextColor:
                                                      Colors.white,
                                                  barrierDismissible: false);
                                            } else if (controller.permitList
                                                    ?.firstWhere((element) =>
                                                        element.permitId !=
                                                        null)
                                                    .tbTDoneCheck ==
                                                0) {
                                              Get.dialog<void>(TbtDoneBMDialog(
                                                ptw_id: controller
                                                        .jobCardDetailsModel
                                                        .value
                                                        ?.ptwId ??
                                                    0,
                                                id: controller
                                                        .jobCardDetailsModel
                                                        .value
                                                        ?.id ??
                                                    0,
                                              ));
                                            }
                                          },
                                          backgroundColor:
                                              ColorValues.addNewColor,
                                        ),

                                        // CustomElevatedButton(
                                        //   text: 'Update',
                                        //   onPressed: () => controller.updateJobCard(),
                                        //   backgroundColor: ColorValues.appYellowColor,
                                        // ),
                                      ])
                                : controller.jobCardDetailsModel.value!
                                                .status ==
                                            157 ||
                                        controller.jobCardDetailsModel.value!
                                                .status ==
                                            152 ||
                                        controller.jobCardDetailsModel.value!
                                                .status ==
                                            154
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        //
                                        children: [
                                            CustomElevatedButton(
                                              text: 'Cancel',
                                              onPressed: () =>
                                                  controller.startStopJobCard(),
                                              backgroundColor:
                                                  ColorValues.appRedColor,
                                            ),
                                            // Dimens.boxWidth10,
                                            SizedBox(width: 10),
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kJobCardFeatureId &&
                                                            e.edit ==
                                                                UserAccessConstants
                                                                    .kHaveEditAccess)
                                                        .length >
                                                    0
                                                ? CustomElevatedButton(
                                                    text: 'Update',
                                                    backgroundColor: ColorValues
                                                        .appYellowColor,
                                                    onPressed: () async {
                                                      bool? confirmed =
                                                          await showConfirmationDialog(
                                                        context,
                                                        'Are you sure you want to Update job ?',
                                                      );
                                                      if (confirmed == true) {
                                                        controller.updateJobCard(
                                                            fileIds:
                                                                dropzoneController
                                                                    .fileIds);
                                                        if (controller
                                                                    .listMrsByTaskId!
                                                                    .value
                                                                    .firstWhereOrNull(
                                                                      (element) =>
                                                                          element?.jobCardId !=
                                                                              0 ||
                                                                          element?.pmId !=
                                                                              0,
                                                                    )
                                                                    ?.mrs_return_ID ==
                                                                0 &&
                                                            controller.allTrue
                                                                    .value ==
                                                                false &&
                                                            controller
                                                                .cmmrsItems!
                                                                .isNotEmpty) {
                                                          controller
                                                              .transferItem();
                                                        }

                                                        Text(
                                                            'Are you sure you want to Update job ?');
                                                      }
                                                    },
                                                  )
                                                : Dimens.box0,
                                            // Dimens.boxWidth10,
                                            SizedBox(width: 10),
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kJobCardFeatureId &&
                                                            e.add ==
                                                                UserAccessConstants
                                                                    .kHaveAddAccess)
                                                        .length >
                                                    0
                                                ? CustomElevatedButton(
                                                    backgroundColor: ColorValues
                                                        .appGreenColor,
                                                    text: 'Close Job',
                                                    onPressed: () async {
                                                      bool? confirmed =
                                                          await showConfirmationDialog(
                                                        context,
                                                        'Are you sure you want to Close Job ?',
                                                      );
                                                      if (confirmed == true) {
                                                        // Check if the listMrsByTaskId is not null and is not empty
                                                        if (controller
                                                                    .listMrsByTaskId !=
                                                                null &&
                                                            controller
                                                                .listMrsByTaskId!
                                                                .isNotEmpty) {
                                                          // Find the first element that meets the condition
                                                          var element = controller
                                                              .listMrsByTaskId!
                                                              .firstWhereOrNull(
                                                                  (element) => (element!
                                                                              .jobCardId !=
                                                                          0 ||
                                                                      element.pmId !=
                                                                          0));

                                                          // Check if the conditions are met
                                                          if (element != null &&
                                                              element.mrs_return_ID ==
                                                                  0 &&
                                                              controller.allTrue
                                                                      .value ==
                                                                  false) {
                                                            Get.defaultDialog(
                                                              radius: 5,
                                                              title: 'Alert',
                                                              middleText:
                                                                  'Please return all items first!',
                                                              textConfirm: 'OK',
                                                              onConfirm: () {
                                                                Get.back(); // Close the dialog
                                                              },
                                                              buttonColor:
                                                                  ColorValues
                                                                      .appGreenColor,
                                                              confirmTextColor:
                                                                  Colors.white,
                                                            );
                                                          } else {
                                                            controller.closeJob(
                                                              fileIds:
                                                                  dropzoneController
                                                                      .fileIds,
                                                            );
                                                          }
                                                        } else {
                                                          // Handle the case where the list is null or empty if needed
                                                          controller.closeJob(
                                                            fileIds:
                                                                dropzoneController
                                                                    .fileIds,
                                                          );
                                                        }

                                                        // This Text widget seems misplaced, ensure it is used correctly in your UI
                                                        Text(
                                                            'Are you sure you want to Close Job ?');
                                                      }
                                                    },
                                                  )
                                                : Container(),
                                            // Dimens.boxWidth10,
                                            SizedBox(width: 10),
                                            CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appLightBlueColor,
                                              text: 'Carry Forward Job',
                                              onPressed: () async {
                                                bool? confirmed =
                                                    await showConfirmationDialog(
                                                  context,
                                                  'Are you sure you want to Carry Forward Job ?',
                                                );
                                                if (confirmed == true) {
                                                  // Check if the listMrsByTaskId is not null and is not empty
                                                  if (controller
                                                              .listMrsByTaskId !=
                                                          null &&
                                                      controller
                                                          .listMrsByTaskId!
                                                          .isNotEmpty) {
                                                    // Find the first element that meets the condition
                                                    var element = controller
                                                        .listMrsByTaskId!
                                                        .firstWhereOrNull(
                                                            (element) => (element!
                                                                        .jobCardId !=
                                                                    0 ||
                                                                element.pmId !=
                                                                    0));

                                                    // Check if the conditions are met
                                                    if (element != null &&
                                                        element.mrs_return_ID ==
                                                            0 &&
                                                        controller.allTrue
                                                                .value ==
                                                            false) {
                                                      Get.defaultDialog(
                                                        radius: 5,
                                                        title: 'Alert',
                                                        middleText:
                                                            'Please return all items first!',
                                                        textConfirm: 'OK',
                                                        onConfirm: () {
                                                          Get.back(); // Close the dialog
                                                        },
                                                        buttonColor: ColorValues
                                                            .appGreenColor,
                                                        confirmTextColor:
                                                            Colors.white,
                                                      );
                                                    } else {
                                                      controller.carryForwardJob(
                                                          fileIds:
                                                              dropzoneController
                                                                  .fileIds);
                                                    }
                                                  } else {
                                                    // Handle the case where the list is null or empty if needed
                                                    controller.carryForwardJob(
                                                        fileIds:
                                                            dropzoneController
                                                                .fileIds);
                                                  }

                                                  // This Text widget seems misplaced, ensure it is used correctly in your UI
                                                  Text(
                                                      'Are you sure you want to Close Job ?');
                                                }
                                                // if (confirmed == true) {
                                                //   controller.listMrsByTaskId!
                                                //                   .value
                                                //                   .firstWhereOrNull(
                                                //                       (element) =>
                                                //                           element!.jobCardId !=
                                                //                               0 ||
                                                //                           element.pmId !=
                                                //                               0)!
                                                //                   .mrs_return_ID ==
                                                //               0 &&
                                                //           controller.allTrue
                                                //                   .value ==
                                                //               false
                                                //       ? Get.defaultDialog(
                                                //           radius: 5,
                                                //           title: 'Alert',
                                                //           middleText:
                                                //               'Please return all items first!',
                                                //           textConfirm: 'OK',
                                                //           onConfirm: () {
                                                //             Get.back(); // Close the dialog
                                                //           },
                                                //           buttonColor: ColorValues
                                                //               .appGreenColor,
                                                //           confirmTextColor:
                                                //               Colors.white,
                                                //         )
                                                //       : controller.carryForwardJob(
                                                //           fileIds:
                                                //               dropzoneController
                                                //                   .fileIds);

                                                //   Text(
                                                //       'Are you sure you want to Carry Forward Job ?');
                                                // }
                                              },
                                            ),
                                            // Dimens.boxWidth10,
                                            SizedBox(width: 10),
                                            controller.listMrsByTaskId!.value
                                                            .firstWhereOrNull(
                                                              (element) =>
                                                                  element?.jobCardId !=
                                                                      0 ||
                                                                  element?.pmId !=
                                                                      0,
                                                            )
                                                            ?.mrs_return_ID ==
                                                        0 &&
                                                    controller.allTrue.value ==
                                                        false
                                                ? CustomElevatedButton(
                                                    icon: Icons
                                                        .keyboard_return_outlined,
                                                    backgroundColor: ColorValues
                                                        .linktopermitColor,
                                                    text: "Return Mrs",
                                                    onPressed: () {
                                                      controller
                                                          .clearMrsIdStoreData();
                                                      controller
                                                          .clearJobIdStoreData();

                                                      controller
                                                          .clearTypeValue();
                                                      controller
                                                          .clearStoreTaskData();
                                                      controller
                                                          .clearStoreTaskActivityData();
                                                      controller
                                                          .clearStoreTasktoActorData();
                                                      controller
                                                          .clearStoreTaskWhereUsedData();
                                                      controller
                                                          .clearStoreTaskfromActorData();

                                                      controller.getMrsListByModule(
                                                          jobId: controller
                                                                  .jobCardDetailsModel
                                                                  .value
                                                                  ?.jobId ??
                                                              0);
                                                      // controller.clearStoreTaskData();
                                                      // controller
                                                      //     .clearStoreTaskActivityData();
                                                      // controller
                                                      //     .clearStoreTasktoActorData();
                                                      // controller
                                                      //     .clearStoreTaskWhereUsedData();
                                                      // controller
                                                      //     .clearStoreTaskfromActorData();

                                                      Get.toNamed(
                                                          Routes
                                                              .mrsReturnScreen,
                                                          arguments: {
                                                            'type': 1,
                                                            'jobId': controller
                                                                .jobId.value,
                                                            "whereUsed": 4,
                                                            "fromActorTypeId":
                                                                4,
                                                            "to_actor_type_id":
                                                                2,
                                                            "pmTaskId":
                                                                controller
                                                                    .jobCardId
                                                                    .value,
                                                            "activity": controller
                                                                .jobDetailsModel
                                                                .value
                                                                ?.jobTitle,
                                                            "mrsId": controller
                                                                    .listMrsByTaskId!
                                                                    .firstWhere(
                                                                        (element) =>
                                                                            element?.mrsId !=
                                                                            0,
                                                                        orElse:
                                                                            null)!
                                                                    .mrsId ??
                                                                0
                                                          });
                                                    },
                                                  )
                                                : Dimens.box0
                                          ])
                                    : controller.jobCardDetailsModel.value!
                                                .status ==
                                            153
                                        // ||
                                        //         controller.jobCardList[0]!.status ==
                                        //             156
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            //
                                            children: [
                                                CustomElevatedButton(
                                                  text: 'Cancel',
                                                  onPressed: () => controller
                                                      .startStopJobCard(),
                                                  backgroundColor:
                                                      ColorValues.appRedColor,
                                                ),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                CustomElevatedButton(
                                                  backgroundColor: ColorValues
                                                      .appYellowColor,
                                                  text: 'Update',
                                                  onPressed: () async {
                                                    bool? confirmed =
                                                        await showConfirmationDialog(
                                                      context,
                                                      'Are you sure you want to Update job ?',
                                                    );
                                                    if (confirmed == true) {
                                                      controller.updateJobCard(
                                                          fileIds:
                                                              dropzoneController
                                                                  .fileIds);

                                                      Text(
                                                          'Are you sure you want to Update job ?');
                                                    }
                                                  },
                                                ),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                // CustomElevatedButton(
                                                //   backgroundColor:
                                                //       ColorValues.approveColor,
                                                //   text: 'Approve',
                                                //   onPressed: () async {
                                                //     bool? confirmed =
                                                //         await showConfirmationDialog(
                                                //       context,
                                                //       'Are you sure you want to Approve ?',
                                                //     );
                                                //     if (confirmed == true) {
                                                // controller.approveJobCards();

                                                //       Text(
                                                //           'Are you sure you want to Approve ?');
                                                //     }
                                                //   },
                                                // ),

                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),

                                                varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id ==
                                                                        4 &&
                                                                    e.approve ==
                                                                        1)
                                                                .length >
                                                            0 &&
                                                        controller
                                                                .jobCardDetailsModel
                                                                .value!
                                                                .status ==
                                                            153
                                                    //         ||
                                                    // varUserAccessModel.value
                                                    //             .access_list!
                                                    //             .where((e) =>
                                                    //                 e.feature_id ==
                                                    //                     4 &&
                                                    //                 e.approve ==
                                                    //                     1)
                                                    //             .length >
                                                    //         0 &&
                                                    //     controller
                                                    //             .jobCardList[0]!
                                                    //             .status ==
                                                    //         156
                                                    ? Container(
                                                        height: 30,
                                                        child:
                                                            CustomElevatedButton(
                                                          backgroundColor:
                                                              ColorValues
                                                                  .appGreenColor,
                                                          text: "Approve",
                                                          icon: Icons.check,
                                                          onPressed: () {
                                                            // controller
                                                            //     .createNewPermit();
                                                            Get.dialog(
                                                                JobCardApproveDialog(
                                                              JobCardId:
                                                                  '${controller.jobCardId.value}',
                                                              // ptwStatus:
                                                              //     '${controller.viewPermitDetailsModel.value?.ptwStatus}'
                                                            ));
                                                          },
                                                        ))
                                                    : Container(),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id ==
                                                                        4 &&
                                                                    e.approve ==
                                                                        1)
                                                                .length >
                                                            0 &&
                                                        controller
                                                                .jobCardDetailsModel
                                                                .value!
                                                                .status ==
                                                            153
                                                    //          ||
                                                    // varUserAccessModel.value
                                                    //             .access_list!
                                                    //             .where((e) =>
                                                    //                 e.feature_id ==
                                                    //                     4 &&
                                                    //                 e.approve ==
                                                    //                     1)
                                                    //             .length >
                                                    //         0 &&
                                                    //     controller
                                                    //             .jobCardList[0]!
                                                    //             .status ==
                                                    //         156
                                                    ? Container(
                                                        height: 30,
                                                        child:
                                                            CustomElevatedButton(
                                                          backgroundColor:
                                                              ColorValues
                                                                  .rejectColor,
                                                          text: "Reject",
                                                          icon: Icons.add,
                                                          onPressed: () {
                                                            // controller
                                                            //     .createNewPermit();
                                                            Get.dialog(
                                                                JobCardRejectDialog(
                                                              JobCardId:
                                                                  '${controller.jobCardId.value}',
                                                              // ptwStatus:
                                                              //     '${controller.viewPermitDetailsModel.value?.ptwStatus}'
                                                            ));
                                                          },
                                                        ))
                                                    : Container(),
                                              ])
                                        : controller.jobCardDetailsModel.value!
                                                    .status ==
                                                156
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                //
                                                children: [
                                                    Container(
                                                        height: 30,
                                                        child:
                                                            CustomElevatedButton(
                                                          backgroundColor:
                                                              ColorValues
                                                                  .appGreenColor,
                                                          text: "Approve",
                                                          icon: Icons.check,
                                                          onPressed: () {
                                                            // controller
                                                            //     .createNewPermit();
                                                            Get.dialog(
                                                                JobCardApproveDialog(
                                                              JobCardId:
                                                                  '${controller.jobCardId.value}',
                                                              type: 1,
                                                              // ptwStatus:
                                                              //     '${controller.viewPermitDetailsModel.value?.ptwStatus}'
                                                            ));
                                                          },
                                                        )),
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 10),
                                                    Container(
                                                        height: 30,
                                                        child:
                                                            CustomElevatedButton(
                                                          backgroundColor:
                                                              ColorValues
                                                                  .rejectColor,
                                                          text: "Reject",
                                                          icon: Icons.add,
                                                          onPressed: () {
                                                            // controller
                                                            //     .createNewPermit();
                                                            Get.dialog(
                                                                JobCardRejectDialog(
                                                              JobCardId:
                                                                  '${controller.jobCardId.value}',
                                                              type: 1,
                                                              // ptwStatus:
                                                              //     '${controller.viewPermitDetailsModel.value?.ptwStatus}'
                                                            ));
                                                          },
                                                        ))
                                                  ])
                                            : Container(),
                            Dimens.boxHeight10,
                            Center(
                              child: Container(
                                height: 35,
                                child: CustomElevatedButton(
                                  icon: Icons.print,
                                  backgroundColor:
                                      ColorValues.linktopermitColor,
                                  text: "print",
                                  onPressed: () {
                                    controller.generateInvoice();
                                  },
                                ),
                              ),
                            ),

                            // Dimens.boxHeight20,
                            SizedBox(height: 20),
                          ]),
                    ),
                  );
                } //
                catch (e) {
                  print(e);
                  return Dimens.box0;
                }
              }),
            ),
          ),
        ],
      );
    }));
  }
}

class DeployedTeam extends StatelessWidget {
  final JobCardDetailsController controller = Get.find();
  DeployedTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: Dimens.edgeInsets20,
        height: ((controller.employeesDeployed.value.length) * 60) + 170,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorValues.lightGreyColorWithOpacity35,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 237, 240, 242),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Team Deployed To Carry Out The Job",
                    style: Styles.blue700,
                  ),
                  controller.jobCardDetailsModel.value!.status == 158 ||
                          controller.jobCardDetailsModel.value!.status == 156
                      ? Dimens.box0
                      : InkWell(
                          onTap: () {
                            controller.addEmployeesDeployed();
                          },
                          child: Container(
                            height: 25,
                            width: 90,
                            decoration: BoxDecoration(
                              color: ColorValues.addNewColor,
                              border: Border.all(
                                color: ColorValues.lightGreyColorWithOpacity35,
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Center(
                              child: Text(
                                " + Add ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Expanded(
              child: DataTable2(
                columnSpacing: 10,
                dataRowHeight: 70,
                border: TableBorder.all(
                  color: Color.fromARGB(255, 206, 229, 234),
                ),
                columns: [
                  DataColumn2(
                    label: Text("Employee Name"),
                  ),
                  DataColumn2(
                    label: Text("Designation"),
                  ),
                  DataColumn2(
                    label: Text("Action"),
                  ),
                ],
                rows: controller.employeesDeployed.value.map(
                  (record) {
                    return DataRow(
                      cells: record.map(
                        (mapData) {
                          return DataCell(
                            (mapData['key'] == "Employee Name")
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IgnorePointer(
                                          ignoring: controller
                                                  .jobCardDetailsModel
                                                  .value!
                                                  .status ==
                                              158,
                                          child: DropdownWebWidget(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            dropdownList:
                                                controller.employeeList,
                                            selectedValue: mapData["value"],
                                            onValueChanged:
                                                (list, selectedValue) {
                                              mapData["value"] = selectedValue;
                                              controller.deployedEmployeeMapperData[
                                                      selectedValue] =
                                                  list.firstWhere(
                                                      (element) =>
                                                          element.name ==
                                                          selectedValue,
                                                      orElse: null);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : (mapData['key'] == "Designation")
                                    ? Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller
                                                          .deployedEmployeeMapperData[
                                                              record[0]
                                                                  ['value']]
                                                          ?.designation ==
                                                      null
                                                  ? "No Designation"
                                                  : "${controller.deployedEmployeeMapperData[record[0]['value']]?.designation}",
                                            ),
                                          ],
                                        ),
                                      )
                                    : (mapData['key'] == "Action")
                                        ? Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                IgnorePointer(
                                                  ignoring: controller
                                                          .jobCardDetailsModel
                                                          .value!
                                                          .status ==
                                                      158,
                                                  child: TableActionButton(
                                                    color:
                                                        ColorValues.appRedColor,
                                                    icon: Icons.delete,
                                                    label: '',
                                                    message: '',
                                                    onPress: () {
                                                      controller
                                                          .employeesDeployed
                                                          .remove(record);
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : Text(mapData['key'] ?? ''),
                          );
                        },
                      ).toList(),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
