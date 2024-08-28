import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_OccupationalHealth/create_occupationalhealth_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textFieldMobile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateOccupationalhealthMobile extends StatefulWidget {
  CreateOccupationalhealthMobile({
    Key? key,
  }) : super(key: key);
  // final FileUploadController dropzoneController =
  //     Get.put(FileUploadController());
@override
  State<CreateOccupationalhealthMobile> createState() =>
      _CreateOccupationalhealthMobileState();
}

class _CreateOccupationalhealthMobileState extends State<CreateOccupationalhealthMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateOccupationalhealthController>(
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
                          "Create Occupational Health",
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
                              title: "No. of Health Examinations carried out for newly joined person: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController: controller.noofhealthexamsofnewjoinerCtrl,
                              // errorController: controller.isHeathExamInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isHeathExamInvalid.value = false;
                                } else {
                                  controller.isHeathExamInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              title: "No. of Occupational Health related illness:",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController:
                                  controller.periodictestsCtrl,
                              // errorController: controller.isPeriodictestInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isPeriodictestInvalid.value = false;
                                } else {
                                  controller.isPeriodictestInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "No. of persons to which Periodic Health Examination conducted (Annual Physical Fitness):",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController: controller.occupationalillnessesCtrl,
                              // errorController: controller.isOccupationalIllnessesInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isOccupationalIllnessesInvalid.value = false;
                                } else {
                                  controller.isOccupationalIllnessesInvalid.value = true;
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
                                    controller.createoccupational();
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
