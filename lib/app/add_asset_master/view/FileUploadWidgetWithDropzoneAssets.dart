import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import '../../controllers/file_upload_controller.dart';
import '../../theme/dimens.dart';
import '../../theme/color_values.dart';
import '../../utils/responsive.dart';
import '../add_asset_master_controller.dart';

///
class FileUploadWidgetWithDropzoneAssets extends StatefulWidget {
  ///
  FileUploadWidgetWithDropzoneAssets({
    Key? key,
  }) : super(key: key);

  @override
  State<FileUploadWidgetWithDropzoneAssets> createState() => _FileUploadWidgetWithDropzoneAssetsState();
}

class _FileUploadWidgetWithDropzoneAssetsState extends State<FileUploadWidgetWithDropzoneAssets> {
  ///
  final FileUploadController controller = Get.find<FileUploadController>();

  final AddAssetMasterController controllerAssets = Get.find<AddAssetMasterController>();

  late DropzoneViewController dzvcontroller;

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Obx(
      () => //
          (Responsive.isDesktop(context))
              ? Container(
                  height: Get.height * 3,
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
                                        onPressed: () async
                                            {
                                                // controller.uploadSelectedFiles(),
                                                  final result =
                                                  await FilePicker.platform.pickFiles();
                                                  if (result != null) {
                                                    // for (var file in result.files) {
                                                    controllerAssets.fileName.value =
                                                        result.files.single.name;
                                                    controllerAssets.fileBytes =
                                                        result.files.single.bytes;
                                                    controllerAssets.filePath.value =
                                                        result.files.single.path!;
                                                    controllerAssets.fileType.value =
                                                        result.files.single.extension!;
                                                    }
                                            },
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
