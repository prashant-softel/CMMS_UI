import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../controllers/file_upload_controller.dart';
import '../theme/color_values.dart';
import '../theme/dimens.dart';
import '../utils/responsive.dart';

class FileUploadWidgetWithDropzone extends StatefulWidget {
  FileUploadWidgetWithDropzone({
    Key? key,
  }) : super(key: key);

  @override
  State<FileUploadWidgetWithDropzone> createState() =>
      _FileUploadWidgetWithDropzoneState();
}

class _FileUploadWidgetWithDropzoneState
    extends State<FileUploadWidgetWithDropzone> {
  ///
  final FileUploadController controller = Get.find<FileUploadController>();

  late DropzoneViewController dzvcontroller;

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Obx(
      () => //
          (Responsive.isDesktop(context))
              ? Container(
                  height: Get.height * 0.16,
                  child: //
                      ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: //
                        Container(
                      padding: EdgeInsets.all(3),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        color: Colors.white,
                        strokeWidth: 3,
                        dashPattern: [8, 4],
                        radius: Radius.circular(10),
                        padding: EdgeInsets.zero,
                        child: //
                            Stack(
                          //
                          children: [
                            ///
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    size: 32,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Drop Files Here',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),

                                  /// CHOOSE FILE BUTTON
                                  SizedBox(
                                    height: Get.height * 0.03,
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        controller.selectFiles();
                                      },
                                      icon: Icon(Icons.search),
                                      label: Text(
                                        'Choose File',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        padding: Dimens.edgeInsets10,
                                        backgroundColor:
                                            (controller.blnHiglight.value ==
                                                    true)
                                                ? ColorValues.appGreenColor
                                                    .withOpacity(0.3)
                                                : ColorValues.appLightBlueColor
                                                    .withOpacity(0.1),
                                        shape: RoundedRectangleBorder(),
                                      ),
                                    ),
                                  ),
                                  Dimens.boxHeight5,

                                  /// UPLOAD BUTTON
                                  controller.uploadingImage == false
                                      ? SizedBox(
                                          height: Get.height * 0.03,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              controller.uploadSelectedFiles();
                                            },
                                            child: const Text(
                                              'Upload',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ColorValues.appDarkBlueColor,
                                            ),
                                          ),
                                        )
                                      : SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      color: (controller.blnHiglight.value == true)
                          ? ColorValues.appGreenColor
                          : ColorValues.appLightBlueColor,
                    ),
                  ),
                )
              : Container(
                  height: Get.height * 0.1,
                  child: //
                      ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        color: Colors.white,
                        strokeWidth: 3,
                        dashPattern: [8, 4],
                        radius: Radius.circular(10),
                        padding: EdgeInsets.zero,
                        child: //
                            Stack(
                                //
                                children: [
                              ///
                              Center(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      /// CHOOSE FILE BUTTON
                                      SizedBox(
                                        height: Get.height * 0.05,
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            controller.selectFiles();
                                          },
                                          icon: Icon(Icons.search),
                                          label: Text(
                                            'Choose File',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            padding: Dimens.edgeInsets10,
                                            backgroundColor: (controller
                                                        .blnHiglight.value ==
                                                    true)
                                                ? ColorValues.appGreenColor
                                                    .withOpacity(0.3)
                                                : ColorValues.appLightBlueColor
                                                    .withOpacity(0.1),
                                            shape: RoundedRectangleBorder(),
                                          ),
                                        ),
                                      ),
                                      Dimens.boxHeight5,

                                      /// UPLOAD BUTTON
                                      ElevatedButton(
                                        onPressed: () =>
                                            {controller.uploadSelectedFiles()},
                                        child: const Text('Upload'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorValues.appDarkBlueColor,
                                        ),
                                      ),
                                    ]),
                              ),
                            ]),
                      ),
                      color: (controller.blnHiglight.value == true)
                          ? ColorValues.appGreenColor
                          : ColorValues.appLightBlueColor,
                    ),
                  ),
                ),
    );
  }
}
