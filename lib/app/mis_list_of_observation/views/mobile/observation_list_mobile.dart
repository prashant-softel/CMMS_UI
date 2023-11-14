import 'package:cmms/app/app.dart';
import 'package:cmms/app/mis_list_of_observation/observation_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObservationListMobile extends GetView<ObservationListController> {
  ObservationListMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return //
        Scaffold(
      //
      body: //
          Container(
        child: //

            Column(
          children: [
            Expanded(
              child: //
                  ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          // onTap: () {
                          //   var _jobId = jobModel?.id ?? 0;
                          //   controller.goToJobDetailsScreen(_jobId);
                          // },
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
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Month Of Observation : ',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                  ' Date of Observation :',
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
                                                //   style: TextStyle(
                                                //       color: Colors.grey),
                                                // ),
                                              ],
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
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "April",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "14-01-2024",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Madhuban",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "UP",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Unsafe Act",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Source",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Bad",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "8808000000",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "14-01-2024",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "14-01-2024",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      "RS",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
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
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
