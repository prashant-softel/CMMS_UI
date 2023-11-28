import 'package:cmms/app/app.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_controller.dart';
import 'package:cmms/app/view_incident_report/view_incident_report_controller.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewIncidentReportMobile extends GetView<ViewIncidentReportController> {
  ViewIncidentReportMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewIncidentReportController>(
      id: 'stock_Mangement_Date',
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Dimens.boxHeight10,
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: Colors.lightBlue.shade50,
                      elevation: 10,
                      shadowColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              width: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(color: Colors.green),
                                ],
                              ),
                              child: Center(
                                  child: Text(
                                '${controller.incidentReportDetailsModel.value?.status_short}',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Dimens.boxHeight20,
                            Text(
                              "${controller.incidentReportDetailsModel.value?.equipment_name}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: ColorValues.redColor),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Incident Id : ',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "${controller.incidentReportDetailsModel.value?.id}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight5,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Incident Description :',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "${controller.incidentReportDetailsModel.value?.description}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight5,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Plant Name: ',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "${controller.incidentReportDetailsModel.value?.block_name}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight5,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Incident date & Time:',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "${controller.incidentDateTimeCtrlrWeb.text}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight5,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Risk Type:',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "${controller.incidentReportDetailsModel.value?.risk_type_name}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight5,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Legal Applicability:',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "${controller.incidentReportDetailsModel.value?.legal_applicability_name}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight5,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Damaged Asset Cost:',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "${controller.incidentReportDetailsModel.value?.damaged_cost}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight5,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Insurance Available:',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "${controller.incidentReportDetailsModel.value?.insurance_name}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight5,
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Reporting Date & Time : ',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              "${controller.reportingDateTimeCtrlrWeb.text}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight5,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Action Taken Date & Time :',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              "${controller.actionTakenDateTimeCtrlrWeb.text}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight5,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Investigation Verified By: ',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              "${controller.incidentReportDetailsModel.value?.verified_by_name}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight5,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ESI Applicability:',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              "${controller.incidentReportDetailsModel.value?.esi_applicability_name}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight5,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'RCA Upload Required:',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              "${controller.incidentReportDetailsModel.value?.rca_required_name}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight5,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Gen. Loss:',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              "${controller.incidentReportDetailsModel.value?.generation_loss}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight5,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Insurance Status:',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              "${controller.incidentReportDetailsModel.value?.insurance_status_name}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight5,
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: ColorValues.navyBlueColor,
              child: Icon(
                Icons.add,
                color: ColorValues.whiteColor,
              ),
            ),
          );
        });
      },
    );
  }
}
