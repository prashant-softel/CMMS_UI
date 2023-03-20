import 'package:cmms/app/controllers/dropzone_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/file_model.dart';
import '../theme/colors_value.dart';

class FileUploadDetailsWidget extends StatelessWidget {
  FileUploadDetailsWidget({super.key});

  ///
  final DropzoneController _dropzoneController = Get.find<DropzoneController>();

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Obx(
      () =>
          //
          Table(
              border: TableBorder.all(
                style: BorderStyle.solid,
                color: ColorsValue.blackColor,
              ),
              //
              children: [
            TableRow(children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text('Event'),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text('Description'),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text('Upload Progress'),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text('Size'),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text('Status'),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text('Remove'),
              ),
            ]),
            for (FileModel _file in _dropzoneController.droppedFiles)
              TableRow(children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text('-'),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text('-'),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text('-'),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text('${_file.size}'),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text('-'),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text('-'),
                ),
              ]),
          ]),
    );
  }
}
