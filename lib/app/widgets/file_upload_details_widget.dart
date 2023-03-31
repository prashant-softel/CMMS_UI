import 'package:data_table_2/data_table_2.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/file_upload_model.dart';
import '../controllers/file_upload_controller.dart';
import '../theme/color_values.dart';

class FileUploadDetailsWidget extends StatelessWidget {
  FileUploadDetailsWidget({super.key});

  ///

  final FileUploadController _fileUploadController =
      Get.find<FileUploadController>();

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Obx(() =>
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
                  // for (var _file in _dropzoneController.files)
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
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: //
                          LinearProgressIndicator(),
                    ),
                    DataTable2(
                      showCheckboxColumn: false,
                      horizontalMargin: 5,
                      lmRatio: 2,
                      columnSpacing: 5,
                      headingRowHeight: Get.height * 0.06,
                      border:
                          TableBorder.all(color: ColorValues.appLightBlueColor),
                      //dataRowHeight: Get.height * 0.06,
                      columns: [
                        DataColumn2(
                          label: Text('Event'),
                          size: ColumnSize.M,
                        ),
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

                      rows: _fileUploadController.files.map<DataRow>((_file) {
                        final index = _fileUploadController.files
                            .indexWhere((f) => f == _file);
                        return DataRow(
                            onSelectChanged: (bool? selected) {
                              if (selected ?? true) {
                                //  log.add('row-selected: ${itemRow.index}');
                              }
                            },
                            cells: [
                              DataCell(
                                DropdownButton<FileUploadEvents>(
                                  isExpanded: true,
                                  value:
                                      _fileUploadController.selectedEvent.value,
                                  onChanged: (FileUploadEvents? newValue) {
                                    _fileUploadController.setSelectedEvent(
                                        newValue ?? FileUploadEvents.BEFORE);
                                  },
                                  items: FileUploadEvents.values.map((event) {
                                    return DropdownMenuItem<FileUploadEvents>(
                                      value: event,
                                      child: Text(
                                          event.toString().split('.').last),
                                    );
                                  }).toList(),
                                ),
                              ),
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
                                  minLines: 3,
                                  maxLines: null,
                                  //initialValue: '',
                                  controller: _fileUploadController
                                      .descriptionCtrlrs[index],
                                ),
                              ),
                              DataCell(
                                LinearProgressIndicator(
                                  color: ColorValues.appLightBlueColor,
                                  //value: _file.
                                  backgroundColor: ColorValues.appLightBlueColor
                                      .withOpacity(0.3),
                                  value: (_fileUploadController
                                          .progresses[index.toInt()] /
                                      100),
                                ),
                              ),
                              DataCell(Text('${filesize(_file.size)}')),
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
                    ),
                  ])
                ]));
  }
}
