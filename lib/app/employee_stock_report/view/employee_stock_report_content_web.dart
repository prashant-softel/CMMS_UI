import 'package:cmms/app/app.dart';
import 'package:cmms/app/employee_stock_report/employee_stock_report_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/dropdown_web.dart';

class EmployeeStockReportContentWeb
    extends GetView<EmployeeStockReportController> {
  EmployeeStockReportContentWeb({Key? key}) : super(key: key);
  final EmployeeStockReportController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeStockReportController>(
        id: 'employeeReport',
        builder: (controller) {
          return Obx(
            () => Container(
              color: Color.fromARGB(255, 234, 236, 238),
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 227, 224, 224),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 236, 234, 234)
                              .withOpacity(0.5),
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
                          "DASHBOARD",
                          style: Styles.greyLight14,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(" / STOCK MANAGEMENT",
                              style: Styles.greyMediumLight12),
                        ),
                        Text(" / EMPLOYEE STOCK REPORT1 ",
                            style: Styles.greyMediumLight12)
                      ],
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Container(
                            width: Get.width,
                            margin:
                                EdgeInsets.only(left: 10, top: 10, right: 10),
                            height: Get.height,
                            //height: Get.height - 300,

                            child: Card(
                              color: Color.fromARGB(255, 245, 248, 250),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Employee Stock Report ",
                                          style: Styles.blackBold16,
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            CustomRichText(title: 'Date Range'),
                                            Dimens.boxWidth10,
                                            CustomTextFieldForStock(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
                                              numberTextField: true,
                                              onTap: () {
                                                controller
                                                        .openFromDateToStartDatePicker =
                                                    !controller
                                                        .openFromDateToStartDatePicker;
                                                controller
                                                    .update(['employeeReport']);
                                              },
                                              hintText:
                                                  '${controller.formattedFromdate.toString()} To ${controller.formattedTodate.toString()}',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Row(
                                    children: [
                                      // Container(
                                      //   height: 35,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //       backgroundColor:
                                      //           ColorValues.appLightBlueColor,
                                      //       onPressed: () {},
                                      //       text: 'Copy'),
                                      // ),
                                      // Container(
                                      //   height: 35,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //       backgroundColor:
                                      //           ColorValues.appLightBlueColor,
                                      //       onPressed: () {},
                                      //       text: 'Excel'),
                                      // ),
                                      // Container(
                                      //   height: 35,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //       backgroundColor:
                                      //           ColorValues.appLightBlueColor,
                                      //       onPressed: () {},
                                      //       text: 'PDF'),
                                      // ),
                                      // Container(
                                      //   height: 35,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //     backgroundColor:
                                      //         ColorValues.appLightBlueColor,
                                      //     onPressed: () {},
                                      //     text: 'columnVisibility'.tr,
                                      //   ),
                                      // ),
                                      Spacer(),
                                      Container(
                                        width: 200,
                                        height: 35,
                                        margin: Dimens.edgeInsets0_0_16_0,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            ),
                                            contentPadding:
                                                Dimens.edgeInsets10_0_0_0,
                                            hintText: 'search'.tr,
                                            hintStyle: Styles.grey12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        Text(
                                          'User Login ID: ',
                                          style: Styles.blackBold14,
                                        ),
                                        Dimens.boxWidth20,
                                        Container(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .2),
                                          child: DropdownWebWidget(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: const Offset(
                                                  5.0,
                                                  5.0,
                                                ),
                                                blurRadius: 5.0,
                                                spreadRadius: 1.0,
                                              ),
                                              BoxShadow(
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ),
                                            ],
                                            controller: controller,
                                            dropdownList: controller.userList,
                                            isValueSelected:
                                                controller.isSelectedUser.value,
                                            selectedValue:
                                                controller.selectedUser.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  controller.assetItemList.isEmpty
                                      ? Expanded(
                                          child: ScrollableTableView(
                                            columns: [
                                              "Assets ID",
                                              "Assets Name",
                                              "Assets Code",
                                              "Requested By",
                                              "Open",
                                              "Inward",
                                              "Outward",
                                              "Balance",
                                            ].map((column) {
                                              return TableViewColumn(
                                                label: column,
                                                minWidth: Get.width * 0.16,
                                              );
                                            }).toList(),
                                            rows: [
                                              ...List.generate(
                                                controller.assetItemList.length,
                                                (index) {
                                                  return [
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                    '',
                                                  ];
                                                },
                                              ),
                                            ].map((record) {
                                              return TableViewRow(
                                                height: 50,
                                                cells: record.map((value) {
                                                  return TableViewCell(
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              );
                                            }).toList(),
                                          ),
                                        )
                                      : Expanded(
                                          child: Container(
                                            margin: Dimens.edgeInsets15,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: ColorValues
                                                    .lightGreyColorWithOpacity35,
                                                width: 1,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: ColorValues
                                                      .appBlueBackgroundColor,
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: ScrollableTableView(
                                                // paginationController:
                                                //     controller.paginationController,
                                                columns: [
                                                  "Assets ID",
                                                  "Assets Name",
                                                  "Assets Code",
                                                  "Requested By",
                                                  "Open",
                                                  "Inward",
                                                  "Outward",
                                                  "Balance",
                                                ].map((column) {
                                                  return TableViewColumn(
                                                    label: column,
                                                    minWidth: Get.width * 0.13,
                                                  );
                                                }).toList(),
                                                rows: controller.assetItemList
                                                    .map((stockDetails) =>
                                                        TableViewRow(
                                                            height: 50,
                                                            cells: [
                                                              TableViewCell(
                                                                child: Text(
                                                                  '${stockDetails?.assetItemID ?? ""}',
                                                                ),
                                                              ),
                                                              TableViewCell(
                                                                  child: Text(
                                                                '${stockDetails?.asset_name ?? ""}',
                                                              )),
                                                              TableViewCell(
                                                                  child: Text(
                                                                '${stockDetails?.asset_code ?? ""}',
                                                              )),
                                                              TableViewCell(
                                                                  child: Text(
                                                                '${stockDetails?.requested_by_name ?? ""}',
                                                              )),
                                                              TableViewCell(
                                                                  child: Text(
                                                                '${stockDetails?.opening ?? ""}',
                                                              )),
                                                              TableViewCell(
                                                                  child: Text(
                                                                '${stockDetails?.inward ?? ""}',
                                                              )),
                                                              TableViewCell(
                                                                  child: Text(
                                                                      '${stockDetails?.outward}')),
                                                              TableViewCell(
                                                                  child: Text(
                                                                '${stockDetails?.balance ?? ""}',
                                                              )),
                                                            ]))
                                                    .toList()),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          if (controller.openFromDateToStartDatePicker)
                            Positioned(
                              right: 150,
                              top: 85,
                              child: DatePickerWidget(
                                selectionMode:
                                    DateRangePickerSelectionMode.range,
                                monthCellStyle: DateRangePickerMonthCellStyle(
                                  todayCellDecoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorValues.appDarkBlueColor),
                                ), // last date of this year
                                // controller: DateRangePickerController(),
                                initialSelectedRange: PickerDateRange(
                                  controller.fromDate.value,
                                  controller.toDate.value,
                                ),

                                onSubmit: (value) {
                                  print('po valu ${value.toString()}');
                                  PickerDateRange? data =
                                      value as PickerDateRange;

                                  var pickUpDate =
                                      DateTime.parse(data.startDate.toString());
                                  controller.fromDate.value = pickUpDate;
                                  var dropDate =
                                      DateTime.parse(data.endDate.toString());
                                  dropDate != null
                                      ? controller.toDate.value = dropDate
                                      : controller.toDate.value = pickUpDate;

                                  controller.getEmployeeReportListListByDate();
                                  controller.openFromDateToStartDatePicker =
                                      !controller.openFromDateToStartDatePicker;
                                  controller.update(['employeeReport']);

                                  // Get.toNamed(
                                  //   Routes.stockManagementGoodsOrdersScreen,
                                  // );
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
