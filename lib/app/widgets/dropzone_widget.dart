import 'package:cmms/app/controllers/dropzone_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import '../../domain/models/file_model.dart';

class DropZoneWidget extends StatelessWidget {
  final ValueChanged<List<FileModel>> onDroppedFiles;

  DropZoneWidget({Key? key, required this.onDroppedFiles}) : super(key: key);
  final DropzoneController controller = Get.find<DropzoneController>();
  late DropzoneViewController dzvcontroller;

  @override
  Widget build(BuildContext context) {
    return

        ///
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
                    onDrop: (dynamic event) {
                      // controller.uploadFile(
                      //   event,
                      //   dzvcontroller,
                      //   onDroppedFiles,
                      // );
                    },
                    onDropMultiple: (
                      List<dynamic>? events,
                    ) {
                      controller.acceptFiles(
                        events,
                        dzvcontroller,
                        onDroppedFiles,
                      );
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
                          size: 80,
                          color: Colors.white,
                        ),
                        Text(
                          'Drop Files Here',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            final events = await dzvcontroller.pickFiles();
                            if (events.isEmpty) return;
                            //UploadedFile(events.first);
                          },
                          icon: Icon(Icons.search),
                          label: Text(
                            'Choose File',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              backgroundColor:
                                  (controller.blnHiglight.value == true)
                                      ? Colors.green.shade300
                                      : Colors.blue,
                              shape: RoundedRectangleBorder()),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
          color: (controller.blnHiglight.value == true)
              ? Colors.green.shade300
              : Colors.blue,
        ),
      ),
    );
  }

  ///
}
