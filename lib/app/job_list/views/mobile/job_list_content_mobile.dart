import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../job_list_controller.dart';

class JobListContentMobile extends GetView<JobListController> {
  JobListContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Obx(
          () => Column(
            children: [
              Dimens.boxHeight10,
              HeaderWidgetMobile(),
              Dimens.boxHeight10,
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.jobList != null
                        ? controller.jobList.length
                        : 0,
                    itemBuilder: (context, index) {
                      final jobModel = (controller.jobList != null)
                          ? controller.jobList[index]
                          : JobModel();
                      // var _statusString =
                      //     JobStatusData.getStatusStringFromStatusEnumValue(
                      //         jobModel?.status);

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
                                              'Job Id : ${jobModel?.id ?? 0}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    ColorValues.navyBlueColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // color: JobStatusData
                                                //     .getStatusColor(
                                                //         _statusString),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 5,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${jobModel?.latestJCStatus ?? 'Unassigned'}',
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
                                            fontWeight: FontWeight.bold,
                                            color: ColorValues.navyBlueColor,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Row(//
                                        children: [
                                      Expanded(
                                        child: Text(
                                          'Job Title: ',
                                          style: const TextStyle(
                                            color: ColorValues.blackColor,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          jobModel?.name ?? '',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorValues.navyBlueColor,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Row(children: [
                                      Expanded(
                                        child: Text(
                                          'Work Description: ',
                                          style: const TextStyle(
                                            color: ColorValues.blackColor,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          jobModel?.description ?? '',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorValues.navyBlueColor,
                                          ),
                                        ),
                                      )
                                    ]),
                                    Row(//
                                        children: [
                                      Expanded(
                                        child: Text(
                                          'Work Area: ',
                                          style: const TextStyle(
                                            color: ColorValues.blackColor,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          jobModel?.workingArea ?? '',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorValues.navyBlueColor,
                                          ),
                                        ),
                                      )
                                    ]),
                                    Row(
                                        //
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Plant name: ',
                                              style: TextStyle(
                                                color: ColorValues.blackColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              jobModel?.facilityName ?? '',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    ColorValues.navyBlueColor,
                                              ),
                                            ),
                                          ),
                                        ]),
                                    Row(//
                                        children: [
                                      Expanded(
                                        child: Text(
                                          'Breakdown Time: ',
                                          style: TextStyle(
                                            color: ColorValues.blackColor,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          (jobModel?.breakdownTime != null)
                                              ? DateFormat('dd-MMM-yyyy hh:mm')
                                                  .format(
                                                      jobModel!.breakdownTime!)
                                              : '',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorValues.navyBlueColor,
                                          ),
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
