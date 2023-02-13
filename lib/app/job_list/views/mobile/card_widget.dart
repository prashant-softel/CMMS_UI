import 'package:cmms/app/theme/colors_value.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatelessWidget {
  CardWidget({Key? key, required this.jobModel}) : super(key: key);

  final JobModel? jobModel;

  @override
  Widget build(BuildContext context) => Container(
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
                            'Current Status: ',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 11, 178, 20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Center(
                              child: Text(
                                'Assigned',
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
                          child: Text(jobModel?.plantName ?? ''),
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
                        DateFormat('dd-MMM-yyyy hh:mm')
                            .format(jobModel?.breakdownTime ?? DateTime.now()),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ]),
                ]),
          ),
        ),
      );

  ///
}
