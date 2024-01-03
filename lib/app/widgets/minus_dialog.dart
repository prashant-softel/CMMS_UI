import 'package:cmms/app/app.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/view/stock_management_add_goods_orders_web.dart';
import 'package:cmms/app/water_data_list/water_data_list_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinusDialog extends GetView {
  final WaterDataListController controller = Get.find();

  DateTime selectedDate =
      DateTime.now(); // Add this line to store the selected date

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets0_0_10_0,
        title: Row(
          children: [
            Text("Water Consumption ", style: Styles.black20),
          ],
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorValues.lightGreyColorWithOpacity35,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorValues.appBlueBackgroundColor,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            height: height / 4,
            width: MediaQuery.of(context).size.width * 0.4,
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Dimens.boxHeight5,
                      CustomRichText(title: 'Date of Consumption  :'),
                      Dimens.boxHeight20,
                      CustomRichText(title: 'Type of water :'),
                      Dimens.boxHeight20,
                      CustomRichText(title: 'Qty in KL unit:'),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dimens.boxHeight10,
                      CustomTextFieldForStock(
                        width: MediaQuery.of(context).size.width / 5,
                        numberTextField: true,
                        onTap: () {
                          // controller.openPurchaseDatePicker =
                          //     !controller.openPurchaseDatePicker;
                          controller.update(['stock_Mangement']);
                        },
                        // textController: controller.purchaseDateTc,
                      ),
                      Dimens.boxHeight10,
                      DropdownWebStock(
                        width: MediaQuery.of(context).size.width / 5,
                        dropdownList: controller.month,
                        // selectedValue: ,
                        onValueChanged: (month, selectedValue) {},
                      ),
                      Dimens.boxHeight10,
                      GoodsOrderTextField(
                        keyboardType: TextInputType.number,

                        // textController:
                        //     controller.girNoCtrlr,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.redColor,
                  text: "Cancel",
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Dimens.boxWidth20,
              Container(
                height: 35,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.greenColor,
                  text: 'Submit',
                  onPressed: () {
                    // controller.createMcPlan();
                  },
                ),
              ),
            ],
          )
        ],
      );
    }));
  }
}
