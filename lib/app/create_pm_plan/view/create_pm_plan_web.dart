import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_pm_plan/create_pm_plan_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreatePmPlanWeb extends StatefulWidget {
  CreatePmPlanWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatePmPlanWeb> createState() => _CreatePmPlanWebState();
}

class _CreatePmPlanWebState extends State<CreatePmPlanWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreatePmPlanController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Column(
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
                      Get.back();
                    },
                    child: Text(" / PREVENTIVE MAINTENANCE",
                        style: Styles.greyMediumLight12),
                  ),
                  Text(" / CREATE PM PLAN", style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: Get.width * 7,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                      // height: Get.height,
                      child: Card(
                        color: ColorValues.cardColor,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 10, left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10, left: 10),
                                    child: Text(
                                      " Create PM Plan",
                                      style: Styles.blackBold14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: ColorValues.greyLightColour,
                            ),
                            Dimens.boxHeight15,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomRichText(title: 'Plan Title :'),
                                    CustomRichText(
                                        title: 'Equipment Category :'),
                                    CustomRichText(title: 'Start Date :'),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 224),
                                            width: 1,
                                          ),
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
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .2),
                                        child: LoginCustomTextfield()),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 224),
                                            width: 1,
                                          ),
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
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .2),
                                        child: LoginCustomTextfield()),
                                    CustomTextFieldForStock(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      numberTextField: true,
                                      onTap: () {
                                        controller.openStartDatePicker =
                                            !controller.openStartDatePicker;
                                        controller.update(['stock_Mangement']);
                                      },
                                      textController:
                                          controller.startDateDateTc,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Dimens.boxHeight15,
                          ],
                        ),
                      ),
                    ),
                    if (controller.openStartDatePicker)
                      Positioned(
                        left: 65,
                        top: 230,
                        child: DatePickerWidget(
                          minDate: DateTime(DateTime.now().year),
                          maxDate: DateTime(DateTime.now().year, 13,
                              0), // last date of this year
                          controller: DateRangePickerController(),
                          selectionChanges: (p0) {
                            print('po valu ${p0.value.toString()}');
                            controller.startDateDateTc.text =
                                DateFormat('yyyy-MM-dd').format(p0.value);
                            controller.openStartDatePicker =
                                !controller.openStartDatePicker;
                            controller.update(['stock_Mangement']);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Spacer(),
                CustomElevatedButton(
                  backgroundColor: ColorValues.appRedColor,
                  text: 'cancel',
                  onPressed: () {
                    // controller.AddInventory();
                  },
                ),
                Dimens.boxWidth15,
                CustomElevatedButton(
                  backgroundColor: ColorValues.appGreenColor,
                  text: 'Submit',
                  onPressed: () {
                    // controller.submitPurchaseOrderData();
                  },
                ),
                Spacer()
              ],
            ),
            Dimens.boxHeight40,
          ],
        );
      },
    );
  }
}
