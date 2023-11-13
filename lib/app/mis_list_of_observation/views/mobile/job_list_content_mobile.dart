import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../observation_list_controller.dart';

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
            Obx(
          () => //
              Column(
            children: [
              Expanded(
                child: //
                    ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        itemCount: 1,
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
                                                child: Text(
                                                  'Month Of Observation',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    // color: JobStatusData
                                                    //     .getStatusColor(
                                                    //         _statusString),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'gfhg',
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
                                              'gfhg',
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
                                              'gfhg',
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
                                              'gfhg',
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
                                              'gfhg',
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
                                                child: Text('gfhg'),
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
                                              'gfhg',
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
