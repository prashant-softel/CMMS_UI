import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_kaizens/create_kaizens_controller.dart';
import 'package:cmms/app/create_plantationdata/create_plantationdata_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textFieldMobile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePlantationMobile extends StatefulWidget {
  CreatePlantationMobile({
    Key? key,
  }) : super(key: key);
  // final FileUploadController dropzoneController =
  //     Get.put(FileUploadController());
@override
  State<CreatePlantationMobile> createState() =>
      _CreatePlantationMobileState();
}

class _CreatePlantationMobileState extends State<CreatePlantationMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreatePlantationDataController>(
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
                          "Create Plantation",
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
                              title: "Total No of saplings planted: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController: controller.SaplingsPlantedCtrl,
                              // errorController: controller.isSaplingsPlantedCtrlInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isSaplingsPlantedCtrlInvalid.value = false;
                                } else {
                                  controller.isSaplingsPlantedCtrlInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              title: "Total No of Saplings survived: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController:
                                  controller.SaplingsSurvivedCtrl,
                              // errorController: controller.isSaplingsSurvivedCtrlInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isSaplingsSurvivedCtrlInvalid.value = false;
                                } else {
                                  controller.isSaplingsSurvivedCtrlInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Total No of Saplings died:",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController: controller.SaplingsDiedCtrl,
                              // errorController: controller.isSaplingsDiedCtrlInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isSaplingsDiedCtrlInvalid.value = false;
                                } else {
                                  controller.isSaplingsDiedCtrlInvalid.value = true;
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
                        controller.selectedItem?.id == 0
                            ? 
                        Container(
                                height: 40,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.submitColor,
                                  text: 'Submit',
                                  onPressed: () {
                                    // controller.isFormInvalid.value = false;
                                    controller.createplantationdata( monthId: controller.selectedMonth,
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
                                    controller.updatePlantationDetails(
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
      },
    );
  }
}
