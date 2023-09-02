import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/widgets/job_card_approve_dialog.dart';
import 'package:cmms/app/widgets/job_card_reject_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        Container(
      height: Get.height,
      padding: Dimens.edgeInsets10,
      margin: Dimens.edgeInsets20,
      decoration: BoxDecoration(
        color: ColorValues.whiteColor,
        // border: Border.all(
        //   color: ColorValues.appDarkBlueColor,
        //   style: BorderStyle.solid,
        //   width: 3,
        // ),
      ),
      child: //
          Obx(() {
        try {
          return //

              SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                //
                children: [
                  /// TABLE - PLANT DETAILS
                  Row(//
                      children: [
                    Text('Plant Details', style: Styles.blackBold16),
                    Spacer(),
                    Text('Job Card Id:', style: Styles.blackBold16),
                    Text('${controller.jobCardId.value}',
                        style: Styles.blackBold16),
                  ]),
                  TransposedTable(controller.plantDetails),
                  Dimens.boxHeight20,

                  /// TABLE - JOB DETAILS
                  Row(//
                      children: [
                    Text('Job Details', style: Styles.blackBold16),
                  ]),
                  TransposedTable(controller.jobDetails),
                  Dimens.boxHeight20,

                  /// TABLE - PERMIT DETAILS
                  Row(//
                      children: [
                    Text('Permit Details', style: Styles.blackBold16),
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

                  EmployeeTableWidget(controller: controller, isWeb: true),
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
                      Expanded(flex: 8, child: FileUploadDetailsWidgetWeb()),
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
                          constraints: BoxConstraints(
                            maxHeight: 200,
                            minHeight: 100,
                          ),
                          child: //
                              HistoryTableWidgetWeb(
                            historyList: controller.historyList,
                          ),
                        )
                      //  )
                      : //
                      Dimens.box0,

                  /// DESCRIPTION OF WORK DONE
                  (controller.jobCardList[0]!.status == 151)
                      ? Container()
                      : Row(children: [
                          Text('Description of work done: '),
                          Expanded(
                            child: TextField(
                              controller: controller.descriptionOfWorkDoneCtrlr,
                              // enabled: controller.isJobCardStarted.value,
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorValues.appLightGreyColor,
                                    width: 1.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorValues.appLightBlueColor,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorValues.appLightBlueColor,
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
                  controller.jobCardList[0]!.status == 151
                      ? //
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center, //
                          children: [
                              CustomElevatedButton(
                                text: 'Start Job Card',
                                onPressed: () => controller
                                    .startJobCard(controller.jobCardId.value),
                                backgroundColor: ColorValues.addNewColor,
                              )
                              // CustomElevatedButton(
                              //   text: 'Update',
                              //   onPressed: () => controller.updateJobCard(),
                              //   backgroundColor: ColorValues.appYellowColor,
                              // ),
                            ])
                      : //
                      controller.jobCardList[0]!.status == 152
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //
                              children: [
                                  CustomElevatedButton(
                                    text: 'Cancel',
                                    onPressed: () =>
                                        controller.startStopJobCard(),
                                    backgroundColor: ColorValues.appRedColor,
                                  ),
                                  Dimens.boxWidth10,
                                  CustomElevatedButton(
                                    text: 'Update',
                                    backgroundColor: ColorValues.appYellowColor,
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
                          : controller.jobCardList[0]!.status == 153 ||
                                  controller.jobCardList[0]!.status == 154
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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

                                      varUserAccessModel.value.access_list!
                                                  .where((e) =>
                                                      e.feature_id == 4 &&
                                                      e.approve == 1)
                                                  .length >
                                              0
                                          ? Container(
                                              height: 30,
                                              child: CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.appGreenColor,
                                                text: "Approve",
                                                icon: Icons.add,
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
                                      varUserAccessModel.value.access_list!
                                                  .where((e) =>
                                                      e.feature_id == 4 &&
                                                      e.approve == 1)
                                                  .length >
                                              0
                                          ? Container(
                                              height: 30,
                                              child: CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.rejectColor,
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
                              : Container(),

                  Dimens.boxHeight20,
                ]),
          );
        } //
        catch (e) {
          print(e);
          return Dimens.box0;
        }
      }),
    );
  }
}
