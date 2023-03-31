import 'package:cmms/app/pm_mapping/pm_mapping_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../theme/color_values.dart';
import '../../theme/styles.dart';

class PmMappingContentWeb extends GetView<PmMappingController> {
  PmMappingContentWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 234, 236, 238),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromARGB(255, 227, 224, 224),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.home,
                color: ColorValues.greyLightColor,
              ),
              Text(
                "Dashboard",
                style: Styles.greyLight14,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(" / Preventive Maintenance",
                    style: Styles.greyMediumLight12),
              ),
              Text(" / Checklist Mapping ", style: Styles.greyMediumLight12)
            ],
          ),
        ),
        Expanded(
          child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 244, 248, 250),
              margin: EdgeInsets.only(top: 20, right: 30, left: 20, bottom: 30),
              child: Obx(
                () => DataTable2(
                  headingRowColor: MaterialStateColor.resolveWith((states) {
                    return Color.fromARGB(255, 246, 244, 244);
                  }),
                  border: TableBorder.all(
                      width: .5, color: Color.fromARGB(255, 153, 184, 189)),
                  dataRowHeight: (MediaQuery.of(context).size.height - 89) / 9,
                  columnSpacing: 12,
                  //horizontalMargin: 12,
                  minWidth: 600,

                  columns: [
                    DataColumn2(
                      size: ColumnSize.S,
                      label: Center(
                          child: Text(
                        'Equipment List',
                        style: Styles.blackBold16,
                      )),
                    ),
                    DataColumn(
                        label: Container(
                            margin: EdgeInsets.only(left: 30),
                            child: Text(
                              'Check List',
                              style: Styles.blackBold16,
                            ))),
                  ],
                  rows: List.generate(
                    controller.equipmentCategoryList.length >=
                            controller.checkList.length
                        ? controller.equipmentCategoryList.length
                        : controller.checkList.length,
                    (index) {
                      return DataRow(cells: [
                        DataCell(
                          index < controller.equipmentCategoryList.length
                              ? Center(
                                  child: Text(controller
                                      .equipmentCategoryList[index]!.name),
                                )
                              : Container(),
                        ),
                        DataCell(
                          index < controller.equipmentCategoryList.length
                              ? SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Container(
                                    height: 90,
                                    margin: EdgeInsets.all(5),
                                    child: MultiSelectDialogField(
                                      decoration: BoxDecoration(
                                        color: ColorValues.whiteColor,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      buttonIcon: Icon(
                                        Icons.arrow_drop_down,
                                        color: ColorValues.whiteColor,
                                      ),
                                      items: controller.checkList
                                          .map((e) => MultiSelectItem(
                                              e, e?.checklist_number ?? ''))
                                          .toList(),
                                      searchable: true,
                                      onConfirm: (selectedOptionsList) => {
                                        controller.checkListSelected(
                                            selectedOptionsList)
                                      },
                                      buttonText: null,
                                      chipDisplay: MultiSelectChipDisplay(
                                        height: 120,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                      ]);
                    },
                  ),
                ),
              )),
          //),
        ),
      ]),
    );
  }
}
