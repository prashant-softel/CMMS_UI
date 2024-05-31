import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/waste_data/waste_data_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WasteDisposedAddDialog extends GetView {
  final int? id;
  final String? date;
  final int? wasteTypeId;
  final String? wasteTypeName;
  final String? quantity;
  final String? description;

  WasteDisposedAddDialog({
    this.id,
    this.date,
    this.wasteTypeId,
    this.wasteTypeName,
    this.quantity,
    this.description,
  });
  final DateTime selectedDate =
      DateTime.now();
  final WasteDataController controller = Get.find();

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
            Text("Waste disposed", style: Styles.black20),
          ],
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;
          if (id != null) {
            controller.detailId = id!;
          }
          if (date != null) {
            controller.wasteDataTimeCtrlr.text = date!;
            controller.selectedWasteDataTime.value = DateTime.parse(date!);
          }
          if (quantity != null) {
            controller.qtyCtrlr.text = quantity.toString();
          }
          if (description != null) {
            controller.descriptionCtrlr.text = description!;
          }
          if (wasteTypeId != null) {
            controller.selectedTypeOfWasteId = wasteTypeId!;
          }
          if (wasteTypeName != null) {
            controller.selectedtypeOfWaste.value = wasteTypeName!;
          }
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
                      IgnorePointer(
                        ignoring: id == 0 || id == null ? false : true,
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
                                  color: Colors.black),
                            ),
                            onTap: () {
                              controller.pickDateTime(context);
                            },
                            controller: controller.wasteDataTimeCtrlr,
                            autofocus: false,
                            readOnly: true,
                            decoration: InputDecoration(
                              fillColor: ColorValues.whiteColor,
                              filled: true,
                              contentPadding:
                                  EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                              border: InputBorder.none,
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
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                      IgnorePointer(
                        ignoring: id == 0 || id == null ? false : true,
                        child: SizedBox(
                          child: DropdownWebStock(
                            width: MediaQuery.of(context).size.width / 5,
                            dropdownList: controller.typeOfWasteList,
                            isValueSelected:
                                controller.istypeOfWasteListSelected.value,
                            selectedValue: controller.selectedtypeOfWaste.value,
                            onValueChanged: controller.onValueChanged,
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                      LoginCustomTextfield(
                        width: (MediaQuery.of(context).size.width * .2),
                        keyboardType: TextInputType.number,
                        textController: controller.qtyCtrlr,
                      ),
                      Dimens.boxHeight10,
                      IgnorePointer(
                        ignoring: id == 0 || id == null ? false : true,
                        child: LoginCustomTextfield(
                          width: (MediaQuery.of(context).size.width * .2),
                          textController: controller.descriptionCtrlr,
                        ),
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
                    controller.clearData();
                    Get.toNamed(Routes.viewWasteData);
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
                          controller.createWasteDataDisposed();
                          Get.toNamed(Routes.viewWasteData);
                        },
                      )
                    : CustomElevatedButton(
                        backgroundColor: ColorValues.greenColor,
                        text: 'Update',
                        onPressed: () {
                          controller.updateWasteDataDisposed();
                          Get.toNamed(Routes.viewWasteData);
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
