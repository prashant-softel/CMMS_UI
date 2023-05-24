import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/file_upload_model.dart';
import '../controllers/file_upload_controller.dart';
import '../theme/color_values.dart';
import '../theme/dimens.dart';

class FileUploadDetailsWidgetMobile extends StatelessWidget {
  FileUploadDetailsWidgetMobile({super.key});

  ///
  final FileUploadController _fileUploadController =
      Get.find<FileUploadController>();

  ///
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_fileUploadController.pickedFiles.isNotEmpty) {
        return //
            ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _fileUploadController.pickedFiles.value.length,
          itemBuilder: (context, index) {
            final _file = _fileUploadController.pickedFiles.value[index];
            final pickedFileIndex = _fileUploadController.pickedFiles.value
                .indexWhere((f) => f == _file);
            return //
                Obx(
              () => //
                  Card(
                child: //
                    ExpansionTile(
                  title: Text('${_file.name}'),
                  onExpansionChanged: (bool isExpanded) {
                    _fileUploadController.tileHeight.value =
                        isExpanded ? Get.height * 0.5 : Get.height * 0.2;
                  },
                  children: [
                    ListTile(
                      leading: Text('Event'),
                      title: DropdownButton<FileUploadEvents>(
                        isExpanded: true,
                        value: _fileUploadController.selectedEvent.value,
                        onChanged: (FileUploadEvents? newValue) {
                          _fileUploadController.setSelectedEvent(
                              newValue ?? FileUploadEvents.BEFORE);
                        },
                        items: FileUploadEvents.values.map((event) {
                          return DropdownMenuItem<FileUploadEvents>(
                            value: event,
                            child: Text(event.toString().split('.').last),
                          );
                        }).toList(),
                      ),
                    ),
                    ListTile(
                      leading: Text('Description'),
                      title: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorValues.appLightBlueColor,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorValues.appLightBlueColor,
                              width: 1.0,
                            ),
                          ),
                        ),
                        minLines: 3,
                        maxLines: null,
                        controller:
                            _fileUploadController.descriptionCtrlrs.length >
                                    pickedFileIndex
                                ? _fileUploadController
                                    .descriptionCtrlrs[pickedFileIndex]
                                : TextEditingController(text: 'No description'),
                      ),
                    ),
                    ListTile(
                      leading: Text('Upload Progress'),
                      title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LinearProgressIndicator(
                              color: ColorValues.appDarkBlueColor,
                              backgroundColor: ColorValues.appLightBlueColor,
                              value: _fileUploadController
                                          .progresses.value.length >
                                      pickedFileIndex
                                  ? (_fileUploadController
                                          .progresses.value[pickedFileIndex]
                                          .toDouble() /
                                      100)
                                  : 0.0,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${(_fileUploadController.progresses.value.length > pickedFileIndex ? _fileUploadController.progresses.value[pickedFileIndex].toStringAsFixed(0) : 'Not yet uploaded')}%',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ]),
                    ),
                    ListTile(
                      leading: Text('Size'),
                      title: FutureBuilder<int>(
                        future: _file.length(),
                        builder: (BuildContext context,
                            AsyncSnapshot<int> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text("Error");
                          } else {
                            return Text('${filesize(snapshot.data!)}');
                          }
                        },
                      ),
                    ),
                    ListTile(
                      leading: Text('Status'),
                      title: Text('-'),
                    ),
                    ListTile(
                      leading: Text('Remove'),
                      title: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            _fileUploadController.removeFile(_file),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        return Dimens.box0;
      }
    });
  }

  ///
}
