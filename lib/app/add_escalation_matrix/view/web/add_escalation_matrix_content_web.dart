import 'package:cmms/app/add_escalation_matrix/add_escalation_matrix_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddEscalationMatrixContentWeb
    extends GetView<AddEscalationMatrixController> {
  AddEscalationMatrixContentWeb({super.key});
  final AddEscalationMatrixController controller = Get.find();
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) => SelectionArea(
        child: Scaffold(
          body: Obx(
            () => Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 450),
                  margin: EdgeInsets.only(
                    left: Responsive.isDesktop(context)
                        ? homecontroller.menuButton.value
                            ? 250.0
                            : 70.0
                        : 0,
                  ),
                  color: Color.fromARGB(255, 234, 236, 238),
                  width: Get.width,
                  height: Get.height,
                  child: Column(
                    children: [
                      HeaderWidget(),
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
                            InkWell(
                              onTap: () {
                                Get.offNamed(Routes.home);
                              },
                              child: Text(
                                "Dashboard".toUpperCase(),
                                style: Styles.greyLight14,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.clearStoreData();
                                Get.offNamed(Routes.escalationMatrixListWeb);
                              },
                              child: Text(
                                " / Escalation Matrix List".toUpperCase(),
                                style: Styles.greyLight14,
                              ),
                            ),
                            Text(
                              " / Create Escalation Matrix".toUpperCase(),
                              style: Styles.greyLight14,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Card(
                            color: ColorValues.cardColor,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(15),
                                        child: Text(
                                          'Create Escalation Matrix',
                                          style: Styles.blue17,
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Dimens.boxHeight10,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomRichText(
                                        title: 'Module',
                                      ),
                                      Dimens.boxWidth5,
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: DropdownWebWidget(
                                          dropdownList: controller.moduleList,
                                          isValueSelected: controller
                                              .isModuleListSelected.value,
                                          selectedValue: controller
                                              .selectedModuleList.value,
                                          onValueChanged:
                                              controller.onValueChanged,
                                        ),
                                      ),
                                      Dimens.boxWidth30,
                                      CustomRichText(
                                        title: 'Status',
                                      ),
                                      Dimens.boxWidth5,
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: DropdownWebWidget(
                                          dropdownList: controller.status,
                                          isValueSelected:
                                              controller.isStatusSelected.value,
                                          selectedValue:
                                              controller.selectedStatus.value,
                                          onValueChanged:
                                              controller.onValueChanged,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: AddRowInEscalation(),
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
                AnimatedPositioned(
                  child: HomeDrawer(),
                  duration: Duration(milliseconds: 450),
                )
              ],
            ),
          ),
          floatingActionButton: Row(
            children: [
              Spacer(),
              Container(
                height: 30,
                child: CustomElevatedButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    // controller.saveAsDraft();
                  },
                  text: 'Cancel',
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 30,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.appGreenColor,
                  text: "Submit",
                  onPressed: () {
                    controller.createEscalationMatrix();
                  },
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      );
}

class AddRowInEscalation extends StatefulWidget {
  AddRowInEscalation({super.key});

  @override
  State<AddRowInEscalation> createState() => _AddRowInEscalationState();
}

class _AddRowInEscalationState extends State<AddRowInEscalation> {
  final AddEscalationMatrixController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: Dimens.edgeInsets20,
        height: Get.height * .6,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorValues.lightGreyColorWithOpacity35,
            width: 1,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Escalation Levels",
                      style: Styles.blue700,
                    ),
                    InkWell(
                      onTap: () {
                        controller.addRowItem();
                        controller.update();
                      },
                      child: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          color: ColorValues.addNewColor,
                          border: Border.all(
                            color: ColorValues.lightGreyColorWithOpacity35,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            " + Add ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1000,
                child: SingleChildScrollView(
                  child: DataTable(
                    border: TableBorder.all(
                        color: Color.fromARGB(255, 206, 229, 234)),
                    columns: [
                      DataColumn(
                        label: Text(
                          "Duration (Days)",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Escalation Roles and Levels",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Action",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: controller.rowItem.map((record) {
                      return DataRow.byIndex(
                        index: controller.rowItem.indexOf(record),
                        cells: record
                            .where((mapData) =>
                                mapData['key'] != "Escalation Role Id")
                            .map((mapData) {
                          if (mapData['key'] == "Duration (Days)") {
                            return DataCell(
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: Get.width * .2,
                                      child: LoginCustomTextfield(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        maxLine: 1,
                                        textController:
                                            new TextEditingController(
                                                text: mapData["value"] ?? ''),
                                        onChanged: (txt) {
                                          mapData["value"] = txt;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else if (mapData['key'] ==
                              "Escalation Roles and Levels") {
                            return DataCell(
                              SizedBox(
                                width: Get.width * .2,
                                child: DropdownWebWidget(
                                  dropdownList: controller.roleList,
                                  isValueSelected:
                                      controller.isSelectedRole.value,
                                  selectedValue: mapData["value"],
                                  onValueChanged: (list, selectedValue) {
                                    // setState(() {
                                    print(
                                      "dropdownData:${{
                                        selectedValue: selectedValue
                                      }}",
                                    );
                                    mapData["value"] = selectedValue;
                                    controller
                                            .dropdownMapperData[selectedValue] =
                                        list.firstWhere(
                                      (element) =>
                                          element.name == selectedValue,
                                    );
                                    final escalationData = controller
                                        .dropdownMapperData[selectedValue];
                                    if (escalationData != null) {
                                      final roleId =
                                          escalationData.id.toString();
                                      final rowIndex =
                                          controller.rowItem.indexWhere(
                                        (row) =>
                                            row[2]['value'] == selectedValue,
                                      );
                                      if (rowIndex != -1) {
                                        // Update the value of 'Escalation Role Id' in the correct row
                                        controller.rowItem[rowIndex][1]
                                            ['value'] = roleId;
                                        print(
                                            "Updated rowItem: ${controller.rowItem[rowIndex]}");
                                      } else {
                                        print(
                                            "Row with selected value not found.");
                                      }
                                    }
                                    // });
                                  },
                                ),
                              ),
                            );
                          } else if (mapData['key'] == "Action") {
                            return DataCell(
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TableActionButton(
                                      color: ColorValues.appRedColor,
                                      icon: Icons.delete_outlined,
                                      label: '',
                                      message: '',
                                      onPress: () {
                                        controller.rowItem.remove(record);
                                        controller.update();
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return DataCell(
                              Text(mapData['value'] ?? ""),
                            );
                          }
                        }).toList(),
                      );
                    }).toList(),
                    // rows: List.generate(
                    //   controller.rowItem.length,
                    //   (rowIndex) {
                    //     var row = controller.rowItem[rowIndex];
                    //     return DataRow(
                    //       cells: row.map(
                    //         (mapData) {
                    //           return DataCell(
                    //             (mapData['key'] == "Duration (Days)")
                    //                 ? Padding(
                    //                     padding: const EdgeInsets.only(
                    //                         left: 20, right: 20, top: 5),
                    //                     child: Column(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.center,
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.center,
                    //                       children: [
                    //                         SizedBox(
                    //                           width: Get.width * .2,
                    //                           child: LoginCustomTextfield(
                    //                             keyboardType:
                    //                                 TextInputType.number,
                    //                             inputFormatters: <TextInputFormatter>[
                    //                               FilteringTextInputFormatter
                    //                                   .digitsOnly
                    //                             ],
                    //                             maxLine: 1,
                    //                             textController:
                    //                                 new TextEditingController(
                    //                                     text:
                    //                                         mapData["value"] ??
                    //                                             ''),
                    //                             onChanged: (txt) {
                    //                               mapData["value"] = txt;
                    //                             },
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   )
                    //                 : (mapData['key'] ==
                    //                         "Escalation Roles and Levels")
                    //                     ? SizedBox(
                    //                         width: Get.width * .2,
                    //                         child: DropdownWebWidget(
                    //                           dropdownList: controller.roleList,
                    //                           isValueSelected: controller
                    //                               .isSelectedRole.value,
                    //                           selectedValue: mapData["value"],
                    //                           onValueChanged:
                    //                               (list, selectedValue) {
                    //                             print(
                    //                               "dropdownData:${{
                    //                                 selectedValue: selectedValue
                    //                               }}",
                    //                             );
                    //                             mapData["value"] =
                    //                                 selectedValue;
                    //                             controller.dropdownMapperData[
                    //                                     selectedValue] =
                    //                                 list.firstWhere(
                    //                               (element) =>
                    //                                   element.name ==
                    //                                   selectedValue,
                    //                               orElse: null,
                    //                             );
                    //                           },
                    //                         ),
                    //                       )
                    //                     : (mapData['key'] == "Action")
                    //                         ? Padding(
                    //                             padding:
                    //                                 EdgeInsets.only(top: 5),
                    //                             child: Column(
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment.start,
                    //                               crossAxisAlignment:
                    //                                   CrossAxisAlignment.start,
                    //                               children: [
                    //                                 TableActionButton(
                    //                                   color: ColorValues
                    //                                       .appRedColor,
                    //                                   icon:
                    //                                       Icons.delete_outlined,
                    //                                   label: '',
                    //                                   message: '',
                    //                                   onPress: () {
                    //                                     controller.rowItem
                    //                                         .remove(row);
                    //                                     controller.update();
                    //                                   },
                    //                                 )
                    //                               ],
                    //                             ),
                    //                           )
                    //                         : Text(mapData['key'] ?? ''),
                    //           );
                    //         },
                    //       ).toList(),
                    //     );
                    //   },
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
