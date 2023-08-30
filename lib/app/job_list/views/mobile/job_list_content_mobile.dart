import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../job_list_controller.dart';

class JobListContentMobile extends GetView<JobListController> {
  JobListContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return //
        Scaffold(
      //
      body: //
          Container(
        child: //
            Obx(
          () => //
              Column(
            children: [
              Expanded(
                child: //
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.jobList != null
                            ? controller.jobList.length
                            : 0,
                        itemBuilder: (context, index) {
                          final jobModel = (controller.jobList != null)
                              ? controller.jobList[index]
                              : JobModel();
                          var _statusString =
                              JobStatusData.getStatusStringFromStatusEnumValue(
                                  jobModel?.status);

                          return GestureDetector(
                            onTap: () {
                              var _jobId = jobModel?.id ?? 0;
                              controller.goToJobDetailsScreen(_jobId);
                            },
                            child: //
                                SizedBox(
                              width: double.infinity,
                              child: //
                                  Card(
                                color: Colors.lightBlue.shade50,
                                elevation: 10,
                                shadowColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: //
                                    Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: //
                                      Column(
                                          //
                                          children: [
                                        Row(
                                            //
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Job${jobModel?.id ?? 0}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: JobStatusData
                                                        .getStatusColor(
                                                            _statusString),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      _statusString,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                        Row(children: [
                                          Expanded(
                                            child: Text(
                                              'Assigned To: ',
                                              style: const TextStyle(
                                                color: ColorValues.blackColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${jobModel?.assignedToName ?? 'Unassigned'}',
                                              style: const TextStyle(
                                                color: ColorValues.blackColor,
                                              ),
                                            ),
                                          ),
                                        ]),
                                        Row(//
                                            children: [
                                          Expanded(
                                            child: Text(
                                              jobModel?.jobDetails ?? '',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 239, 87, 27),
                                              ),
                                            ),
                                          ),
                                        ]),
                                        Row(//
                                            children: [
                                          Expanded(
                                            child: Text(
                                              jobModel?.description ?? '',
                                              style: const TextStyle(),
                                            ),
                                          )
                                        ]),
                                        Row(//
                                            children: [
                                          Expanded(
                                            child: Text(
                                              'Work Area: ',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              jobModel?.workingArea ?? '',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ]),
                                        Row(
                                            //
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Plant name: ',
                                                style: TextStyle(
                                                  color: Colors.blue.shade900,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                    jobModel?.facilityName ??
                                                        ''),
                                              ),
                                            ]),
                                        Row(//
                                            children: [
                                          Expanded(
                                            child: Text(
                                              'Breakdown Time: ',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              (jobModel?.breakdownTime != null)
                                                  ? DateFormat(
                                                          'dd-MMM-yyyy hh:mm')
                                                      .format(jobModel!
                                                          .breakdownTime!)
                                                  : '',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ]),
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
      ),
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToAddJobScreen(),
        backgroundColor: ColorValues.navyBlueColor,
        child: //
            Icon(
          Icons.add,
          color: ColorValues.whiteColor,
        ),
      ),
    );
  }

  ///
}
