import 'package:cmms/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/file_upload_controller.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../widgets/custom_divider.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/file_upload_details_widget.dart';
import '../../../widgets/file_upload_with_dropzone_widget.dart';
import '../../../widgets/history_table_widget.dart';
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
      height: Get.height * 0.9,
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
          Obx(
        () =>
            //
            ListView(children: [
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              //
              children: [
                Row(//
                    children: [
                  /// TABLE - PLANT DETAILS
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
                if (controller.isolationAssetsCategoryList.isNotEmpty)
                  Container(
                    margin: Dimens.edgeInsets20,
                    constraints: BoxConstraints(
                      maxHeight:
                          (controller.isolationAssetsCategoryList.length) > 0
                              ? (controller
                                      .isolationAssetsCategoryList.length) *
                                  (Get.height * 0.1)
                              : Get.height * 0.06,
                      minHeight:
                          (controller.isolationAssetsCategoryList.length ?? 0) >
                                  0
                              ? (controller
                                          .isolationAssetsCategoryList.length ??
                                      0) *
                                  (Get.height * 0.08)
                              : Get.height * 0.1,
                    ),
                    child: Flexible(flex: 10, child: IsolatedAssetsWidget()),
                  )
                else
                  Dimens.boxHeight0,
                // (controller.isolationAssetsCategoryList != null &&
                //         controller.isolationAssetsCategoryList!.isNotEmpty)
                //     ? Expanded(flex: 10, child: IsolatedAssetsWidget())
                //     //)
                //     : Dimens.boxHeight0,
                // Dimens.boxHeight20,
                // CustomDivider(),

                /// LOTO APPLIED ASSETS TABLE WIDGET
                // if (controller.lotoAppliedAssets != null &&
                //     controller.lotoAppliedAssets!.isNotEmpty)
                Container(
                  margin: Dimens.edgeInsets20,
                  constraints: BoxConstraints(
                    maxHeight: (controller.lotoAppliedAssets?.length ?? 0) > 0
                        ? (controller.lotoAppliedAssets?.length ?? 0) *
                            (Get.height * 0.1)
                        : Get.height * 0.06,
                    minHeight: (controller.lotoAppliedAssets?.length ?? 0) > 0
                        ? (controller.lotoAppliedAssets?.length ?? 0) *
                            (Get.height * 0.1)
                        : Get.height * 0.06,
                  ),
                  child: Expanded(child: LotoAppliedAssetsWidget()),
                ),
                // else
                //   Dimens.boxHeight0,
                Dimens.boxHeight20,
                CustomDivider(),

                /// EMPLOYEE TABLE
                Container(
                  margin: Dimens.edgeInsets20,
                  constraints: BoxConstraints(
                    maxHeight: Get.height * 0.6,
                    minHeight: controller.employeeTableRows.length > 0
                        ? (controller.employeeTableRows.length *
                            Get.height *
                            0.12)
                        : Get.height * 0.12,
                  ),
                  child: Flexible(
                    child: EmployeeTable(controller: controller),
                  ),
                ),

                Dimens.boxHeight20,
                CustomDivider(),

                /// FILE UPLOAD WIDGET
                Container(
                  //color: ColorValues.blueMediumColor,
                  height: Get.height * 0.3,
                  width: Get.width,
                  child: Row(//
                      children: [
                    Expanded(
                      flex: 2,
                      child: FileUploadWidgetWithDropzone(),
                    ),
                    Dimens.boxWidth10,
                    Expanded(flex: 8, child: FileUploadDetailsWidget()),
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
                            HistoryTableWidget(
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

                (controller.isJobCardStarted == false)
                    ? //
                    Center(
                        child: CustomElevatedButton(
                          text: 'Start Job Card',
                          onPressed: () => controller.startStopJobCard(),
                          backgroundColor: ColorValues.appGreenColor,
                        ),
                      )
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
        ]),
      ),
    );
  }
}
