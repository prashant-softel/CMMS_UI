import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

import '../../domain/models/dropped_file.dart';
import '../controllers/file_upload_controller.dart';
import '../theme/dimens.dart';

class FileUploadWidget extends GetView<DropzoneController> {
  FileUploadWidget({
    this.onDroppedFile,
    Key? key,
  }) : super(key: key);
  //var jobCardDetailsController = Get.find<JobCardDetailsController>();

  ///
  late DropzoneViewController dzController;
  final ValueChanged<DroppedFile>? onDroppedFile;

  ///
  @override
  Widget build(BuildContext context) {
    return Column(//
        children: [
      Expanded(
        child: Stack(//
            children: [
          DropzoneView(
            operation: DragOperation.copy,
            cursor: CursorType.grab,
            onCreated: (DropzoneViewController ctrl) => dzController = ctrl,
            onLoaded: () => print('Zone loaded'),
            onError: (String? event) => print('Error: $event'),
            onHover: () => print('Zone hovered'),
            onDrop: (dynamic event) {
              controller.acceptFile(event, dzController);
            },
            onDropMultiple: (List<dynamic>? events) {
              controller.acceptFiles(events ?? [], dzController);
            },
            onLeave: () => print('Zone left'),
          ),
          Container(
            padding: Dimens.edgeInsets10,
            child: DottedBorder(
              color: Colors.black,
              dashPattern: [10, 5],
              strokeWidth: 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload),
                    SizedBox(height: 8.0),
                    Text(
                      'Drag and drop file here or',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () async {},
                      child: Text('Choose File'),
                    ),
                    SizedBox(height: 8.0),
                  ]),
            ),
          ),
        ]),
      ),
      Table(
        columnWidths: {
          0: FlexColumnWidth(),
        },
        children: [
          for (DroppedFile droppedFile in controller.droppedFiles)
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(droppedFile.size),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(
                      //value: //_uploadProgress[file],
                      ),
                ),
              ],
            ),
        ],
      ),
    ]);
  }

  ///
}
