import 'package:cmms/app/controllers/affected_parts_upload_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/color_values.dart';

class AffectedPartWidgetWeb extends StatelessWidget {
  AffectedPartWidgetWeb({super.key});

  final AffectedPartUploadController _affectedPartUploadController =
      Get.find<AffectedPartUploadController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: DataTable2(
          showCheckboxColumn: false,
          horizontalMargin: 5,
          lmRatio: 2,
          columnSpacing: 5,
          headingRowHeight: 40,
          dataRowHeight: 50,
          border: TableBorder.all(
            color: ColorValues.appLightBlueColor,
          ),
          columns: [
            DataColumn2(
              label: Text('Affected Part'),
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
          rows: _affectedPartUploadController.pickedFiles.map<DataRow>(
            (_file) {
              final pickedFileIndex = _affectedPartUploadController.pickedFiles
                  .indexWhere((f) => f == _file);
              return DataRow(
                onSelectChanged: (bool? selected) {
                  if (selected ?? true) {}
                },
                cells: [
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
                      controller: _affectedPartUploadController
                                  .descriptionCtrlrs.length >
                              pickedFileIndex
                          ? _affectedPartUploadController
                              .descriptionCtrlrs[pickedFileIndex]
                          : TextEditingController(text: 'No description'),
                    ),
                  ),
                  DataCell(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearProgressIndicator(
                          color: ColorValues.appDarkBlueColor,
                          backgroundColor: ColorValues.appLightBlueColor,
                          value: _affectedPartUploadController
                                      .progresses.value.length >
                                  pickedFileIndex
                              ? (_affectedPartUploadController
                                      .progresses.value[pickedFileIndex]
                                      .toDouble() /
                                  100)
                              : 0.0,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${(_affectedPartUploadController.progresses.value.length > pickedFileIndex ? _affectedPartUploadController.progresses.value[pickedFileIndex].toStringAsFixed(0) : 'Not yet uploaded')}%',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    FutureBuilder<int>(
                      future: Future.value(_file.size),
                      builder:
                          (BuildContext context, AsyncSnapshot<int> snapshot) {
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
                  DataCell(
                    Text(
                      '${(_affectedPartUploadController.progresses.value.length > pickedFileIndex ? "Done" : 'Pending')}',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () =>
                          _affectedPartUploadController.removeFile(_file),
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
