import 'package:cmms/app/add_incident_report/add_incident_report_controller.dart';
import 'package:cmms/app/add_incident_report/view/detailsOfInjuredPersonMobile.dart';
import 'package:cmms/app/add_incident_report/view/web/add_incident_report_content_web.dart';
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
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class IRMobile extends StatefulWidget {
  const IRMobile({Key? key}) : super(key: key);

  @override
  _IRMobileState createState() => _IRMobileState();
}

class _IRMobileState extends State<IRMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddIncidentReportController>(
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
                          "Add Incident Report",
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
                              textController: controller.titleTextCtrlr,
                              errorText: controller.isTitleTextInvalid.value
                                  ? "Required field"
                                  : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isTitleTextInvalid.value = false;
                                } else {
                                  controller.isTitleTextInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Incident Description: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              textController:
                                  controller.incidentreportDescriptionCtrlr,
                              errorText:
                                  controller.isIncidentDescriptionInvalid.value
                                      ? "Required field"
                                      : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isIncidentDescriptionInvalid
                                      .value = false;
                                } else {
                                  controller.isIncidentDescriptionInvalid
                                      .value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Type of Incident: ",
                            ),
                            Dimens.boxHeight2,
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Obx(
                                () => DropdownWebWidget(
                                  dropdownList: controller.incidentrisktypeList,
                                  isValueSelected:
                                      controller.isRiskTypeListSelected.value,
                                  selectedValue:
                                      controller.selectedRiskTypeList.value,
                                  onValueChanged:
                                      controller.onValuetypeincidentChanged,
                                ),
                              ),
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Incident date & Time: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.text,
                              textController: controller
                                  .startDateTimeCtrlr, // For Incident Date & Time
                              errorText: controller.isDateInvalid.value
                                  ? "Required field"
                                  : null,
                              onTap: () {
                                controller.pickDateTime(context, 'incident');
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
                              title: "Asset Restoration Action Taken By: ",
                            ),
                            Dimens.boxHeight2,
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Obx(
                                () => DropdownWebWidget(
                                  dropdownList: controller
                                      .assetRestorationActionTakenByList,
                                  isValueSelected: controller
                                      .isAssetRestorationActionTakenByListSelected
                                      .value,
                                  selectedValue: controller
                                      .selectedAssetRestorationActionTakenByList
                                      .value,
                                  onValueChanged: controller
                                      .onValueAssetRestorationActionTakenByChanged,
                                ),
                              ),
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Damaged Asset Cost Approx: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textController:
                                  controller.damagedAssetCostTextCtrlr,
                              errorText:
                                  controller.isDamagedAssetCostTextInvalid.value
                                      ? "Required field"
                                      : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isDamagedAssetCostTextInvalid
                                      .value = false;
                                } else {
                                  controller.isDamagedAssetCostTextInvalid
                                      .value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Gen Loss Due To Asset Damage: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textController:
                                  controller.genLossAssetDamageTextCtrlr,
                              errorText: controller
                                      .isGenLossAssetDamageTextInvalid.value
                                  ? "Required field"
                                  : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isGenLossAssetDamageTextInvalid
                                      .value = false;
                                } else {
                                  controller.isGenLossAssetDamageTextInvalid
                                      .value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Location: ",
                            ),
                            Dimens.boxHeight2,
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Obx(
                                () => DropdownWebWidget(
                                  dropdownList: controller.blockList,
                                  isValueSelected:
                                      controller.isBlockSelected.value,
                                  selectedValue: controller.selectedBlock.value,
                                  onValueChanged: controller.onValueChanged,
                                ),
                              ),
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Incident Severity: ",
                            ),
                            Dimens.boxHeight2,
                            Wrap(
                              children: [
                                buildRadioButton('Critical', Colors.red,
                                    Colors.white, context, controller),
                                buildRadioButton('High', Colors.orange,
                                    Colors.white, context, controller),
                                buildRadioButton('Medium', Colors.yellow,
                                    Colors.white, context, controller),
                                buildRadioButton('Low', Colors.green,
                                    Colors.white, context, controller),
                              ],
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Asset Restoration Date & Time: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.text,
                              textController:
                                  controller.actionTakenDateTimeCtrlr,
                              onTap: () {
                                controller.pickDateTime(context, 'restoration');
                              },
                            ),
                            Dimens.boxHeight15,
                            Row(
                              children: [
                                CustomRichTextMobile(
                                  includeAsterisk: false,
                                  title: "ESI Applicability Remark: ",
                                ),
                                Dimens.boxWidth2,
                                Obx(
                                  () => Switch(
                                    activeColor: Colors.green,
                                    value:
                                        controller.esiApplicabilityValue.value,
                                    onChanged: (value) {
                                      controller.esiApplicabilityValue.value =
                                          value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxHeight2,
                            controller.esiApplicabilityValue == true
                                ? CustomTextfieldMobile(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    textController: controller
                                        .ESIApplicabilityRemarkTextCtrlr,
                                  )
                                : Container(),
                            // Dimens.boxHeight2,

                            Row(
                              children: [
                                CustomRichTextMobile(
                                  includeAsterisk: false,
                                  title: "Legal Applicability Remark: ",
                                ),
                                Dimens.boxWidth2,
                                Obx(
                                  () => Switch(
                                    activeColor: Colors.green,
                                    value: controller
                                        .legalApplicabilityValue.value,
                                    onChanged: (value) {
                                      controller.legalApplicabilityValue.value =
                                          value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxHeight2,
                            controller.legalApplicabilityValue == true
                                ? CustomTextfieldMobile(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    textController: controller
                                        .legalApplicabilityRemarkTextCtrlr,
                                  )
                                : Container(),
                            Dimens.boxHeight2,
                            Row(
                              children: [
                                CustomRichTextMobile(
                                  includeAsterisk: false,
                                  title: "Insurance Applicable: ",
                                ),
                                Dimens.boxWidth2,
                                Obx(
                                  () => Switch(
                                    activeColor: Colors.green,
                                    value: controller
                                        .insuranceApplicableValue.value,
                                    onChanged: (value) {
                                      controller.insuranceApplicableValue
                                          .value = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxHeight2,
                            controller.insuranceApplicableValue == true
                                ? CustomTextfieldMobile(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    textController:
                                        controller.insuranceAvailableTextCtrlr,
                                  )
                                : Container(),
                            Dimens.boxHeight2,
                            DetailsOfInjuredPersonMobile(),
                            Dimens.boxHeight15,

                            Text(
                              "Investigation",
                              style: Styles.blue700,
                            ),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "What task or type of job was being performed",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 1),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "Was the person involved in these activities trained and if so, when?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 2),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "Was the person authorized/licensed to carry out that type of work / use machinery?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 3),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "What instructions had been given? By Whom?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 4),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "What safety equipment and /protection was used/ available?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 5),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "Were correct safe procedures being observed?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 6),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "What unsafe condition contributed to the incident?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 7),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "Did unsafe act/s cause the incident? If yes. Mention the same?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 8),
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

Widget buildRadioButton(String severity, Color color, Color textColor,
    BuildContext context, AddIncidentReportController controller) {
  return Obx(() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width / 2.5,
      child: Row(
        children: [
          Radio<String>(
            value: severity,
            groupValue: controller.selectedSeverity.value,
            onChanged: (value) {
              controller.setSelectedSeverity(value!);
              print('Incident Severity: ${controller.selectedSeverity.value}');
            },
            activeColor: color,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                severity,
                style: TextStyle(color: textColor, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  });
}

investigationTextfields(BuildContext context,
    AddIncidentReportController controller, int position) {
  return CustomTextfieldMobile(
    width: MediaQuery.of(context).size.width / 1.1,
    textController: position == 1
        ? controller.typeOfJbTextCtrlr
        : position == 2
            ? controller.personInvolvedTextCtrlr
            : position == 3
                ? controller.personAuthorizedInvolvedTextCtrlr
                : position == 4
                    ? controller.instructionsTextCtrlr
                    : position == 5
                        ? controller.SafetyEquipmetsTextCtrlr
                        : position == 6
                            ? controller.correctSafeTextCtrlr
                            : position == 7
                                ? controller.unsafeConditionsTextCtrlr
                                : position == 8
                                    ? controller.unsafeActCauseTextCtrlr
                                    : null,
    focusNode: position == 1
        ? controller.typeOfJbFocusNode
        : position == 2
            ? controller.personInvolvedFocusNode
            : position == 3
                ? controller.personAuthorizedInvolvedFocusNode
                : position == 4
                    ? controller.instructionsFocusNode
                    : position == 5
                        ? controller.safetyEquipmentsFocusNode
                        : position == 6
                            ? controller.correctSafeFocusNode
                            : position == 7
                                ? controller.unsafeConditionsFocusNode
                                : position == 8
                                    ? controller.unsafeActCauseFocusNode
                                    : null,
    scroll: position == 1
        ? controller.typeOfJbScrollController
        : position == 2
            ? controller.personInvolvedScrollController
            : position == 3
                ? controller.personAuthorizedInvolvedScrollController
                : position == 4
                    ? controller.instructionsScrollController
                    : position == 5
                        ? controller.safetyEquipmentsScrollController
                        : position == 6
                            ? controller.correctSafeScrollController
                            : position == 7
                                ? controller.unsafeConditionsScrollController
                                : position == 8
                                    ? controller.unsafeActCauseScrollController
                                    : null,
  );
}
