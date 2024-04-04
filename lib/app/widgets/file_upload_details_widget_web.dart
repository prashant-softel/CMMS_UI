import 'package:data_table_2/data_table_2.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/file_upload_model.dart';
import '../controllers/file_upload_controller.dart';
import '../theme/color_values.dart';

class FileUploadDetailsWidgetWeb extends StatelessWidget {
  FileUploadDetailsWidgetWeb({super.key});

  ///
  final FileUploadController _fileUploadController =
      Get.find<FileUploadController>();

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Obx(() =>
                // _fileUploadController.pickedFiles.isNotEmpty
                //     ?
                DataTable2(
                  showCheckboxColumn: false,
                  horizontalMargin: 5,
                  lmRatio: 2,
                  columnSpacing: 5,
                  headingRowHeight: Get.height * 0.06,
                  dataRowHeight: Get.height * 0.08,
                  border: TableBorder.all(color: ColorValues.appLightBlueColor),
                  columns: [
                    // DataColumn2(
                    //   label: Text('Event'),
                    //   size: ColumnSize.M,
                    // ),
                    DataColumn2(
                      label: Text('Description'),
                      size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('Upload Progress'),
                      size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('Size'),
                      size: ColumnSize.S,
                    ),
                    DataColumn2(
                      label: Text('Status'),
                    ),
                    DataColumn2(
                      label: Text('Remove'),
                      size: ColumnSize.S,
                    ),
                  ],
                  rows: _fileUploadController.pickedFiles.value
                      .map<DataRow>((_file) {
                    final pickedFileIndex = _fileUploadController
                        .pickedFiles.value
                        .indexWhere((f) => f == _file);
                    return DataRow(
                        onSelectChanged: (bool? selected) {
                          if (selected ?? true) {}
                        },
                        cells: [
                          // DataCell(
                          //   DropdownButton<FileUploadEvents>(
                          //     isExpanded: true,
                          //     value: _fileUploadController.selectedEvent.value,
                          //     onChanged: (FileUploadEvents? newValue) {
                          //       _fileUploadController.setSelectedEvent(
                          //           newValue ?? FileUploadEvents.BEFORE);
                          //     },
                          //     items: FileUploadEvents.values.map((event) {
                          //       return DropdownMenuItem<FileUploadEvents>(
                          //         value: event,
                          //         child: Text(event.toString().split('.').last),
                          //       );
                          //     }).toList(),
                          //   ),
                          // ),
                          DataCell(
                            TextFormField(
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
                              minLines: 5,
                              maxLines: null,
                              controller: _fileUploadController
                                          .descriptionCtrlrs.length >
                                      pickedFileIndex
                                  ? _fileUploadController
                                      .descriptionCtrlrs[pickedFileIndex]
                                  : TextEditingController(
                                      text: 'No description'),
                            ),
                          ),
                          DataCell(
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LinearProgressIndicator(
                                    color: ColorValues.appDarkBlueColor,
                                    backgroundColor:
                                        ColorValues.appLightBlueColor,
                                    value: _fileUploadController
                                                .progresses.value.length >
                                            pickedFileIndex
                                        ? (_fileUploadController.progresses
                                                .value[pickedFileIndex]
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
                          DataCell(
                            FutureBuilder<int>(
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
                          DataCell(Text('-')),
                          DataCell(
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () =>
                                  _fileUploadController.removeFile(_file),
                            ),
                          ),
                        ]);
                  }).toList(),
                ) //
            //   : Dimens.box0,
            );
  }
}
