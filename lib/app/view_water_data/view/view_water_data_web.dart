import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_water_data/view_water_data_controller.dart';
import 'package:cmms/app/widgets/add_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/date_picker.dart';

class ViewWaterDataWeb extends StatefulWidget {
  ViewWaterDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewWaterDataWeb> createState() => _WaterDataWebState();
}

class _WaterDataWebState extends State<ViewWaterDataWeb> {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewWaterDataController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return SelectionArea(
          child: Scaffold(
            body: Obx(
              () => Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 450),
                    margin: EdgeInsets.only(
                      left: Responsive.isDesktop(context)
                          ? homeController.menuButton.value
                              ? 250.0
                              : 70.0
                          : 0,
                    ),
                    color: Color.fromARGB(255, 234, 236, 238),
                    width: Get.width,
                    height: Get.height,
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
                                  controller.clearStoreData();
                                  Get.offNamed(Routes.misDashboard);
                                },
                                child:
                                    Text(" / MIS", style: Styles.greyLight14),
                              ),
                              Text(" / VIEW WATER DATA",
                                  style: Styles.greyLight14),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(15),
                            child: Card(
                              color: Color.fromARGB(255, 245, 248, 250),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            "View Water Data For ${controller.waterDataByMonth.value?.month ?? ''} Month",
                                            style: Styles.blackBold16,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Dimens.boxHeight20,
                                    Container(
                                      color: Color.fromARGB(255, 245, 248, 250),
                                      height: Get.height * .7,
                                      width: Get.width * .92,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.waterDataByMonth
                                            .value?.itemData?.length,
                                        itemBuilder: (context, index) {
                                          final item = controller
                                              .waterDataByMonth
                                              .value
                                              ?.itemData?[index];
                                          return Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 227, 224, 224),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                          255, 236, 234, 234)
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            constraints: BoxConstraints(
                                              minHeight: 100,
                                              maxHeight: Get.height * .6,
                                            ),
                                            // height: Get.height * .6,
                                            margin: EdgeInsets.all(15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  child: Text(
                                                    "${controller.waterDataByMonth.value?.itemData?[index].waterType ?? "This Water Type has been deleted from master"}",
                                                    style: Styles.blue17,
                                                  ),
                                                ),
                                                Divider(
                                                  color: ColorValues
                                                      .greyLightColour,
                                                ),
                                                Expanded(
                                                  child: DataTable2(
                                                    columns: [
                                                      DataColumn(
                                                        label: Text(
                                                          "Date",
                                                          style: Styles.blue17,
                                                        ),
                                                      ),
                                                      DataColumn(
                                                        label: Text(
                                                          "Description",
                                                          style: Styles.blue17,
                                                        ),
                                                      ),
                                                      DataColumn(
                                                        label: Text(
                                                          "Transaction Type",
                                                          style: Styles.blue17,
                                                        ),
                                                      ),
                                                      DataColumn(
                                                        label: Text(
                                                          "Procurment",
                                                          style: Styles.green17,
                                                        ),
                                                      ),
                                                      DataColumn(
                                                        label: Text(
                                                          "Consumption",
                                                          style: Styles.red17,
                                                        ),
                                                      ),
                                                      DataColumn(
                                                        label: Text(
                                                          "Action",
                                                          style: Styles.blue17,
                                                        ),
                                                      ),
                                                    ],
                                                    rows: item?.details
                                                            ?.map(
                                                              (detail) =>
                                                                  DataRow(
                                                                cells: [
                                                                  DataCell(
                                                                    Text(
                                                                        detail.date ??
                                                                            '',
                                                                        style: Styles
                                                                            .black14),
                                                                  ),
                                                                  DataCell(
                                                                    Text(
                                                                        detail.description ??
                                                                            '',
                                                                        style: Styles
                                                                            .black14),
                                                                  ),
                                                                  DataCell(
                                                                    Text(
                                                                        detail.transactionType ??
                                                                            '',
                                                                        style: Styles
                                                                            .black14),
                                                                  ),
                                                                  DataCell(
                                                                    Text(
                                                                      "${detail.procuredQty}",
                                                                      style: Styles
                                                                          .green700,
                                                                    ),
                                                                  ),
                                                                  DataCell(
                                                                    Text(
                                                                      "${detail.consumedQty}",
                                                                      style: Styles
                                                                          .Red700,
                                                                    ),
                                                                  ),
                                                                  DataCell(
                                                                    TableActionButton(
                                                                      color: ColorValues
                                                                          .editColor,
                                                                      icon: Icons
                                                                          .edit_outlined,
                                                                      message:
                                                                          "edit",
                                                                      onPress:
                                                                          () {
                                                                        Get.dialog(
                                                                          AddDialog(),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ), // Add this line
                                                                ],
                                                              ),
                                                            )
                                                            .toList() ??
                                                        [],
                                                  ),
                                                ),
                                                Dimens.boxHeight20,
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Responsive.isDesktop(context)
                      ? AnimatedPositioned(
                          duration: Duration(milliseconds: 450),
                          child: HomeDrawer(),
                        )
                      : Dimens.box0,
                  if (controller.openPurchaseDatePicker)
                    Positioned(
                      right: 65,
                      top: 130,
                      child: DatePickerWidget(
                        minDate: DateTime(DateTime.now().year),
                        maxDate: DateTime(DateTime.now().year, 13,
                            0), // last date of this year
                        controller: DateRangePickerController(),
                        selectionChanges: (p0) {
                          print('po valu ${p0.value.toString()}');
                          controller.purchaseDateTc.text =
                              DateFormat('yyyy-MM-dd').format(p0.value);
                          controller.openPurchaseDatePicker =
                              !controller.openPurchaseDatePicker;
                          controller.update(['stock_Mangement']);
                        },
                      ),
                    ),
                ],
              ),
            ),

            // floatingActionButton: Row(
            //   children: [
            //     Spacer(),
            //     Container(
            //       height: 40,
            //       child: CustomElevatedButton(
            //         backgroundColor: ColorValues.cancelColor,
            //         text: 'Cancel',
            //         onPressed: () {
            //           Get.back();
            //         },
            //       ),
            //     ),
            //     Dimens.boxWidth15,
            //     Container(
            //       height: 40,
            //       child: CustomElevatedButton(
            //         backgroundColor: ColorValues.submitColor,
            //         text: 'Update',
            //         onPressed: () {
            //           // controller.createGoodsOrder();
            //         },
            //       ),
            //     ),
            //     Spacer(),
            //   ],
            // ),
          ),
        );
        // );
      },
    );
  }
}

// class AppBarGoodsOrder extends StatelessWidget {
//   const AppBarGoodsOrder({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<ViewWaterDataController>();
//     return Container(
//       height: 45,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Color.fromARGB(255, 227, 224, 224),
//           width: 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(
//             Icons.home,
//             color: ColorValues.greyLightColor,
//           ),
//           InkWell(
//             onTap: () {
//               Get.offNamed(Routes.home);
//             },
//             child: Text(
//               "DASHBOARD",
//               style: Styles.greyLight14,
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               controller.clearStoreData();
//               Get.offNamed(Routes.misDashboard);
//             },
//             child: Text(" / MIS", style: Styles.greyLight14),
//           ),
//           Text(" /VIEW WATER DATA", style: Styles.greyLight14),
//         ],
//       ),
//     );
//   }
// }
