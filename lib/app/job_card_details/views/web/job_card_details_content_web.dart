import 'package:cmms/app/job_card_details/views/widgets/isolated_assets_widget.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/history_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/file_upload_controller.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/file_upload_with_dropzone_widget.dart';
import '../../../widgets/file_upload_details_widget.dart';
import '../../job_card_details_controller.dart';
import '../widgets/employee_table_widget.dart';
import '../widgets/transposed_table.dart';

class JobCardDetailsContentWeb extends GetView<JobCardDetailsController> {
  JobCardDetailsContentWeb({super.key});

  ///
  final DropzoneController dropzoneController = Get.put(DropzoneController());

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
            SingleChildScrollView(
          child: //
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
                TransposedTable(controller.productDetails),
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

                /// ISOLATE ASSETS TABLE WIDGET
                SizedBox(
                  height: Get.height * 0.2,
                  child: IsolatedAssetsWidget(),
                ),
                Dimens.boxHeight20,
                Divider(color: ColorValues.greyLightColour, thickness: 2),

                /// EMPLOYEE TABLE
                SizedBox(
                  height: Get.height * 0.2,
                  child: EmployeeTable(controller: controller),
                ),
                Dimens.boxHeight20,
                Divider(color: ColorValues.greyLightColour, thickness: 2),

                /// FILE UPLOAD WIDGET
                Container(
                  //color: ColorsValue.blueMediumColor,
                  height: Get.height * 0.35,
                  width: Get.width,
                  child: Row(//
                      children: [
                    Flexible(
                      flex: 3,
                      child: FileUploadWidgetWithDropzone(),
                    ),
                    Dimens.boxWidth10,
                    Expanded(flex: 7, child: FileUploadDetailsWidget()),
                  ]),
                ),

                Dimens.boxHeight20,
                Divider(color: ColorValues.greyLightColour, thickness: 2),

                ///HISTORY
                (controller.isJobCardStarted.value == true)
                    ? //
                    HistoryTableWidget()
                    : //
                    Dimens.box0,

                /// DESCRIPTION OF WORK DONE
                Row(children: [
                  Text('Description of work done: '),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
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
                              onPressed: () => controller.startStopJobCard(),
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
                              onPressed: () => controller.startStopJobCard(),
                              backgroundColor: ColorValues.appLightBlueColor,
                            ),
                            Dimens.boxWidth10,
                          ]),

                Dimens.boxHeight20,
              ]),
        ),
      ),
    );
  }
}
