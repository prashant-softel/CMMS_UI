// import 'dart:html';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import '../controllers/file_upload_controller.dart';
import '../theme/color_values.dart';
import '../theme/dimens.dart';

///
class FileUploadWidgetWithDropzone extends StatelessWidget {
  ///
  FileUploadWidgetWithDropzone({
    Key? key,
  }) : super(key: key);

  ///
  final DropzoneController controller = Get.find<DropzoneController>();
  late DropzoneViewController dzvcontroller;

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Obx(
      () => //
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
                  DropzoneView(
                    onCreated: (controller) => this.dzvcontroller = controller,
                    onDrop: (dynamic event) {},
                    onDropMultiple: (List<dynamic>? events) {
                      // controller.files.value = events?.cast<File>() ?? [];
                    },
                    onHover: () => controller.blnHiglight.value = true,
                    onLeave: () => controller.blnHiglight.value = false,
                  ),

                  Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 60,
                            color: Colors.white,
                          ),
                          Text(
                            'Drop Files Here',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),

                          /// CHOOSE FILE BUTTON
                          ElevatedButton.icon(
                            onPressed: (){},
                            // onPressed: () => controller.addFiles(),
                            icon: Icon(Icons.search),
                            label: Text(
                              'Choose File',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: Dimens.edgeInsets20,
                              backgroundColor: (controller.blnHiglight.value ==
                                      true)
                                  ? ColorValues.appGreenColor.withOpacity(0.3)
                                  : ColorValues.appLightBlueColor
                                      .withOpacity(0.1),
                              shape: RoundedRectangleBorder(),
                            ),
                          ),
                          Dimens.boxHeight10,

                          /// UPLOAD BUTTON
                          ElevatedButton(
                            onPressed: (){},
                            // onPressed: () => controller.uploadFiles(),
                            child: const Text('Upload'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorValues.appDarkBlueColor,
                            ),
                          ),
                          //),
                        ]),
                  ),
                ]),
          ),
          color: (controller.blnHiglight.value == true)
              ? ColorValues.appGreenColor
              : ColorValues.appLightBlueColor,
        ),
      ),
    );
  }

  ///
}
