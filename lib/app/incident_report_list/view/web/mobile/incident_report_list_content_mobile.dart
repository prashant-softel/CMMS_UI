import 'package:cmms/app/app.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_controller.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncidentReportListMobile extends GetView<IncidentReportListController> {
  IncidentReportListMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IncidentReportListController>(
      id: 'stock_Mangement_Date',
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Dimens.boxHeight10,
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.15,
                          child: TextField(
                            style: TextStyle(
                              fontSize: 15.0,
                              height: 0.2,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 20, left: 20),
                              hintText: 'Search',
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.filter_alt,
                          size: 40,
                          color: ColorValues.appDarkGreyColor,
                        ),
                        // Icon(
                        //   Icons.plus_one_sharp,
                        //   color: ColorValues.appDarkGreyColor,
                        // )
                      ],
                    ),
                  ),
                  Dimens.boxHeight10,
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        itemCount: controller.incidentReportList != null
                            ? controller.incidentReportList.length
                            : 0,
                        itemBuilder: (context, index) {
                          final incidentReportListModel =
                              (controller.incidentReportList != null)
                                  ? controller.incidentReportList[index]
                                  : IncidentReportListModel();
                          return GestureDetector(
                            onTap: () {
                              // var _jobId = jobModel?.id ?? 0;
                              // controller.goToJobDetailsScreen(_jobId);
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: Card(
                                color: Colors.lightBlue.shade50,
                                elevation: 10,
                                shadowColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ///start date: 2023-07-01, End date: 2023-12-31
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Incident : ',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                'Date of Observation :',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                'Contractor Name  : ',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                'Location of Observation:',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                'Type of Observation:',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                'Source of Observation:',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                'Risk Type:',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                'Contact Number:',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                'Target Date:',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                'Closer Date:',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                'Cost type:',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              // Text(
                                              //   'Status:',
                                              //   style: TextStyle(color: Colors.grey),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${incidentReportListModel?.id}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "14-01-2024",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "Madhuban",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "UP",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "Unsafe Act",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "Source",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "Bad",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "8808000000",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "14-01-2024",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "14-01-2024",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "RS",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Done",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: ColorValues
                                                          .addNewColor),
                                                ),
                                                Dimens.boxWidth10,
                                                GestureDetector(
                                                    onTap: () {
                                                      // controller
                                                      //     .goToCreateObservation();
                                                    },
                                                    child: Icon(Icons.edit)),
                                              ],
                                            )
                                          ],
                                        )
                                        // Text(
                                        //   "Done",
                                        //   style: TextStyle(
                                        //       fontSize: 14,
                                        //       fontWeight: FontWeight.w600,
                                        //       color: ColorValues.addNewColor),
                                        // ),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
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
