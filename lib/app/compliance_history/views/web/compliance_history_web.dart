import 'package:cmms/app/compliance_history/compliance_history_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/color_values.dart';
import '../../../theme/styles.dart';

class ComplianceHistoryWeb extends GetView<ComplianceHistoryController> {
  ComplianceHistoryWeb({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          color: Color.fromARGB(255, 234, 236, 238),
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              HeaderWidget(),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 227, 224, 224),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                        controller.clearStoreData();
                        Get.offNamed(Routes.statutory);
                      },
                      child: Text(" / STATUTORY", style: Styles.greyLight14),
                    ),
                    Text(
                      " / COMPLIANCE HISTORY",
                      style: Styles.greyLight14,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: Get.width * 7,
                  margin: EdgeInsets.only(right: 10, left: 10, top: 20),
                  height: Get.height,
                  child: Card(
                    color: Color.fromARGB(255, 251, 252, 253),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                "COMPLIANCE HISTORY",
                                style: Styles.blackBold16,
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: Dimens.edgeInsets20,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorValues.lightGreyColorWithOpacity35,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ColorValues.appBlueBackgroundColor,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "${controller.complicance_name.value}",
                                      style: Styles.blue700,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              DataTable(
                                border: TableBorder.all(
                                  color: Color.fromARGB(255, 206, 229, 234),
                                ),
                                columns: [
                                  DataColumn(
                                    label: Text(
                                      "Id",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Facility ",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Start Date",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "End Date",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Created At",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Current Status",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Updated By",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Updated At",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  controller.historyStatutory.length,
                                  (index) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                          controller.historyStatutory[index].id
                                              .toString(),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          controller.historyStatutory[index]
                                                  .facility_name ??
                                              "",
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          controller.historyStatutory[index]
                                                  .start_date ??
                                              "",
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          controller.historyStatutory[index]
                                                  .end_date ??
                                              "",
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          controller.historyStatutory[index]
                                                  .created_at ??
                                              "",
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          controller.historyStatutory[index]
                                                  .current_status_short ??
                                              "",
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          controller.historyStatutory[index]
                                                  .updated_by ??
                                              "",
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          controller.historyStatutory[index]
                                                  .updated_at ??
                                              "",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
          ),
        ),
      ),
    );
  }
}
