import 'package:cmms/app/add_waste_data/add_waste_data_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/view/stock_management_add_goods_orders_web.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/date_picker.dart';

class AddWasteDataWeb extends StatefulWidget {
  AddWasteDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWasteDataWeb> createState() => _AddWasteDataWebState();
}

class _AddWasteDataWebState extends State<AddWasteDataWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddWasteDataController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: Color.fromARGB(255, 234, 236, 238),
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                AppBarGoodsOrder(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          color: Color.fromARGB(255, 245, 248, 250),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Add Waste Data",
                                      style: Styles.blackBold16,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 100),
                                              child: Container(
                                                width: 160,
                                                color: ColorValues.cancelColor,
                                                child: Center(
                                                  child: Text(
                                                    "Waste Generated",
                                                    style: Styles.blackBold14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Solid Waste Generated'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'E- waste in kgs'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Battery Waste in number'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Solar Module waste in number'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Haz waste Oil'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Haz Waste grease in kgs'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Haz solid waste'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Haz waste oil barrel generated in No'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 100),
                                              child: Container(
                                                width: 160,
                                                color: ColorValues.addNewColor,
                                                child: Center(
                                                  child: Text(
                                                    "Waste Disposed",
                                                    style: Styles.blackBold14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Solid Waste Disposed'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'E- waste Disposed in kgs'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Battery Waste Disposed in number'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Solar module waste in number'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Haz waste oil Disposed in litres'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Haz waste Grease in Kgs'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Haz Solid waste Disposed in Kgs '),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Haz waste oil barrel Disposed in No'),
                                                Dimens.boxWidth10,
                                                GoodsOrderTextField(
                                                  keyboardType:
                                                      TextInputType.number,

                                                  // textController:
                                                  //     controller.girNoCtrlr,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Dimens.boxWidth30,
                                      ],
                                    ),
                                    Dimens.boxHeight30
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            children: [
              Spacer(),
              Container(
                height: 40,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.cancelColor,
                  text: 'Cancel',
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Dimens.boxWidth15,
              Container(
                height: 40,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.submitColor,
                  text: 'Update',
                  onPressed: () {
                    // controller.createGoodsOrder();
                  },
                ),
              ),
              Spacer(),
            ],
          ),
        );
        // );
      },
    );
  }
}

class AppBarGoodsOrder extends StatelessWidget {
  const AppBarGoodsOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            "DASHBOARD",
            style: Styles.greyLight14,
          ),
          GestureDetector(
            onTap: () {
              Get.offNamed(Routes.misDashboard);
            },
            child: Text(" / MIS", style: Styles.greyLight14),
          ),
          GestureDetector(
              child: Text(" / ADD WASTE DATA", style: Styles.greyLight14)),
        ],
      ),
    );
  }
}
