import 'package:cmms/app/app.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/view/stock_management_add_goods_orders_web.dart';
import 'package:cmms/app/waste_data/waste_data_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WasteGeneratedAddDialog extends GetView {
  final WasteDataController controller = Get.find();

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
            Text("Waste Generated", style: Styles.black20),
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
                      CustomRichText(title: 'Date of procurement :'),
                      Dimens.boxHeight20,
                      CustomRichText(title: 'Type of Waste :'),
                      Dimens.boxHeight20,
                      CustomRichText(title: 'Quantity in KL unit:'),
                      Dimens.boxHeight20,
                      CustomRichText(title: 'Description:'),
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
                        onTap: () async {
                          // Show date picker and set the selected date
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );

                          // If a date is selected, update the selectedDate and the UI
                          if (pickedDate != null &&
                              pickedDate != selectedDate) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                      ),
                      Dimens.boxHeight10,
                      DropdownWebStock(
                        width: MediaQuery.of(context).size.width / 5,
                        dropdownList: controller.wasteData,
                        // selectedValue: ,
                        onValueChanged: (wasteData, selectedValue) {},
                      ),
                      Dimens.boxHeight10,
                      GoodsOrderTextField(
                        keyboardType: TextInputType.number,

                        // textController:
                        //     controller.girNoCtrlr,
                      ),
                      Dimens.boxHeight10,
                      GoodsOrderTextField(

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
