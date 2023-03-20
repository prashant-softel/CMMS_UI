import 'package:cmms/app/job_card_details/views/widgets/isolated_assets_widget.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/dropzone_controller.dart';
import '../../../theme/colors_value.dart';
import '../../../theme/dimens.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/dropzone_widget.dart';
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
        color: ColorsValue.whiteColor,
        border: Border.all(
          color: ColorsValue.blueColor,
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
                IsolatedAssetsWidget(),

                /// EMPLOYEE TABLE
                EmployeeTable(controller: controller),
                Dimens.boxHeight20,
                Divider(color: ColorsValue.greyLightColour, thickness: 2),

                /// FILE UPLOAD WIDGET
                Container(
                  //color: ColorsValue.blueMediumColor,
                  height: Get.height * 0.25,
                  width: Get.width,
                  child: Row(children: [
                    Expanded(
                      flex: 3,
                      child: DropZoneWidget(
                        onDroppedFiles: (files) =>
                            dropzoneController.droppedFiles.value = files,
                      ),
                    ),
                    Dimens.boxWidth10,
                    Expanded(flex: 7, child: FileUploadDetailsWidget()),
                  ]),
                ),
                Dimens.boxHeight20,
                Divider(color: ColorsValue.greyLightColour, thickness: 2),
                Row(children: [
                  Text('Description of work done: '),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
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
                          backgroundColor: ColorsValue.blueColor,
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
                              backgroundColor: ColorsValue.redColor,
                            ),
                            Dimens.boxWidth10,
                            CustomElevatedButton(
                              text: 'Update',
                              onPressed: () => controller.startStopJobCard(),
                              backgroundColor: ColorsValue.yellowColor,
                            ),
                            Dimens.boxWidth10,
                            CustomElevatedButton(
                              text: 'Close Job',
                              onPressed: () => controller.startStopJobCard(),
                              backgroundColor: ColorsValue.lightGreenColor,
                            ),
                            Dimens.boxWidth10,
                            CustomElevatedButton(
                              text: 'Carry Forward Job',
                              onPressed: () => controller.startStopJobCard(),
                              backgroundColor: ColorsValue.blueColor,
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
