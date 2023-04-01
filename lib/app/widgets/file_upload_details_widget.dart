import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/file_upload_controller.dart';
import '../theme/color_values.dart';

class FileUploadDetailsWidget extends StatelessWidget {
  FileUploadDetailsWidget({super.key});

  ///
  // final DropzoneController _dropzoneController = Get.find<DropzoneController>();

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
                color: ColorValues.blackColor,
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
            //  for (var _file in _dropzoneController.files)
            TableRow(children: [
              // Container(
              //   padding: EdgeInsets.all(8.0),
              //   child: Text('${_file.name}'),
              // ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text('-'),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text('-'),
              ),
              // Container(
              //   padding: EdgeInsets.all(8.0),
              //   child: Text('${_file.size}'),
              // ),
              // Container(
              //   padding: EdgeInsets.all(8.0),
              //   child: //
              //       LinearProgressIndicator(
              //     color: ColorValues.appLightBlueColor,
              //     //value: _file.
              //     value: _dropzoneController.progress.value / 100,
              //   ),
              // ),

              Container(
                padding: EdgeInsets.all(8.0),
                child: Text('-'),
              ),
            ]),
          ]),
    );
  }
}
