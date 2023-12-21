import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/water_data/water_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/date_picker.dart';

class WaterDataWeb extends StatefulWidget {
  WaterDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<WaterDataWeb> createState() => _WaterDataWebState();
}

class _WaterDataWebState extends State<WaterDataWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WaterDataController>(
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
                                      "Add Goods Order Details",
                                      style: Styles.blackBold16,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              Container(
                                margin: Dimens.edgeInsets20,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [Text("data")],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [Text("data")],
                                    ),
                                    Dimens.boxWidth30,
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
                    text: 'Submit',
                    onPressed: () {
                      // controller.createGoodsOrder();
                    },
                  ))
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
              child: Text(" / WATER DATA", style: Styles.greyLight14)),
        ],
      ),
    );
  }
}
