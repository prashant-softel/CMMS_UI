// import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_escalation_matrix/view_escalation_matrix_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ViewEscalationMatrixContentWeb
    extends GetView<ViewEscalationMatrixController> {
  ViewEscalationMatrixContentWeb({super.key});
  @override
  Widget build(BuildContext context) => SelectionArea(
        child: Scaffold(
          body: SingleChildScrollView(
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
                          "Dashboard",
                          style: Styles.greyLight14,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed(Routes.escalationMatrixListWeb);
                        },
                        child: Text(" / Escalation Matrix List",
                            style: Styles.greyMediumLight12),
                      ),
                      Text(" / View Escalation Matrix",
                          style: Styles.greyMediumLight12)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1,
                  child: Card(
                    color: Colors.lightBlue.shade50,
                    child: Wrap(
                      children: [
                        GetBuilder<ViewEscalationMatrixController>(
                          id: 'escalation-matrix',
                          builder: (controller) {
                            return Column(
                              children: [
                                CustomAppBar(
                                  title: 'View Escalation Matrix'.tr,
                                ),
                                Dimens.boxHeight20,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomRichText(title: 'Module'),
                                    Dimens.boxWidth5,
                                    Text(
                                      'JOB',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 5, 92, 163),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Dimens.boxWidth30,
                                    CustomRichText(title: 'Status'),
                                    Dimens.boxWidth5,
                                    Text(
                                      'CREATED',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 5, 92, 163),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight50,
                                SizedBox(
                                  height: 400,
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Column(
                                    children: [
                                      CustomAppBar(
                                        title: 'Escalation Levels',
                                      ),
                                      Container(
                                        height: 300,
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
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: ScrollableTableView(
                                          columns: [
                                            "Sr. No.",
                                            "Duration (Days)",
                                            "Escalation Level and Role",
                                          ].map((column) {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width * 0.22,
                                            );
                                          }).toList(),
                                          rows: [
                                            [
                                              "1",
                                              "2",
                                              "Site Engineer",
                                            ],
                                            [
                                              "2",
                                              "4",
                                              "Site in Charge",
                                            ],
                                            [
                                              "3",
                                              "6",
                                              "Plant Manager",
                                            ],
                                            [
                                              "4",
                                              "8",
                                              "Zonal in Charge",
                                            ],
                                            [
                                              "5",
                                              "10",
                                              "Portfolio Head",
                                            ],
                                          ].map(
                                            (record) {
                                              return TableViewRow(
                                                height: 60,
                                                cells: record.map(
                                                  (value) {
                                                    return TableViewCell(
                                                      child: value == "Action"
                                                          ? TableActionButton(
                                                              color: ColorValues
                                                                  .appDarkBlueColor,
                                                              icon: Icons
                                                                  .remove_red_eye_outlined,
                                                              message:
                                                                  'View/Edit',
                                                              onPress: () {},
                                                            )
                                                          : Text(value),
                                                    );
                                                  },
                                                ).toList(),
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      height: 28,
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appGreenColor,
                                        text: "Edit",
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
