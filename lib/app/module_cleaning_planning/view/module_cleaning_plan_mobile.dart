import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textFieldMobile.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/mc_set_equipment_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ModuleCleaningPlanMobile extends StatefulWidget {
  const ModuleCleaningPlanMobile({Key? key}) : super(key: key);

  @override
  _ModuleCleaningPlanMobileState createState() =>
      _ModuleCleaningPlanMobileState();
}

class _ModuleCleaningPlanMobileState extends State<ModuleCleaningPlanMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModuleCleaningPlanningController>(
      id: "module-cleaning-mobile",
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => SingleChildScrollView(
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
                          "Add MC Plan",
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
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: Get.height * .8,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRichTextMobile(
                              title: "Title: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.text,
                              textController: controller.mcTitelCtrlr,
                              errorText: controller.isTitleInvalid.value
                                  ? "Required field"
                                  : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isTitleInvalid.value = false;
                                } else {
                                  controller.isTitleInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Start Date: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.text,
                              textController: controller.startDateTc,
                              errorText: controller.isDateInvalid.value
                                  ? "Required field"
                                  : null,
                              onTap: () {
                                controller.pickDateTime(context);
                              },
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isDateInvalid.value = false;
                                } else {
                                  controller.isDateInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Frequency: ",
                            ),
                            Dimens.boxHeight2,
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Obx(
                                () => DropdownWebWidget(
                                  dropdownList: controller.frequencyList,
                                  isValueSelected:
                                      controller.isSelectedfrequency.value,
                                  selectedValue:
                                      controller.selectedfrequency.value,
                                  onValueChanged: controller.onValueChanged,
                                ),
                              ),
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Estimated Duration In Days: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textController: controller.durationInDayCtrlr,
                              errorText: controller.isDurationInvalid.value
                                  ? "Required field"
                                  : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isDurationInvalid.value = false;
                                } else {
                                  controller.isDurationInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Cleaning Type: ",
                            ),
                            Dimens.boxHeight2,
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Obx(
                                () => DropdownWebWidget(
                                  dropdownList: controller.cleaningType,
                                  isValueSelected:
                                      controller.isSelectedCleaningType.value,
                                  selectedValue:
                                      controller.selectedCleaningType.value,
                                  onValueChanged: controller.onValueChanged,
                                ),
                              ),
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Assigned To: ",
                            ),
                            Dimens.boxHeight2,
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Obx(
                                () => DropdownWebWidget(
                                  dropdownList: controller.assignedToList,
                                  isValueSelected:
                                      controller.isAssignedToSelected.value,
                                  selectedValue:
                                      controller.selectedAssignedTo.value,
                                  onValueChanged: controller.onValueChanged,
                                ),
                              ),
                            ),
                            Dimens.boxHeight20,
                            Center(
                              child: InkWell(
                                onTap: () {
                                  if (controller.id != 0) {
                                    var selectedEqp = [];
                                    controller
                                        .mcPlanDetailsModel.value?.schedules
                                        .forEach((schedule) {
                                      schedule.equipments?.forEach((element) {
                                        var ee = element;
                                        ee!.cleaningDay = schedule.cleaningDay;
                                        ;
                                        selectedEqp.add(element);
                                        print(element?.toJson());
                                      });
                                    });
                                    selectedEqp.forEach((element) {
                                      try {
                                        var selectedParentIndex = controller
                                            .equipmentList.value
                                            .indexWhere((eqp) =>
                                                eqp?.invId == element.parentId);
                                        print({
                                          "selectedParentIndex":
                                              selectedParentIndex
                                        });
                                        if (selectedParentIndex > -1) {
                                          var selectedChildIndex = controller
                                                  .equipmentList
                                                  .value[selectedParentIndex]
                                                  ?.smbs
                                                  .indexWhere((smb) =>
                                                      smb.smbId ==
                                                      element.id) ??
                                              -1;

                                          if (selectedChildIndex > -1) {
                                            var ss = controller
                                                .equipmentList
                                                .value[selectedParentIndex]
                                                ?.smbs[selectedChildIndex];
                                            ss?.selectedDay =
                                                "${element.cleaningDay}";
                                            controller
                                                    .equipmentList
                                                    .value[selectedParentIndex]
                                                    ?.smbs[selectedChildIndex] =
                                                ss!;
                                          }
                                          print({
                                            "selectedChildIndex":
                                                selectedChildIndex
                                          });
                                        }
                                      } catch (e) {
                                        print({"eadfds": e});
                                      }
                                    });
                                  }

                                  controller.isFormInvalid.value = false;
                                  // controller.checkForm();
                                  if (controller.isFormInvalid.value) {
                                    return;
                                  } else {
                                    controller.dayCount(
                                        dayCount: int.tryParse(
                                                '${controller.durationInDayCtrlr.text}') ??
                                            0);
                                    Get.dialog(MCSetEquipmentMobile(
                                      estimateDurationDays: int.tryParse(
                                          '${controller.durationInDayCtrlr.text}'),
                                    ));
                                  }
                                },
                                child: Container(
                                  height: 30,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: ColorValues.addNewColor,
                                    border: Border.all(
                                      color: ColorValues
                                          .lightGreyColorWithOpacity35,
                                      width: 1,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Set Equipments",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
