import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/water_data_list/water_data_list_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MinusDialog extends GetView {
  final int? id;
  final String? date;
  final int? waterTypeId;
  final String? waterTypeName;
  final String? quantity;
  final String? description;
  MinusDialog({
    this.id,
    this.date,
    this.waterTypeId,
    this.waterTypeName,
    this.quantity,
    this.description,
  });
  final WaterDataListController controller = Get.find();
  final DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
        if (id != null) {
          controller.detailId.value = id!;
        }
        if (date != null) {
          controller.procurementTimeCtrlr.text = date!;
          controller.selectedProcurementTime.value =
              DateFormat("yyyy-mm-dd").parse(date!);
        }
        if (quantity != null) {
          controller.qtyCtrlr.text = quantity.toString();
        }
        if (description != null) {
          controller.descriptionCtrlr.text = description!;
        }
        if (waterTypeId != null) {
          controller.selectedTypeOfWaterId = waterTypeId!;
        }
        if (waterTypeName != null) {
          controller.selectedtypeOfWater.value = waterTypeName!;
        }
        return Obx(
          () => Container(
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
                      CustomRichText(title: 'Quantity in KL unit:'),
                      Dimens.boxHeight20,
                      Text("Description:", style: Styles.black15W400),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dimens.boxHeight10,
                      IgnorePointer(
                        ignoring: controller.detailId.value != 0 ? true : false,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.height * 0.040,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: ColorValues.whiteColor,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                            color: ColorValues.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 16.0,
                                height: 1.0,
                                color: Colors.black,
                              ),
                            ),
                            onTap: () {
                              controller.pickDateTime(context);
                            },
                            controller: controller.procurementTimeCtrlr,
                            autofocus: false,
                            readOnly: true,
                            decoration: InputDecoration(
                              fillColor: ColorValues.whiteColor,
                              filled: true,
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                              focusedErrorBorder: controller.isDateInvalid.value
                                  ? OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: ColorValues.redColorDark,
                                      ),
                                    )
                                  : InputBorder.none,
                              errorBorder: controller.isDateInvalid.value
                                  ? OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: ColorValues.redColorDark,
                                      ),
                                    )
                                  : null,
                              errorText: controller.isDateInvalid.value
                                  ? "Required field"
                                  : null,
                            ),
                            onChanged: (value) {
                              if (controller.procurementTimeCtrlr.text
                                  .trim()
                                  .isNotEmpty) {
                                controller.isDateInvalid.value = false;
                              } else {
                                controller.isDateInvalid.value = true;
                              }
                            },
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                      IgnorePointer(
                        ignoring: controller.detailId != 0 ? true : false,
                        child: SizedBox(
                          child: DropdownWebStock(
                            width: MediaQuery.of(context).size.width / 5,
                            dropdownList: controller.typeOfWaterList,
                            isValueSelected:
                                controller.istypeOfWaterListSelected.value,
                            selectedValue: controller.selectedtypeOfWater.value,
                            onValueChanged: controller.onValueChanged,
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                      LoginCustomTextfield(
                        width: (MediaQuery.of(context).size.width * .2),
                        keyboardType: TextInputType.number,
                        textController: controller.qtyCtrlr,
                        errorController: controller.isQtyInvalid.value
                            ? "Required field"
                            : null,
                        onChanged: (value) {
                          if (controller.qtyCtrlr.text.trim().length > 0) {
                            controller.isQtyInvalid.value = false;
                          } else {
                            controller.isQtyInvalid.value = true;
                          }
                        },
                      ),
                      Dimens.boxHeight10,
                      IgnorePointer(
                        ignoring: controller.detailId != 0 ? true : false,
                        child: SizedBox(
                          child: LoginCustomTextfield(
                            width: (MediaQuery.of(context).size.width * .2),
                            textController: controller.descriptionCtrlr,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                  controller.clearData();
                  id == 0 || id == null
                      ? Get.offNamed(Routes.waterDataListScreen)
                      : Get.offNamed(Routes.viewWaterData);
                },
              ),
            ),
            Dimens.boxWidth20,
            Container(
              height: 35,
              child: id == 0 || id == null
                  ? CustomElevatedButton(
                      backgroundColor: ColorValues.greenColor,
                      text: 'Submit',
                      onPressed: () {
                        controller.isFormInvalid.value = false;
                        controller.createWaterDataConsumption();
                        Get.offNamed(Routes.waterDataListScreen);
                      },
                    )
                  : CustomElevatedButton(
                      backgroundColor: ColorValues.greenColor,
                      text: 'Update',
                      onPressed: () {
                        controller.updateWaterDataConsumption();
                        Get.offNamed(Routes.viewWaterData);
                      },
                    ),
            ),
          ],
        )
      ],
    );
  }
}
