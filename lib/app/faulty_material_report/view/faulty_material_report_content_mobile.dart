import 'package:cmms/app/app.dart';
import 'package:cmms/app/faulty_material_report/faulty_material_report_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/domain/models/get_faulty_material_report_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../widgets/date_picker.dart';

class FaultyMaterialReportContentMobile
    extends GetView<FaultyMaterialReportController> {
  FaultyMaterialReportContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return GetBuilder<FaultyMaterialReportController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return //
              Scaffold(
            body: //
                Obx(
              () => Stack(
                children: [
                  Container(
                    child: //
                        Column(
                      children: [
                        Dimens.boxHeight10,
                        HeaderWidgetMobile(
                          onPressed: () {
                            controller.openFromDateToStartDatePicker =
                                !controller.openFromDateToStartDatePicker;
                            controller.update(['stock_Mangement_Date']);
                            DatePickerWidget(
                              selectionMode: DateRangePickerSelectionMode.range,
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

                                //  controller.getPmTaskListByDate();
                                controller.openFromDateToStartDatePicker =
                                    false;

                                controller.update(['stock_Mangement_Date']);

                                // Get.toNamed(
                                //   Routes.stockManagementGoodsOrdersScreen,
                                // );
                              },
                              onCancel: () {
                                controller.openFromDateToStartDatePicker =
                                    false;
                                controller.update(['stock_Mangement_Date']);
                              },
                            );
                          },
                        ),
                        Dimens.boxHeight10,
                        Expanded(
                          child: ListView.builder(
                              //physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.faultyMaterialReportList !=
                                      null
                                  ? controller.faultyMaterialReportList.length
                                  : 0,
                              itemBuilder: (context, index) {
                                final pmTaskModel = (controller
                                            .faultyMaterialReportList !=
                                        null)
                                    ? controller.faultyMaterialReportList[index]
                                    : FaultyMaterialReportModel();
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Card(
                                      color: Colors.lightBlue.shade50,
                                      elevation: 10,
                                      shadowColor: Colors.black87,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Assets Name: ',
                                                    style: const TextStyle(
                                                        color: ColorValues
                                                            .blackColor,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      '${pmTaskModel?.asset_name ?? ""}',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: ColorValues
                                                            .navyBlueColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(children: [
                                                Text(
                                                  'Serial Number: ',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${pmTaskModel?.serial_number}'
                                                    '',
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                              Row(//
                                                  children: [
                                                Text(
                                                  'Replace Serial No.: ',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    pmTaskModel
                                                            ?.replaceSerialNo ??
                                                        '',
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              ]),
                                              Row(children: [
                                                Text(
                                                  'Inseted DateTime: ',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "${pmTaskModel?.lastInsetedDateTime ?? ''}",
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              ]),
                                              Row(children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'quantity',
                                                      style: const TextStyle(
                                                          color: ColorValues
                                                              .blackColor,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "${pmTaskModel?.qty ?? ''}",
                                                      style: const TextStyle(
                                                        color: ColorValues
                                                            .navyBlueColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Spacer(),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Remark',
                                                        style: const TextStyle(
                                                            color: ColorValues
                                                                .blackColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        "${pmTaskModel?.remarks ?? ''}",
                                                        style: const TextStyle(
                                                          color: ColorValues
                                                              .navyBlueColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                            ]),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  if (controller.openFromDateToStartDatePicker)
                    Positioned(
                      top: 50,
                      left: 10,
                      right: 10,
                      child: DatePickerWidget(
                        selectionMode: DateRangePickerSelectionMode.range,
                        monthCellStyle: DateRangePickerMonthCellStyle(
                          todayCellDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorValues.appDarkBlueColor,
                          ),
                        ),
                        initialSelectedRange: PickerDateRange(
                          controller.fromDate.value,
                          controller.toDate.value,
                        ),
                        onSubmit: (value) {
                          print('Selected date range: ${value.toString()}');
                          if (value is PickerDateRange) {
                            var pickUpDate = value.startDate ?? DateTime.now();
                            var dropDate = value.endDate ?? pickUpDate;
                            controller.fromDate.value = pickUpDate;
                            controller.toDate.value = dropDate;
                            controller.getPlantStockListByDate();
                            controller.openFromDateToStartDatePicker = false;
                            controller.update(['stock_Mangement_Date']);
                          }
                        },
                        onCancel: () {
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['stock_Mangement_Date']);
                        },
                      ),
                    ),
                  Dimens.boxHeight10,
                ],
              ),
            ),
            //
          );
        });
  }

  ///
}
