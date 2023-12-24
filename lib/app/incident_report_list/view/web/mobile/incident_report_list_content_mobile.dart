import 'package:cmms/app/app.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_controller.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16.0,
                                  height: 1.0,
                                  color: Colors.black),
                            ),
                            onChanged: (value) => controller.search(value),
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
                              controller.viewIncidentReport(
                                  id: incidentReportListModel?.id);
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
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Id : ',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              'Block Name :',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              'Reported At: ',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              'Reported By:',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxWidth20,
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
                                              "${incidentReportListModel?.block_name}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "${incidentReportListModel?.reported_at}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "${incidentReportListModel?.reported_by_name}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 20,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    // border: Border.all(
                                                    //   color: Colors.blue,
                                                    //   width: 1,
                                                    // ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.green),
                                                    ],
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    '${incidentReportListModel?.status}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                                ),
                                                // Dimens.boxWidth10,
                                                // GestureDetector(
                                                //     onTap: () {
                                                //       // controller
                                                //       //     .goToCreateObservation();
                                                //     },
                                                //     child: Icon(Icons.edit)),
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
