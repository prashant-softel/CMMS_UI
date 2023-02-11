import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../job_list/job_list_controller.dart';
import '../../theme/colors_value.dart';
import '../../theme/dimens.dart';
import '../../theme/styles.dart';
import '../add_job_controller.dart';

class AddJobScreen extends GetView<AddJobController> {
  AddJobScreen({Key? key}) : super(key: key);

  ///
  final JobListController jobController = Get.find();

  ///
  @override
  Widget build(BuildContext context) {
    ///
    final ButtonStyle saveButtonStyle = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: Dimens.fourteen),
      backgroundColor: ColorsValue.navyBlueColor,
    );

    ///
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Job'),
        centerTitle: true,
      ),
      body:
          //
          Obx(
        () => //
            Container(
          margin: Dimens.edgeInsets10_0_10_0,
          child: Column(children: [
            ///
            /// SELECT PLANT DropDown
            Row(
                //
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Plant:',
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: Dimens.edgeInsets05_0_5_0,
                      padding: Dimens.edgeInsets10_0_10_0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: ColorsValue.whiteColor,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          dropdownColor: ColorsValue.whiteColor,
                          isExpanded: true,
                          value: jobController.selectedFacility.value,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 50,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? selectedValue) {
                            jobController.isFacilitySelected.value = true;
                            jobController.selectedFacility.value =
                                selectedValue ?? '';
                          },
                          items: jobController.facilityList
                              .map<DropdownMenuItem<String>>((block) {
                            return DropdownMenuItem<String>(
                              value: block?.name ?? '',
                              child: Text(block?.name ?? ''),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ]),
            Dimens.boxHeight20,

            /// CARD
            Container(
              child: Expanded(
                child: Card(
                  color: Colors.lightBlue.shade50,
                  elevation: 20,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: Dimens.edgeInsets10,
                    child:
                        //
                        SingleChildScrollView(
                      child: Column(
                          ////
                          children: [
                            ///
                            /// SELECT BLOCK DropDown
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Select Block: ',
                                    style: Styles.blackBold16,
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: ColorsValue.orangeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Dimens.boxHeight5,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: ColorsValue.whiteColor,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: ColorsValue.whiteColor,
                                  isExpanded: true,
                                  value: controller.selectedBlock.value,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 50,
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? selectedValue) {
                                    controller.isBlockSelected.value = true;
                                    controller.selectedBlock.value =
                                        selectedValue ?? '';
                                  },
                                  items: controller.blockList
                                      .map<DropdownMenuItem<String>>((block) {
                                    return DropdownMenuItem<String>(
                                      value: block?.name ?? '',
                                      child: Text(block?.name ?? ''),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Dimens.boxHeight20,

                            /// EQUIPMENT CATEGORIES DropDown
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Equipment Categories: ',
                                    style: Styles.blackBold16,
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: ColorsValue.orangeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Dimens.boxHeight5,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: ColorsValue.whiteColor,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                color: ColorsValue.whiteColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: ColorsValue.whiteColor,
                                  isExpanded: true,
                                  value: controller
                                      .selectedEquipmentCategory.value,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 50,
                                  style: const TextStyle(
                                    color: ColorsValue.blackColor,
                                  ),
                                  onChanged: (String? selectedValue) {
                                    controller.isEquipmentCategorySelected
                                        .value = true;
                                    controller.selectedEquipmentCategory.value =
                                        selectedValue ?? '';
                                  },
                                  items: controller.equipmentCategoryList
                                      .map<DropdownMenuItem<String>>(
                                          (equipmentCategory) {
                                    return DropdownMenuItem<String>(
                                      value: equipmentCategory?.name ?? '',
                                      child:
                                          Text(equipmentCategory?.name ?? ''),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Dimens.boxHeight20,

                            /// WORK AREA DropDown
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Work Area: ',
                                    style: Styles.blackBold16,
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: ColorsValue.orangeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Dimens.boxHeight5,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: ColorsValue.whiteColor,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                                color: ColorsValue.whiteColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: ColorsValue.whiteColor,
                                  isExpanded: true,
                                  value: controller.selectedWorkArea.value,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 50,
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? selectedValue) {
                                    controller.isWorkAreaSelected.value = true;
                                    controller.selectedWorkArea.value =
                                        selectedValue ?? '';
                                  },
                                  items: controller.workAreaList
                                      .map<DropdownMenuItem<String>>(
                                          (workArea) {
                                    return DropdownMenuItem<String>(
                                      value: workArea?.name ?? '',
                                      child: Text(workArea?.name ?? ''),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Dimens.boxHeight20,

                            /// STATUS
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Status: ',
                                    style: Styles.blackBold16,
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: ColorsValue.orangeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Dimens.boxHeight5,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: ColorsValue.whiteColor,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                                color: ColorsValue.greyLightColour,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                enabled: false,
                                autofocus: false,
                                decoration: InputDecoration(
                                  fillColor: ColorsValue.greyLightColour,
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            Dimens.boxHeight20,

                            /// WORK TYPE DropDown
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Work Type: ',
                                    style: Styles.blackBold16,
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: ColorsValue.orangeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Dimens.boxHeight5,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: ColorsValue.whiteColor,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                color: ColorsValue.whiteColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: ColorsValue.whiteColor,
                                  isExpanded: true,
                                  value: controller.selectedEquipment.value,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 50,
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? selectedValue) {
                                    controller.isEquipmentSelected.value = true;
                                    controller.selectedEquipment.value =
                                        selectedValue ?? '';
                                  },
                                  items: controller.equipmentList
                                      .map<DropdownMenuItem<String>>(
                                          (equipment) {
                                    return DropdownMenuItem<String>(
                                      value: equipment?.name ?? '',
                                      child: Text(equipment?.name ?? ''),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Dimens.boxHeight20,

                            /// TOOLS REQUIRED DropDown
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Tools Required To Work Type: ',
                                    style: Styles.blackBold16,
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: ColorsValue.orangeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Dimens.boxHeight5,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: ColorsValue.whiteColor,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                color: ColorsValue.whiteColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: ColorsValue.whiteColor,
                                  isExpanded: true,
                                  value: controller.selectedEquipment.value,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 50,
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? selectedValue) {
                                    controller.isEquipmentSelected.value = true;
                                    controller.selectedEquipment.value =
                                        selectedValue ?? '';
                                  },
                                  items: controller.equipmentList
                                      .map<DropdownMenuItem<String>>(
                                          (equipment) {
                                    return DropdownMenuItem<String>(
                                      value: equipment?.name ?? '',
                                      child: Text(equipment?.name ?? ''),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Dimens.boxHeight20,

                            /// ASSIGNED TO DropDown
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Assigned To: ',
                                    style: Styles.blackBold16,
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: ColorsValue.orangeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Dimens.boxHeight5,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: ColorsValue.whiteColor,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                color: ColorsValue.whiteColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: ColorsValue.whiteColor,
                                  isExpanded: true,
                                  value: controller.selectedEquipment.value,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 50,
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? selectedValue) {
                                    controller.isEquipmentSelected.value = true;
                                    controller.selectedEquipment.value =
                                        selectedValue ?? '';
                                  },
                                  items: controller.equipmentList
                                      .map<DropdownMenuItem<String>>(
                                          (equipment) {
                                    return DropdownMenuItem<String>(
                                      value: equipment?.name ?? '',
                                      child: Text(equipment?.name ?? ''),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Dimens.boxHeight20,

                            /// JOB TITLE
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Job Title: ',
                                    style: Styles.blackBold16,
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: ColorsValue.orangeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Dimens.boxHeight5,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: ColorsValue.whiteColor,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                                color: ColorsValue.whiteColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  fillColor: ColorsValue.whiteColor,
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            Dimens.boxHeight20,

                            /// JOB DESCRIPTION
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Job Description: ',
                                    style: Styles.blackBold16,
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: ColorsValue.orangeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Dimens.boxHeight5,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: ColorsValue.whiteColor,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                color: ColorsValue.whiteColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                autofocus: false,
                                decoration: InputDecoration(
                                  fillColor: ColorsValue.whiteColor,
                                  filled: true,
                                  contentPadding: Dimens.edgeInsets05_10,
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            Dimens.boxHeight10,

                            /// SAVE BUTTON
                            ElevatedButton(
                              style: saveButtonStyle,
                              onPressed: () => controller.saveJob(),
                              child: const Text('Save'),
                            ),

                            ///
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );

    ///build ends
  }

  /// class ends
}
