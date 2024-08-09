import 'package:cmms/app/add_incident_report/add_incident_report_controller.dart';
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
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
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
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
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
                                Obx(() => Switch(
                                      activeColor: Colors.green,
                                      value: controller
                                          .esiApplicabilityValue.value,
                                      onChanged: (value) {
                                        controller.esiApplicabilityValue.value =
                                            value;
                                      },
                                    )),
                              ],
                            ),
                            Dimens.boxHeight2,
                            controller.esiApplicabilityValue == true
                                ? CustomTextfieldMobile(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    textController: controller
                                        .ESIApplicabilityRemarkTextCtrlr,
                                    errorText: controller
                                            .isESIApplicabilityInvalid.value
                                        ? "Required field"
                                        : null,
                                    onChanged: (value) {
                                      if (value.trim().length > 0) {
                                        controller.isESIApplicabilityInvalid
                                            .value = false;
                                      } else {
                                        controller.isESIApplicabilityInvalid
                                            .value = true;
                                      }
                                    },
                                  )
                                : Container(),
                            Dimens.boxHeight15,
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
