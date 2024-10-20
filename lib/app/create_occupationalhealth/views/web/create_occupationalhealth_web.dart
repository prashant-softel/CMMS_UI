import 'package:cmms/app/create_OccupationalHealth/create_occupationalhealth_controller.dart';
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

class CreateOccupationalhealthWeb extends StatefulWidget {
  CreateOccupationalhealthWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateOccupationalhealthWeb> createState() => _ViewOccupationalhealthWebState();
}

class _ViewOccupationalhealthWebState extends State<CreateOccupationalhealthWeb> {
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateOccupationalhealthController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return SelectionArea(
          child: Obx(()=>
           Scaffold(
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
                            Text(" / CREATE OCCUPATIONAL HEALTH",
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
                                                  "Add Occupational Health",
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
                                                                          .HealthDate,
                                                                ),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                CustomRichText(
                                                                    title:
                                                                        'No. of Health Examinations carried out for newly joined person'),
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
                                                                            .noofhealthexamsofnewjoinerCtrl,
                                                                  // validate
                                                                    errorController: controller
                                                                            .isHeathExamInvalid
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
                                                                            .isHeathExamInvalid
                                                                            .value = false;
                                                                      } else {
                                                                        controller
                                                                            .isHeathExamInvalid
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
                                                                        'No. of Occupational Health related illness'),
                                                                Dimens.boxWidth3,
                                                                LoginCustomTextfield(
                                                                    width: (MediaQuery.of(
                                                                                context)
                                                                            .size
                                                                            .width *
                                                                        .2),
                                                                    textController:
                                                                        controller
                                                                            .periodictestsCtrl,
                                                                    //validate
                                                                    errorController: controller
                                                                            .isPeriodictestInvalid
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
                                                                            .isPeriodictestInvalid
                                                                            .value = false;
                                                                      } else {
                                                                        controller
                                                                            .isPeriodictestInvalid
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
                                                                        'No. of persons to which Periodic Health Examination conducted (Annual Physical Fitness)'),
                                                                Dimens.boxWidth3,
                                                                LoginCustomTextfield(
                                                                    width: (MediaQuery.of(
                                                                                context)
                                                                            .size
                                                                            .width *
                                                                        .2),
                                                                    textController:
                                                                        controller
                                                                            .occupationalillnessesCtrl,
                                                                    //validate
                                                                    errorController: controller
                                                                            .isOccupationalIllnessesInvalid
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
                                                                            .isOccupationalIllnessesInvalid
                                                                            .value = false;
                                                                      } else {
                                                                        controller
                                                                            .isOccupationalIllnessesInvalid
                                                                            .value = true;
                                                                      }
                                                                    }
                                                                    ),
                                                              ],
                                                            ),
                                                            
                                                            
                                                            Dimens.boxHeight5,
                                                            //  Row(
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
                          Dimens.boxWidth10,
                          controller.selectedItem?.id==0
                              ? 
                              Container(
                                  height: 40,
                                  child: CustomElevatedButton(
                                    backgroundColor: ColorValues.submitColor,
                                    text: 'Submit',
                                    onPressed: () {
                                      // controller.isFormInvalid.value = false;
                                      controller.createoccupational(
                                          month_id: controller.selectedMonth,
                                      year: controller.selectedYear
                                      );
                                    },
                                  ),
                                )
                              : 
                              Container(
                                  height: 40,
                                  child: CustomElevatedButton(
                                    backgroundColor: ColorValues.submitColor,
                                    text: 'Update',
                                    onPressed: () {
                                      // controller.isFormInvalid.value = false;
                                      controller.updateOccupationalDetails(
                                      
                                          );
                                    },
                                  ),
                                ),
                          
                          Spacer(),
                        ],
                      )
                  // : Dimens.box0
                
            ),
          ),
        );
        // );
      },
    );
  }
}
_showMonthYearPicker(BuildContext context, CreateOccupationalhealthController controller) {
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
              controller.HealthDate.text = "${DateFormat.MMMM().format(DateTime(0, controller.selectedMonth))} ${controller.selectedYear}";
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