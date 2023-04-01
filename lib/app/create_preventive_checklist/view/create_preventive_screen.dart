import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textField.dart';
import '../../widgets/dropdown.dart';
import '../create_preventive_checklist_controller.dart';

class CreatePriventiveListScreen
    extends GetView<PreventiveCheckListController> {
  CreatePriventiveListScreen({Key? key}) : super(key: key);
  final PreventiveCheckListController controller = Get.find();

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create CheckList Number'),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Container(
                  margin: EdgeInsets.all(10),
                  child: DropdownWidget(
                    controller: controller,
                    dropdownList: controller.facilityList,
                    isValueSelected: controller.isFacilitySelected.value,
                    selectedValue: controller.selectedFacility.value,
                    onValueChanged: controller.onValueChanged,
                  ),
                ),
              ),
              // if (Responsive.isMobile(context))
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                    color: ColorValues.appLightGreyColor,
                    elevation: 20,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding: Dimens.edgeInsets10,
                        child: Obx(
                          () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomRichText(title: 'CheckList Number: '),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
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
                                          color: ColorValues.whiteColor,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ],
                                      color: ColorValues.whiteColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: LoginCustomTextfield(
                                      textController:
                                          controller.checklistNumberCtrlr,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomRichText(title: 'Equipment Category: '),
                                SizedBox(
                                  height: 5,
                                ),
                                DropdownWidget(
                                  controller: controller,
                                  dropdownList:
                                      controller.equipmentCategoryList,
                                  isValueSelected:
                                      controller.isSelectedequipment.value,
                                  selectedValue:
                                      controller.selectedequipment.value,
                                  onValueChanged: controller.onValueChanged,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomRichText(title: 'Frequency: '),
                                SizedBox(
                                  height: 5,
                                ),
                                DropdownWidget(
                                  controller: controller,
                                  dropdownList: controller.frequencyList,
                                  isValueSelected:
                                      controller.isSelectedfrequency.value,
                                  selectedValue:
                                      controller.selectedfrequency.value,
                                  onValueChanged: controller.onValueChanged,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Manpower: ",
                                  style: Styles.blackBold16,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
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
                                          color: ColorValues.whiteColor,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ],
                                      color: ColorValues.whiteColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: LoginCustomTextfield(
                                      textController: controller.manpowerCtrlr,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Duration(in Min.): ",
                                  style: Styles.blackBold16,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
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
                                          color: ColorValues.whiteColor,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ],
                                      color: ColorValues.whiteColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: LoginCustomTextfield(
                                      textController: controller.durationCtrlr,
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Container(
                                      height: 45,
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appDarkBlueColor,
                                        text: "Submit",
                                        onPressed: () {
                                          controller
                                              .createChecklistNumber()
                                              .then((value) {
                                            if (value == true)
                                              controller.isSuccessDialog();
                                          });
                                        },
                                      )),
                                ),
                              ]),
                        )
                        //
                        )
                    //
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
