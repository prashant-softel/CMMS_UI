import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/job_card_approve_dialog.dart';
import 'package:cmms/app/widgets/job_card_reject_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  Get.offNamed(Routes.breakdown);
                },
                child: Text(" / BREAKDOWN MAINTAINANCE".toUpperCase(),
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

                          /// EMPLOYEE TABLE

                          EmployeeTableWidget(
                              controller: controller, isWeb: true),
                          Dimens.boxHeight20,
                          CustomDivider(),

                          /// FILE UPLOAD WIDGET
                          Container(
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
                                  flex: 8, child: FileUploadDetailsWidgetWeb()),
                            ]),
                          ),
                          Dimens.boxHeight20,
                          CustomDivider(),
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
                          // (controller.isJobCardStarted == false)
                          controller.jobCardDetailsModel.value!.status == 151
                              // controller.jobCardDetailsModel.value!.status == 151 &&
                              //         controller.permitList
                              //                 ?.firstWhere((element) =>
                              //                     element.permitId != null)
                              //                 .status ==
                              //             125
                              ? //
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center, //
                                  children: [
                                      CustomElevatedButton(
                                        text: 'Start Job Card',
                                        onPressed: () =>
                                            controller.startJobCard(
                                                controller.jobCardId.value),
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
                                                controller.updateJobCard();

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
                                                      controller.closeJob();

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
                                                controller.carryForwardJob();

                                                Text(
                                                    'Are you sure you want to Carry Forward Job ?');
                                              }
                                            },
                                          ),
                                          Dimens.boxWidth10,
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
                                                    controller.updateJobCard();

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
