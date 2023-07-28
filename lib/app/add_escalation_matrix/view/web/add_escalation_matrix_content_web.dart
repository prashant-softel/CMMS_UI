// import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'dart:convert';

import 'package:cmms/app/add_escalation_matrix/add_escalation_matrix_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class AddEscalationMatrixContentWeb
    extends GetView<AddEscalationMatrixController> {
  AddEscalationMatrixContentWeb({super.key});

  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  bool valuefirst = false;
  bool _switchValue = false;

  // final homeController = Get.find<HomeController>();
  final AddEscalationMatrixController controller = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: HeaderWidget(),
          elevation: 0,
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
        ),
        body: Row(
          children: [
            Responsive.isMobile(context) || Responsive.isTablet(context)
                ? Dimens.box0
                : HomeDrawer(),
            Expanded(
              child: RepaintBoundary(
                key: controller.printKey,
                child: Center(
                  child: Container(
                    // margin: Dimens.edgeInsets16,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(.3)),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: 1100,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(
                                color: Color.fromARGB(255, 227, 224, 224),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 236, 234, 234)
                                      .withOpacity(0.5),
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
                                Text(
                                  "Dashboard",
                                  style: Styles.greyLight14,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Text(" / Escalation Matrix List",
                                      style: Styles.greyMediumLight12),
                                ),
                                Text(" / Create Escalation Matrix",
                                    style: Styles.greyMediumLight12)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1,
                            // height: MediaQuery.of(context).size.height / 1,
                            child: Card(
                              color: Colors.lightBlue.shade50,
                              child: Wrap(
                                children: [
                                  GetBuilder<AddEscalationMatrixController>(
                                      id: 'escalation-matrix',
                                      builder: (controller) {
                                        return Obx(
                                          () => Column(
                                            children: [
                                              CustomAppBar(
                                                title:
                                                    'Create Escalation Matrix'
                                                        .tr,
                                              ),
                                              Dimens.boxHeight20,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomRichText(
                                                      title: 'Module'),
                                                  Dimens.boxWidth5,
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    child: DropdownWebWidget(
                                                      dropdownList:
                                                          controller.moduleList,
                                                      isValueSelected: controller
                                                          .isModuleListSelected
                                                          .value,
                                                      selectedValue: controller
                                                          .selectedModuleList
                                                          .value,
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  ),
                                                  Dimens.boxWidth30,
                                                  CustomRichText(
                                                      title: 'Status'),
                                                  Dimens.boxWidth5,
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    child: DropdownWebWidget(
                                                      dropdownList: controller
                                                          .typePermitList,
                                                      isValueSelected: controller
                                                          .isTypePermitSelected
                                                          .value,
                                                      selectedValue: controller
                                                          .selectedTypePermit
                                                          .value,
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight50,

                                              ///Escalation Matrix Roles
                                              Obx(
                                                () => Wrap(
                                                  children: [
                                                    Container(
                                                      height: 350,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.5,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: ColorValues
                                                              .lightGreyColorWithOpacity35,
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: ColorValues
                                                                .appBlueBackgroundColor,
                                                            spreadRadius: 2,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        5),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                    "Escalation Levels"),
                                                                Spacer(),
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      controller
                                                                          .addRowItem();

                                                                    
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .exposure_plus_1)),
                                                              ],
                                                            ),
                                                          ),
                                                          // Column(
                                                          //     children: []
                                                          //       ..addAll(
                                                          //           controller
                                                          //               .rowItem
                                                          //               .value
                                                          //               .map(
                                                          //                   (e) {
                                                          //         return Text(
                                                          //             jsonEncode(
                                                          //                 e));
                                                          //       }))),
                                                          // Text(jsonEncode(controller
                                                          //     .dropdownMapperData)),
                                                          Container(
                                                            height: 300,
                                                            child:
                                                                ScrollableTableView(
                                                              columns: [
                                                                "Duration (Days)",
                                                                "Escalation Roles and Levels",
                                                              ].map((column) {
                                                                return TableViewColumn(
                                                                  label: column,
                                                                  minWidth:
                                                                      Get.width *
                                                                          0.35,
                                                                  height:
                                                                      Get.height /
                                                                          2,
                                                                );
                                                              }).toList(),
                                                              rows: controller
                                                                  .rowItem.value
                                                                  .map(
                                                                      (record) {
                                                                return TableViewRow(
                                                                  height: 200,
                                                                  cells: record.map(
                                                                      (mapData) {
                                                                    return TableViewCell(
                                                                      child: (mapData['key'] ==
                                                                              "Duration (Days)")
                                                                          ? Padding(
                                                                              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  SizedBox(
                                                                                      width: MediaQuery.of(context).size.width / 5,
                                                                                      child: LoginCustomTextfield(
                                                                                        keyboardType: TextInputType.number,
                                                                                        inputFormatters: <TextInputFormatter>[
                                                                                          FilteringTextInputFormatter.digitsOnly
                                                                                        ],
                                                                                        maxLine: 1,
                                                                                        textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                        onChanged: (txt) {
                                                                                          mapData["value"] = txt;
                                                                                        },
                                                                                      )),
                                                                                  SizedBox(
                                                                                    height: 5,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            )
                                                                          : (mapData['key'] == "Escalation Roles and Levels")
                                                                              ? SizedBox(
                                                                                  width: MediaQuery.of(context).size.width / 5,
                                                                                  child: DropdownWebWidget(
                                                                                    dropdownList: controller.roleList,
                                                                                    isValueSelected: controller.isSelectedRole.value,
                                                                                    selectedValue: mapData["value"],
                                                                                    onValueChanged: (list, selectedValue) {
                                                                                      print("dropdownData:${{
                                                                                        selectedValue: selectedValue
                                                                                      }}");
                                                                                      mapData["value"] = selectedValue;
                                                                                      controller.dropdownMapperData[selectedValue] = list.firstWhere((element) => element.name == selectedValue, orElse: null);
                                                                                    },
                                                                                  ),
                                                                                )
                                                                              : Text(mapData['key'] ?? ''),
                                                                    );
                                                                  }).toList(),
                                                                );
                                                              }).toList(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Container(
                                              //   height: 28,
                                              //   child: CustomElevatedButton(
                                              //     backgroundColor:
                                              //         ColorValues.appGreenColor,
                                              //     text: "Add Data",
                                              //     onPressed: () {
                                              //       controller
                                              //           .addStatusEscalationData(
                                              //               controller
                                              //                   .selectedTypePermitId);
                                              //       controller.addEscalationData(
                                              //           int.tryParse(
                                              //               '${controller.durationDaysTextCtrlr.text}'),
                                              //           controller
                                              //               .selectedRoleListId);
                                              //       print(
                                              //           'Controller:${controller.durationDaysTextCtrlr.text}');
                                              //       print(
                                              //           'Controller:${controller.selectedTypePermitId}');
                                              //       controller
                                              //           .durationDaysTextCtrlr
                                              //           .clear();
                                              //       controller.selectedRole
                                              //           .value = "";
                                              //     },
                                              //   ),
                                              // ),

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 150,
                                                  ),

                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  CustomElevatedButton(
                                                    backgroundColor: Colors.red,
                                                    onPressed: () {
                                                      // controller.saveAsDraft();
                                                    },
                                                    text: 'Cancel',
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                    height: 28,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .appGreenColor,
                                                      text: "Submit",
                                                      onPressed: () {
                                                        controller
                                                            .createEscalationMatrix();
                                                      },
                                                    ),
                                                  ),

                                                  //           varUserAccessModel.value.access_list!
                                                  // .where((e) => e.feature_id == 3 && e.edit == 1)
                                                  // .length > 0
                                                  // &&
                                                  // controller.incidentReportDetailsModel
                                                  //             .value?.id !=
                                                  //         null
                                                  //     ? CustomElevatedButton(
                                                  //         icon: Icons.edit,
                                                  //         backgroundColor: Colors.green,
                                                  //         onPressed: () {
                                                  //           // controller.saveAsDraft();
                                                  //           controller.editIncidentReport(
                                                  //               id: controller
                                                  //                   .incidentReportDetailsModel
                                                  //                   .value
                                                  //                   ?.id);
                                                  //         },
                                                  //         text: 'Edit',
                                                  //       )
                                                  //     : Container()
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        // ),
      );

  
}
