import 'package:cmms/app/create_observation/create_observation_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/view/stock_management_add_goods_orders_web.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cmms/app/app.dart';

class CreateObservationWeb extends StatefulWidget {
  CreateObservationWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateObservationWeb> createState() => _ViewHazWasteDataWebState();
}

class _ViewHazWasteDataWebState extends State<CreateObservationWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateObservationController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: Color.fromARGB(255, 234, 236, 238),
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                HeaderWidget(),
                AppBarCreateObservation(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Column(
                        children: [
                          Card(
                            color: Color.fromARGB(255, 245, 248, 250),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 20),
                                  child: Text(
                                    "Create Observation",
                                    style: Styles.blackBold16,
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Container(
                                  color: Color.fromARGB(255, 245, 248, 250),
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
                                                CrossAxisAlignment.start,
                                            children: [
                                              Spacer(),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      CustomRichText(
                                                          title:
                                                              'Contractor Name'),
                                                      Dimens.boxWidth10,
                                                      GoodsOrderTextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,

                                                        // textController:
                                                        //     controller.challanNoCtrlr,
                                                      ),
                                                    ],
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      CustomRichText(
                                                          title:
                                                              'Date of Observation'),
                                                      Dimens.boxWidth10,
                                                      CustomTextFieldForStock(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        numberTextField: true,
                                                        onTap: () {
                                                          // controller
                                                          //         .openReceivedPicker =
                                                          //     !controller
                                                          //         .openReceivedPicker;
                                                          // controller.update(
                                                          //     ['stock_Mangement']);
                                                        },
                                                        // textController:
                                                        //     controller.receivedDateTc,
                                                      ),
                                                    ],
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      CustomRichText(
                                                          title:
                                                              'Type of Observation'),
                                                      Dimens.boxWidth10,
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          // boxShadow: [
                                                          //   BoxShadow(
                                                          //     color: Colors
                                                          //         .black26,
                                                          //     offset:
                                                          //         const Offset(
                                                          //       5.0,
                                                          //       5.0,
                                                          //     ),
                                                          //     blurRadius: 5.0,
                                                          //     spreadRadius: 1.0,
                                                          //   ),
                                                          // ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: DropdownWebStock(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                          dropdownList: controller
                                                              .typeOfObservation,
                                                          // selectedValue: ,
                                                          onValueChanged:
                                                              (typeOfObservation,
                                                                  selectedValue) {},
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      CustomRichText(
                                                          title: 'Risk Type'),
                                                      Dimens.boxWidth10,
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          // boxShadow: [
                                                          //   BoxShadow(
                                                          //     color: Colors
                                                          //         .black26,
                                                          //     offset:
                                                          //         const Offset(
                                                          //       5.0,
                                                          //       5.0,
                                                          //     ),
                                                          //     blurRadius: 5.0,
                                                          //     spreadRadius: 1.0,
                                                          //   ),
                                                          // ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: DropdownWebStock(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                          dropdownList:
                                                              controller
                                                                  .riskType,
                                                          // selectedValue: ,
                                                          onValueChanged: (riskType,
                                                              selectedValue) {},
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      CustomRichText(
                                                          title:
                                                              'Corrective/Preventive Action'),
                                                      Dimens.boxWidth10,
                                                      GoodsOrderTextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,

                                                        // textController:
                                                        //     controller.challanNoCtrlr,
                                                      ),
                                                    ],
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      CustomRichText(
                                                          title:
                                                              'Responsible Person'),
                                                      Dimens.boxWidth10,
                                                      GoodsOrderTextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,

                                                        // textController:
                                                        //     controller.challanNoCtrlr,
                                                      ),
                                                    ],
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      CustomRichText(
                                                          title: 'Cost type'),
                                                      Dimens.boxWidth10,
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          // boxShadow: [
                                                          //   BoxShadow(
                                                          //     color: Colors
                                                          //         .black26,
                                                          //     offset:
                                                          //         const Offset(
                                                          //       5.0,
                                                          //       5.0,
                                                          //     ),
                                                          //     blurRadius: 5.0,
                                                          //     spreadRadius: 1.0,
                                                          //   ),
                                                          // ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: DropdownWebStock(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                          dropdownList:
                                                              controller
                                                                  .costType,
                                                          // selectedValue: ,
                                                          onValueChanged: (costType,
                                                              selectedValue) {},
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  Dimens.boxHeight5,
                                                  // if (reNew == 1)
                                                  // Row(
                                                  //   children: [
                                                  //     CustomRichText(
                                                  //         title: 'ReNew Date '),
                                                  //     Dimens.boxWidth10,
                                                  //     CustomTextFieldForStock(
                                                  //       width:
                                                  //           MediaQuery.of(context)
                                                  //                   .size
                                                  //                   .width /
                                                  //               5,
                                                  //       numberTextField: true,
                                                  //       onTap: () {
                                                  //         // controller
                                                  //         //         .openReceivedPicker =
                                                  //         //     !controller
                                                  //         //         .openReceivedPicker;
                                                  //         // controller.update(
                                                  //         //     ['stock_Mangement']);
                                                  //       },
                                                  //       // textController:
                                                  //       //     controller.receivedDateTc,
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                ],
                                              ),
                                              Spacer(),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      CustomRichText(
                                                          title:
                                                              'Location of Observation'),
                                                      Dimens.boxWidth10,
                                                      GoodsOrderTextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,

                                                        // textController:
                                                        //     controller.challanNoCtrlr,
                                                      ),
                                                    ],
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      CustomRichText(
                                                          title:
                                                              'Source of Observation'),
                                                      Dimens.boxWidth10,
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          // boxShadow: [
                                                          //   BoxShadow(
                                                          //     color: Colors
                                                          //         .black26,
                                                          //     offset:
                                                          //         const Offset(
                                                          //       5.0,
                                                          //       5.0,
                                                          //     ),
                                                          //     blurRadius: 5.0,
                                                          //     spreadRadius: 1.0,
                                                          //   ),
                                                          // ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: DropdownWebStock(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                          dropdownList: controller
                                                              .sourceOfObservation,
                                                          // selectedValue: ,
                                                          onValueChanged:
                                                              (sourceOfObservation,
                                                                  selectedValue) {},
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      CustomRichText(
                                                          title:
                                                              'Action Taken'),
                                                      Dimens.boxWidth10,
                                                      GoodsOrderTextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,

                                                        // textController:
                                                        //     controller.challanNoCtrlr,
                                                      ),
                                                    ],
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      CustomRichText(
                                                          title: 'Target Date'),
                                                      Dimens.boxWidth10,
                                                      CustomTextFieldForStock(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        numberTextField: true,
                                                        onTap: () {
                                                          // controller
                                                          //         .openReceivedPicker =
                                                          //     !controller
                                                          //         .openReceivedPicker;
                                                          // controller.update(
                                                          //     ['stock_Mangement']);
                                                        },
                                                        // textController:
                                                        //     controller.receivedDateTc,
                                                      ),
                                                    ],
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      CustomRichText(
                                                          title: 'Closer Date'),
                                                      Dimens.boxWidth10,
                                                      CustomTextFieldForStock(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        numberTextField: true,
                                                        onTap: () {
                                                          // controller
                                                          //         .openReceivedPicker =
                                                          //     !controller
                                                          //         .openReceivedPicker;
                                                          // controller.update(
                                                          //     ['stock_Mangement']);
                                                        },
                                                        // textController:
                                                        //     controller.receivedDateTc,
                                                      ),
                                                    ],
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      CustomRichText(
                                                          title:
                                                              'Contact Number'),
                                                      Dimens.boxWidth10,
                                                      GoodsOrderTextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,

                                                        // textController:
                                                        //     controller.challanNoCtrlr,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                          Dimens.boxHeight20,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Row(children: [
                                              Text('Observation Description: ',
                                                  style: Styles.blue14),
                                              Expanded(
                                                child: TextField(
                                                  style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                        fontSize: 16.0,
                                                        height: 1.0,
                                                        color: Colors.black),
                                                  ),
                                                  decoration: InputDecoration(
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: ColorValues
                                                            .appLightGreyColor,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: ColorValues
                                                            .appLightBlueColor,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: ColorValues
                                                            .appLightBlueColor,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  minLines: 3,
                                                  maxLines: null,
                                                ),
                                              ),
                                            ]),
                                          ),
                                          Dimens.boxHeight15,
                                          Row(
                                            children: [
                                              Spacer(),
                                              CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.appRedColor,
                                                text: 'cancel',
                                                onPressed: () {
                                                  // controller.AddInventory();
                                                },
                                              ),
                                              Dimens.boxWidth15,
                                              CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.appGreenColor,
                                                text: 'Submit',
                                                onPressed: () {
                                                  // controller.submitPurchaseOrderData();
                                                },
                                              ),
                                              Spacer()
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
                  ),
                ),
              ],
            ),
          ),
          // floatingActionButton: Row(
          //   children: [
          //     Spacer(),
          //     Container(
          //       height: 40,
          //       child: CustomElevatedButton(
          //         backgroundColor: ColorValues.cancelColor,
          //         text: 'Cancel',
          //         onPressed: () {
          //           Get.back();
          //         },
          //       ),
          //     ),
          //     Dimens.boxWidth15,
          //     Container(
          //       height: 40,
          //       child: CustomElevatedButton(
          //         backgroundColor: ColorValues.submitColor,
          //         text: 'Update',
          //         onPressed: () {
          //           // controller.createGoodsOrder();
          //         },
          //       ),
          //     ),
          //     Spacer(),
          //   ],
          // ),
        );
        // );
      },
    );
  }
}

class AppBarCreateObservation extends StatelessWidget {
  const AppBarCreateObservation({
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
          Text(" / CREATE OBSERVATION", style: Styles.greyLight14),
        ],
      ),
    );
  }
}
