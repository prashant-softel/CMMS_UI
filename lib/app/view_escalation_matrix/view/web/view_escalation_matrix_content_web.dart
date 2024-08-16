import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_escalation_matrix/view_escalation_matrix_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewEscalationMatrixContentWeb
    extends GetView<ViewEscalationMatrixController> {
  ViewEscalationMatrixContentWeb({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
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
                    color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                    " / View Escalation Matrix".toUpperCase(),
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'View Escalation Matrix',
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomRichText(title: 'Module: '),
                          Dimens.boxWidth5,
                          Text(
                            '${controller.escalation_details.value?.module_name}',
                            style: TextStyle(
                              color: Color.fromARGB(255, 5, 92, 163),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Dimens.boxWidth30,
                          CustomRichText(title: 'Status: '),
                          Dimens.boxWidth5,
                          Text(
                            '${controller.status_escalation.value.status_name}',
                            style: TextStyle(
                              color: Color.fromARGB(255, 5, 92, 163),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Dimens.boxHeight15,
                      Container(
                        height: Get.height * .6,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomAppBar(
                                title: 'Escalation Levels',
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height:
                                    (controller.escalation_list.length * 40) +
                                        50,
                                child: DataTable2(
                                  border: TableBorder.all(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  dataRowHeight: 40,
                                  headingRowHeight: 50,
                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        "Sr. No.",
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "Duration (Days)",
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "Escalation Level and Role",
                                      ),
                                    ),
                                  ],
                                  rows: List.generate(
                                    controller.escalation_list.length,
                                    (index) => DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                            '${index + 1}',
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            '${controller.escalation_list[index].days}',
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            '${controller.escalation_list[index].role_name}',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 30,
                            child: CustomElevatedButton(
                              backgroundColor: ColorValues.appGreenColor,
                              text: "Edit",
                              onPressed: () {
                                controller.editEscalationMatrix(
                                  moudle_id: controller.escalation_details.value
                                          ?.module_id ??
                                      0,
                                  status_id: controller
                                          .status_escalation.value.status_id ??
                                      0,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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
