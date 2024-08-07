import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_mobile.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/permit_cancel_request_dialog.dart';
import 'package:cmms/app/widgets/view_jsa_dialog.dart';
import 'package:cmms/app/widgets/view_sop_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NewPermitMobile extends GetView<NewPermitController> {
  NewPermitMobile({super.key});
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());
  @override
  Widget build(BuildContext context) {
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
                      "Request a Permit to Work",
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRichTextMobile(
                          title: "Block / Plot: ",
                        ),
                        Dimens.boxHeight2,
                        IgnorePointer(
                          ignoring:
                              controller.jobModel?.id != null ? true : false,
                          child: SizedBox(
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
                        ),
                        Dimens.boxHeight15,
                        CustomRichTextMobile(
                          title: "Type of Permit: ",
                        ),
                        Dimens.boxHeight2,
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Obx(
                            () => DropdownWebWidget(
                              dropdownList: controller.typePermitList,
                              isValueSelected:
                                  controller.isTypePermitSelected.value,
                              selectedValue:
                                  controller.selectedTypePermit.value,
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ),
                        Dimens.boxHeight15,
                        CustomRichTextMobile(
                          title: "Equipment Categories: ",
                        ),
                        Dimens.boxHeight2,
                        IgnorePointer(
                          ignoring: controller.pmtaskViewModel?.id != null ||
                                  controller.jobModel?.id != null
                              ? true
                              : false,
                          child: Obx(
                            () => SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: CustomMultiSelectDialogField(
                                title: 'Please Select',
                                buttonText: 'Equipment Category',
                                initialValue: (controller
                                        .selectedEquipmentCategoryIdList
                                        .isNotEmpty)
                                    ? controller.selectedEquipmentCategoryIdList
                                    : [],
                                items: controller.equipmentCategoryList
                                    .map(
                                      (equipmentCategory) => MultiSelectItem(
                                        equipmentCategory?.id,
                                        equipmentCategory?.name ?? '',
                                      ),
                                    )
                                    .toList(),
                                onConfirm: (selectedOptionsList) => {
                                  controller.equipmentCategoriesSelected(
                                      selectedOptionsList),
                                  print(
                                      'Equipment list55 ${controller.selectedEquipmentCategoryIdList}')
                                },
                              ),
                            ),
                          ),
                        ),
                        Dimens.boxHeight15,
                        CustomRichTextMobile(title: 'Start Date: '),
                        Dimens.boxHeight2,
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: _buildStartDateField_mobile(context, 0),
                        ),
                        Dimens.boxHeight15,
                        IgnorePointer(
                          ignoring: true,
                          child: CustomRichTextMobile(
                            title: 'Expiry Date: ',
                          ),
                        ),
                        Dimens.boxHeight2,
                        IgnorePointer(
                            ignoring: true,
                            child: _buildStartDateField_mobile(context, 1)),
                        Dimens.boxHeight15,
                        _buildPermitDescriptionField_mobile(context),
                        Obx(
                          () => Row(
                            children: [
                              CustomRichTextMobile(
                                  title: 'Electrical Isolation Required '),
                              Switch(
                                value: controller.isToggleOn.value,
                                onChanged: (value) {
                                  controller.toggle();
                                },
                                activeColor: Colors.white,
                                activeTrackColor: Colors.green,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.red,
                              ),
                            ],
                          ),
                        ),
                        Dimens.boxHeight2,
                        Obx(
                          () => controller.isToggleOn == true
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomRichTextMobile(
                                        title: 'Equipment Isolation '),
                                    Dimens.boxHeight2,
                                    SizedBox(
                                      child: CustomMultiSelectDialogField(
                                        buttonText:
                                            'Select Equipment Isolation',
                                        title: 'Equipment Isolation',
                                        initialValue: (controller
                                                .selectedEquipmentIsolationIdList
                                                .isNotEmpty)
                                            ? controller
                                                .selectedEquipmentIsolationIdList
                                            : [],
                                        items: controller.equipmentIsolationList
                                            .map(
                                              (equipmentIsolation) =>
                                                  MultiSelectItem(
                                                equipmentIsolation?.id,
                                                equipmentIsolation?.name ?? '',
                                              ),
                                            )
                                            .toList(),
                                        onConfirm: (selectedOptionsList) => {
                                          controller.equipmentIsolationSelected(
                                              selectedOptionsList),
                                          print(
                                              'Equipment Isolation list5: ${controller.equipmentIsolationList}')
                                        },
                                      ),
                                    ),
                                    Dimens.boxHeight15
                                  ],
                                )
                              : Dimens.box0,
                        ),
                        Obx(
                          () => controller.isToggleOn == true
                              ? Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomRichTextMobile(
                                        title: "Select Loto Equipment List".tr,
                                      ),
                                      Dimens.boxHeight10,
                                      CustomMultiSelectDialogField(
                                        buttonText: 'Select Equipment Name',
                                        title: 'Equipment Name',
                                        initialValue: (controller
                                                .selectedEquipmentNameList
                                                .isNotEmpty)
                                            ? controller
                                                .selectedEquipmentNameIdList
                                                .value
                                            : [],
                                        items: controller.equipmentNameList
                                            .map(
                                              (equipmentName) =>
                                                  MultiSelectItem(
                                                equipmentName?.id,
                                                equipmentName?.name ?? '',
                                              ),
                                            )
                                            .toList(),
                                        onConfirm: (selectedOptionsList) => {
                                          controller.equipmentNameSelected(
                                              selectedOptionsList),
                                          print(
                                              'Equipment Name list25: ${controller.selectedEquipmentNameIdList}')
                                        },
                                      ),
                                      // Dimens.boxHeight10,
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: SizedBox(
                                          width: Get.width,
                                          child: Container(
                                            constraints:
                                                BoxConstraints(minHeight: 150),
                                            height: ((controller
                                                    .filteredEquipmentNameList
                                                    .length) *
                                                60),
                                            // 90,
                                            child: DataTable2(
                                              columns: [
                                                DataColumn2(
                                                    fixedWidth: 160,
                                                    label: Text(
                                                        "Loto Applied On")),
                                                DataColumn2(
                                                    fixedWidth: 100,
                                                    label:
                                                        Text("Serial Number")),
                                                DataColumn2(
                                                    fixedWidth: 100,
                                                    label: Text("Action")),
                                              ],
                                              rows: List<DataRow>.generate(
                                                controller
                                                    .filteredEquipmentNameList
                                                    .length,
                                                (index) {
                                                  var inventoryEquipmentName =
                                                      controller
                                                              .filteredEquipmentNameList[
                                                          index];
                                                  controller.id.value =
                                                      inventoryEquipmentName
                                                              ?.id ??
                                                          0;
                                                  print(
                                                      'Equipment Isss5:${controller.id.value}');
                                                  return DataRow(
                                                    cells: [
                                                      DataCell(
                                                        Text(
                                                            '${inventoryEquipmentName?.name ?? ''}'),
                                                      ),
                                                      DataCell(
                                                        Text(
                                                            '${inventoryEquipmentName?.serialNumber ?? ''}'),
                                                      ),
                                                      DataCell(
                                                        Wrap(
                                                          children: [
                                                            TableActionButton(
                                                              color: Colors.red,
                                                              icon: Icons
                                                                  .delete_outline,
                                                              message: 'Remove',
                                                              onPress: () {
                                                                controller
                                                                    .removeItem(
                                                                        index);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Dimens.box0,
                        ),
                        controller.safetyMeasureList.length > 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomRichTextMobile(
                                      title: "Permit Type Checklist"),
                                  Dimens.boxHeight2,
                                  GetBuilder<NewPermitController>(
                                    init: controller,
                                    builder: (ctrl) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children:
                                            controller.safetyMeasureList.map(
                                          (element) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      checkBoxMethod(
                                                        element.isChecked ??
                                                            false,
                                                        (value) {
                                                          element.isChecked =
                                                              value ?? false;

                                                          controller.update();
                                                        },
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "${element.name}",
                                                          maxLines: 5,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ).toList(),
                                      );
                                    },
                                  ),
                                  Dimens.boxHeight15,
                                ],
                              )
                            : Dimens.box0,
                        CustomRichTextMobile(title: "Job Type: "),
                        Dimens.boxHeight2,
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Obx(
                            () => DropdownWebWidget(
                              dropdownList: controller.jobTypeList,
                              isValueSelected:
                                  controller.isJobTypeListSelected.value,
                              selectedValue: controller.selectedJobType.value,
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ),
                        Dimens.boxHeight15,
                        CustomRichTextMobile(title: "SOP: "),
                        Dimens.boxHeight2,
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Obx(
                            () => DropdownWebWidget(
                              dropdownList: controller.sopPermitList,
                              isValueSelected:
                                  controller.isSopPermitListSelected.value,
                              selectedValue: controller.selectedSopPermit.value,
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ),
                        Dimens.boxHeight15,
                        Row(
                          children: [
                            Spacer(),
                            CustomElevatedButton(
                              backgroundColor: ColorValues.navyBlueColor,
                              text: "Create JSA",
                              onPressed: () {
                                Get.dialog<void>(ViewJSADialog());
                              },
                            ),
                            Spacer(),
                            CustomElevatedButton(
                              backgroundColor: ColorValues.navyBlueColor,
                              text: "View SOP",
                              onPressed: () {
                                Get.dialog<void>(ViewSOPDialog());
                              },
                            ),
                            Spacer(),
                          ],
                        ),
                        Dimens.boxHeight15,
                        FileUploadWidgetWithDropzone(),
                        Dimens.boxHeight15,
                        FileUploadDetailsWidgetMobile(),
                        Dimens.boxHeight15,
                        controller.permitId.value > 0 &&
                                controller.newPermitDetailsModel.value!
                                        .file_list!.length >
                                    0
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: DataTable2(
                                      border: TableBorder.all(
                                        color:
                                            Color.fromARGB(255, 206, 229, 234),
                                      ),
                                      dataRowHeight: 40,
                                      columns: [
                                        DataColumn2(
                                          fixedWidth: Get.width * .6,
                                          label: Text(
                                            "File Description",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          fixedWidth: Get.width * .2,
                                          label: Text(
                                            "Action",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                      rows: List<DataRow>.generate(
                                        controller.file_list?.length ?? 0,
                                        (index) => DataRow(
                                          cells: [
                                            DataCell(
                                              Text(
                                                controller.file_list![index]
                                                        ?.description
                                                        .toString() ??
                                                    '',
                                              ),
                                            ),
                                            DataCell(
                                              Wrap(
                                                children: [
                                                  TableActionButton(
                                                    color: ColorValues
                                                        .appDarkBlueColor,
                                                    icon: Icons.visibility,
                                                    message: 'view',
                                                    onPress: () async {
                                                      // String baseUrl =
                                                      //     "http://65.0.20.19/CMMS_API/";
                                                      String baseUrl =
                                                          'http://172.20.43.9:83/';
                                                      String fileName =
                                                          controller
                                                                  .file_list![
                                                                      index]
                                                                  ?.fileName ??
                                                              "";
                                                      String fullUrl =
                                                          baseUrl + fileName;
                                                      if (await canLaunch(
                                                          fullUrl)) {
                                                        await launch(fullUrl);
                                                      } else {
                                                        throw 'Could not launch $fullUrl';
                                                      }
                                                      // String baseUrl = 'http://172.20.43.9:83/';
                                                    },
                                                  ),
                                                  controller.newPermitDetailsModel
                                                              .value!.ptwStatus ==
                                                          125
                                                      ? Dimens.box0
                                                      : TableActionButton(
                                                          color: ColorValues
                                                              .deleteColor,
                                                          icon: Icons
                                                              .delete_outline_outlined,
                                                          message: 'remove',
                                                          onPress: () {
                                                            controller.removeImage(
                                                                controller
                                                                    .file_list![
                                                                        index]
                                                                    ?.id,
                                                                index);
                                                          },
                                                        ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Dimens.box0,
                        controller.newPermitDetailsModel.value?.ptwStatus ==
                                    125 &&
                                controller.newPermitDetailsModel.value
                                        ?.is_TBT_Expire ==
                                    true
                            ? Container(
                                decoration: BoxDecoration(
                                    color: ColorValues.appRedColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                height: 25,
                                child: Text(
                                  "  Your Time For TBT Taken Is Expire So Please Cancel The Permit  ",
                                ),
                              )
                            : Dimens.box0,
                        controller.newPermitDetailsModel.value?.ptwStatus ==
                                    125 &&
                                controller.newPermitDetailsModel.value
                                        ?.is_TBT_Expire ==
                                    false
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomRichTextMobile(
                                      title: 'Conducted At Job-Site By: '),
                                  Dimens.boxHeight2,
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    child: Obx(
                                      () => DropdownWebWidget(
                                        dropdownList:
                                            controller.employeeNameList,
                                        isValueSelected: controller
                                            .isemployeeNameListSelected.value,
                                        selectedValue: controller
                                            .selectedEmployeeNamesList.value,
                                        onValueChanged: controller
                                            .onValueTbtConductedChanged,
                                      ),
                                    ),
                                  ),
                                  Dimens.boxHeight15,
                                  CustomRichTextMobile(
                                      title: 'Date and Time: '),
                                  Dimens.boxHeight2,
                                  _buildDateTimeField_mobile(context),
                                  Dimens.boxHeight15,
                                  CustomRichTextMobile(title: 'Add Employee'),
                                  Dimens.boxHeight2,
                                  Obx(
                                    () => CustomMultiSelectDialogField(
                                      buttonText: 'Add Employee',
                                      title: 'Select Employee',
                                      initialValue: (controller
                                              .selectedEmployeeNameList
                                              .isNotEmpty)
                                          ? controller
                                              .selectedEmployeeNameIdList
                                          : [],
                                      items: controller.employeeNameList
                                          .map(
                                            (employeeName) => MultiSelectItem(
                                              employeeName?.id,
                                              employeeName?.name ?? '',
                                            ),
                                          )
                                          .toList(),
                                      onConfirm: (selectedOptionsList) => {
                                        controller.employeeNameSelected(
                                            selectedOptionsList),
                                        print(
                                            'Employee Name list50: ${controller.selectedEmployeeNameIdList}')
                                      },
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 2,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        width: Get.width * 2,
                                        constraints:
                                            BoxConstraints(minHeight: 100),
                                        height: ((controller
                                                .filteredEquipmentNameList
                                                .length) *
                                            60),
                                        // 90,
                                        child: DataTable2(
                                          columns: [
                                            DataColumn2(
                                                label: Text("Employee Name")),
                                            DataColumn2(
                                                label: Text("Contact No")),
                                            DataColumn2(
                                                label: Text("Responsibility")),
                                            DataColumn2(
                                                label: Text("Responsibility")),
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller.filteredEmployeeNameList
                                                .length,
                                            (index) {
                                              var employeeNameDetails = controller
                                                      .filteredEmployeeNameList[
                                                  index];
                                              return DataRow(cells: [
                                                DataCell(Text(
                                                    '${employeeNameDetails?.name ?? ''}')),
                                                DataCell(Text(
                                                    '${employeeNameDetails?.mobileNumber ?? ''}')),
                                                DataCell(Text(
                                                    '${employeeNameDetails?.responsibility?.map((e) => e.name) ?? ''}')),
                                                DataCell(
                                                  Wrap(
                                                    children: [
                                                      TableActionButton(
                                                        color: Colors.red,
                                                        icon: Icons
                                                            .delete_outline,
                                                        message: 'Remove',
                                                        onPress: () {
                                                          // Call the removeItem method of the controller
                                                          _removeRow(index);
                                                          print("index");
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Dimens.boxHeight15,
                                ],
                              )
                            : Dimens.box0,
                        CustomRichTextMobile(title: "Comments: "),
                        Dimens.boxHeight2,
                        _buildPermitCommentField_mobile(context),
                        Dimens.boxHeight20,
                        controller.jobModel?.id != null
                            ? Center(
                                child: Container(
                                  height: 45,
                                  child: CustomElevatedButton(
                                    backgroundColor: ColorValues.appGreenColor,
                                    text: "Submit For Approval",
                                    onPressed: () {
                                      controller.isCheckedJSA.value == true &&
                                              controller.isCheckedSOP.value ==
                                                  true
                                          ? controller.createNewPermitForJob(
                                              jobId: controller.jobModel?.id,
                                              fileIds:
                                                  dropzoneController.fileIds)
                                          : Get.dialog<void>(
                                              checkboxAlertBox(),
                                            );
                                    },
                                  ),
                                ),
                              )
                            : controller.mcExecutionDetailsModel?.id != null &&
                                    controller.permitId.value == 0
                                ? Center(
                                    child: Container(
                                        height: 45,
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appGreenColor,
                                          text: "Submit",
                                          onPressed: () {
                                            controller.isFormInvalid.value =
                                                false;
                                            controller.checkForm() == true &&
                                                    controller.isCheckedJSA
                                                            .value ==
                                                        true &&
                                                    controller.isCheckedSOP
                                                            .value ==
                                                        true
                                                ? controller
                                                    .createNewPermitForPm(
                                                        pmTaskId: controller
                                                            .scheduleID.value,
                                                        fileIds:
                                                            dropzoneController
                                                                .fileIds)
                                                : controller.isCheckedJSA
                                                                .value ==
                                                            true &&
                                                        controller.isCheckedSOP
                                                                .value ==
                                                            true
                                                    ? print("condiation failed")
                                                    : Get.dialog<void>(
                                                        checkboxAlertBox(),
                                                      );
                                            // var jobId = controller.jobModel?.id ?? 0;
                                            // print('JobId'),
                                            // controller.isFormInvalid.value =
                                            //     false;
                                            // controller.isCheckedJSA.value ==
                                            //             true &&
                                            //         controller
                                            //                 .isCheckedSOP.value ==
                                            //             true
                                            //     ? controller
                                            //         .createNewPermitForJob(
                                            //             jobId: controller
                                            //                 .jobModel?.id,
                                            //             fileIds:
                                            //                 dropzoneController
                                            //                     .fileIds)
                                            //     : Get.dialog<void>(
                                            //         checkboxAlertBox());
                                            // controller.linkToPermit(jobId: controller.jobModel?.id);
                                          },
                                        )),
                                  )
                                : controller.vegExecutionDetailsModel
                                                ?.executionId !=
                                            null &&
                                        controller.permitId.value == 0
                                    ? Center(
                                        child: Container(
                                            height: 45,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appGreenColor,
                                              text: "Submit",
                                              onPressed: () {
                                                controller.isFormInvalid.value =
                                                    false;
                                                controller.checkForm() ==
                                                            true &&
                                                        controller.isCheckedJSA
                                                                .value ==
                                                            true &&
                                                        controller.isCheckedSOP
                                                                .value ==
                                                            true
                                                    ? controller.createNewPermitForPm(
                                                        pmTaskId: controller
                                                            .scheduleID.value,
                                                        fileIds:
                                                            dropzoneController
                                                                .fileIds)
                                                    : controller.isCheckedJSA
                                                                    .value ==
                                                                true &&
                                                            controller
                                                                    .isCheckedSOP
                                                                    .value ==
                                                                true
                                                        ? print(
                                                            "condiation failed")
                                                        : Get.dialog<void>(
                                                            checkboxAlertBox(),
                                                          );
                                              },
                                            )),
                                      )
                                    : controller.pmtaskViewModel?.id != null
                                        ? Center(
                                            child: Container(
                                              height: 45,
                                              child: CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.appGreenColor,
                                                text: "Submit For Approval",
                                                onPressed: () {
                                                  controller.isCheckedJSA.value ==
                                                              true &&
                                                          controller
                                                                  .isCheckedSOP
                                                                  .value ==
                                                              true
                                                      ? controller.createNewPermitForPm(
                                                          pmTaskId: controller
                                                              .pmtaskViewModel
                                                              ?.id,
                                                          activity: controller
                                                              .pmtaskViewModel
                                                              ?.plan_title,
                                                          fileIds:
                                                              dropzoneController
                                                                  .fileIds)
                                                      : Get.dialog<void>(
                                                          checkboxAlertBox(),
                                                        );
                                                },
                                              ),
                                            ),
                                          )
                                        : controller.permitId.value <= 0
                                            ? Center(
                                                child: Container(
                                                  height: 45,
                                                  child: CustomElevatedButton(
                                                    backgroundColor: ColorValues
                                                        .appGreenColor,
                                                    text: "Submit For Approval",
                                                    onPressed: () {
                                                      controller.isCheckedJSA
                                                                      .value ==
                                                                  true &&
                                                              controller
                                                                      .isCheckedSOP
                                                                      .value ==
                                                                  true
                                                          ? controller.createNewPermit(
                                                              fileIds:
                                                                  dropzoneController
                                                                      .fileIds)
                                                          : Get.dialog<void>(
                                                              checkboxAlertBox(),
                                                            );
                                                    },
                                                  ),
                                                ),
                                              )
                                            : Center(
                                                child: Row(
                                                  children: [
                                                    Spacer(),
                                                    controller
                                                                .newPermitDetailsModel
                                                                .value
                                                                ?.ptwStatus ==
                                                            121
                                                        ? Center(
                                                            child: Container(
                                                              height: 45,
                                                              child:
                                                                  CustomElevatedButton(
                                                                backgroundColor:
                                                                    ColorValues
                                                                        .appDarkBlueColor,
                                                                text: "Update",
                                                                onPressed: () {
                                                                  controller.updateNewPermit(
                                                                      fileIds:
                                                                          dropzoneController
                                                                              .fileIds);
                                                                },
                                                              ),
                                                            ),
                                                          )
                                                        : Dimens.box0,
                                                    Spacer(),
                                                    controller.newPermitDetailsModel.value
                                                                    ?.ptwStatus ==
                                                                125 &&
                                                            controller
                                                                    .newPermitDetailsModel
                                                                    .value
                                                                    ?.is_TBT_Expire ==
                                                                false &&
                                                            controller
                                                                    .newPermitDetailsModel
                                                                    .value
                                                                    ?.tbT_Done_Check ==
                                                                0
                                                        ? Center(
                                                            child: Container(
                                                              height: 45,
                                                              child:
                                                                  CustomElevatedButton(
                                                                backgroundColor:
                                                                    ColorValues
                                                                        .appDarkBlueColor,
                                                                text:
                                                                    "Update TBT",
                                                                onPressed: () {
                                                                  if (controller
                                                                              .tbtDateTimeCtrlrBuffer ==
                                                                          null ||
                                                                      controller
                                                                              .selectedTbtConductedId ==
                                                                          0 ||
                                                                      controller
                                                                          .tbtDateTimeCtrlrBuffer
                                                                          .isEmpty ||
                                                                      controller
                                                                              .tbtDateTimeCtrlrBuffer ==
                                                                          "") {
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text("Select Time"),
                                                                          content: controller.selectedTbtConductedId == 0
                                                                              ? Text("Select TBT Conducted By")
                                                                              : Text("Can't do TBT without entering the time."),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Text("OK"),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    return null;
                                                                  }
                                                                  controller.updateNewPermit(
                                                                      fileIds:
                                                                          dropzoneController
                                                                              .fileIds);
                                                                },
                                                              ),
                                                            ),
                                                          )
                                                        : Dimens.box0,
                                                    Spacer(),
                                                    controller
                                                                .newPermitDetailsModel
                                                                .value
                                                                ?.ptwStatus ==
                                                            124
                                                        ? Center(
                                                            child: Container(
                                                              height: 45,
                                                              child:
                                                                  CustomElevatedButton(
                                                                backgroundColor:
                                                                    Color.fromARGB(
                                                                        255,
                                                                        116,
                                                                        78,
                                                                        130),
                                                                text:
                                                                    "Re submit Permit",
                                                                onPressed: () {
                                                                  controller.resubmitPermit(
                                                                      fileIds:
                                                                          dropzoneController
                                                                              .fileIds);
                                                                },
                                                              ),
                                                            ),
                                                          )
                                                        : Dimens.box0,
                                                    Spacer(),
                                                    controller.newPermitDetailsModel.value
                                                                    ?.ptwStatus ==
                                                                125 &&
                                                            controller
                                                                    .newPermitDetailsModel
                                                                    .value
                                                                    ?.is_TBT_Expire ==
                                                                true
                                                        ? Container(
                                                            height: 45,
                                                            child:
                                                                CustomElevatedButton(
                                                              backgroundColor:
                                                                  ColorValues
                                                                      .appRedColor,
                                                              text:
                                                                  "Cancel Permit",
                                                              icon: Icons.close,
                                                              onPressed: () {
                                                                Get.dialog(
                                                                  PermitCancelReQuestDialog(
                                                                    permitId:
                                                                        '${controller.permitId.value}',
                                                                    jobId: controller
                                                                        .jobModel!
                                                                        .id,
                                                                  ),
                                                                );
                                                                print(
                                                                    "Permit ID TO Cancel: ${controller.permitId.value}");
                                                                print(
                                                                    "JobId To cancel: ${controller.jobModel!.id}");
                                                              },
                                                            ))
                                                        : Dimens.box0,
                                                    Spacer(),
                                                  ],
                                                ),
                                              ),
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
  }

  ////Below All for Mobile
  Widget _buildStartDateField_mobile(
    BuildContext context,
    int position,
  ) {
    return Container(
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
            color: ColorValues.whiteColor,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        color: ColorValues.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width / 1.1,
      child: TextField(
        style: GoogleFonts.lato(
          textStyle:
              TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
        ),
        onTap: () {
          position == 0
              ? pickDateTime_mobile(context, 0)
              : pickDateTime_mobile(context, 1);
        },
        controller: position == 0
            ? controller.startDateTimeCtrlr
            : controller.validTillTimeCtrlr,
        autofocus: false,
        decoration: InputDecoration(
          fillColor: ColorValues.whiteColor,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Future pickDateTime_mobile(BuildContext context, int position) async {
    var dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
    final date = await pickDate_mobile(context, position);
    if (date == null) {
      return;
    }

    final time = await pickTime_mobile(context, position, date);
    if (time == null) {
      return;
    }
    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value = dateTime;
    position == 0
        ? controller.startDateTimeCtrlr
        : controller.validTillTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: position == 0
              ? controller.startDateTimeCtrlr.text.length
              : controller.validTillTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    controller.validTillTimeCtrlr.text =
        DateFormat("yyyy-MM-dd HH:mm").format(dateTime.add(Duration(hours: 8)));
    controller.validTillTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
            .format(dateTime.add(Duration(hours: 8)));
    controller.startDateTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate_mobile(BuildContext context, int position) async {
    DateTime? dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDate == null) return null;
    return newDate;
  }

  Future<TimeOfDay?> pickTime_mobile(
      BuildContext context, int position, DateTime? selectedDate) async {
    DateTime dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
    final newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
    if (newTime == null) {
      return null;
    }
    final currentTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      TimeOfDay.now().hour,
      TimeOfDay.now().minute,
    );

    final selected = DateTime(
      selectedDate?.year ?? DateTime.now().year,
      selectedDate?.month ?? DateTime.now().month,
      selectedDate?.day ?? DateTime.now().day,
      newTime.hour,
      newTime.minute,
    );

    print('seklected time : $selected');
    if (currentTime.isAfter(selected)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid Time"),
            content: Text("Please select a time in the future."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return null;
    }

    return newTime;
  }

  // Widget _buildValidTillField_mobile(BuildContext context) {
  //   return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //     Container(
  //       decoration: BoxDecoration(
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black26,
  //             offset: const Offset(
  //               5.0,
  //               5.0,
  //             ),
  //             blurRadius: 5.0,
  //             spreadRadius: 1.0,
  //           ), //BoxShadow
  //           BoxShadow(
  //             color: ColorValues.whiteColor,
  //             offset: const Offset(0.0, 0.0),
  //             blurRadius: 0.0,
  //             spreadRadius: 0.0,
  //           ), //BoxShadow
  //         ],
  //         color: ColorValues.whiteColor,
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       child: SizedBox(
  //         width: MediaQuery.of(context).size.width / 1.1,
  //         child: TextField(
  //           style: GoogleFonts.lato(
  //             textStyle:
  //                 TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
  //           ),
  //           onTap: () {
  //             pickDateTimeTill_mobile(context);
  //           },
  //           controller: controller.validTillTimeCtrlr,
  //           autofocus: false,
  //           decoration: InputDecoration(
  //             fillColor: ColorValues.whiteColor,
  //             filled: true,
  //             contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
  //             border: InputBorder.none,
  //             enabledBorder: InputBorder.none,
  //             focusedBorder: InputBorder.none,
  //           ),
  //           onChanged: (value) {},
  //         ),
  //       ),
  //     ),
  //   ]);
  // }

  // Future pickDateTimeTill_mobile(BuildContext context) async {
  //   var dateTime = controller.selectedValidTillTime.value;
  //   final date = await pickDateTill_mobile(context);
  //   if (date == null) {
  //     return;
  //   }
  //   final time = await pickTimeTill_mobile(context);
  //   if (time == null) {
  //     return;
  //   }
  //   dateTime = DateTime(
  //     date.year,
  //     date.month,
  //     date.day,
  //     time.hour,
  //     time.minute,
  //   );
  //   controller.selectedValidTillTime.value = dateTime;
  //   controller.validTillTimeCtrlr
  //     ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
  //     ..selection = TextSelection.fromPosition(
  //       TextPosition(
  //         offset: controller.validTillTimeCtrlr.text.length,
  //         affinity: TextAffinity.upstream,
  //       ),
  //     );
  // }

  // Future<DateTime?> pickDateTill_mobile(BuildContext context) async {
  //   DateTime? dateTime = controller.selectedValidTillTime.value;
  //   //final initialDate = DateTime.now();
  //   final newDate = await showDatePicker(
  //     context: context,
  //     initialDate: dateTime,
  //     firstDate: DateTime(DateTime.now().year - 5),
  //     lastDate: DateTime(DateTime.now().year + 5),
  //   );
  //   if (newDate == null) return null;
  //   return newDate;
  // }

  // Future<TimeOfDay?> pickTimeTill_mobile(BuildContext context) async {
  //   DateTime dateTime = controller.selectedValidTillTime.value;
  //   //final initialTime = TimeOfDay(hour: 12, minute: 0);
  //   final newTime = await showTimePicker(
  //       context: context,
  //       initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
  //       builder: (BuildContext context, Widget? child) {
  //         return Theme(
  //           data: ThemeData.light(),
  //           child: child!,
  //         );
  //       });
  //   if (newTime == null) {
  //     return null;
  //   }
  //   return newTime;
  // }

  Widget _buildPermitDescriptionField_mobile(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomRichTextMobile(title: 'Permit Description: '),
      Dimens.boxHeight2,
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          child: TextField(
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
            controller: controller.permitDescriptionCtrlr,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isJobDescriptionInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isJobDescriptionInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isJobDescriptionInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isJobDescriptionInvalid.value = false;
              } else {
                controller.isJobDescriptionInvalid.value = true;
              }
            },
          ),
        ),
      ),
      Dimens.boxHeight15,
    ]);
  }

  showEquipmentNameAlertBox() {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          'Select Equipment Name',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          return Obx(
            () => Container(
              padding: Dimens.edgeInsets05_0_5_0,
              height: double.infinity,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: CustomMultiSelectDialogField(
                        buttonText: 'Equipment Name',
                        title: 'Select Equipment Name',
                        initialValue:
                            (controller.selectedEquipmentNameList.isNotEmpty)
                                ? controller.selectedEquipmentNameIdList
                                : [],
                        items: controller.equipmentNameList
                            .map(
                              (equipmentName) => MultiSelectItem(
                                equipmentName?.id,
                                equipmentName?.name ?? '',
                              ),
                            )
                            .toList(),
                        onConfirm: (selectedOptionsList) => {
                          controller.equipmentNameSelected(selectedOptionsList),
                          print(
                              'Equipment Name list25: ${controller.selectedEquipmentNameIdList}')
                        },
                      ),
                    )
                  ]),
            ),
          );
        }),
        actions: [
          Center(
            child: Container(
                height: 45,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.navyBlueColor,
                  text: "Ok",
                  onPressed: () {
                    Get.back();
                  },
                )),
          ),
        ],
      );
    }));
  }

  checkboxAlertBox() {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          'JSA & SOP is not Accepted !!',
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: 100,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  Text(
                      'Please check the JSA and SOP Terms and Condition. \n Please click on View JSA and View SOP Button.')
                ]),
          );
        }),
        actions: [
          Center(
            child: Container(
                height: 45,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.navyBlueColor,
                  text: "Ok",
                  onPressed: () {
                    Get.back();
                  },
                )),
          ),
        ],
      );
    }));
  }

  AddEmployeeListAlertBox() {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        title: Text(
          'Select Employee Name',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          return Obx(
            () => Container(
              padding: Dimens.edgeInsets05_0_5_0,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: CustomMultiSelectDialogField(
                        buttonText: 'Add Employee',
                        title: 'Select Employee',
                        initialValue:
                            (controller.selectedEmployeeNameList.isNotEmpty)
                                ? controller.selectedEmployeeNameIdList
                                : [],
                        items: controller.employeeNameList
                            .map(
                              (employeeName) => MultiSelectItem(
                                employeeName?.id,
                                employeeName?.name ?? '',
                              ),
                            )
                            .toList(),
                        onConfirm: (selectedOptionsList) => {
                          controller.employeeNameSelected(selectedOptionsList),
                          print(
                              'Employee Name list50: ${controller.selectedEmployeeNameIdList}')
                        },
                      ),
                    )
                  ]),
            ),
          );
        }),
        actions: [
          Center(
            child: Container(
                height: 45,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.navyBlueColor,
                  text: "Ok",
                  onPressed: () {
                    Get.back();
                  },
                )),
          ),
        ],
      );
    }));
  }

  checkBoxMethod(bool isChecked, Function(bool?) onChange) {
    return Checkbox(
      value: isChecked,
      // value: isInitialChecked,
      onChanged: onChange,
    );
  }

  // checkBoxMethod(int position) {
  //   return Checkbox(
  //       value: position == 1
  //           ? controller.isChecked1.value
  //           : position == 2
  //               ? controller.isChecked2.value
  //               : position == 3
  //                   ? controller.isChecked3.value
  //                   : position == 4
  //                       ? controller.isChecked4.value
  //                       : position == 5
  //                           ? controller.isChecked5.value
  //                           : position == 6
  //                               ? controller.isChecked6.value
  //                               : position == 7
  //                                   ? controller.isChecked7.value
  //                                   : null,
  //       onChanged: (bool? value) {
  //         position == 1
  //             ? controller.toggleCheckbox1()
  //             : position == 2
  //                 ? controller.toggleCheckbox2()
  //                 : position == 3
  //                     ? controller.toggleCheckbox3()
  //                     : position == 4
  //                         ? controller.toggleCheckbox4()
  //                         : position == 5
  //                             ? controller.toggleCheckbox5()
  //                             : position == 6
  //                                 ? controller.toggleCheckbox6()
  //                                 : position == 7
  //                                     ? controller.toggleCheckbox7()
  //                                     : null;
  //       });
  // }

  Widget _buildDateTimeField_mobile(
    BuildContext context,
  ) {
    return Column(//
        children: [
      Dimens.boxHeight5,
      Container(
        width: MediaQuery.of(context).size.width / 1.1,
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
              color: ColorValues.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          style: GoogleFonts.lato(
            textStyle:
                TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
          ),
          onTap: () {
            pickDateTimeTBT_mobile(context);
          },
          controller: controller.dateTimeCtrlr,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: ColorValues.whiteColor,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onChanged: (value) {},
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

  Future pickDateTimeTBT_mobile(BuildContext context) async {
    var dateTime = controller.selectedDateTime.value;
    final date = await pickDateTBT_mobile(context);
    if (date == null) {
      return;
    }

    final time = await pickTimeTBT_mobile(context);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    // controller.selectedDateTime.value = dateTime;
    // controller.dateTimeCtrlr
    //   ..text = DateFormat('yyyy-MM-dd HH:mm').format(dateTime)
    //   ..selection = TextSelection.fromPosition(
    //     TextPosition(
    //       offset: controller.dateTimeCtrlr.text.length,
    //       affinity: TextAffinity.upstream,
    //     ),
    //   );
    controller.dateTimeCtrlr.text =
        DateFormat("yyyy-MM-dd HH:mm").format(dateTime);
    controller.tbtDateTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
    print('TBT DateTime:${controller.dateTimeCtrlr.text}');
  }

  Future<DateTime?> pickDateTBT_mobile(BuildContext context) async {
    DateTime? dateTime = controller.selectedDateTime.value;
    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTimeTBT_mobile(BuildContext context) async {
    DateTime dateTime = controller.selectedDateTime.value;
    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }

  Widget _buildPermitCommentField_mobile(BuildContext context) {
    return Container(
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
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.1,
        child: TextField(
          style: GoogleFonts.lato(
            textStyle:
                TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
          ),
          controller: controller.workPermitRemarkTextCtrlr,
          focusNode: controller.commentFocus,
          scrollController: controller.commentScroll,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: ColorValues.whiteColor,
            filled: true,
            contentPadding: Dimens.edgeInsets05_10,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: controller.isJobDescriptionInvalid.value
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: ColorValues.redColorDark,
                    ),
                  )
                : InputBorder.none,
            errorBorder: controller.isJobDescriptionInvalid.value
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: ColorValues.redColorDark,
                    ),
                  )
                : null,
            errorText: controller.isJobDescriptionInvalid.value
                ? "Required field"
                : null,
          ),
          onChanged: (value) {
            if (value.trim().length > 3) {
              controller.isJobDescriptionInvalid.value = false;
            } else {
              controller.isJobDescriptionInvalid.value = true;
            }
          },
        ),
      ),
    );
  }

  void _removeRow(int index) {
    controller.filteredEmployeeNameList.removeAt(index);
  }
}
