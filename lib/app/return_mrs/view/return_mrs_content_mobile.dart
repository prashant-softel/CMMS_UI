import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/return_mrs/return_mrs_controller.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/get_return_mrs_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ReturnMrsListContentMobile extends GetView<ReturnMrsListController> {
  ReturnMrsListContentMobile({Key? key}) : super(key: key);
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    ///
    return GetBuilder<ReturnMrsListController>(
        id: 'mrslist',
        builder: (controller) {
          return //
              Scaffold(
            body: //
                Obx(
              () => Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Dimens.boxHeight10,
                        HeaderWidgetMobile(
                          onPressed: () {
                            controller.openFromDateToStartDatePicker =
                                !controller.openFromDateToStartDatePicker;
                            controller.update(['mrslist']);
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
                                final mrsReturnListModel =
                                    (controller.mrsList != null)
                                        ? controller.mrsList[index]
                                        : ReturnMrsListModel();
                                return GestureDetector(
                                  onTap: () {
                                    controller.clearStoreData();
                                    // controller.clearStoreDatatype();
                                    String rmrsId = controller
                                            .mrsList[index]!.id
                                            .toString() ??
                                        '';
                                    String type = 0.toString();
                                    Get.offNamed(
                                        '${Routes.approverReturnMrs}/$rmrsId/$type');
                                  },
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
                                                    'MRS Id: ',
                                                    style: const TextStyle(
                                                        color: ColorValues
                                                            .blackColor,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    'MRS${mrsReturnListModel?.id ?? 0}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    padding: Dimens
                                                        .edgeInsets8_2_8_2,
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .addNewColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Text(
                                                      '${mrsReturnListModel?.status_short}',
                                                      style: Styles.white10
                                                          .copyWith(
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
                                                    '${mrsReturnListModel?.activity}'
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
                                                  'Where Used: ',
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
                                                    '${mrsReturnListModel?.whereUsedType.toString().toUpperCase() ?? ''}${mrsReturnListModel?.whereUsedTypeId ?? ''}',
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
                                                  'Mrs Detail: ',
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
                                                    "Requested by:${mrsReturnListModel?.requested_by_name ?? ""}\nIssued by:${mrsReturnListModel?.approver_name ?? ""}",
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
                                                      'Order Date',
                                                      style: const TextStyle(
                                                          color: ColorValues
                                                              .blackColor,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "${mrsReturnListModel?.requestd_date ?? ''}",
                                                      style: const TextStyle(
                                                        color: ColorValues
                                                            .navyBlueColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ]),
                                              Dimens.boxHeight5,
                                              varUserAccessModel.value
                                                                  .access_list!
                                                                  .where((e) =>
                                                                      e.feature_id ==
                                                                          UserAccessConstants
                                                                              .kreturnMrsFeatureId &&
                                                                      e.edit ==
                                                                          UserAccessConstants
                                                                              .kHaveEditAccess)
                                                                  .length >
                                                              0 &&
                                                          controller.mrsList
                                                                  .firstWhere(
                                                                    (e) =>
                                                                        e?.id ==
                                                                        mrsReturnListModel!
                                                                            .id,
                                                                    orElse: () =>
                                                                        ReturnMrsListModel(
                                                                            id: 00),
                                                                  )
                                                                  ?.status ==
                                                              321 ||
                                                      varUserAccessModel.value
                                                                  .access_list!
                                                                  .where((e) =>
                                                                      e.feature_id ==
                                                                          UserAccessConstants
                                                                              .kreturnMrsFeatureId &&
                                                                      e.edit ==
                                                                          UserAccessConstants
                                                                              .kHaveEditAccess)
                                                                  .length >
                                                              0 &&
                                                          controller.mrsList
                                                                  .firstWhere(
                                                                    (e) =>
                                                                        e?.id ==
                                                                        mrsReturnListModel!
                                                                            .id,
                                                                    orElse: () =>
                                                                        ReturnMrsListModel(
                                                                            id: 00),
                                                                  )
                                                                  ?.status ==
                                                              321
                                                  ? Center(
                                                      child:
                                                          CustomElevatedButton(
                                                        onPressed: () {
                                                          controller
                                                              .clearStoreData();

                                                          int mrsId =
                                                              mrsReturnListModel
                                                                      ?.id ??
                                                                  0;

                                                          Get.toNamed(
                                                              Routes
                                                                  .editReturnMrs,
                                                              arguments: {
                                                                'mrsId': mrsId,
                                                              });
                                                        },
                                                        text: 'Edit MRS',
                                                        icon: Icons.edit,
                                                        backgroundColor:
                                                            ColorValues
                                                                .editColor,
                                                      ),
                                                    )
                                                  : Dimens.box0
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
                            controller.getReturnMrsListByDate();
                            controller.openFromDateToStartDatePicker = false;
                            controller.update(['mrslist']);
                          }
                        },
                        onCancel: () {
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['mrslist']);
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
