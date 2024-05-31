import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_waste_data/view_waste_data_controller.dart';
import 'package:cmms/app/widgets/add_waste_generated_dialog.dart';
import 'package:cmms/app/widgets/waste_disposed_dialog%20copy.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';

class ViewWasteDataWeb extends StatefulWidget {
  ViewWasteDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewWasteDataWeb> createState() => _WasteDataWebState();
}

class _WasteDataWebState extends State<ViewWasteDataWeb> {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewWasteDataController>(
      id: 'waste-controller',
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
                                  Get.offNamed(Routes.wasteData);
                                },
                                child: Text(
                                  " / WASTE DATA",
                                  style: Styles.greyLight14,
                                ),
                              ),
                              Text(
                                " / VIEW WASTE DATA",
                                style: Styles.greyLight14,
                              ),
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
                                            "View Waste Data For ${controller.monthName.value} Month",
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
                                        itemCount: controller.wasteDataByMonth
                                            .value?.item_data?.length,
                                        itemBuilder: (context, index) {
                                          final item = controller
                                              .wasteDataByMonth
                                              .value
                                              ?.item_data?[index];
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
                                            // height: 194,
                                            height:
                                                ((item?.details?.length ?? 0) *
                                                        50 +
                                                    155),
                                            margin: EdgeInsets.all(15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  child: Text(
                                                    "${controller.wasteDataByMonth.value?.item_data?[index]?.waste_type ?? "This Water Type has been deleted from master"}",
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
                                                                        if (detail.transactionType ==
                                                                            "Procurement") {
                                                                          Get.dialog(
                                                                            WasteGeneratedAddDialog(
                                                                              id: detail.id,
                                                                              date: detail.date,
                                                                              description: detail.description,
                                                                              quantity: detail.procuredQty.toString(),
                                                                              wasteTypeId: item.wasteTypeId,
                                                                              wasteTypeName: item.waste_type,
                                                                            ),
                                                                            barrierDismissible:
                                                                                false,
                                                                          );
                                                                        } else {
                                                                          Get.dialog(
                                                                            WasteDisposedAddDialog(
                                                                              id: detail.id,
                                                                              date: detail.date,
                                                                              description: detail.description,
                                                                              quantity: detail.consumedQty.toString(),
                                                                              wasteTypeId: item.wasteTypeId,
                                                                              wasteTypeName: item.waste_type,
                                                                            ),
                                                                            barrierDismissible:
                                                                                false,
                                                                          );
                                                                        }
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
