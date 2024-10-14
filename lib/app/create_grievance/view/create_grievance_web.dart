import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_grievance/create_grievance_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
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
    final Map<String, dynamic>? args = Get.arguments;  // Get the passed arguments
    bool isActionTaken = args?['actionTaken'] ?? false;
    bool isEdit = args?['isEdit'] ?? false;
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
                  Text(isActionTaken ? " / ACTION TAKEN " : isEdit ? " / UPDATE GRIEVANCE " :" / CREATE GRIEVANCE ", style: Styles.greyLight14),
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
                                  isActionTaken ? " Action Taken" : "Create Grievance" ,
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
                                    () => Container(
                                      padding: isActionTaken ? EdgeInsets.symmetric(vertical: 8.0) : null, 
                                      decoration: BoxDecoration(
                                        color:  Colors.grey[300] , // Change fill color
                                        borderRadius: BorderRadius.circular(10.0),
                                        border: Border.all(color: Colors.transparent), // Border color
                                      ),
                                      child: AbsorbPointer(
                                        absorbing: isActionTaken, // Prevent interaction if action is taken
                                        child: DropdownWebWidget(
                                          dropdownList: controller.grievanceType,
                                          isValueSelected: controller.isGrievanceTypeSelected.value,
                                          selectedValue: controller.selectedGrievanceType.value,
                                          onValueChanged: controller.onValueChanged, // Keep this method, but it will be disabled if absorbed
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ],
                              ),

                              // Dropdown Button

                              Dimens.boxHeight15,
                              Column(
                                children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 53),
                                          child: CustomRichText(
                                              title: 'Concern: '),
                                        ),
                                        SizedBox(width: 60),
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
                                              textStyle: TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
                                            ),
                                            controller: controller.concernController,
                                            focusNode: controller.concernFocus,
                                            scrollController: controller.concernScroll,
                                            keyboardType: TextInputType.multiline,
                                            readOnly: isActionTaken,
                                            maxLines: 5,
                                            autofocus: false,
                                            decoration: InputDecoration(
                                              fillColor: isActionTaken ? Colors.grey[300] : ColorValues.whiteColor,
                                              filled: true,
                                              contentPadding: Dimens.edgeInsets05_10,
                                              border: InputBorder.none,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                borderSide: BorderSide(color: Colors.transparent),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                borderSide: BorderSide(color: Colors.transparent),
                                              ),
                                              errorText: controller.isConcernInvalid.value ? "Required field" : null,
                                            ),
                                          ),
                                        ),

                                          ),
                                        ),
                                      ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, right: 10, left: 30),
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
                                              textStyle: TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
                                            ),
                                            controller: controller.descriptionController,
                                            focusNode: controller.descriptionFocus,
                                            scrollController: controller.descriptionScroll,
                                            keyboardType: TextInputType.multiline,
                                            readOnly: isActionTaken,
                                            maxLines: 5,
                                            autofocus: false,
                                            decoration: InputDecoration(
                                              fillColor: isActionTaken ? Colors.grey[300] : ColorValues.whiteColor,
                                              filled: true,
                                              contentPadding: Dimens.edgeInsets05_10,
                                              border: InputBorder.none,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                borderSide: BorderSide(color: Colors.transparent),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                borderSide: BorderSide(color: Colors.transparent),
                                              ),
                                              errorText: controller.isDescriptionInvalid.value ? "Required field" : null,
                                            ),
                                          ),
                                        ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Dimens.boxHeight15,
                                  if (isActionTaken)
                            Padding(
                              padding: const EdgeInsets.only(left: 51.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Resolution Type:',
                                    style: Styles.blackBold14,
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(width: 20),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 5,
                                    child: Obx(
                                      () => 
                                        DropdownWebWidget(
                                        dropdownList: 
                                        controller.resolutionType,
                                        isValueSelected: controller
                                            .isResolutionTypeSelected.value,
                                        selectedValue: controller
                                            .selectedResolutionType.value,
                                        onValueChanged:
                                            controller.onValueChanged,// Update with resolution change method
       
                                          ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
    
 
          
                      
                                   if (isActionTaken)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, right: 10, left: 30),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: CustomRichText(
                                              title: 'Action Taken: '),
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
                                              textStyle: TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
                                            ),
                                            controller: controller.actionTakenController,
                                            focusNode: controller.actionTakenFocus,
                                            scrollController: controller.actionTakenScroll,
                                            keyboardType: TextInputType.multiline,
                                            maxLines: 5,
                                            autofocus: false,
                                            decoration: InputDecoration(
                                              fillColor: ColorValues.whiteColor,
                                              filled: true,
                                              contentPadding: Dimens.edgeInsets05_10,
                                              border: InputBorder.none,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                borderSide: BorderSide(color: Colors.transparent),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                borderSide: BorderSide(color: Colors.transparent),
                                              ),
                                              errorText: controller.isActionTakenInvalid.value ? "Required field" : null,
                                            ),
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

                                 controller.grievanceId.value > 0 && isActionTaken
                        ? CustomElevatedButton(
                            backgroundColor: ColorValues.blueColor, // Red for close action
                            text: 'Close Grievance',
                            onPressed: controller.closeGrievanceDetails, // Method to close grievance
                          )
                        : controller.grievanceId.value > 0 && isActionTaken == false// Check if there is an existing grievance
                            ? CustomElevatedButton(
                                backgroundColor: ColorValues.appGreenColor,
                                text: 'Update Grievance',
                                onPressed: controller.updateGrievanceDetails, // Method to update grievance
                              )
                            : CustomElevatedButton(
                                backgroundColor: ColorValues.appGreenColor,
                                text: 'Create Grievance',
                                onPressed: controller.saveGrievance, // Method to save new grievance
                              )
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
