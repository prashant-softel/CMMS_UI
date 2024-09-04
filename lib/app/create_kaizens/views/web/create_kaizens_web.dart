import 'package:cmms/app/create_kaizens/create_kaizens_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';
import 'package:intl/intl.dart';

class KaizensDataWeb extends StatefulWidget {
  KaizensDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<KaizensDataWeb> createState() => _ViewKaizensDataWebState();
}

class _ViewKaizensDataWebState extends State<KaizensDataWeb> {
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateKaizensDataController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return SelectionArea(
          child: Scaffold(
              body: Obx(
                () => Container(
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
                                Get.offNamed(Routes.misDashboard);
                              },
                              child: Text(" / MIS", style: Styles.greyLight14),
                            ),
                            Text(" / KAIZENS DATA", style: Styles.greyLight14),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 10, right: 10),
                                child: Column(
                                  children: [
                                    Card(
                                      color: Color.fromARGB(255, 245, 248, 250),
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 20,
                                                top: 5,
                                                bottom: 5,
                                                left: 20),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Add Kaizens Data",
                                                  style: Styles.blackBold16,
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 20,
                                                    right: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: ColorValues.greyLightColour,
                                          ),
                                          Container(
                                            color: Color.fromARGB(
                                                255, 245, 248, 250),
                                            width: Get.width,
                                            height: Get.height,
                                            child: Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Container(
                                                margin: Dimens.edgeInsets20,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Spacer(),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    'Select Month And Year:'),
                                                                Dimens
                                                                    .boxWidth10,
                                                                CustomTextFieldForStock(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  numberTextField:
                                                                      true,
                                                                  onTap: () {
                                                                    _showMonthYearPicker(
                                                                        context,
                                                                        controller);
                                                                  },
                                                                  textController:
                                                                      controller
                                                                          .KaizensDateTc, // Ensure this is correctly passed
                                                                ),
                                                              ],
                                                            ),

                                                            Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                CustomRichText(
                                                                    title:
                                                                        'No. of kaizens implemented'),
                                                                Dimens
                                                                    .boxWidth3,
                                                                LoginCustomTextfield(
                                                                    width: (MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .2),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    textController:
                                                                        controller
                                                                            .KaizensImplementedCtrl,
                                                                    //  validate
                                                                    errorController: controller
                                                                            .isKaizensImplementedInvalid
                                                                            .value
                                                                        ? "Required field"
                                                                        : null,
                                                                    onChanged:
                                                                        (value) {
                                                                      if (value
                                                                              .trim()
                                                                              .length >
                                                                          0) {
                                                                        controller
                                                                            .isKaizensImplementedInvalid
                                                                            .value = false;
                                                                      } else {
                                                                        controller
                                                                            .isKaizensImplementedInvalid
                                                                            .value = true;
                                                                      }
                                                                    }),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                CustomRichText(
                                                                    title:
                                                                        'Cost inquired for implementation of Kaizens'),
                                                                Dimens
                                                                    .boxWidth3,
                                                                LoginCustomTextfield(
                                                                    width: (MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .2),
                                                                    textController:
                                                                        controller
                                                                            .CostForImplementationCtrl,
                                                                    //validate
                                                                    errorController: controller
                                                                            .isCostForImplementationInvalid
                                                                            .value
                                                                        ? "Required field"
                                                                        : null,
                                                                    onChanged:
                                                                        (value) {
                                                                      if (value
                                                                              .trim()
                                                                              .length >
                                                                          0) {
                                                                        controller
                                                                            .isCostForImplementationInvalid
                                                                            .value = false;
                                                                      } else {
                                                                        controller
                                                                            .isCostForImplementationInvalid
                                                                            .value = true;
                                                                      }
                                                                    }),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                CustomRichText(
                                                                    title:
                                                                        'Cost saved from the Implementation of Kaizens'),
                                                                Dimens
                                                                    .boxWidth3,
                                                                LoginCustomTextfield(
                                                                    width: (MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .2),
                                                                    textController:
                                                                        controller
                                                                            .CostSavedFromImplementationCtrl,
                                                                    //validate
                                                                    errorController: controller
                                                                            .isCostSavedFromImplementationInvalid
                                                                            .value
                                                                        ? "Required field"
                                                                        : null,
                                                                    onChanged:
                                                                        (value) {
                                                                      if (value
                                                                              .trim()
                                                                              .length >
                                                                          0) {
                                                                        controller
                                                                            .isCostSavedFromImplementationInvalid
                                                                            .value = false;
                                                                      } else {
                                                                        controller
                                                                            .isCostSavedFromImplementationInvalid
                                                                            .value = true;
                                                                      }
                                                                    }),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight5,
                                                            // Row(
                                                            //   children: [
                                                            //     CustomRichText(
                                                            //         title:
                                                            //             'Submited By'),
                                                            //     Dimens
                                                            //         .boxWidth3,
                                                            //     LoginCustomTextfield(
                                                            //         width: (MediaQuery.of(context)
                                                            //                 .size
                                                            //                 .width *
                                                            //             .2),
                                                            //         keyboardType:
                                                            //             TextInputType
                                                            //                 .number,
                                                            //         // textController:
                                                            //         //     controller
                                                            //         //         .KaizensImplementedCtrl,
                                                            //         //  validate
                                                            //         // errorController: controller
                                                            //         //         .isKaizensImplementedInvalid
                                                            //         //         .value
                                                            //         //     ? "Required field"
                                                            //         //     : null,
                                                            //         // onChanged:
                                                            //         //     (value) {
                                                            //         //   if (value
                                                            //         //           .trim()
                                                            //         //           .length >
                                                            //         //       0) {
                                                            //         //     controller
                                                            //         //         .isKaizensImplementedInvalid
                                                            //         //         .value = false;
                                                            //         //   } else {
                                                            //         //     controller
                                                            //         //         .isKaizensImplementedInvalid
                                                            //         //         .value = true;
                                                            //         //   }
                                                            //         // }
                                                            //         ),
                                                            //   ],
                                                            // ),
                                                            // Dimens.boxHeight5,
                                                          ],
                                                        ),
                                                        Spacer(),
                                                      ],
                                                    ),
                                                    Dimens.boxHeight15,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
                        Get.offAllNamed(Routes.misDashboard);
                      },
                    ),
                  ),
                  Dimens.boxWidth15,
                  controller.selectedItem?.id == 0
                      ? Container(
                          height: 40,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.submitColor,
                            text: 'Submit',
                            onPressed: () {
                              controller.isFormInvalid.value = false;
                              controller.checkForm();
                              controller.createkaizensdata(
                                  monthId: controller.selectedMonth,
                                  year: controller.selectedYear);
                            },
                          ),
                        )
                      : Container(
                          height: 40,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.submitColor,
                            text: 'Update',
                            onPressed: () {
                              controller.isFormInvalid.value = false;
                              controller.updateKaizenDetails();
                            },
                          ),
                        ),
                  Spacer(),
                ],
              )
              // : Dimens.box0

              ),
        );
        // );
      },
    );
  }
}

void _showMonthYearPicker(
    BuildContext context, CreateKaizensDataController controller) {
  // Set initial values from selectedItem
  int initialMonth = controller.selectedItem?.month_id ?? DateTime.now().month;
  int initialYear = controller.selectedItem?.year ?? DateTime.now().year;

  // Set the controller's selectedMonth and selectedYear to the initial values
  controller.selectedMonth = initialMonth;
  controller.selectedYear = initialYear;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Select Month and Year"),
        content: Container(
          height: 200,
          child: Column(
            children: [
              // Month Picker
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: controller.selectedMonth - 1,
                  ),
                  itemExtent: 40,
                  onSelectedItemChanged: (int index) {
                    controller.selectedMonth = index + 1; // Month is 1-based
                  },
                  children: List.generate(12, (index) {
                    return Center(
                      child: Text(
                        DateFormat.MMMM().format(DateTime(0, index + 1)),
                      ),
                    );
                  }),
                ),
              ),
              // Year Picker
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: controller.selectedYear - 2000,
                  ),
                  itemExtent: 40,
                  onSelectedItemChanged: (int index) {
                    controller.selectedYear = 2000 + index;
                  },
                  children: List.generate(100, (index) {
                    return Center(
                      child: Text((2000 + index).toString()),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ActionButton(
            label: "Cancel",
            color: ColorValues.appRedColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Dimens.boxHeight10,
          ActionButton(
            color: ColorValues.addNewColor,
            onPressed: () {
              // Update the TextField with the selected month and year
              controller.KaizensDateTc.text =
                  "${DateFormat.MMMM().format(DateTime(0, controller.selectedMonth))} ${controller.selectedYear}";

              // Call GetX update to refresh the UI
              controller.update(['stock_Mangement']);

              Navigator.of(context).pop();
            },
            label: "Select",
          )
        ],
      );
    },
  );
}
