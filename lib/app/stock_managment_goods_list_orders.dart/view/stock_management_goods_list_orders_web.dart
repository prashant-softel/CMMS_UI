import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/table_action_button.dart';
import '../stock_management_goods_list_orders_controller.dart';

class StockManagementGoodsOrdersWeb extends StatefulWidget {
  StockManagementGoodsOrdersWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<StockManagementGoodsOrdersWeb> createState() =>
      _StockManagementGoodsOrdersWebState();
}

class _StockManagementGoodsOrdersWebState
    extends State<StockManagementGoodsOrdersWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StockManagementGoodsOrdersController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(
            () => SingleChildScrollView(
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
                        Text(" / GOODS ORDER", style: Styles.greyMediumLight12)
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Flexible(
                        child: Container(
                          width: Get.width * 7,
                          margin: EdgeInsets.only(left: 10, top: 30),
                          height: Get.height,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "GOODS ORDER",
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
                                              controller.update(
                                                  ['stock_Mangement_Date']);
                                            },
                                            hintText:
                                                '${controller.formattedTodate.toString()} To ${controller.formattedFromdate.toString()}',
                                          ),
                                        ],
                                      ),
                                      Dimens.boxWidth10,
                                      ActionButton(
                                        icon: Icons.add,
                                        label: "Add New",
                                        onPressed: () {
                                          Get.offNamed(Routes
                                              .updateGoodsOrdersDetailsScreen);
                                        },
                                        color: ColorValues.appGreenColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'Copy'),
                                    ),
                                    Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'Excel'),
                                    ),
                                    Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'PDF'),
                                    ),
                                    Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () {},
                                        text: 'columnVisibility'.tr,
                                      ),
                                    ),
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
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 0.0),
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
                                SizedBox(
                                  height: 20,
                                ),
                                controller.goodsOrdersList!.isEmpty
                                    ? Expanded(
                                        child: ScrollableTableView(
                                          columns: [
                                            "Order ID",
                                            "Challan No",
                                            "Generated By",
                                            "Order Date",
                                            "Cost",
                                            "Status",
                                            "Action",
                                          ].map((column) {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width * 0.10,
                                            );
                                          }).toList(),
                                          rows: [
                                            ...List.generate(
                                              controller.goodsOrdersList
                                                      ?.length ??
                                                  0,
                                              (index) {
                                                return [
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
                                              height: 60,
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
                                            paginationController:
                                                controller.paginationController,
                                            columns: [
                                              "Order ID",
                                              "Challan No",
                                              "Generated By",
                                              "Order Date",
                                              "Cost",
                                              "Status",
                                              "Action",
                                            ].map((column) {
                                              return TableViewColumn(
                                                label: column,
                                                minWidth: Get.width * 0.10,
                                              );
                                            }).toList(),
                                            rows: [
                                              ...List.generate(
                                                controller
                                                    .goodsOrdersList!.length,
                                                (index) {
                                                  return [
                                                    '${controller.goodsOrdersList![index]?.id}',
                                                    '${controller.goodsOrdersList![index]?.challan_no}',
                                                    '${controller.goodsOrdersList![index]?.generatedBy}',
                                                    '${controller.goodsOrdersList![index]?.purchaseDate}',
                                                    '${controller.goodsOrdersList![index]?.cost}',
                                                    '${controller.goodsOrdersList![index]?.status}    '
                                                        '${controller.goodsOrdersList![index]?.status_short}',
                                                    'Action',
                                                  ];
                                                },
                                              ),
                                            ].map((record) {
                                              // print('recoerdfjb:$record');
                                              return TableViewRow(
                                                height: 60,
                                                cells: record.map((value) {
                                                  return TableViewCell(
                                                    child: value == "Action"
                                                        ? Wrap(children: [
                                                            TableActionButton(
                                                              color: ColorValues
                                                                  .viewColor,
                                                              icon: Icons
                                                                  .remove_red_eye_outlined,
                                                              // label: 'view',

                                                              onPress: () {
                                                                controller.viewAddGoodsOrdersDetails(
                                                                    id: int.tryParse(
                                                                        '${record[0]}'));
                                                                Get.toNamed(Routes
                                                                    .viewGoodsOrders);
                                                              },
                                                            ),
                                                            TableActionButton(
                                                              onPress: () {
                                                                controller.showAddGoodsOrdersDetails(
                                                                    id: int.tryParse(
                                                                        '${record[0]}'));
                                                              },
                                                              color: ColorValues
                                                                  .editColor,
                                                              icon: Icons.edit,
                                                            ),
                                                            TableActionButton(
                                                              color: ColorValues
                                                                  .deleteColor,
                                                              icon:
                                                                  Icons.delete,
                                                              // label: 'Delete',
                                                              onPress: () {
                                                                controller.isDeleteDialog(
                                                                    id: record[
                                                                        0],
                                                                    generatedBy:
                                                                        record[
                                                                            1]);
                                                              },
                                                            ),
                                                          ])
                                                        : Text(value),
                                                  );
                                                }).toList(),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: ValueListenableBuilder(
                                      valueListenable:
                                          controller.paginationController,
                                      builder: (context, value, child) {
                                        return Row(children: [
                                          Text(
                                              "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
                                          Row(children: [
                                            IconButton(
                                              onPressed: controller
                                                          .paginationController
                                                          .currentPage <=
                                                      1
                                                  ? null
                                                  : () {
                                                      controller
                                                          .paginationController
                                                          .previous();
                                                    },
                                              iconSize: 20,
                                              splashRadius: 20,
                                              icon: Icon(
                                                Icons
                                                    .arrow_back_ios_new_rounded,
                                                color: controller
                                                            .paginationController
                                                            .currentPage <=
                                                        1
                                                    ? Colors.black26
                                                    : Theme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: controller
                                                          .paginationController
                                                          .currentPage >=
                                                      controller
                                                          .paginationController
                                                          .pageCount
                                                  ? null
                                                  : () {
                                                      controller
                                                          .paginationController
                                                          .next();
                                                    },
                                              iconSize: 20,
                                              splashRadius: 20,
                                              icon: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: controller
                                                            .paginationController
                                                            .currentPage >=
                                                        controller
                                                            .paginationController
                                                            .pageCount
                                                    ? Colors.black26
                                                    : Theme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          ]),
                                        ]);
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (controller.openFromDateToStartDatePicker)
                        Positioned(
                          right: 150,
                          top: 85,
                          child: DatePickerWidget(
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

                              controller.getPmTaskListByDate();
                              controller.openFromDateToStartDatePicker =
                                  !controller.openFromDateToStartDatePicker;
                              controller.update(['stock_Mangement_Date']);

                              // Get.toNamed(
                              //   Routes.stockManagementGoodsOrdersScreen,
                              // );
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
