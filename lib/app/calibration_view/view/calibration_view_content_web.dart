import 'package:cmms/app/calibration_View/calibration_View_controller.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/url_path.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/color_values.dart';
import '../../theme/dimens.dart';
import '../../theme/styles.dart';

class CalibrationViewContentWeb extends GetView<CalibrationViewController> {
  CalibrationViewContentWeb({super.key});

  ///
  var controller = Get.find<CalibrationViewController>();
  final FileUploadController dropzoneController =
      Get.put(FileUploadController( apiUrl: UrlPath.deployUrl + 'api/FileUpload/UploadFile',));
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Obx(
        () => Column(
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
                      Get.offNamed(Routes.calibrationList);
                    },
                    child: Text(" / CALIBRATION LIST",
                        style: Styles.greyMediumLight12),
                  ),
                  Text(
                    " / CALIBRATION VIEW",
                    style: Styles.greyMediumLight12,
                  ),
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Card(
                    color: Color.fromARGB(255, 245, 248, 250),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Calibration Views",
                                style: TextStyle(
                                    color: ColorValues.appDarkBlueColor),
                                // style: Styles.blackBold16,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Calibration ID:",
                              style: Styles.black17,
                            ),
                            Text(
                              "${controller.calibrationDetailModel.value?.calibrationId ?? ""}",
                              style: Styles.blue17,
                            ),
                            Dimens.boxWidth8,
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomElevatedButton(
                                text:
                                    "${controller.calibrationDetailModel.value?.statusShort ?? ""}",
                                onPressed: () {},
                                backgroundColor: controller
                                            .calibrationDetailModel
                                            .value
                                            ?.statusId ==
                                        218
                                    ? ColorValues.appRedColor
                                    : controller.calibrationDetailModel.value?.statusId ==
                                            211
                                        ? ColorValues.blueColor
                                        : controller.calibrationDetailModel
                                                    .value?.statusId ==
                                                214
                                            ? ColorValues.appGreenColor
                                            : controller.calibrationDetailModel
                                                        .value?.statusId ==
                                                    213
                                                ? ColorValues
                                                    .rejectedStatusColor
                                                : controller.calibrationDetailModel
                                                            .value?.statusId ==
                                                        217
                                                    ? ColorValues.closeColor
                                                    : controller
                                                                .calibrationDetailModel
                                                                .value
                                                                ?.statusId ==
                                                            212
                                                        ? ColorValues
                                                            .carryfarwordColor
                                                        : controller
                                                                    .calibrationDetailModel
                                                                    .value
                                                                    ?.statusId ==
                                                                215
                                                            ? ColorValues
                                                                .startColor
                                                            : controller
                                                                        .calibrationDetailModel
                                                                        .value
                                                                        ?.statusId ==
                                                                    216
                                                                ? ColorValues.completeColor
                                                                : controller.calibrationDetailModel.value?.statusId == 218
                                                                    ? ColorValues.approveColor
                                                                    : controller.calibrationDetailModel.value?.statusId == 220
                                                                        ? ColorValues.rejectedStatusColor
                                                                        : ColorValues.appDarkBlueColor,
                                textColor: ColorValues.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: ColorValues.greyLightColour,
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Equipment Name:',
                                        style: Styles.black17,
                                      ),
                                      Dimens.boxHeight10,
                                      Text(
                                        'Vender Name:',
                                        style: Styles.black17,
                                      ),
                                      Dimens.boxHeight10,
                                      Text(
                                        'Started Date:',
                                        style: Styles.black17,
                                      ),
                                      Dimens.boxHeight10,
                                      Text(
                                        'Last Done Date:',
                                        style: Styles.black17,
                                      ),
                                      Dimens.boxHeight10,
                                      Text(
                                        'Calibration Done Date:',
                                        style: Styles.black17,
                                      ),
                                    ],
                                  ),
                                  Dimens.boxWidth5,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${controller.calibrationDetailModel.value?.assetName ?? ""}",
                                          style: Styles.blue17),
                                      Dimens.boxHeight10,
                                      Text(
                                          "${controller.calibrationDetailModel.value?.vendorName ?? ""}",
                                          style: Styles.blue17),
                                      Dimens.boxHeight10,
                                      Text(
                                          "${controller.calibrationDetailModel.value?.startedAt ?? ""}",
                                          style: Styles.blue17),
                                      Dimens.boxHeight10,
                                      Text(
                                          "${controller.calibrationDetailModel.value?.lastCalibrationDate ?? ""}",
                                          style: Styles.blue17),
                                      Dimens.boxHeight10,
                                      Text(
                                          "${controller.calibrationDetailModel.value?.completedAt ?? ""}",
                                          style: Styles.blue17),
                                      Dimens.boxHeight10,
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Equipment Category:',
                                        style: Styles.black17,
                                      ),
                                      Dimens.boxHeight10,
                                      Text(
                                        'Responsible Person:',
                                        style: Styles.black17,
                                      ),
                                      Dimens.boxHeight10,
                                      Text(
                                        'Requested Date:',
                                        style: Styles.black17,
                                      ),
                                      Dimens.boxHeight10,
                                      Text(
                                        'Due date:',
                                        style: Styles.black17,
                                      ),
                                    ],
                                  ),
                                  Dimens.boxWidth5,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${controller.calibrationDetailModel.value?.categoryName ?? ""}",
                                          style: Styles.blue17),
                                      Dimens.boxHeight10,
                                      Text(
                                          "${controller.calibrationDetailModel.value?.responsiblePerson ?? ""}",
                                          style: Styles.blue17),
                                      Dimens.boxHeight10,
                                      Text(
                                          "${controller.calibrationDetailModel.value?.requestedAt ?? ""}",
                                          style: Styles.blue17),
                                      Dimens.boxHeight10,
                                      Text(
                                          "${controller.calibrationDetailModel.value?.calibrationDate ?? ""}",
                                          style: Styles.blue17),
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              ),

                              controller.calibrationId.value > 0 &&
                                      controller.calibrationDetailModel.value
                                              ?.file_list_calibration !=
                                          null &&
                                      controller.calibrationDetailModel.value!
                                          .file_list_calibration!.isNotEmpty
                                  ? Container(
                                      // width:
                                      //     MediaQuery.of(context).size.width /
                                      //         1.2,
                                      height: ((controller
                                                  .calibrationDetailModel
                                                  .value!
                                                  .file_list_calibration!
                                                  .length) *
                                              41) +
                                          117,
                                      margin: Dimens.edgeInsets20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.withOpacity(.3)),
                                      ),

                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Assets Calibration Certificates ",
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
                                              dataRowHeight: 40,
                                              columns: [
                                                DataColumn(
                                                  label: Text(
                                                    "File Description",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    "Created By",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    "Created Time",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    "View",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              rows: List<DataRow>.generate(
                                                controller
                                                        .calibrationDetailModel
                                                        .value!
                                                        .file_list_calibration
                                                        ?.length ??
                                                    0,
                                                (index) => DataRow(
                                                  cells: [
                                                    DataCell(Text(
                                                      controller
                                                              .calibrationDetailModel
                                                              .value!
                                                              .file_list_calibration![
                                                                  index]
                                                              .description
                                                              .toString() ??
                                                          '',
                                                    )),
                                                    DataCell(Text(
                                                      controller
                                                              .calibrationDetailModel
                                                              .value!
                                                              .file_list_calibration![
                                                                  index]
                                                              .created_by
                                                              .toString() ??
                                                          '',
                                                    )),
                                                    DataCell(Text(
                                                      controller
                                                              .calibrationDetailModel
                                                              .value!
                                                              .file_list_calibration![
                                                                  index]
                                                              .created_at
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
                                                            icon: Icons
                                                                .visibility,
                                                            message: 'view',
                                                            onPress: () async {
                                                              String baseUrl =
                                                                  UrlPath
                                                                      .deployUrl;
                                                              String fileName = controller
                                                                      .calibrationDetailModel
                                                                      .value!
                                                                      .file_list_calibration![
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
                                                              // String baseUrl = UrlPath.deployUrl;
                                                            },
                                                          ),
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

                              controller.calibrationId.value > 0 &&
                                      controller.calibrationDetailModel.value
                                              ?.fileList !=
                                          null &&
                                      controller.calibrationDetailModel.value!
                                          .fileList!.isNotEmpty
                                  ? Container(
                                      // width:
                                      //     MediaQuery.of(context).size.width /
                                      //         1.2,
                                      height: ((controller.file_list!.length) *
                                              41) +
                                          117,
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.withOpacity(.3)),
                                      ),

                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Calibration Certificates And Damaged Files ",
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
                                              dataRowHeight: 40,
                                              columns: [
                                                DataColumn(
                                                  label: Text(
                                                    "File Description",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    "Created By",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    "Created Time",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    "View Image",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              rows: List<DataRow>.generate(
                                                controller.file_list?.length ??
                                                    0,
                                                (index) => DataRow(
                                                  cells: [
                                                    DataCell(Text(
                                                      controller
                                                              .file_list![index]
                                                              ?.description
                                                              .toString() ??
                                                          '',
                                                    )),
                                                    DataCell(Text(
                                                      controller
                                                              .file_list![index]
                                                              ?.created_by
                                                              .toString() ??
                                                          '',
                                                    )),
                                                    DataCell(Text(
                                                      controller
                                                              .file_list![index]
                                                              ?.created_at
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
                                                            icon: Icons
                                                                .visibility,
                                                            message: 'view',
                                                            onPress: () async {
                                                              String baseUrl =
                                                                  UrlPath
                                                                      .deployUrl;
                                                              String fileName = controller
                                                                      .file_list![
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
                                                              // String baseUrl = UrlPath.deployUrl;
                                                            },
                                                          ),
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
                              controller.calibrationDetailModel.value
                                              ?.statusId ==
                                          215 ||
                                      controller.calibrationDetailModel.value
                                              ?.statusId ==
                                          220
                                  ? Container(
                                      height: Get.height * 0.2,
                                      width: Get.width,
                                      margin:
                                          EdgeInsets.only(left: 16, right: 16),
                                      // padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child:
                                                FileUploadWidgetWithDropzone(),
                                          ),
                                          Dimens.boxWidth10,
                                          Expanded(
                                            flex: 8,
                                            child:
                                                FileUploadDetailsWidgetWeb2(),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Dimens.box0,
                              Dimens.boxHeight10,
                              controller.calibrationDetailModel.value?.statusId == 211 ||
                                      controller.calibrationDetailModel.value?.statusId ==
                                          212 ||
                                      controller.calibrationDetailModel.value?.statusId ==
                                          213 ||
                                      controller.calibrationDetailModel.value
                                              ?.statusId ==
                                          214
                                  ? Dimens.box0
                                  : IgnorePointer(
                                      ignoring: controller
                                                      .calibrationDetailModel
                                                      .value
                                                      ?.statusId ==
                                                  211 ||
                                              controller.calibrationDetailModel
                                                      .value?.statusId ==
                                                  212 ||
                                              controller.calibrationDetailModel
                                                      .value?.statusId ==
                                                  213 ||
                                              controller.calibrationDetailModel
                                                      .value?.statusId ==
                                                  214 ||
                                              controller.calibrationDetailModel
                                                      .value?.statusId ==
                                                  215 ||
                                              controller.calibrationDetailModel
                                                      .value?.statusId ==
                                                  220
                                          ? false
                                          : true,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Any Damages:",
                                              style: Styles.blackBold15,
                                            ),
                                            Dimens.boxWidth10,
                                            CustomSwitchTroggle(
                                                value:
                                                    controller.isToggleOn.value,
                                                onChanged: (value) {
                                                  controller.toggle();
                                                }),
                                          ],
                                        ),
                                      )),

                              (controller.historyList != null &&
                                      controller.historyList!.isNotEmpty)
                                  ? Container(
                                      margin: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          bottom: 20,
                                          top: 10),
                                      height:
                                          ((controller.historyList?.length ??
                                                      0) *
                                                  40) +
                                              120,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorValues
                                              .lightGreyColorWithOpacity35,
                                          width: 1,
                                        ),
                                      ),
                                      child: //
                                          Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Calibration History ",
                                                  style: Styles.blue700,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: HistoryTableWidgetWeb(
                                              historyList:
                                                  controller.historyList,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  //  )
                                  : //
                                  Dimens.box0,

                              controller.calibrationDetailModel.value
                                              ?.statusId ==
                                          214 ||
                                      controller.calibrationDetailModel.value
                                              ?.statusId ==
                                          221
                                  ? Dimens.box0
                                  : Container(
                                      margin: Dimens.edgeInsets15,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomRichText(title: "Comment:"),
                                          Dimens.boxWidth10,
                                          LoginCustomTextfield(
                                            width: (Get.width * .6),
                                            maxLine: 5,
                                            textController:
                                                controller.commentCtrlr,
                                          ),
                                        ],
                                      ),
                                    ),
                              //  : Dimens.box0,
                              //  Dimens.boxHeight30,
                              // ,
                              Container(
                                margin: EdgeInsets.only(bottom: 40, top: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Container(
                                    //   height: 35,
                                    //   //width: (Get.width * .2) - 90,
                                    //   child: CustomElevatedButton(
                                    //     backgroundColor:
                                    //         ColorValues.appDarkBlueColor,
                                    //     text: "Print",
                                    //     onPressed: () {},
                                    //   ),
                                    // ),
                                    // Dimens.boxWidth20,
                                    // Container(
                                    //   height: 35,
                                    //   // width: (Get.width * .2) - 90,
                                    //   child: CustomElevatedButton(
                                    //     backgroundColor: ColorValues.redColor,
                                    //     text: "Cancel",
                                    //     onPressed: () {
                                    //       Get.back();
                                    //     },
                                    //   ),
                                    // ),
                                    controller.calibrationDetailModel.value
                                                    ?.statusId ==
                                                214 &&
                                            varUserAccessModel
                                                    .value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kCalibrationFeatureId &&
                                                        e.add ==
                                                            UserAccessConstants
                                                                .kHaveAddAccess)
                                                    .length >
                                                0
                                        ? Container(
                                            height: 35,
                                            //width: (Get.width * .2) - 90,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.startColor,
                                              text: "Start Calibration",
                                              onPressed: () {
                                                controller
                                                    .isStartCalibrationDialog(
                                                  calibrationName:
                                                      '${controller.calibrationDetailModel.value?.assetName}',
                                                  calibrationId:
                                                      '${controller.calibrationDetailModel.value?.calibrationId}',
                                                );
                                              },
                                            ),
                                          )
                                        : Dimens.box0,
                                    controller.calibrationDetailModel.value
                                                    ?.statusId ==
                                                212 &&
                                            varUserAccessModel
                                                    .value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kCalibrationFeatureId &&
                                                        e.add ==
                                                            UserAccessConstants
                                                                .kHaveApproveAccess)
                                                    .length >
                                                0
                                        ? Container(
                                            margin: EdgeInsets.only(
                                                right: 20, left: 20),
                                            height: 35,
                                            //width: (Get.width * .2) - 90,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.approveColor,
                                              text: "Approve",
                                              onPressed: () {
                                                controller
                                                    .approveRequestCalibration();
                                              },
                                            ),
                                          )
                                        : Dimens.box0,
                                    //  Dimens.boxWidth20,
                                    controller.calibrationDetailModel.value
                                                    ?.statusId ==
                                                212 &&
                                            varUserAccessModel
                                                    .value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kCalibrationFeatureId &&
                                                        e.add ==
                                                            UserAccessConstants
                                                                .kHaveApproveAccess)
                                                    .length >
                                                0
                                        ? Container(
                                            height: 35,
                                            margin: EdgeInsets.only(
                                                right: 20, left: 20),

                                            //width: (Get.width * .2) - 90,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.rejectColor,
                                              text: "Reject",
                                              onPressed: () {
                                                controller
                                                    .rejectRequestCalibration();
                                              },
                                            ),
                                          )
                                        : Dimens.box0,
                                    // Dimens.boxWidth20,
                                    controller.calibrationDetailModel.value?.statusId == 215 &&
                                                varUserAccessModel.value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kCalibrationFeatureId &&
                                                            e.add ==
                                                                UserAccessConstants
                                                                    .kHaveAddAccess)
                                                        .length >
                                                    0 ||
                                            controller.calibrationDetailModel
                                                        .value?.statusId ==
                                                    220 &&
                                                varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kCalibrationFeatureId &&
                                                            e.add == UserAccessConstants.kHaveAddAccess)
                                                        .length >
                                                    0
                                        ? Container(
                                            height: 35,
                                            //width: (Get.width * .2) - 90,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.completeColor,
                                              text: "Complete",
                                              onPressed: () {
                                                controller.completeCalibration(
                                                    fileIds: dropzoneController
                                                        .fileIds);
                                              },
                                            ),
                                          )
                                        : Dimens.box0,
                                    controller.calibrationDetailModel.value
                                                    ?.statusId ==
                                                217 &&
                                            varUserAccessModel
                                                    .value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kCalibrationFeatureId &&
                                                        e.add ==
                                                            UserAccessConstants
                                                                .kHaveApproveAccess)
                                                    .length >
                                                0
                                        ? Container(
                                            height: 35,
                                            margin: EdgeInsets.only(
                                                right: 20, left: 20),

                                            //width: (Get.width * .2) - 90,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.approveColor,
                                              text: "Approve",
                                              onPressed: () {
                                                controller
                                                    .approveCloseCalibration();
                                              },
                                            ),
                                          )
                                        : Dimens.box0,
                                    Dimens.boxWidth20,
                                    controller.calibrationDetailModel.value
                                                    ?.statusId ==
                                                217 &&
                                            varUserAccessModel
                                                    .value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kCalibrationFeatureId &&
                                                        e.add ==
                                                            UserAccessConstants
                                                                .kHaveApproveAccess)
                                                    .length >
                                                0
                                        ? Container(
                                            height: 35,
                                            margin: EdgeInsets.only(
                                                right: 20, left: 20),

                                            //width: (Get.width * .2) - 90,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.rejectColor,
                                              text: "Reject",
                                              onPressed: () {
                                                controller
                                                    .rejectCloseCalibration();
                                              },
                                            ),
                                          )
                                        : Dimens.box0,
                                    controller.calibrationDetailModel.value
                                                    ?.statusId ==
                                                216 &&
                                            varUserAccessModel
                                                    .value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kCalibrationFeatureId &&
                                                        e.add ==
                                                            UserAccessConstants
                                                                .kHaveApproveAccess)
                                                    .length >
                                                0
                                        ? Container(
                                            height: 35,
                                            //width: (Get.width * .2) - 90,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.closeColor,
                                              text: "Close",
                                              onPressed: () {
                                                controller.closeCalibration();
                                              },
                                            ),
                                          )
                                        : Dimens.box0,
                                  ],
                                ),
                              )
                            ],
                          ),
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
    );
  }
}
