import 'package:cmms/app/controllers/affected_parts_upload_controller.dart';
import 'package:cmms/app/controllers/tbt_file_upload_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import '../theme/color_values.dart';
import '../theme/dimens.dart';
import '../utils/responsive.dart';

class TbtFileUploadDropzone extends StatefulWidget {
  const TbtFileUploadDropzone({Key? key}) : super(key: key);

  @override
  _TbtFileUploadDropzoneState createState() => _TbtFileUploadDropzoneState();
}

class _TbtFileUploadDropzoneState extends State<TbtFileUploadDropzone> {
  final TbtFileUploadController controller =
      Get.find<TbtFileUploadController>();
  late DropzoneViewController dzvcontroller;
  @override
  Widget build(BuildContext context) {
    return //
        Obx(
      () => //
          (Responsive.isDesktop(context))
              ? Container(
                  height: 145,
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
                                    height: 23,
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        controller.addFiles();
                                        controller.showUploadButton.value =
                                            true;
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
                                  controller.showUploadButton == true
                                      ? SizedBox(
                                          height: 23,
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
                                      : controller.uploadingImage == true
                                          ? SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : SizedBox(
                                              height: 28,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  'Upload',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: ColorValues
                                                      .appDarkBlueColor,
                                                ),
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
                                            controller.addFiles();
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
