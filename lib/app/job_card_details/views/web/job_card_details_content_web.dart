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
        border: Border.all(
          color: ColorValues.appDarkBlueColor,
          style: BorderStyle.solid,
          width: 3,
        ),
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

                  ///HISTORY
                  (controller.isJobCardStarted.value == true &&
                          controller.historyList != null &&
                          controller.historyList!.isNotEmpty)
                      ? //
                      Container(
                          margin: Dimens.edgeInsets20,
                          constraints: BoxConstraints(
                            maxHeight: 500,
                            minHeight: 100,
                          ),
                          child: //
                              HistoryTableWidgetWeb(
                            historyList: controller.historyList,
                          ),
                        )
                      //)
                      : //
                      Dimens.box0,

                  /// DESCRIPTION OF WORK DONE
                  Row(children: [
                    Text('Description of work done: '),
                    Expanded(
                      child: TextField(
                        controller: controller.descriptionOfWorkDoneCtrlr,
                        enabled: controller.isJobCardStarted.value,
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
                  (controller.isJobCardStarted == false)
                      ? //
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center, //
                          children: [
                              CustomElevatedButton(
                                text: 'Start Job Card',
                                onPressed: () => controller.createJobCard(),
                                backgroundColor: ColorValues.appGreenColor,
                              ),
                              Dimens.boxWidth10,
                              // CustomElevatedButton(
                              //   text: 'Update',
                              //   onPressed: () => controller.updateJobCard(),
                              //   backgroundColor: ColorValues.appYellowColor,
                              // ),
                            ])
                      : //
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //
                          children: [
                              CustomElevatedButton(
                                text: 'Cancel',
                                onPressed: () => controller.startStopJobCard(),
                                backgroundColor: ColorValues.appRedColor,
                              ),
                              Dimens.boxWidth10,
                              CustomElevatedButton(
                                text: 'Update',
                                onPressed: () => controller.updateJobCard(),
                                backgroundColor: ColorValues.appYellowColor,
                              ),
                              Dimens.boxWidth10,
                              CustomElevatedButton(
                                text: 'Close Job',
                                onPressed: () => controller.startStopJobCard(),
                                backgroundColor: ColorValues.appGreenColor,
                              ),
                              Dimens.boxWidth10,
                              CustomElevatedButton(
                                text: 'Carry Forward Job',
                                onPressed: () =>
                                    controller.carryForwardJob(context),
                                backgroundColor: ColorValues.appLightBlueColor,
                              ),
                              Dimens.boxWidth10,
                            ]),
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
