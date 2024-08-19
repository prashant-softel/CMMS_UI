import 'package:cmms/app/create_regulataryvisits/create_regulataryvisits_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';

class RegulataryVisitsWeb extends StatefulWidget {
  RegulataryVisitsWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<RegulataryVisitsWeb> createState() => _ViewRegulataryVisitsWebState();
}

class _ViewRegulataryVisitsWebState extends State<RegulataryVisitsWeb> {
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateRegulataryVisitsController>(
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
                          Text(" / REGULATARY VISITS AND NOTICES",
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
                                                "Regulatary Visits and Notices",
                                                style: Styles.blackBold16,
                                              ),
                                              Spacer(),
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
                                                                      'No. of Govt. authorities visited the site'),
                                                              Dimens.boxWidth3,
                                                              LoginCustomTextfield(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  // keyboardType:
                                                                  //     TextInputType
                                                                  //         .number,
                                                                  // textController:
                                                                  //     controller
                                                                  //         .contractorNameCtrlr,
                                                                  //validate
                                                                  // errorController: controller
                                                                  //         .isContractorInvalid
                                                                  //         .value
                                                                  //     ? "Required field"
                                                                  //     : null,
                                                                  // onChanged:
                                                                  //     (value) {
                                                                  //   if (value
                                                                  //           .trim()
                                                                  //           .length >
                                                                  //       0) {
                                                                  //     controller
                                                                  //         .isContractorInvalid
                                                                  //         .value = false;
                                                                  //   } else {
                                                                  //     controller
                                                                  //         .isContractorInvalid
                                                                  //         .value = true;
                                                                  //   }
                                                                  // }
                                                                  ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'No. of Penalties/fines received by third parties '),
                                                              Dimens.boxWidth3,
                                                              LoginCustomTextfield(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  // textController:
                                                                  //     controller
                                                                  //         .correctivePreventiveCtrlr,
                                                                  // //validate
                                                                  // errorController: controller
                                                                  //         .isCorrectiveInvalid
                                                                  //         .value
                                                                  //     ? "Required field"
                                                                  //     : null,
                                                                  // onChanged:
                                                                  //     (value) {
                                                                  //   if (value
                                                                  //           .trim()
                                                                  //           .length >
                                                                  //       0) {
                                                                  //     controller
                                                                  //         .isCorrectiveInvalid
                                                                  //         .value = false;
                                                                  //   } else {
                                                                  //     controller
                                                                  //         .isCorrectiveInvalid
                                                                  //         .value = true;
                                                                  //   }
                                                                  // }
                                                                  ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'No. of Show cause notices received by third parties '),
                                                              Dimens.boxWidth3,
                                                              LoginCustomTextfield(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  // textController:
                                                                  //     controller
                                                                  //         .responsiblePersonCtrlr,
                                                                  // //validate
                                                                  // errorController: controller
                                                                  //         .isResponsibleInvalid
                                                                  //         .value
                                                                  //     ? "Required field"
                                                                  //     : null,
                                                                  // onChanged:
                                                                  //     (value) {
                                                                  //   if (value
                                                                  //           .trim()
                                                                  //           .length >
                                                                  //       0) {
                                                                  //     controller
                                                                  //         .isResponsibleInvalid
                                                                  //         .value = false;
                                                                  //   } else {
                                                                  //     controller
                                                                  //         .isResponsibleInvalid
                                                                  //         .value = true;
                                                                  //   }
                                                                  // }
                                                                  ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'No of warning or Non conformity notices issued by HFE to contractor '),
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
                                                                  // keyboardType:
                                                                  //     TextInputType
                                                                  //         .number,
                                                                  // textController:
                                                                  //     controller
                                                                  //         .contactNumberCtrlr,
                                                                  // //validate
                                                                  // errorController: controller
                                                                  //         .isContactNumberInvalid
                                                                  //         .value
                                                                  //     ? "Required field"
                                                                  //     : null,
                                                                  // onChanged:
                                                                  //     (value) {
                                                                  //   if (value
                                                                  //           .trim()
                                                                  //           .length >
                                                                  //       0) {
                                                                  //     controller
                                                                  //         .isContactNumberInvalid
                                                                  //         .value = false;
                                                                  //   } else {
                                                                  //     controller
                                                                  //         .isContactNumberInvalid
                                                                  //         .value = true;
                                                                  //   }
                                                                  // }
                                                                  ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                           Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Penalties imposed to the contractor by HFE in Amount'),
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
                                                                  // keyboardType:
                                                                  //     TextInputType
                                                                  //         .number,
                                                                  // textController:
                                                                  //     controller
                                                                  //         .contactNumberCtrlr,
                                                                  // //validate
                                                                  // errorController: controller
                                                                  //         .isContactNumberInvalid
                                                                  //         .value
                                                                  //     ? "Required field"
                                                                  //     : null,
                                                                  // onChanged:
                                                                  //     (value) {
                                                                  //   if (value
                                                                  //           .trim()
                                                                  //           .length >
                                                                  //       0) {
                                                                  //     controller
                                                                  //         .isContactNumberInvalid
                                                                  //         .value = false;
                                                                  //   } else {
                                                                  //     controller
                                                                  //         .isContactNumberInvalid
                                                                  //         .value = true;
                                                                  //   }
                                                                  // }
                                                                  ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Any other'),
                                                              Dimens.boxWidth3,
                                                              LoginCustomTextfield(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  // inputFormatters: [
                                                                  //   FilteringTextInputFormatter
                                                                  //       .digitsOnly
                                                                  // ],
                                                                  // keyboardType:
                                                                  //     TextInputType
                                                                  //         .number,
                                                                  // textController:
                                                                  //     controller
                                                                  //         .contactNumberCtrlr,
                                                                  // //validate
                                                                  // errorController: controller
                                                                  //         .isContactNumberInvalid
                                                                  //         .value
                                                                  //     ? "Required field"
                                                                  //     : null,
                                                                  // onChanged:
                                                                  //     (value) {
                                                                  //   if (value
                                                                  //           .trim()
                                                                  //           .length >
                                                                  //       0) {
                                                                  //     controller
                                                                  //         .isContactNumberInvalid
                                                                  //         .value = false;
                                                                  //   } else {
                                                                  //     controller
                                                                  //         .isContactNumberInvalid
                                                                  //         .value = true;
                                                                  //   }
                                                                  // }
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
                              Get.toNamed(Routes.complianceScreen);
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
                                    // controller.createObs(
                                    //     position: 1,
                                    //     fileIds: dropzoneController.fileIds);
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
