import 'package:cmms/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/file_upload_controller.dart';
import '../../../theme/colors_value.dart';
import '../../../theme/dimens.dart';
import '../../../widgets/file_upload_widget.dart';
import '../../job_card_details_controller.dart';
import '../widgets/transposed_table.dart';

class JobCardDetailsContentWeb extends GetView<JobCardDetailsController> {
  JobCardDetailsContentWeb({super.key});

  ///
  final DropzoneController dropzoneController = Get.put(DropzoneController());

  ///
  @override
  Widget build(BuildContext context) {
    return

        ///
        Obx(
      () =>

          ///
          Container(
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
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              //
              children: [
                Row(//
                    children: [
                  Text('Plant Details', style: Styles.blackBold16),
                ]),
                TransposedTable(controller.productDetails),
                Dimens.boxHeight20,
                Row(//
                    children: [
                  Text('Job Details', style: Styles.blackBold16),
                ]),
                TransposedTable(controller.jobDetails),
                Dimens.boxHeight20,
                Row(//
                    children: [
                  Text('Permit Details', style: Styles.blackBold16),
                ]),
                TransposedTable(controller.permitDetails),
                Dimens.boxHeight20,

                /// FILE UPLOAD WIDGET
                Container(
                  color: ColorsValue.blueMediumColor,
                  height: Get.height * 0.25,
                  width: Get.width,
                  child: Center(
                    child: FileUploadWidget(
                      onDroppedFile: (file) =>
                          dropzoneController.droppedFile.value = file,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
