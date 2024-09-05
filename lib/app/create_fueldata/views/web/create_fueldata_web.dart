import 'package:cmms/app/create_fueldata/create_fueldata_controller.dart';
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

class FuelDataWeb extends StatefulWidget {
  FuelDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<FuelDataWeb> createState() => _ViewFuelDataWebState();
}

class _ViewFuelDataWebState extends State<FuelDataWeb> {
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateFuelDataController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return SelectionArea(
          child: Scaffold(
            body: Container(
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
                          Text(" / FUEL DATA",
                              style: Styles.greyLight14),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 10, right: 10),
                              child: Column(
                                children: [
                                  Card(
                                    color: Color.fromARGB(255, 245, 248, 250),
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
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
                                                "Add Fuel Data",
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
                                                                Text('Select Month And Year:'),
                                                                Dimens
                                                                    .boxWidth10,
                                                                CustomTextFieldForStock(
                                                                  width: (MediaQuery.of(context)
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
                                                                          .FuelDateTc,
                                                                ),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Total diesel consumed for vehicles in Litres'),
                                                              Dimens.boxWidth3,
                                                              LoginCustomTextfield(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  textController:
                                                                      controller
                                                                          .dieselConsumedforvehiclesCtrl,
                                                                //  validate
                                                                  errorController: controller
                                                                          .isDieselConsumedForVehiclesInvalid
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
                                                                          .isDieselConsumedForVehiclesInvalid
                                                                          .value = false;
                                                                    } else {
                                                                      controller
                                                                          .isDieselConsumedForVehiclesInvalid
                                                                          .value = true;
                                                                    }
                                                                  }
                                                                  ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Total Petrol consumed for vehicles in Litres'),
                                                              Dimens.boxWidth3,
                                                              LoginCustomTextfield(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  textController:
                                                                      controller
                                                                          .petrolconsumedforvehiclesCtrl,
                                                                  //validate
                                                                  errorController: controller
                                                                          .isPetrolConsumedForVehiclesInvalid
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
                                                                          .isPetrolConsumedForVehiclesInvalid
                                                                          .value = false;
                                                                    } else {
                                                                      controller
                                                                          .isPetrolConsumedForVehiclesInvalid
                                                                          .value = true;
                                                                    }
                                                                  }
                                                                  ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Total petrol consumed for Grass cutting & Mower in Litres'),
                                                              Dimens.boxWidth3,
                                                              LoginCustomTextfield(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  textController:
                                                                      controller
                                                                          .petrolconsumedforgrasscuttingandmoversCtrl,
                                                                  //validate
                                                                  errorController: controller
                                                                          .isPetrolConsumedForGrassCuttingAndMoversInvalid
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
                                                                          .isPetrolConsumedForGrassCuttingAndMoversInvalid
                                                                          .value = false;
                                                                    } else {
                                                                      controller
                                                                          .isPetrolConsumedForGrassCuttingAndMoversInvalid
                                                                          .value = true;
                                                                    }
                                                                  }
                                                                  ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Total Diesel consumed at site in Litres'),
                                                              Dimens.boxWidth3,
                                                              LoginCustomTextfield(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  inputFormatters: [
                                                                    FilteringTextInputFormatter
                                                                        .digitsOnly
                                                                  ],
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  textController:
                                                                      controller
                                                                          .dieselconsumedatsiteCtrl,
                                                                  //validate
                                                                  errorController: controller
                                                                          .isDieselConsumedAtSiteInvalid
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
                                                                          .isDieselConsumedAtSiteInvalid
                                                                          .value = false;
                                                                    } else {
                                                                      controller
                                                                          .isDieselConsumedAtSiteInvalid
                                                                          .value = true;
                                                                    }
                                                                  }
                                                                  ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                           Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Total Petrol consumed at site in Litres'),
                                                              Dimens.boxWidth3,
                                                              LoginCustomTextfield(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  inputFormatters: [
                                                                    FilteringTextInputFormatter
                                                                        .digitsOnly
                                                                  ],
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  textController:
                                                                      controller
                                                                          .petrolconsumedatsiteCtrl,
                                                                  //validate
                                                                  errorController: controller
                                                                          .isPetrolConsumedAtSiteInvalid
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
                                                                          .isPetrolConsumedAtSiteInvalid
                                                                          .value = false;
                                                                    } else {
                                                                      controller
                                                                          .isPetrolConsumedAtSiteInvalid
                                                                          .value = true;
                                                                    }
                                                                  }
                                                                  ),
                                                            ],
                                                          ),
                                                          // Dimens.boxHeight5,
                                                          //  Row(
                                                          //     children: [
                                                          //       CustomRichText(
                                                          //           title:
                                                          //               'Submited By'),
                                                          //       Dimens
                                                          //           .boxWidth3,
                                                          //       LoginCustomTextfield(
                                                          //           width: (MediaQuery.of(context)
                                                          //                   .size
                                                          //                   .width *
                                                          //               .2),
                                                          //           keyboardType:
                                                          //               TextInputType
                                                          //                   .number,
                                                          //           // textController:
                                                          //           //     controller
                                                          //           //         .KaizensImplementedCtrl,
                                                          //           //  validate
                                                          //           // errorController: controller
                                                          //           //         .isKaizensImplementedInvalid
                                                          //           //         .value
                                                          //           //     ? "Required field"
                                                          //           //     : null,
                                                          //           // onChanged:
                                                          //           //     (value) {
                                                          //           //   if (value
                                                          //           //           .trim()
                                                          //           //           .length >
                                                          //           //       0) {
                                                          //           //     controller
                                                          //           //         .isKaizensImplementedInvalid
                                                          //           //         .value = false;
                                                          //           //   } else {
                                                          //           //     controller
                                                          //           //         .isKaizensImplementedInvalid
                                                          //           //         .value = true;
                                                          //           //   }
                                                          //           // }
                                                          //           ),
                                                          //     ],
                                                          //   ),
                                                            Dimens.boxHeight5,
                                                          
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
            
            floatingActionButton: 
                    Row(
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
                            ? 
                            Container(
                                height: 40,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.submitColor,
                                  text: 'Submit',
                                  onPressed: () {
                                    controller.isFormInvalid.value = false;
                                    controller.checkForm();
                                    controller.createfuledata(
                                      month_id: controller.selectedMonth,
                                      year: controller.selectedYear
                                    );

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
                                    controller.updateFuelConsumption(
                                        );
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
_showMonthYearPicker(BuildContext context, CreateFuelDataController controller) {
  // Set the default selected month and year
  controller.selectedMonth = DateTime.now().month;
  controller.selectedYear = DateTime.now().year;

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
                  itemExtent: 40,
                  onSelectedItemChanged: (int index) {
                    controller.selectedMonth = index + 1;
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
                  itemExtent: 40,
                  onSelectedItemChanged: (int index) {
                    // Adjust the base year (e.g., 2000) as needed
                    controller.selectedYear = 2000 + index;
                  },
                  children: List.generate(100, (index) {
                    return Center(
                      child: Text(
                        (2000 + index).toString(),
                      ),
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
              controller.FuelDateTc.text = "${DateFormat.MMMM().format(DateTime(0, controller.selectedMonth))} ${controller.selectedYear}";
              // Pass the selected month and year ID when creating Kaizens data
              // controller.createkaizensdata(monthId: controller.selectedMonth, year: controller.selectedYear);
              controller.update(['stock_Mangement']);
              Navigator.of(context).pop();
            },
            label: "Select",
          ),
        ],
      );
    },
  );
}