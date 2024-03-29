import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/pm_mapping/pm_mapping_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class PmMappingContentWeb extends GetView<PmMappingController> {
  PmMappingContentWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 234, 236, 238),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        HeaderWidget(),
        Container(
          height: 45,
          decoration: BoxDecoration(
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
              InkWell(
                onTap: () {
                  Get.offNamed(Routes.home);
                },
                child: Text(
                  "DASHBOARD",
                  style: Styles.greyLight14,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.offNamed(Routes.preventive);
                },
                child: Text(" / PREVENTIVE MAINTENANCE",
                    style: Styles.greyMediumLight12),
              ),
              Text(" / CHECKLIST MAPPING ", style: Styles.greyMediumLight12)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20),
          child: Text(
            "Check List Mapping",
            style: Styles.blackBold16,
          ),
        ),
        Expanded(
            child: varUserAccessModel.value.access_list!
                        .where((e) => e.feature_id == 7 && e.view == 0)
                        .length >
                    0
                ? Container(
                    width: Get.width,
                    color: Color.fromARGB(255, 244, 248, 250),
                    margin: EdgeInsets.only(
                        top: 10, right: 30, left: 20, bottom: 30),
                    child: Obx(
                      () => DataTable2(
                        headingRowColor:
                            MaterialStateColor.resolveWith((states) {
                          return Color.fromARGB(255, 246, 244, 244);
                        }),
                        border: TableBorder.all(
                            width: .5,
                            color: Color.fromARGB(255, 153, 184, 189)),
                        dataRowHeight: (Get.height - 10) / 8,
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
                          controller.checkList.length >=
                                  controller.checkList.length
                              ? controller.equipmentCategoryNameList.length
                              : controller.checkList.length,
                          (index) {
                            return DataRow(cells: [
                              DataCell(
                                index <
                                        controller
                                            .equipmentCategoryNameList.length
                                    ? Center(
                                        child: Text(controller
                                                    .equipmentCategoryNameList[
                                                index] ??
                                            ""))
                                    : Container(),
                              ),
                              DataCell(
                                index <
                                        controller
                                            .equipmentCategoryNameList.length
                                    ? SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Container(
                                          //  height: 90,
                                          margin: EdgeInsets.all(5),
                                          child: MultiSelectDialogField(
                                            decoration: BoxDecoration(
                                              color: ColorValues.whiteColor,
                                            ),
                                            buttonIcon: Icon(
                                              Icons.arrow_drop_down,
                                              color: ColorValues.whiteColor,
                                            ),
                                            initialValue: controller
                                                .selectedOption(controller
                                                        .equipmentCategoryNameList[
                                                    index]),
                                            onSelectionChanged:
                                                (selectedItem) {},
                                            items: (controller.checkList.where(
                                                    (element) =>
                                                        element
                                                            ?.category_name ==
                                                        controller
                                                                .equipmentCategoryNameList[
                                                            index]))
                                                .map((e) => MultiSelectItem(e,
                                                    e?.name.toString() ?? ''))
                                                .toList(),
                                            searchable: true,
                                            onConfirm: (selectedOptionsList) =>
                                                {
                                              controller.checkListSelected(
                                                selectedOptionsList,
                                              )
                                            },
                                            buttonText: null,
                                            chipDisplay: MultiSelectChipDisplay(
                                              //  scroll: true,
                                              //  height: 250,
                                              decoration: BoxDecoration(
                                                color: ColorValues.whiteColor,
                                              ),
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
                    ))
                : Dimens.box0),
        Container(
          margin: EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   height: 35,
              //   child: CustomElevatedButton(
              //     backgroundColor: ColorValues.redColor,
              //     text: "Cancel",
              //     onPressed: () {},
              //   ),
              // ),
              // SizedBox(
              //   width: 20,
              // ),
              varUserAccessModel.value.access_list!
                          .where((e) => e.feature_id == 7 && e.add == 0)
                          .length >
                      0
                  ? Container(
                      height: 35,
                      child: CustomElevatedButton(
                        backgroundColor: ColorValues.greenColor,
                        text: 'Submitted',
                        onPressed: () {
                          controller.savePmMapping();
                        },
                      ),
                    )
                  : Dimens.box0,
              SizedBox(
                width: 20,
              ),
              // Container(
              //   height: 35,
              //   child: CustomElevatedButton(
              //     backgroundColor: ColorValues.appDarkBlueColor,
              //     text: "Print",
              //     onPressed: () {},
              //   ),
              // ),
            ],
          ),
        )
      ]),
    );
  }
}
