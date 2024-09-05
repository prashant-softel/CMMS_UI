import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_fueldata/create_fueldata_controller.dart';
import 'package:cmms/app/create_kaizens/create_kaizens_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textFieldMobile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateFuelMobile extends StatefulWidget {
  CreateFuelMobile({
    Key? key,
  }) : super(key: key);
  // final FileUploadController dropzoneController =
  //     Get.put(FileUploadController());
@override
  State<CreateFuelMobile> createState() =>
      _CreateFuelMobileState();
}

class _CreateFuelMobileState extends State<CreateFuelMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateFuelDataController>(
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
                          "Create Fuel",
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
                              title: "Total diesel consumed for vehicles in Litres: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController: controller.dieselConsumedforvehiclesCtrl,
                              // errorController: controller.isDieselConsumedForVehiclesInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isDieselConsumedForVehiclesInvalid.value = false;
                                } else {
                                  controller.isDieselConsumedForVehiclesInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              title: "Total Petrol consumed for vehicles in Litres:",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController:
                                  controller.petrolconsumedforvehiclesCtrl,
                              // errorController: controller.isPetrolConsumedForVehiclesInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isPetrolConsumedForVehiclesInvalid.value = false;
                                } else {
                                  controller.isPetrolConsumedForVehiclesInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Total petrol consumed for Grass cutting & Mower in Litres:",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController: controller.petrolconsumedforgrasscuttingandmoversCtrl,
                              // errorController: controller.isPetrolConsumedForGrassCuttingAndMoversInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isPetrolConsumedForGrassCuttingAndMoversInvalid.value = false;
                                } else {
                                  controller.isPetrolConsumedForGrassCuttingAndMoversInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Total Diesel consumed at site in Litres:",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController:
                                  controller.dieselconsumedatsiteCtrl,
                              // errorController: controller.isPetrolConsumedForVehiclesInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isDieselConsumedAtSiteInvalid.value = false;
                                } else {
                                  controller.isDieselConsumedAtSiteInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Total Petrol consumed at site in Litres:",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              textController: controller.petrolconsumedatsiteCtrl,
                              // errorController: controller.isPetrolConsumedAtSiteInvalid.value
                              //     ? "Required field"
                              //     : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isPetrolConsumedAtSiteInvalid.value = false;
                                } else {
                                  controller.isPetrolConsumedAtSiteInvalid.value = true;
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
                                    controller.updateFuelConsumption();
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
