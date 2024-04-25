import 'dart:convert';

import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/job_card_approve_dialog.dart';
import 'package:cmms/app/widgets/job_card_reject_dialog.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
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
import '../widgets/employee_table_widget.dart';
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
                child: Text(" / JOB CARD LIST".toUpperCase(),
                    style: Styles.greyMediumLight12),
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
                                    color: controller.jobCardDetailsModel.value
                                                ?.status ==
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
                                    " ${controller.jobCardDetailsModel.value?.status_short ?? ""}",
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
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          ""
                                          "Job Card Id :",
                                          style: Styles.black14,
                                        ),
                                        Text(
                                          "Asset Category Name :",
                                          style: Styles.black14,
                                        ),
                                        Text(
                                          "Job Id :",
                                          style: Styles.black14,
                                        ),
                                        Text(
                                          "Ptw Id :",
                                          style: Styles.black14,
                                        ),
                                        Text(
                                          "Created By :",
                                          style: Styles.black14,
                                        ),
                                      ],
                                    ),
                                    Dimens.boxWidth10,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(" ${controller.jobCardId.value}",
                                            style: Styles.blue14),
                                        Container(
                                          width: 400,
                                          child: Text(
                                              " ${controller.jobCardDetailsModel.value?.assetCategoryName ?? ""}",
                                              maxLines: 3,
                                              style: Styles.blue14),
                                        ),
                                        Text(
                                            " ${controller.jobCardDetailsModel.value?.jobId ?? ""}",
                                            style: Styles.blue14),
                                        Text(
                                            " ${controller.jobCardDetailsModel.value?.ptwId ?? ""}",
                                            style: Styles.blue14),
                                        Text(
                                            " ${controller.jobCardDetailsModel.value?.created_by ?? ""}",
                                            style: Styles.blue14),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Plant Name :",
                                          style: Styles.black14,
                                        ),
                                        Text(
                                          "Title :",
                                          style: Styles.black14,
                                        ),
                                        Text(
                                          "JC Closed By Name :",
                                          style: Styles.black14,
                                        ),
                                        Text(
                                          "JC Start By Name :",
                                          style: Styles.black14,
                                        ),
                                        Text(
                                          "JC Approved By Name :",
                                          style: Styles.black14,
                                        ),
                                      ],
                                    ),
                                    Dimens.boxWidth10,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            " ${controller.jobCardDetailsModel.value?.plantName ?? ""}",
                                            style: Styles.blue14),
                                        Container(
                                          width: 400,
                                          child: Text(
                                              " ${controller.jobCardDetailsModel.value?.title ?? ""}",
                                              maxLines: 2,
                                              style: Styles.blue14),
                                        ),
                                        Text(
                                            " ${controller.jobCardDetailsModel.value?.jcClosedByName ?? ""}",
                                            style: Styles.blue14),
                                        Text(
                                            " ${controller.jobCardDetailsModel.value?.jC_Start_By_Name ?? ""}",
                                            style: Styles.blue14),
                                        Text(
                                            " ${controller.jobCardDetailsModel.value?.jcApprovedByName ?? ""}",
                                            style: Styles.blue14),
                                      ],
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(children: [
                            Text('Plant Details :', style: Styles.blackBold16),
                          ]),
                          TransposedTable(controller.plantDetails),
                          Dimens.boxHeight20,

                          /// TABLE - JOB DETAILS
                          Row(//
                              children: [
                            Text('Job Details :', style: Styles.blackBold16),
                          ]),
                          TransposedTable(controller.jobDetails),
                          Dimens.boxHeight20,

                          /// TABLE - PERMIT DETAILS
                          Row(//
                              children: [
                            Text('Permit Details :', style: Styles.blackBold16),
                          ]),
                          TransposedTable(controller.permitDetails),
                          Dimens.boxHeight20,

                          /// ISOLATED ASSETS TABLE WIDGET
                          (controller.isolationAssetsCategoryList.isNotEmpty)
                              ? IsolatedAssetsWidget()
                              : Dimens.boxHeight0,

                          /// LOTO APPLIED ASSETS TABLE WIDGET
                          (controller.lotoAppliedAssets.isNotEmpty)
                              ? LotoAppliedAssetsWidget()
                              : Dimens.boxHeight20,
                          CustomDivider(),

                          /// EMPLOYEE TABL
                          DeployedTeam(),
                          // EmployeeTableWidget(
                          //     controller: controller, isWeb: true),
                          Dimens.boxHeight20,
                          CustomDivider(),

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
                                    Dimens.boxWidth10,
                                    Expanded(
                                        flex: 8,
                                        child: FileUploadDetailsWidgetWeb()),
                                  ]),
                                ),
                          Dimens.boxHeight20,
                          CustomDivider(),
                          Dimens.boxHeight20,
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
                                        color:
                                            ColorValues.appBlueBackgroundColor,
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
                                                        icon: Icons.visibility,
                                                        message: 'View Permit',
                                                        onPress: () async {
                                                          String baseUrl =
                                                              "http://65.0.20.19/CMMS_API/";
                                                          // String baseUrl =
                                                          // 'http://172.20.43.9:83/';
                                                          String fileName =
                                                              controller
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
                                                          // String baseUrl = 'http://172.20.43.9:83/';
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
                          Dimens.boxHeight20,
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
                          (controller.jobCardDetailsModel.value!.status == 151)
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
                                      controller:
                                          controller.descriptionOfWorkDoneCtrlr,
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

                          Dimens.boxHeight20,

                          /// START JOB CARD BUTTON
                          controller.jobCardDetailsModel.value!.status == 151 &&
                                  controller.permitList
                                          ?.firstWhere((element) =>
                                              element.permitId != null)
                                          .status ==
                                      125 &&
                                  controller.permitList
                                          ?.firstWhere((element) =>
                                              element.permitId != null)
                                          .tbT_Done_Check ==
                                      1
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center, //
                                  children: [
                                      CustomElevatedButton(
                                        text: 'Start Job Card',
                                        onPressed: () =>
                                            controller.startJobCard(
                                                jcCard:
                                                    controller.jobCardId.value,
                                                fileIds:
                                                    dropzoneController.fileIds),
                                        backgroundColor:
                                            ColorValues.addNewColor,
                                      )
                                      // CustomElevatedButton(
                                      //   text: 'Update',
                                      //   onPressed: () => controller.updateJobCard(),
                                      //   backgroundColor: ColorValues.appYellowColor,
                                      // ),
                                    ])
                              : controller.jobCardDetailsModel.value!.status ==
                                          157 ||
                                      controller.jobCardDetailsModel.value!.status ==
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
                                          Dimens.boxWidth10,
                                          CustomElevatedButton(
                                            text: 'Update',
                                            backgroundColor:
                                                ColorValues.appYellowColor,
                                            onPressed: () async {
                                              bool? confirmed =
                                                  await showConfirmationDialog(
                                                context,
                                                'Are you sure you want to Update job ?',
                                              );
                                              if (confirmed == true) {
                                                controller.updateJobCard(
                                                    fileIds: dropzoneController
                                                        .fileIds);

                                                Text(
                                                    'Are you sure you want to Update job ?');
                                              }
                                            },
                                          ),
                                          Dimens.boxWidth10,
                                          varUserAccessModel.value.access_list!
                                                      .where((e) =>
                                                          e.feature_id == 4 &&
                                                          e.add == 1)
                                                      .length >
                                                  0
                                              ? CustomElevatedButton(
                                                  backgroundColor:
                                                      ColorValues.appGreenColor,
                                                  text: 'Close Job',
                                                  onPressed: () async {
                                                    bool? confirmed =
                                                        await showConfirmationDialog(
                                                      context,
                                                      'Are you sure you want to Close Job ?',
                                                    );
                                                    if (confirmed == true) {
                                                      controller.closeJob(
                                                          fileIds:
                                                              dropzoneController
                                                                  .fileIds);

                                                      Text(
                                                          'Are you sure you want to Close Job ?');
                                                    }
                                                  },
                                                )
                                              : Container(),
                                          Dimens.boxWidth10,
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
                                                controller.carryForwardJob(
                                                    fileIds: dropzoneController
                                                        .fileIds);

                                                Text(
                                                    'Are you sure you want to Carry Forward Job ?');
                                              }
                                            },
                                          ),
                                          Dimens.boxWidth10,
                                        ])
                                  : controller.jobCardDetailsModel.value!.status ==
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
                                              Dimens.boxWidth10,
                                              CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.appYellowColor,
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
                                              Dimens.boxWidth10,
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

                                              Dimens.boxWidth10,

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
                                              Dimens.boxWidth10,
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
                                              mainAxisAlignment: MainAxisAlignment.center,
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
                                                  Dimens.boxWidth10,
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

                          Dimens.boxHeight20,
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
            // Column(
            //     children: []
            //       ..addAll(controller.employeesDeployed.value.map((e) {
            //         return Text(jsonEncode(e));
            //       }))),
            // Text(jsonEncode(controller.deployedEmployeeMapperData)),
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
                  InkWell(
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
                        borderRadius: BorderRadius.all(Radius.circular(5)),
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
                    label: Text("Responsibility"),
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
                                        DropdownWebWidget(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          // controller: controller,
                                          dropdownList: controller.employeeList,
                                          selectedValue: mapData["value"],
                                          onValueChanged:
                                              (list, selectedValue) {
                                            // if (selectedValue != null) {
                                            //   controller.updateSelectedOption(
                                            //       selectedValue);
                                            // }
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
                                      ],
                                    ),
                                  )
                                : (mapData['key'] == "Responsibility")
                                    ? Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
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
                                                  ],
                                                  color: ColorValues.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: LoginCustomTextfield(
                                                  keyboardType:
                                                      TextInputType.text,
                                                  // inputFormatters: <
                                                  //     TextInputFormatter>[
                                                  //   FilteringTextInputFormatter
                                                  //       .digitsOnly
                                                  // ],
                                                  maxLine: 1,
                                                  textController:
                                                      new TextEditingController(
                                                          text: mapData[
                                                                  "value"] ??
                                                              ''),
                                                  onChanged: (txt) {
                                                    mapData["value"] = txt;
                                                  },
                                                )),
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
                                                TableActionButton(
                                                  color:
                                                      ColorValues.appRedColor,
                                                  icon: Icons.delete,
                                                  label: '',
                                                  message: '',
                                                  onPress: () {
                                                    controller.employeesDeployed
                                                        .remove(record);
                                                  },
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
