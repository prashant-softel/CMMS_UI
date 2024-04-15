import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/mrs/mrs_list_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/get_mrs_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../widgets/date_picker.dart';

class MrsListContentMobile extends GetView<MrsListController> {
  MrsListContentMobile({Key? key}) : super(key: key);
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    ///
    return GetBuilder<MrsListController>(
        id: 'mrslist',
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
                        controller.update(['PreventiveMaintenanceTask']);
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

                            controller.getMrsListByDate();
                            controller.openFromDateToStartDatePicker =
                                !controller.openFromDateToStartDatePicker;
                            controller.update(['PreventiveMaintenanceTask']);

                            // Get.toNamed(
                            //   Routes.stockManagementGoodsOrdersScreen,
                            // );
                          },
                        );
                      },
                    ),
                    Dimens.boxHeight10,
                    Expanded(
                      child: ListView.builder(
                          //physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.mrsList != null
                              ? controller.mrsList.length
                              : 0,
                          itemBuilder: (context, index) {
                            final mrsListModel = (controller.mrsList != null)
                                ? controller.mrsList[index]
                                : MrsListModel();
                            return GestureDetector(
                              onTap: () {
                                controller.clearStoreData();
                                // controller.clearStoreDatatype();
                                var _mrsId = controller.mrsList[index]!.id ?? 0;
                                controller.mrsList[index]?.status == 323
                                    ? Get.toNamed(Routes.mrsIssueScreen,
                                        arguments: {'mrsId': _mrsId})
                                    : Get.toNamed(Routes.mrsApprovalScreen,
                                        arguments: {'mrsId': _mrsId});
                              },
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
                                                'MRS Id: ',
                                                style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                'MRS${mrsListModel?.id ?? 0}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                padding:
                                                    Dimens.edgeInsets8_2_8_2,
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorValues.addNewColor,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Text(
                                                  '${mrsListModel?.status_short}',
                                                  style:
                                                      Styles.white10.copyWith(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(children: [
                                            Text(
                                              'Activity: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${mrsListModel?.activity}'
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
                                              'Where Used: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${mrsListModel?.whereUsedType.toString().toUpperCase() ?? ''}${mrsListModel?.whereUsedTypeId ?? ''}',
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
                                              'Mrs Detail: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "Requested by:${mrsListModel?.requested_by_name ?? ""}\nIssued by:${mrsListModel?.approver_name ?? ""}",
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
                                                  'Order Date',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  "${mrsListModel?.requestd_date ?? ''}",
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
