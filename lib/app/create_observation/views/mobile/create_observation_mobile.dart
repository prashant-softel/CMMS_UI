import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/create_observation/create_observation_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textFieldMobile.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateObservationMobile extends GetView<CreateObservationController> {
  CreateObservationMobile({super.key});
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Create Observation",
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
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRichTextMobile(
                        title: "Contractor Name: ",
                      ),
                      Dimens.boxHeight2,
                      CustomTextfieldMobile(
                        width: MediaQuery.of(context).size.width / 1.1,
                        keyboardType: TextInputType.number,
                        textController: controller.contractorNameCtrlr,
                        // errorController: controller.isContractorInvalid.value
                        //     ? "Required field"
                        //     : null,
                        onChanged: (value) {
                          if (value.trim().length > 0) {
                            controller.isContractorInvalid.value = false;
                          } else {
                            controller.isContractorInvalid.value = true;
                          }
                        },
                      ),
                      Dimens.boxHeight15,
                      CustomRichTextMobile(
                        title: "Risk Type: ",
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
                            onValueChanged: controller.onValueChanged,
                          ),
                        ),
                      ),
                      Dimens.boxHeight15,
                      CustomRichTextMobile(
                        title: "Corrective/Preventive Action: ",
                      ),
                      Dimens.boxHeight2,
                      CustomTextfieldMobile(
                        width: MediaQuery.of(context).size.width / 1.1,
                        keyboardType: TextInputType.number,
                        textController: controller.correctivePreventiveCtrlr,
                        // errorController: controller.isCorrectiveInvalid.value
                        //     ? "Required field"
                        //     : null,
                        onChanged: (value) {
                          if (value.trim().length > 0) {
                            controller.isCorrectiveInvalid.value = false;
                          } else {
                            controller.isCorrectiveInvalid.value = true;
                          }
                        },
                      ),
                      Dimens.boxHeight2,
                    ],
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
