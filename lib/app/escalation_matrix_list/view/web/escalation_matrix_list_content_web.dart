import 'package:cmms/app/app.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

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
                                child:
                                    Text(" / MASTER", style: Styles.greyLight14),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 450),
                              child: Container(
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
                            ),
                          ],
                        ),
            
                        ///
            
                        Expanded(
                          child: Container(
                            child: GetBuilder<EscalationMatrixListController>(
                                id: 'escalator_matrix_list',
                                builder: (controller) {
                                  return //
                                      Column(children: [
                                    ///
            
                                    Expanded(
                                      child: ScrollableTableView(
                                        // paginationController: controller
                                        //     .paginationEscalationMatrixController,
                                        columns: [
                                          'Module',
                                          'Status',
                                          'action'.tr,
                                        ].map((column) {
                                          return TableViewColumn(
                                            minWidth: Get.width * 0.27,
                                            label: column,
                                          );
                                        }).toList(),
                                        rows: [
                                          // ...List.generate(
                                          //   controller
                                          //       .incidentReportList.length,
                                          //   (index) => [
                                          //     // AssetName(
            
                                          //     //    '${controller.warrantyClaimList[index].wc_id}',
                                          //     //   // 'dummy data',
                                          //     //   1,
                                          //     // ),
                                          //     // index + 1,
                                          //     '${controller.incidentReportList[index].id}',
                                          //     '${controller.incidentReportList[index].description}',
                                          //     '${controller.incidentReportList[index].equipment_name}',
                                          //     '${controller.incidentReportList[index].approved_by}',
                                          //     '${controller.incidentReportList[index].approved_at}',
                                          //     '${controller.incidentReportList[index].block_name}',
                                          //     '${controller.incidentReportList[index].created_at}',
                                          //     '${controller.incidentReportList[index].status}',
                                          //     'Actions'
                                          //   ],
                                          // ),
                                          ["Job", "Created", "Actions"],
                                          ["Job", "Assigned", "Actions"],
                                          ["Job", "Linked", "Actions"],
                                          ["Job Card", "Approved", "Actions"],
                                          ["Incident", "Linked", "Actions"],
                                          ["Job", "Created", "Actions"]
                                        ].map(
                                          (record) {
                                            return TableViewRow(
                                              height: Get.height * 0.08,
                                              onTap: () {},
                                              cells: record.map(
                                                (value) {
                                                  return TableViewCell(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            'incidentreportiddata:$value');
                                                        // controller.viewIncidentReport(
                                                        //     id: int.tryParse(
                                                        //         '${record[0]}'));
                                                      },
                                                      child: value == 'Actions'
                                                          ? Wrap(
                                                              children: [
                                                                Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      TableActionButton(
                                                                        color: ColorValues
                                                                            .appDarkBlueColor,
                                                                        icon: Icons
                                                                            .visibility,
                                                                        message:
                                                                            'View',
                                                                        onPress:
                                                                            () {
                                                                          controller.viewEscalationMatrix(
                                                                              id: 0);
                                                                          // print('record:${int.tryParse('${record[0]}')}');
                                                                        },
                                                                      ),
                                                                      //),
            
                                                                      TableActionButton(
                                                                        color: ColorValues
                                                                            .appYellowColor,
                                                                        icon: Icons
                                                                            .edit,
                                                                        message:
                                                                            'Edit',
                                                                        onPress:
                                                                            () {
                                                                          // controller.editIncidentReport(id: int.tryParse('${record[0]}'));
                                                                          // print('edit record:${int.tryParse('${record[0]}')}');
                                                                        },
                                                                      ),
            
                                                                      TableActionButton(
                                                                        color: Colors
                                                                            .red,
                                                                        icon: Icons
                                                                            .delete,
                                                                        message:
                                                                            'Delete',
                                                                        onPress:
                                                                            () {
                                                                          // Get.dialog(IncidentReportRejectDialog(id: record[0]));
                                                                          // controller.viewNewPermitList(permitId: int.tryParse(_newPermitList[0]));
                                                                        },
                                                                      ),
            
                                                                      //),
            
                                                                      // TableActionButton(
                                                                      //   color: Colors.red,
                                                                      //   icon:
                                                                      //       Icons.delete,
                                                                      //   label: 'Delete',
                                                                      //   onPress: () {},
                                                                      // ),
                                                                      //),
                                                                    ]),
            
                                                                // TableActionButton(
                                                                //   color: Colors.green,
                                                                //   icon: Icons
                                                                //       .visibility,
                                                                //   label:
                                                                //       'Approve Request',
                                                                //   onPress: () {},
                                                                // ),
                                                                // TableActionButton(
                                                                //   color: Colors.red,
                                                                //   icon: Icons
                                                                //       .visibility,
                                                                //   label:
                                                                //       'Reject Request',
                                                                //   onPress: () {},
                                                                // ),
                                                              ],
                                                            )
                                                          : Text(
                                                              value.toString()),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
            
                                    // paginated
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: ValueListenableBuilder(
                                            valueListenable: controller
                                                .paginationEscalationMatrixController,
                                            builder: (context, value, child) {
                                              return Row(
                                                children: [
                                                  Text(
                                                      "${controller.paginationEscalationMatrixController.currentPage}  of ${controller.paginationEscalationMatrixController.pageCount}"),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                        onPressed: controller
                                                                    .paginationEscalationMatrixController
                                                                    .currentPage <=
                                                                1
                                                            ? null
                                                            : () {
                                                                controller
                                                                    .paginationEscalationMatrixController
                                                                    .previous();
                                                              },
                                                        iconSize: 20,
                                                        splashRadius: 20,
                                                        icon: Icon(
                                                          Icons
                                                              .arrow_back_ios_new_rounded,
                                                          color: controller
                                                                      .paginationEscalationMatrixController
                                                                      .currentPage <=
                                                                  1
                                                              ? Colors.black26
                                                              : Theme.of(context)
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: controller
                                                                    .paginationEscalationMatrixController
                                                                    .currentPage >=
                                                                controller
                                                                    .paginationEscalationMatrixController
                                                                    .pageCount
                                                            ? null
                                                            : () {
                                                                controller
                                                                    .paginationEscalationMatrixController
                                                                    .next();
                                                              },
                                                        iconSize: 20,
                                                        splashRadius: 20,
                                                        icon: Icon(
                                                          Icons
                                                              .arrow_forward_ios_rounded,
                                                          color: controller
                                                                      .paginationEscalationMatrixController
                                                                      .currentPage >=
                                                                  controller
                                                                      .paginationEscalationMatrixController
                                                                      .pageCount
                                                              ? Colors.black26
                                                              : Theme.of(context)
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            }),
                                      ),
                                    ),
            
                                    ///
                                  ]);
            
                                  //);
                                }),
                          ),
                        ),
                      ])),
                ),
              ],
            ),
          );
        });
  }
}
