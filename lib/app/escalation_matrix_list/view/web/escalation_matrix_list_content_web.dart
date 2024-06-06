import 'package:cmms/app/app.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:data_table_2/data_table_2.dart';

class EscalationMatrixListWeb extends GetView<EscalationMatrixListController> {
  EscalationMatrixListWeb({super.key});

  final EscalationMatrixListController controller = Get.find();

  ///

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EscalationMatrixListController>(
        id: "escalator_matrix_list",
        builder: (controller) {
          return SelectionArea(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                      color: ColorValues.lightBlueishColor,
                      child: Column(children: [
                        HeaderWidget(),
                        Container(
                          height: 45,
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
                                  "DASHBOARD",
                                  style: Styles.greyLight14,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offNamed(Routes.masterDashboard);
                                },
                                child: Text(" / MASTER",
                                    style: Styles.greyLight14),
                              ),
                              Text(
                                " / ESCALATION MATRIX LIST",
                                style: Styles.greyLight14,
                              ),
                              // Text(" / Create Checklist Number",
                              //     style: Styles.greyMediumLight12)
                              SizedBox(
                                width: 400,
                              ),
                              // ActionButton(
                              //   icon: Icons.calendar_month,
                              //   label: 'December 3rd 2022',
                              //   // onPress: () {
                              //   //   // Get.to(() => AddInventory());
                              //   //   // _buildStartDateField_mobile(context);
                              //   // },
                              //   color: Colors.green,
                              //   onPressed: () {},
                              // ),
                            ],
                          ),
                        ),
                        Dimens.boxHeight20,

                        ///
                        SizedBox(
                          height: 60,
                          child: CustomAppBar(
                            title: 'Escalation Matrix List'.tr,
                            action: Row(
                              children: [
                                Dimens.boxWidth10,
                                ActionButton(
                                  icon: Icons.add,
                                  label: 'Add Escalation Matrix',
                                  onPressed: () {
                                    Get.toNamed(
                                        Routes.addEscalatiomMatrixContentWeb);
                                  },
                                  color: ColorValues.addNewColor,
                                ),
                                Dimens.boxWidth10,
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              margin: EdgeInsets.only(left: 10),
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appLightBlueColor,
                                onPressed: () {},
                                text: 'columnVisibility'.tr,
                              ),
                            ),
                            Container(
                              height: 35,
                              margin: EdgeInsets.only(left: 10),
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appLightBlueColor,
                                onPressed: () {},
                                text: 'Copy'.tr,
                              ),
                            ),
                            Container(
                              height: 35,
                              margin: EdgeInsets.only(left: 10),
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appLightBlueColor,
                                onPressed: () {},
                                text: 'Excel'.tr,
                              ),
                            ),
                            Container(
                              height: 35,
                              margin: EdgeInsets.only(left: 10),
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appLightBlueColor,
                                onPressed: () {},
                                text: 'PDF'.tr,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 200,
                              height: 40,
                              margin: Dimens.edgeInsets0_0_16_0,
                              child: TextField(
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 16.0,
                                      height: 1.0,
                                      color: Colors.black),
                                ),
                                onChanged: ((value) => controller.search(value)),
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                  contentPadding: Dimens.edgeInsets10_0_0_0,
                                  hintText: 'search'.tr,
                                  hintStyle: Styles.grey12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Expanded(
                            child: Obx(() => DataTable2(
                                  key: UniqueKey(),
                                  dataRowHeight: 50,
                                  columnSpacing: 10,
                                  border: TableBorder.all(
                                      color: ColorValues.createdColor),
                                  columns: [
                                    DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          "Sr No.",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    DataColumn2(
                                        label: Text(
                                      "Module Name",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn2(
                                        label: Text(
                                      "Status",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          "No of matrices",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          "Action",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                  rows: List<DataRow>.generate(
                                      controller.matrixlist.length, (index) {
                                    var item = controller.matrixlist[index];
                                    return DataRow(cells: [
                                      DataCell(Text(
                                          (index + 1).toString())), // Sr No.
                                      DataCell(Text(item.moduleName ??
                                          "")), // Module Name
                                      DataCell(Text(
                                          item.statusName ?? "")), // Status
                                      DataCell(Text(
                                          item.escalation?.length.toString() ??
                                              "0")), // No of matrices
                                      DataCell(Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TableActionButton(
                                              color:
                                                  ColorValues.appDarkBlueColor,
                                              icon: Icons.visibility,
                                              message: 'View',
                                              onPress: () {
                                                controller.viewEscalationMatrix(
                                                    id: 0);
                                                // print('record:${int.tryParse('${record[0]}')}');
                                              }),
                                          TableActionButton(
                                            color: ColorValues.appYellowColor,
                                            icon: Icons.edit,
                                            message: 'Edit',
                                            onPress: () {
                                              // controller.editIncidentReport(id: int.tryParse('${record[0]}'));
                                              // print('edit record:${int.tryParse('${record[0]}')}');
                                            },
                                          ),
                                          TableActionButton(
                                            color: Colors.red,
                                            icon: Icons.delete,
                                            message: 'Delete',
                                            onPress: () {
                                              // Get.dialog(IncidentReportRejectDialog(id: record[0]));
                                              // controller.viewNewPermitList(permitId: int.tryParse(_newPermitList[0]));
                                            },
                                          )
                                        ],
                                      )), // Action
                                    ]);
                                  }),
                                )))
                      ])),
                ),
              ],
            ),
          );
        });
  }
}
