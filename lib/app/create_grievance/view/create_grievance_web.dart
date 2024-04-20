import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_grievance/create_grievance_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/src/services/text_formatter.dart';

class CreateGrievancesWeb extends GetView<CreateGrievanceController> {
  CreateGrievancesWeb({Key? key}) : super(key: key);
  final CreateGrievanceController controller = Get.find();

  final TextEditingController concernController = TextEditingController();
  final TextEditingController actionTakenController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  var jobDescriptionCtrlr = TextEditingController();
  // Sample list of options for the dropdown
  final List<int> dropdownOptions = [1, 2, 3];

  int selectedOption = 1; // Initial selected option

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SelectionArea(
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
                      Get.offAllNamed(Routes.misDashboard);
                      controller.clearStoreData();
                    },
                    child: Text(
                      " / MIS ",
                      style: Styles.greyLight14,
                    ),
                  ),
                  Text(" / CREATE GRIEVANCE ", style: Styles.greyLight14),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: Get.width * 7,
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Card(
                    color: ColorValues.cardColor,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 10, left: 10),
                                child: Text(
                                  " Create Grievance",
                                  style: Styles.blackBold14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: ColorValues.greyLightColour,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 51.0),
                                    child: Text(
                                      'Grievance Type:',
                                      style: Styles
                                          .blackBold14, // Apply the specified style
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    child: Obx(
                                      () => DropdownWebWidget(
                                        dropdownList: controller.grievanceType,
                                        isValueSelected: controller
                                            .isGrievanceTypeSelected.value,
                                        selectedValue: controller
                                            .selectedGrievanceType.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Dropdown Button

                              Dimens.boxHeight15,
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 50),
                                    child: Row(
                                      children: [
                                        CustomRichText(title: 'Concern: '),
                                        SizedBox(
                                            width:
                                                60), // Assuming you want some space between the text and the TextField
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 227, 224, 224),
                                                  width: 1),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                          255, 236, 234, 234)
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            // Remove width property here
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.040,
                                            child: Obx(
                                              () => TextField(
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16.0,
                                                      height: 1.0,
                                                      color: Colors.black),
                                                ),
                                                controller: controller
                                                    .concernController,
                                                focusNode:
                                                    controller.concernFocus,
                                                scrollController:
                                                    controller.concernScroll,
                                                autofocus: false,
                                                decoration: InputDecoration(
                                                  fillColor:
                                                      ColorValues.whiteColor,
                                                  filled: true,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          5.0, 10.0, 5.0, 10.0),
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedErrorBorder: controller
                                                          .isConcernInvalid
                                                          .value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide: BorderSide(
                                                              color: ColorValues
                                                                  .redColorDark),
                                                        )
                                                      : InputBorder.none,
                                                  errorBorder: controller
                                                          .isConcernInvalid
                                                          .value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide: BorderSide(
                                                              color: ColorValues
                                                                  .redColorDark),
                                                        )
                                                      : null,
                                                  errorText: controller
                                                          .isConcernInvalid
                                                          .value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 3) {
                                                    controller.isConcernInvalid
                                                        .value = false;
                                                  } else {
                                                    controller.isConcernInvalid
                                                        .value = true;
                                                  }
                                                },
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .deny(
                                                    RegExp('[\'^]'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10, left: 30),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: CustomRichText(
                                              title: 'Description: '),
                                        ),
                                        SizedBox(width: 40),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 227, 224, 224),
                                                  width: 1),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                          255, 236, 234, 234)
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            width: (MediaQuery.of(context)
                                                .size
                                                .width),
                                            // Remove width property here
                                            child: Obx(
                                              () => TextField(
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16.0,
                                                      height: 1.0,
                                                      color: Colors.black),
                                                ),
                                                controller: controller
                                                    .descriptionController,
                                                focusNode:
                                                    controller.descriptionFocus,
                                                scrollController: controller
                                                    .descriptionScroll,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                maxLines: 5,
                                                autofocus: false,
                                                decoration: InputDecoration(
                                                  fillColor:
                                                      ColorValues.whiteColor,
                                                  filled: true,
                                                  contentPadding:
                                                      Dimens.edgeInsets05_10,
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedErrorBorder: controller
                                                          .isDescriptionInvalid
                                                          .value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide: BorderSide(
                                                              color: ColorValues
                                                                  .redColorDark),
                                                        )
                                                      : InputBorder.none,
                                                  errorBorder: controller
                                                          .isDescriptionInvalid
                                                          .value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide: BorderSide(
                                                              color: ColorValues
                                                                  .redColorDark),
                                                        )
                                                      : null,
                                                  errorText: controller
                                                          .isConcernInvalid
                                                          .value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 3) {
                                                    controller
                                                        .isDescriptionInvalid
                                                        .value = false;
                                                  } else {
                                                    controller
                                                        .isDescriptionInvalid
                                                        .value = true;
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              Dimens.boxHeight15,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomElevatedButton(
                                    backgroundColor: ColorValues.appRedColor,
                                    text: 'Cancel',
                                    onPressed: () {
                                      // Handle cancel action
                                    },
                                  ),
                                  Dimens.boxWidth15,
                                  controller.grievanceId.value > 0
                                      ? CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appGreenColor,
                                          text: 'Update Grievance',
                                          onPressed:
                                              controller.updateGrievanceDetails,
                                        )
                                      : CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appGreenColor,
                                          text: 'Create Grievance',
                                          onPressed: controller.saveGrievance,
                                        ),
                                ],
                              ),
                              Dimens.boxHeight15,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
