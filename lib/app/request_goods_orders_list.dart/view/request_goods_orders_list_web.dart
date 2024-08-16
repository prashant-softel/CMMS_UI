import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/request_goods_orders_list.dart/request_goods_orders_list_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/request_order_list.model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/table_action_button.dart';

class PurchaseGoodsorderListWeb extends StatefulWidget {
  PurchaseGoodsorderListWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<PurchaseGoodsorderListWeb> createState() =>
      _PurchaseGoodsorderListWebState();
}

class _PurchaseGoodsorderListWebState extends State<PurchaseGoodsorderListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchaseGoodsorderListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(
            () {
              final dataSource = GoodsOrderListDataSource(controller);
              return SelectionArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                Get.offAllNamed(
                                    Routes.stockManagementDashboardScreen);
                              },
                              child: Text(" / STOCK MANAGEMENT",
                                  style: Styles.greyLight14),
                            ),
                            Text(" / GOODS REQUEST LIST",
                                style: Styles.greyLight14)
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: Get.width * 7,
                            margin:
                                EdgeInsets.only(left: 10, top: 15, right: 10),
                            height: Get.height * .85 - 5,
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
                                          "Goods Request List",
                                          style: Styles.blackBold16,
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            CustomRichText(title: 'Date Range'),
                                            // Dimens.boxWidth10,
                                            SizedBox(width: 10),
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
                                                  '${controller.formattedFromdate} - ${controller.formattedTodate}',
                                            ),
                                          ],
                                        ),
                                        // Dimens.boxWidth10,
                                        SizedBox(width: 10),
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kReqOrderFeatureId &&
                                                        e.edit ==
                                                            UserAccessConstants
                                                                .kHaveApproveAccess)
                                                    .length >
                                                0
                                            ? ActionButton(
                                                icon: Icons.add,
                                                label: "Add New",
                                                onPressed: () {
                                                  controller.clearStoreData();
                                                  controller
                                                      .clearTypeStoreData();
                                                  Get.offNamed(Routes
                                                      .GoodsOrdersReqDetailsScreen);
                                                },
                                                color: ColorValues.addNewColor,
                                              )
                                            : Dimens.box0
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Row(
                                    children: [
                                      PopupMenuButton<String>(
                                        tooltip: "",
                                        elevation: 25.0,
                                        child: Container(
                                          height: 35,
                                          margin: EdgeInsets.only(left: 10),
                                          padding: EdgeInsets.only(
                                              top: 4,
                                              bottom: 4,
                                              right: 8,
                                              left: 8),
                                          decoration: BoxDecoration(
                                              color:
                                                  ColorValues.appLightBlueColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  offset:
                                                      const Offset(4.0, 2.0),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0,
                                                ),
                                              ]),
                                          child: Text(
                                            'Column Visibility',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry<String>>[]..addAll(
                                                  controller.columnVisibility
                                                      .value.entries
                                                      .map((e) {
                                                return PopupMenuItem<String>(
                                                    child:
                                                        ValueListenableBuilder(
                                                            valueListenable:
                                                                controller
                                                                    .columnVisibility,
                                                            builder: (context,
                                                                value, child) {
                                                              return Row(
                                                                children: [
                                                                  Checkbox(
                                                                    value: value[
                                                                        e.key],
                                                                    onChanged:
                                                                        (newValue) {
                                                                      controller.setColumnVisibility(
                                                                          e.key,
                                                                          newValue!);
                                                                    },
                                                                  ),
                                                                  Text(e.key),
                                                                ],
                                                              );
                                                            }));
                                              })),
                                        onSelected: (String value) {
                                          // Handle column selection
                                        },
                                      ),

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
                                      Container(
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: const Offset(2.0, 1.0),
                                            blurRadius: 5.0,
                                            spreadRadius: 1.0,
                                          )
                                        ]),
                                        height: 35,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {
                                              controller.export();
                                            },
                                            text: 'Excel'),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 300,
                                        height: 40,
                                        // margin: Dimens.edgeInsets0_0_16_0,
                                        margin: EdgeInsets.only(right: 5),
                                        child: TextField(
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 16.0,
                                                height: 1.0,
                                                color: Colors.black),
                                          ),
                                          onChanged: (value) =>
                                              controller.search(value),
                                          decoration: InputDecoration(
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 0.0,
                                              ),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 0.0,
                                              ),
                                            ),
                                            contentPadding:
                                                Dimens.edgeInsets05_10,
                                            hintText: 'search'.tr,
                                            hintStyle: Styles.grey16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  controller.goodsOrdersList.isEmpty == true &&
                                          controller.isLoading == false
                                      ? Center(child: Text('No data'))
                                      : controller.isLoading.value == true
                                          ? Center(
                                              child: Text("Data Loading......"))
                                          : Expanded(
                                              child: ValueListenableBuilder(
                                                  valueListenable: controller
                                                      .columnVisibility,
                                                  builder:
                                                      (context, value, child) {
                                                    final dataSource =
                                                        GoodsOrderListDataSource(
                                                            controller);

                                                    return PaginatedDataTable2(
                                                      columnSpacing: 10,
                                                      dataRowHeight: 60,
                                                      source:
                                                          dataSource, // Custom DataSource class
                                                      // headingRowHeight:
                                                      //     Get.height * 0.12,
                                                      minWidth: Get.width * 1.2,
                                                      showCheckboxColumn: false,
                                                      rowsPerPage:
                                                          10, // Number of rows per page
                                                      availableRowsPerPage: [
                                                        10,
                                                        20,
                                                        30,
                                                        50
                                                      ],
                                                      columns: [
                                                        for (var entry
                                                            in value.entries)
                                                          if (entry.value)
                                                            buildDataColumn(
                                                              entry.key,
                                                              controller
                                                                      .filterText[
                                                                  entry.key]!,
                                                              controller
                                                                      .columnwidth[
                                                                  entry.key],
                                                            ),
                                                        buildDataColumn(
                                                          'Actions',
                                                          controller
                                                              .costFilterText,
                                                          150,
                                                        ),
                                                      ],
                                                    );
                                                  }),
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

                                  controller.getROListByDate();
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
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}

DataColumn2 buildDataColumn(
  // String columnName,
  String header,

  /// ColumnSize columnSize,
  RxString filterText,
  double? fixedWidth,
  //  {required Function(String) onSearchCallBack}
) {
  return //
      DataColumn2(
    // size: columnSize,
    fixedWidth: fixedWidth,

    label: //
        Column(
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
          // SizedBox(
          //   height: Get.height * 0.05,
          //   child: TextField(
          //     style: GoogleFonts.lato(
          //       textStyle:
          //           TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
          //     ),
          //     onChanged: (value) {
          //       filterText.value = value;
          //       //   onSearchCallBack(value);
          //     },
          //     textAlign: TextAlign.left,
          //     decoration: InputDecoration(
          //       hintText: 'Filter',
          //       contentPadding:
          //           EdgeInsets.fromLTRB(5, 0, 5, 0), // Reduced vertical padding
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(5),
          //         borderSide: BorderSide(color: Colors.black),
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(5),
          //         borderSide: BorderSide(color: Colors.black),
          //       ),
          //       enabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(5),
          //         borderSide: BorderSide(color: Colors.black),
          //       ),
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              header,
              style: Styles.black16W500,
            ),
          ),
        ]),
    // ),
  );
}

class GoodsOrderListDataSource extends DataTableSource {
  final PurchaseGoodsorderListController controller;

  late List<GetRequestOrderListModel?> filteredGoodsOrderList;

  GoodsOrderListDataSource(this.controller) {
    filtersGoodsOrder();
  }

  ///
  void filtersGoodsOrder() {
    filteredGoodsOrderList = <GetRequestOrderListModel?>[];
    filteredGoodsOrderList = controller.goodsOrdersList.where((GoodsOrderList) {
      return (GoodsOrderList.requestOrderId ?? '')
              .toString()
              .contains(controller.orderIdFilterText.value.toLowerCase()) &&
          (GoodsOrderList.generatedBy ?? '')
              .toString()
              .contains(controller.generatedByFilterText.value.toLowerCase()) &&
          (GoodsOrderList.generatedAt ?? '')
              .toString()
              .contains(controller.orderDateFilterText.value.toLowerCase()) &&
          (GoodsOrderList.cost ?? '')
              .toString()
              .contains(controller.costFilterText.value.toLowerCase()) &&
          (GoodsOrderList.status ?? '')
              .toString()
              .contains(controller.statusFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredGoodsOrderList": filteredGoodsOrderList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final GoodsOrderListDetails = filteredGoodsOrderList[index];

    controller.GoodsOrderId.value = GoodsOrderListDetails?.requestOrderId ?? 0;
    var cellsBuffer = [
      "request_order_id",
      '${GoodsOrderListDetails?.generatedBy ?? ''}',
      '${GoodsOrderListDetails?.generatedAt ?? ''}',
      // '${GoodsOrderListDetails?.status ?? ''}',
      '${GoodsOrderListDetails?.cost ?? ''}',
      '${GoodsOrderListDetails?.displayCurrency ?? ''}',

      'Actions',
    ];
    var cells = [];
    int i = 0;

    for (var entry in controller.columnVisibility.value.entries) {
      // print({"entry.value entry": entry});
      if (entry.key == "search") {
        return null;
      }
      if (entry.value) {
        // print({"entry.value removed": entry.key});
        cells.add(cellsBuffer[i]);
      }
      i++;
    }
    cells.add('Actions');

    // print({"cell": cells});
    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: (value == 'request_order_id')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' GR${GoodsOrderListDetails?.requestOrderId}',
                      ),
                      // Dimens.boxHeight10,
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: controller.goodsOrdersList
                                      .firstWhere(
                                        (e) =>
                                            e.requestOrderId ==
                                            GoodsOrderListDetails!
                                                .requestOrderId,
                                        orElse: () => GetRequestOrderListModel(
                                            requestOrderId: 0),
                                      )
                                      .status ==
                                  342
                              ? ColorValues.yellowColor
                              : controller.goodsOrdersList
                                          .firstWhere(
                                            (e) =>
                                                e.requestOrderId ==
                                                GoodsOrderListDetails!
                                                    .requestOrderId,
                                            orElse: () =>
                                                GetRequestOrderListModel(
                                                    requestOrderId: 0),
                                          )
                                          .status ==
                                      343
                                  ? ColorValues.rejectColor
                                  : controller.goodsOrdersList
                                              .firstWhere(
                                                (e) =>
                                                    e.requestOrderId ==
                                                    GoodsOrderListDetails!
                                                        .requestOrderId,
                                                orElse: () =>
                                                    GetRequestOrderListModel(
                                                        requestOrderId: 0),
                                              )
                                              .status ==
                                          345
                                      ? Color.fromARGB(255, 152, 145, 145)
                                      : controller.goodsOrdersList
                                                  .firstWhere(
                                                    (e) =>
                                                        e.requestOrderId ==
                                                        GoodsOrderListDetails!
                                                            .requestOrderId,
                                                    orElse: () =>
                                                        GetRequestOrderListModel(
                                                            requestOrderId: 0),
                                                  )
                                                  .status ==
                                              341
                                          ? Color(0xff77cae7)
                                          : controller.goodsOrdersList
                                                      .firstWhere(
                                                        (e) =>
                                                            e.requestOrderId ==
                                                            GoodsOrderListDetails!
                                                                .requestOrderId,
                                                        orElse: () =>
                                                            GetRequestOrderListModel(
                                                                requestOrderId:
                                                                    0),
                                                      )
                                                      .status ==
                                                  301
                                              ? ColorValues.approveColor
                                              : ColorValues.addNewColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '${GoodsOrderListDetails?.status_short}',
                          style: Styles.white10.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                : (value == 'Actions')
                    ? Wrap(children: [
                        TableActionButton(
                          color: ColorValues.viewColor,
                          icon: Icons.remove_red_eye_outlined,
                          message: 'view',
                          onPress: () {
                            controller.clearStoreData();
                            int roId =
                                GoodsOrderListDetails?.requestOrderId ?? 0;

                            if (roId != 0) {
                              Get.toNamed(Routes.purchaseGoodsorderView,
                                  arguments: {'roId': roId, "roType": 1});
                            }
                          },
                          // onPress: () {
                          //   // controller.viewAddGoodsOrdersDetails(
                          //   //     id: int.tryParse(
                          //   //         '${record[0]}'));
                          //   // Get.toNamed(Routes
                          //   //     .viewGoodsOrders);
                          // },
                        ),
                        controller.goodsOrdersList
                                        .firstWhere(
                                          (e) =>
                                              e.requestOrderId ==
                                              GoodsOrderListDetails!
                                                  .requestOrderId,
                                          orElse: () =>
                                              GetRequestOrderListModel(
                                                  requestOrderId: 0),
                                        )
                                        .status ==
                                    342 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kReqOrderFeatureId &&
                                            e.edit ==
                                                UserAccessConstants
                                                    .kHaveEditAccess)
                                        .length >
                                    0
                            ? TableActionButton(
                                color: ColorValues.editColor,
                                icon: Icons.edit,
                                message: 'Edit',
                                onPress: () {
                                  controller.clearStoreData();
                                  int roId =
                                      GoodsOrderListDetails?.requestOrderId ??
                                          0;

                                  if (roId != 0) {
                                    Get.toNamed(
                                        Routes.GoodsOrdersReqDetailsScreen,
                                        arguments: {"roId": roId});
                                  }
                                },
                              )
                            : Dimens.box0,
                        controller.goodsOrdersList
                                        .firstWhere(
                                          (e) =>
                                              e.requestOrderId ==
                                              GoodsOrderListDetails!
                                                  .requestOrderId,
                                          orElse: () =>
                                              GetRequestOrderListModel(
                                                  requestOrderId: 0),
                                        )
                                        .status ==
                                    343 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kReqOrderFeatureId &&
                                            e.add ==
                                                UserAccessConstants
                                                    .kHaveAddAccess)
                                        .length >
                                    0
                            ? TableActionButton(
                                color: Color.fromARGB(255, 116, 78, 130),
                                icon: Icons.ads_click,
                                message: 'Re-Submit RO',
                                onPress: () {
                                  controller.clearStoreData();
                                  int roId =
                                      GoodsOrderListDetails?.requestOrderId ??
                                          0;

                                  if (roId != 0) {
                                    Get.toNamed(
                                        Routes.GoodsOrdersReqDetailsScreen,
                                        arguments: {"roId": roId});
                                  }
                                },
                              )
                            : Dimens.box0,
                        controller.goodsOrdersList
                                        .firstWhere(
                                          (e) =>
                                              e.requestOrderId ==
                                              GoodsOrderListDetails!
                                                  .requestOrderId,
                                          orElse: () =>
                                              GetRequestOrderListModel(
                                                  requestOrderId: 0),
                                        )
                                        .status ==
                                    342 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kReqOrderFeatureId &&
                                            e.approve ==
                                                UserAccessConstants
                                                    .kHaveApproveAccess)
                                        .length >
                                    0
                            ? TableActionButton(
                                color: ColorValues.appGreenColor,
                                icon: Icons.check,
                                message: 'Approve/Reject',
                                onPress: () {
                                  controller.clearStoreData();
                                  int roId =
                                      GoodsOrderListDetails?.requestOrderId ??
                                          0;

                                  if (roId != 0) {
                                    Get.toNamed(Routes.purchaseGoodsorderView,
                                        arguments: {'roId': roId, "roType": 1});
                                  }
                                },
                              )
                            : Dimens.box0,
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        controller.clearStoreData();
        int roId = GoodsOrderListDetails?.requestOrderId ?? 0;

        if (roId != 0) {
          Get.toNamed(Routes.purchaseGoodsorderView,
              arguments: {'roId': roId, "roType": 1});
        }
        // controller.clearStoreData();
        //   Get.toNamed(Routes.viewUserDetail,
        //       arguments: {'userId': UserDetails?.id});
      },
    );
  }

  @override
  int get rowCount => filteredGoodsOrderList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
