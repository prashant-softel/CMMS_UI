import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../job_list/job_list_controller.dart';
import '../../theme/colors_value.dart';
import '../../theme/dimens.dart';
import '../../theme/styles.dart';
import '../add_job_controller.dart';
import 'widgets/dropdown.dart';

class AddJobScreen extends GetView<AddJobController> {
  AddJobScreen({Key? key}) : super(key: key);

  ///
  final JobListController jobListController = Get.find();

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
                    child: DropdownWidget(
                      dropdownList: controller.facilityList,
                      isValueSelected: controller.isFacilitySelected.value,
                      selectedValue: controller.selectedFacility.value,
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
                            DropdownWidget(
                              dropdownList: controller.blockList,
                              isValueSelected: controller.isBlockSelected.value,
                              selectedValue: controller.selectedBlock.value,
                            ),
                            Dimens.boxHeight20,

                            ///MULTISELECT CONTROL Equipment Categories
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
                              child: MultiSelectDialogField(
                                decoration: BoxDecoration(border: Border()),
                                buttonIcon: Icon(Icons.arrow_drop_down),
                                items: controller.equipmentCategoryList.value
                                    .map(
                                      (e) => MultiSelectItem<
                                              InventoryCategoryModel?>(
                                          e, e?.name ?? ''),
                                    )
                                    .toList(),
                                onConfirm: (selectedOptionsList) => {
                                  controller.equipmentCategoriesSelected(
                                      selectedOptionsList)
                                },
                                chipDisplay: MultiSelectChipDisplay(),
                              ),
                            ),
                            Dimens.boxHeight20,

                            /// WORK AREA (= EQUIPMENTS) DropDown
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Work Area / Equipments: ',
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
                              child: MultiSelectDialogField(
                                decoration: BoxDecoration(border: Border()),
                                buttonIcon: Icon(Icons.arrow_drop_down),
                                items: controller.workAreaList.value
                                    .map((e) =>
                                        MultiSelectItem(e, e?.name ?? ''))
                                    .toList(),
                                onConfirm: (selectedOptionsList) => {
                                  controller
                                      .workAreasSelected(selectedOptionsList)
                                },
                                chipDisplay: MultiSelectChipDisplay(),
                              ),
                            ),
                            Dimens.boxHeight20,

                            /// WORK TYPE  DropDown
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
                            DropdownWidget(
                              dropdownList: controller.equipmentList,
                              isValueSelected:
                                  controller.isEquipmentSelected.value,
                              selectedValue: controller.selectedEquipment.value,
                            ),
                            Dimens.boxHeight20,

                            /// TOOLS REQUIRED DropDown
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Tools Required To Work Type: ',
                                  style: Styles.blackBold16,
                                  children: [],
                                ),
                              ),
                            ),
                            Dimens.boxHeight5,
                            DropdownWidget(
                              dropdownList:
                                  controller.toolsRequiredToWorkTypeList,
                              isValueSelected: controller
                                  .isToolRequiredToWorkTypeSelected.value,
                              selectedValue: controller
                                  .selectedToolRequiredToWorkType.value,
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
                            DropdownWidget(
                              dropdownList: controller.assignedToList,
                              isValueSelected:
                                  controller.isAssignedToSelected.value,
                              selectedValue:
                                  controller.selectedAssignedTo.value,
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
                                controller: controller.jobTitleCtrlr,
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
                                controller: controller.jobDescriptionCtrlr,
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
