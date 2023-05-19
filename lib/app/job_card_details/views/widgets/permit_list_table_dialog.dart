import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/models/new_permit_list_model.dart';
import '../../../job_details/job_details_controller.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../utils/responsive.dart';
import '../../../widgets/table_action_button.dart';

class PermitListTableDialog extends GetView<JobDetailsController> {
  const PermitListTableDialog({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    final fieldNames = [
      'Permit Site No.',
      'Permit ID',
      'Permit Type',
      'Requested By',
      'Permit Status',
      'Request Date',
    ];

    ///
    return //
        AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      backgroundColor: ColorValues.appBlueBackgroundColor,
      title: Text(
        'Permits',
        textAlign: TextAlign.center,
      ),
      content: Builder(builder: (context) {
        return //
            (Responsive.isDesktop(context))
                ? Container(
                    padding: Dimens.edgeInsets05_0_5_0,
                    height: Get.height * 0.25,
                    width: Get.width * 0.9,
                    child: //
                        Obx(
                      () => //
                          Column(
                              //
                              mainAxisSize: MainAxisSize.min,
                              children: [
                            Expanded(
                              child: DataTable2(
                                headingRowHeight: Get.height * 0.06,
                                dataRowHeight: Get.height * 0.08,
                                columnSpacing:
                                    5, // Adjust column spacing as needed
                                horizontalMargin: 5,
                                border: TableBorder.all(
                                    color: Colors.grey,
                                    width: 1), // Set table border color
                                columns: [
                                  DataColumn2(
                                      label: Text('Permit To Work'),
                                      size: ColumnSize.L),
                                  DataColumn2(
                                      label: Text('Site Permit No.'),
                                      size: ColumnSize.S),
                                  DataColumn2(
                                      label: Text('Permit ID'),
                                      size: ColumnSize.S),
                                  // DataColumn2(
                                  //     label: Text('Permit Name'), size: ColumnSize.S),
                                  DataColumn2(
                                      label: Text('Permit Type'),
                                      size: ColumnSize.L),
                                  DataColumn2(
                                      label: Text('Assigned To'),
                                      size: ColumnSize.L),
                                  DataColumn2(
                                      label: Text('Permit Status'),
                                      size: ColumnSize.L),
                                  DataColumn2(
                                      label: Text('Permit Date'),
                                      size: ColumnSize.M),
                                  DataColumn2(
                                      label: Text('Job Card'),
                                      size: ColumnSize.S),
                                ],
                                rows: [
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        Expanded(
                                          child: DropdownButtonFormField<
                                              NewPermitModel>(
                                            isExpanded: true,
                                            items: controller.permitList
                                                ?.map((item) {
                                              return DropdownMenuItem(
                                                child: Text(
                                                    item?.permitTypeName ?? ''),
                                                value: item,
                                              );
                                            }).toList(),
                                            value:
                                                controller.selectedPermit.value,
                                            onChanged: (NewPermitModel? value) {
                                              controller
                                                  .onPermitSelected(value);
                                              // print('Selected Permit ID: $selectedPermitId');
                                            },
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.black),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.black),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      for (int i = 0; i < 6; i++)
                                        DataCell(
                                          Obx(
                                            () => //

                                                TextFormField(
                                              textAlign: TextAlign.center,
                                              controller: TextEditingController(
                                                  text: controller
                                                      .permitValues[i]),
                                              decoration: InputDecoration(
                                                // hintText: 'Filter',
                                                contentPadding: EdgeInsets.all(
                                                    0), // Remove padding
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                      color: Colors.black),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                      color: Colors.black),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      (controller.isPermitLinked.value == true)
                                          ? DataCell(
                                              TableActionButton(
                                                color:
                                                    ColorValues.appPurpleColor,
                                                icon: Icons.add,
                                                label: 'Job Card',
                                                onPress: () {
                                                  controller
                                                      .goToJobCardScreen();
                                                },
                                              ),
                                            )
                                          : DataCell(Dimens.box0)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Text(controller.responseMessage.value),
                            controller.responseMessage.value.isEmpty
                                ? CustomElevatedButton(
                                    text: 'Link',
                                    onPressed: () => controller.linkToPermit(),
                                  )
                                : CustomElevatedButton(
                                    text: 'View Job',
                                    onPressed: () =>
                                        controller.goToJobDetailsScreen(),
                                  ),
                          ]),
                    ),
                  )
                : Container(
                    padding: Dimens.edgeInsets05_0_5_0,
                    height: Get.height,
                    width: Get.width * 0.9,
                    child: Obx(() {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DropdownButtonFormField<NewPermitModel>(
                              isExpanded: true,
                              items: controller.permitList?.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item?.permitTypeName ?? ''),
                                  value: item,
                                );
                              }).toList(),
                              value: controller.selectedPermit.value,
                              onChanged: (NewPermitModel? value) {
                                controller.onPermitSelected(value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                            for (int i = 0; i < 6; i++)
                              Card(
                                child: ListTile(
                                  title: Text(fieldNames[
                                      i]), // replace with your field names
                                  subtitle: Obx(
                                    () => TextFormField(
                                      textAlign: TextAlign.center,
                                      controller: TextEditingController(
                                          text: controller.permitValues[i]),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            (controller.isPermitLinked.value == true)
                                ? CustomElevatedButton(
                                    text: 'View Job',
                                    onPressed: () =>
                                        controller.goToJobDetailsScreen(),
                                  )
                                : CustomElevatedButton(
                                    text: 'Link',
                                    onPressed: () => controller.linkToPermit(),
                                  ),
                            Text(controller.responseMessage.value),
                          ],
                        ),
                      );
                    }),
                  );
      }),
      actions: [],
    );
  }

  ///
}
