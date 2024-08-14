import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/transaction_report/transaction_report_list_controller.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/domain/models/transaction_report_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../widgets/date_picker.dart';

class TransactionReportContentMobile
    extends GetView<TransactionReportListController> {
  TransactionReportContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return GetBuilder<TransactionReportListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return //
              Scaffold(
            body: //
                Obx(
              () => Container(
                child: //
                    Column(
                  children: [
                    Dimens.boxHeight10,
                    HeaderWidgetMobile(
                      onPressed: () {
                        controller.openFromDateToStartDatePicker =
                            !controller.openFromDateToStartDatePicker;
                        controller.update(['plant_Stock']);
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
                            PickerDateRange? data = value as PickerDateRange;

                            var pickUpDate =
                                DateTime.parse(data.startDate.toString());
                            controller.fromDate.value = pickUpDate;
                            var dropDate =
                                DateTime.parse(data.endDate.toString());
                            dropDate != null
                                ? controller.toDate.value = dropDate
                                : controller.toDate.value = pickUpDate;

                            //  controller.getPmTaskListByDate();
                            controller.openFromDateToStartDatePicker = false;
                            controller.update(['stock_Mangement_Date']);

                            // Get.toNamed(
                            //   Routes.stockManagementGoodsOrdersScreen,
                            // );
                          },
                          onCancel: () {
                            controller.openFromDateToStartDatePicker = false;
                            controller.update(['stock_Mangement_Date']);
                          },
                        );
                      },
                    ),
                    Dimens.boxHeight10,
                    Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Actor Type: ',
                            style: Styles.blackBold14,
                          ),
                          Dimens.boxHeight8,
                          DropdownWebWidget(
                            width: Get
                                .width, //MediaQuery.of(context).size.width * 2,
                            dropdownList: controller.actorType,
                            isValueSelected:
                                controller.isSelectedactorType.value,
                            selectedValue: controller.selectedActorType.value,
                            onValueChanged: controller.onValueChanged,
                          ),
                          Dimens.boxHeight8,
                          Text(
                            'Task Name: ',
                            style: Styles.blackBold14,
                          ),
                          Dimens.boxHeight8,
                          controller.selectedactorTypeId == AppConstants.kTask
                              ? DropdownWebWidget(
                                  width: Get.width,
                                  dropdownList: controller.pmTaskList,
                                  isValueSelected:
                                      controller.isSelectedpmtask.value,
                                  selectedValue:
                                      controller.selectedpmtask.value,
                                  onValueChanged: controller.onValueChanged,
                                )
                              : controller.selectedactorTypeId ==
                                      AppConstants.kEngineer
                                  ? DropdownWebWidget(
                                      width: Get.width,
                                      dropdownList: controller.userList,
                                      isValueSelected:
                                          controller.isSelectedUser.value,
                                      selectedValue:
                                          controller.selectedUser.value,
                                      onValueChanged: controller.onValueChanged,
                                    )
                                  : controller.selectedactorTypeId ==
                                          AppConstants.kStore
                                      ? DropdownWebWidget(
                                          width: Get.width,
                                          dropdownList:
                                              controller.facilityNameList,
                                          isValueSelected: controller
                                              .isSelectedfacility.value,
                                          selectedValue:
                                              controller.selectedfacility.value,
                                          onValueChanged:
                                              controller.onValueChanged,
                                        )
                                      : controller.selectedactorTypeId ==
                                              AppConstants.kInventory
                                          ? DropdownWebWidget(
                                              width: Get.width,
                                              dropdownList:
                                                  controller.inventoryNameList,
                                              isValueSelected: controller
                                                  .isSelectedInventory.value,
                                              selectedValue: controller
                                                  .selectedInventory.value,
                                              onValueChanged:
                                                  controller.onValueChanged,
                                            )
                                          : controller.selectedactorTypeId ==
                                                  AppConstants.kJobCard
                                              ? DropdownWebWidget(
                                                  width: Get.width,
                                                  dropdownList:
                                                      controller.jobList,
                                                  isValueSelected: controller
                                                      .isSelectedJob.value,
                                                  selectedValue: controller
                                                      .selectedJob.value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                )
                                              : Dimens.box0
                        ],
                      ),
                    ),
                    Dimens.boxHeight8,
                    Expanded(
                      child: ListView.builder(
                          //physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.transactionReportList != null
                              ? controller.transactionReportList.length
                              : 0,
                          itemBuilder: (context, index) {
                            final pmTaskModel =
                                (controller.transactionReportList != null)
                                    ? controller.transactionReportList[index]
                                    : TransactionReportListModel();
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  color: Colors.lightBlue.shade50,
                                  elevation: 10,
                                  shadowColor: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
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
                                                'From Actor ID: ',
                                                style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${pmTaskModel?.fromActorID ?? ""}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(children: [
                                            Text(
                                              'From Actor Type: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${pmTaskModel?.fromActorType}'
                                                '',
                                                style: const TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ]),
                                          Row(//
                                              children: [
                                            Text(
                                              'From Actor Name: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                pmTaskModel?.fromActorName ??
                                                    '',
                                                style: const TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ]),
                                          Row(children: [
                                            Text(
                                              'To Actor Type: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${pmTaskModel?.toActorType ?? ''}",
                                                style: const TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ]),
                                          Row(children: [
                                            Text(
                                              'To Actor Name: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${pmTaskModel?.toActorName ?? ''}",
                                                style: const TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ]),
                                          Row(children: [
                                            Text(
                                              'Asset Item Name: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${pmTaskModel?.assetItemName ?? ''}",
                                                style: const TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
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
                                                  'Asset type',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  "${pmTaskModel?.assettype ?? ''}",
                                                  style: const TextStyle(
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Qty: ',
                                                    style: const TextStyle(
                                                        color: ColorValues
                                                            .blackColor,
                                                        fontWeight:
                                                            FontWeight.w500),
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
                                            )
                                          ]),
                                          Row(children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Last Updated',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  "${pmTaskModel?.lastUpdated ?? ''}",
                                                  style: const TextStyle(
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
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
            ),
            //
          );
        });
  }

  ///
}
