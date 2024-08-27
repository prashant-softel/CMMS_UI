import 'package:cmms/app/create_plantationdata/create_plantationdata_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';

class PlantationDataWeb extends StatefulWidget {
  PlantationDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<PlantationDataWeb> createState() => _ViewPlantationDataWebState();
}

class _ViewPlantationDataWebState extends State<PlantationDataWeb> {
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreatePlantationDataController>(
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
                          Text(" / PLANTATION DATA",
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
                                                "Plantation Data",
                                                style: Styles.blackBold16,
                                              ),
                                              Spacer(),
                                                    Padding(
                                            padding: EdgeInsets.only(
                                              top: 20,
                                              right: 20,
                                            ),
                                            child: Row(
                                              children: [
                                                Text('Month:'),
                                                Dimens.boxWidth10,
                                                CustomTextFieldForStock(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      8,
                                                  numberTextField: true,
                                                  onTap: () {
                                                    _showMonthPicker(
                                                        context, controller);
                                                  },
                                                  // textController:
                                                  //     controller.waterDateTc,
                                                ),
                                              ],
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
                                                              CustomRichText(
                                                                  title:
                                                                      'Total No of saplings planted'),
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
                                                                          .SaplingsPlantedCtrl,
                                                                //  validate
                                                                  errorController: controller
                                                                          .isSaplingsPlantedCtrlInvalid
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
                                                                          .isSaplingsPlantedCtrlInvalid
                                                                          .value = false;
                                                                    } else {
                                                                      controller
                                                                          .isSaplingsPlantedCtrlInvalid
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
                                                                      'Total No of Saplings survived'),
                                                              Dimens.boxWidth3,
                                                              LoginCustomTextfield(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  textController:
                                                                      controller
                                                                          .SaplingsSurvivedCtrl,
                                                                  //validate
                                                                  errorController: controller
                                                                          .isSaplingsSurvivedCtrlInvalid
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
                                                                          .isSaplingsSurvivedCtrlInvalid
                                                                          .value = false;
                                                                    } else {
                                                                      controller
                                                                          .isSaplingsSurvivedCtrlInvalid
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
                                                                      'Total No of Saplings died'),
                                                              Dimens.boxWidth3,
                                                              LoginCustomTextfield(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  textController:
                                                                      controller
                                                                          .SaplingsDiedCtrl,
                                                                  //validate
                                                                  errorController: controller
                                                                          .isSaplingsDiedCtrlInvalid
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
                                                                          .isSaplingsDiedCtrlInvalid
                                                                          .value = false;
                                                                    } else {
                                                                      controller
                                                                          .isSaplingsDiedCtrlInvalid
                                                                          .value = true;
                                                                    }
                                                                  }
                                                                  ),
                                                            ],
                                                          ),
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
                              Get.toNamed(Routes.misDashboard);
                            },
                          ),
                        ),
                        Dimens.boxWidth15,
                        // controller.obsId == 0
                            // ? 
                            Container(
                                height: 40,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.submitColor,
                                  text: 'Submit',
                                  onPressed: () {
                                    // controller.isFormInvalid.value = false;
                                    controller.createplantationdata();

                                  },
                                ),
                              )
                            // : Container(
                            //     height: 40,
                            //     child: CustomElevatedButton(
                            //       backgroundColor: ColorValues.submitColor,
                            //       text: 'Update',
                            //       onPressed: () {
                            //         controller.isFormInvalid.value = false;
                            //         controller.createObs(
                            //             position: 0,
                            //             fileIds: dropzoneController.fileIds);
                            //       },
                            //     ),
                            //   ),
                            ,
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
_showMonthPicker(BuildContext context, CreatePlantationDataController controller) {
  // controller.selectedMonth = DateTime.now().year;
  // showDialog(
  //   context: context,
  //   builder: (BuildContext context) {
  //     return AlertDialog(
  //       title: Text("Select Year"),
  //       content: Container(
  //         height: 200,
  //         child: CupertinoPicker(
  //           itemExtent: 40,
  //           onSelectedItemChanged: (int index) {
  //             controller.selectedMonth = DateTime.now().year - index;
  //           },
  //           children: List.generate(10, (index) {
  //             return Center(
  //               child: Text((DateTime.now().year - index).toString()),
  //             );
  //           }),
  //         ),
  //       ),
  //       actions: <Widget>[
  //         ActionButton(
  //           label: "Cancel", color: ColorValues.appRedColor,
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           // child: Text("Cancel"),
  //         ),
  //         Dimens.boxHeight10,
  //         ActionButton(
  //           color: ColorValues.addNewColor,
  //           onPressed: () {
  //             controller.waterDateTc.text = controller.selectedYear.toString();
  //             controller.goWaterDataList();
  //             controller.update(['stock_Mangement_Date']);
  //             Navigator.of(context).pop();
  //           },
  //           label: "Select",
  //         ),
  //       ],
  //     );
  //   },
  // );
}