import 'package:cmms/app/theme/colors_value.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatelessWidget {
  CardWidget({Key? key, this.jobModel}) : super(key: key);

  final JobModel? jobModel;

  @override
  Widget build(BuildContext context) {
    ///
    var status = jobModel?.status?.name.toString() ?? '';

    ///
    return Container(
      child: Card(
        color: Colors.lightBlue.shade50,
        elevation: 10,
        shadowColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              //
              children: [
                Row(
                    //
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Job${jobModel?.id ?? 0}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorsValue.navyBlueColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (status.toLowerCase() == "created")
                                ? Color(0xff58c3ca)
                                : (status.toLowerCase() == "assigned")
                                    ? Color(0xff58c352)
                                    : (status.toLowerCase() == "linked")
                                        ? Color(0xff787099)
                                        : (status.toLowerCase() ==
                                                "in progress")
                                            ? Color(0xffbf8c4b)
                                            : (status.toLowerCase() == "closed")
                                                ? Color(0xff3438cd)
                                                : (status.toLowerCase() ==
                                                        "cancelled")
                                                    ? Color(0xffbf4844)
                                                    : Color.fromARGB(
                                                        255, 227, 223, 108),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Center(
                            child: Text(
                              status,
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
                        color: ColorsValue.blackColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${jobModel?.assignedToName ?? 'Unassigned'}',
                      style: const TextStyle(
                        color: ColorsValue.blackColor,
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
                        color: Color.fromARGB(255, 239, 87, 27),
                      ),
                    ),
                  )
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Plant name: ',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Text(jobModel?.facilityName ?? ''),
                      ),
                    ]),
                Row(//
                    children: [
                  Expanded(
                    child: Text(
                      'Breakdown Time: ',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      (jobModel?.breakdownTime != null)
                          ? DateFormat('dd-MMM-yyyy hh:mm')
                              .format(jobModel!.breakdownTime!)
                          : '',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ]),
              ]),
        ),
      ),
    );
  }

  ///
}
