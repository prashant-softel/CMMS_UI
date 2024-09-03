import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_kaizens/create_kaizens_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textFieldMobile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateKaizensMobile extends StatefulWidget {
  CreateKaizensMobile({
    Key? key,
  }) : super(key: key);
  // final FileUploadController dropzoneController =
  //     Get.put(FileUploadController());
  @override
  State<CreateKaizensMobile> createState() => _CreateKaizensMobileState();
}

class _CreateKaizensMobileState extends State<CreateKaizensMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateKaizensDataController>(
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
                            "Create Kiazens",
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
                                title: "No. of kaizens implemented: ",
                              ),
                              Dimens.boxHeight2,
                              CustomTextfieldMobile(
                                width: MediaQuery.of(context).size.width / 1.1,
                                keyboardType: TextInputType.number,
                                textController:
                                    controller.KaizensImplementedCtrl,
                                // errorController: controller.isKaizensImplementedInvalid.value
                                //     ? "Required field"
                                //     : null,
                                onChanged: (value) {
                                  if (value.trim().length > 0) {
                                    controller.isKaizensImplementedInvalid
                                        .value = false;
                                  } else {
                                    controller.isKaizensImplementedInvalid
                                        .value = true;
                                  }
                                },
                              ),
                              Dimens.boxHeight15,
                              CustomRichTextMobile(
                                title:
                                    "Cost inquired for implementation of Kaizens: ",
                              ),
                              Dimens.boxHeight2,
                              CustomTextfieldMobile(
                                width: MediaQuery.of(context).size.width / 1.1,
                                keyboardType: TextInputType.number,
                                textController:
                                    controller.CostForImplementationCtrl,
                                // errorController: controller.isCorrectiveInvalid.value
                                //     ? "Required field"
                                //     : null,
                                onChanged: (value) {
                                  if (value.trim().length > 0) {
                                    controller.isCostForImplementationInvalid
                                        .value = false;
                                  } else {
                                    controller.isCostForImplementationInvalid
                                        .value = true;
                                  }
                                },
                              ),
                              Dimens.boxHeight15,
                              CustomRichTextMobile(
                                title:
                                    "Cost saved from the Implementation of Kaizens: ",
                              ),
                              Dimens.boxHeight2,
                              CustomTextfieldMobile(
                                width: MediaQuery.of(context).size.width / 1.1,
                                keyboardType: TextInputType.number,
                                textController:
                                    controller.CostSavedFromImplementationCtrl,
                                // errorController: controller.isCorrectiveInvalid.value
                                //     ? "Required field"
                                //     : null,
                                onChanged: (value) {
                                  if (value.trim().length > 0) {
                                    controller
                                        .isCostSavedFromImplementationInvalid
                                        .value = false;
                                  } else {
                                    controller
                                        .isCostSavedFromImplementationInvalid
                                        .value = true;
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
              floatingActionButton: Row(
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
                        controller.createkaizensdata(
                            monthId: controller.selectedMonth,
                            year: controller.selectedMonth);
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
      },
    );
  }
}
