import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_regulataryvisits/create_regulataryvisits_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textFieldMobile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateVisitAndNodticeMobile extends StatefulWidget {
  CreateVisitAndNodticeMobile({
    Key? key,
  }) : super(key: key);
  // final FileUploadController dropzoneController =
  //     Get.put(FileUploadController());
@override
  State<CreateVisitAndNodticeMobile> createState() =>
      _CreateVisitAndNodticeMobileState();
}

class _CreateVisitAndNodticeMobileState extends State<CreateVisitAndNodticeMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateRegulataryVisitsController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return SelectionArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Dimens.boxHeight5,
                  HeaderWidgetMobile(),
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create Visit And Notice",
                          style: Styles.blackBold18,
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.lightBlue.shade50,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRichTextMobile(
                              title: "No. of Govt. authorities visited the site: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController: controller.govtauthvisitsCtrl,
                              // errorController: controller.isDieselConsumedForVehiclesInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isGovtAuthVisitsInvalid.value = false;
                                } else {
                                  controller.isGovtAuthVisitsInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              title: "No. of Penalties/fines received by third parties:",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController:
                                  controller.noOffinebythirdpartyCtrl,
                              // errorController: controller.isPetrolConsumedForVehiclesInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isNoOfFineByThirdPartyInvalid.value = false;
                                } else {
                                  controller.isNoOfFineByThirdPartyInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "No. of Show cause notices received by third parties:",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController: controller.noofshowcausenoticesbythirdpartyCtrl,
                              // errorController: controller.isPetrolConsumedForGrassCuttingAndMoversInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isNoOfShowCauseNoticesInvalid.value = false;
                                } else {
                                  controller.isNoOfShowCauseNoticesInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "No of warning or Non conformity notices issued by HFE to contractor:",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController:
                                  controller.noticestocontractorCtrl,
                              // errorController: controller.isNoticesToContractorInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isNoticesToContractorInvalid.value = false;
                                } else {
                                  controller.isNoticesToContractorInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Penalties imposed to the contractor by HFE in Amount:",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController: controller.amountofpenaltiestocontractorsCtrl,
                              // errorController: controller.isPetrolConsumedAtSiteInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isAmountOfPenaltiesToContractorsInvalid.value = false;
                                } else {
                                  controller.isAmountOfPenaltiesToContractorsInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                             CustomRichTextMobile(
                              title: "Any other:",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController: controller.anyotherCtrl,
                              // errorController: controller.isPetrolConsumedAtSiteInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isAnyOtherInvalid.value = false;
                                } else {
                                  controller.isAnyOtherInvalid.value = true;
                                }
                              },
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
                        //     ? 
                        Container(
                                height: 40,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.submitColor,
                                  text: 'Submit',
                                  onPressed: () {
                                    // controller.isFormInvalid.value = false;
                                    controller.createvisitsandnotices();
                                  },
                                ),
                              )
                        //     : Container(
                        //         height: 40,
                        //         child: CustomElevatedButton(
                        //           backgroundColor: ColorValues.submitColor,
                        //           text: 'Update',
                        //           onPressed: () {
                        //             controller.isFormInvalid.value = false;
                        //             controller.createObs(position: 0);
                        //           },
                        //         ),
                        //       ),
                        ,
                        Spacer(),
                      ],
                    )
                // : Dimens.box0
                
          ),
        );
      },
    );
  }
}
