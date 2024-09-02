import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class LinkToPermitDialog extends GetView {
  String? approveIncidentReportData;
  String? data;
  int? taskId;
  int? permitId;
  String? activity;
  int? type;
  int? vegexid;
  int? vegplanId;
  LinkToPermitDialog(
      {super.key,
      this.approveIncidentReportData,
      this.data,
      this.taskId,
      this.activity,
      this.type,
      this.permitId,
      this.vegplanId,
      this.vegexid});
  final NewPermitController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          'Permit Linked Successfully....',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: 50,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  Center(
                    child: Text('${data}',
                        style: TextStyle(color: Colors.green),
                        textAlign: TextAlign.center),
                  ),
                  // SizedBox(height: 20,),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SizedBox(
                  //         width: 15,
                  //       ),
                  //       ElevatedButton(
                  //         style: Styles.greenElevatedButtonStyle,
                  //         onPressed: () => Get.offAllNamed(Routes.newPermit),
                  //         child: const Text('Permit List'),
                  //       ),
                  //       Dimens.boxWidth10,
                  //       ElevatedButton(
                  //         style: Styles.blueElevatedButtonStyle,
                  //         onPressed: () => Get.offAndToNamed(Routes.newPermitList),
                  //         child: const Text('View This Permit'),
                  //       ),
                  //       Dimens.boxWidth10,
                  //       // ElevatedButton(
                  //       //   style: Styles.redElevatedButtonStyle,
                  //       //   onPressed: () => Get.offAndToNamed(Routes.addJob),
                  //       //   child: const Text('Add New Job'),
                  //       // ),
                  //     ]),
                ]),
          );
        }),
        actions: [
          // Dimens.boxWidth10,
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                type == 3
                    ? ElevatedButton(
                        style: Styles.greenElevatedButtonStyle,
                        onPressed: () {
                          // _controller.getIncidentReportList(
                          //     _controller.facilityId,
                          //     _controller.formattedTodate,
                          //     _controller.formattedFromdate,
                          //     false);
                          //  Get.offAllNamed(Routes.createMrs, arguments: {"jcId": jcId![0]});
                          Get.back();
                          Get.offAllNamed(Routes.viewAuditTask,
                              arguments: {'auditTaskId': taskId, 'type': type});
                        },
                        child: const Text('View Audit'),
                      )
                    : type == 4
                        ? ElevatedButton(
                            style: Styles.greenElevatedButtonStyle,
                            onPressed: () {
                              // _controller.getIncidentReportList(
                              //     _controller.facilityId,
                              //     _controller.formattedTodate,
                              //     _controller.formattedFromdate,
                              //     false);
                              //  Get.offAllNamed(Routes.createMrs, arguments: {"jcId": jcId![0]});
                              Get.back();
                              Get.offAllNamed(
                                  Routes.addModuleCleaningExecutionContentWeb,
                                  arguments: {"mcid": taskId, "planId": 0});
                            },
                            child: const Text('View MC'),
                          )
                        : type == 5
                            ? ElevatedButton(
                                style: Styles.greenElevatedButtonStyle,
                                onPressed: () {
                                  // _controller.getIncidentReportList(
                                  //     _controller.facilityId,
                                  //     _controller.formattedTodate,
                                  //     _controller.formattedFromdate,
                                  //     false);
                                  //  Get.offAllNamed(Routes.createMrs, arguments: {"jcId": jcId![0]});
                                  Get.back();
                                  Get.offAllNamed(
                                    Routes.vegExecutionScreen,
                                    arguments: {
                                      "vegexe": vegexid,
                                      "vegid": vegplanId,
                                    },
                                  );
                                },
                                child: const Text('View VEG'),
                              )
                            : ElevatedButton(
                                style: Styles.greenElevatedButtonStyle,
                                onPressed: () {
                                  // _controller.getIncidentReportList(
                                  //     _controller.facilityId,
                                  //     _controller.formattedTodate,
                                  //     _controller.formattedFromdate,
                                  //     false);
                                  //  Get.offAllNamed(Routes.createMrs, arguments: {"jcId": jcId![0]});

                                  Get.offAllNamed(Routes.pmTaskView,
                                      arguments: {'pmTaskId': taskId});
                                  Get.back();
                                },
                                child: const Text('View Task'),
                              ),
                Dimens.boxWidth10,
                type == 3 || type == 4 || type == 5
                    ? Dimens.box0
                    : ElevatedButton(
                        style: Styles.yellowElevatedButtonStyle,
                        onPressed: () {
                          controller.clearStoreData();
                          controller.clearStoreTaskData();
                          controller.clearStoreTaskActivityData();
                          controller.clearStoreTasktoActorData();
                          controller.clearStoreTaskWhereUsedData();
                          controller.clearStoreTaskfromActorData();

                          // _controller.getIncidentReportList(
                          //     _controller.facilityId,
                          //     _controller.formattedTodate,
                          //     _controller.formattedFromdate,
                          //     false);
                          //  Get.offAllNamed(Routes.createMrs, arguments: {"jcId": jcId![0]});
                          Get.offAllNamed(Routes.createMrs, arguments: {
                            "whereUsedId": taskId,
                            "activity": activity,
                            "whereUsed": 27,
                            "type": type,
                            "fromActorTypeId": 2,
                            "to_actor_type_id": 3
                          });
                          Get.back();
                        },
                        child: const Text('Add Mrs'),
                      ),
                type == 3
                    ? ElevatedButton(
                        style: Styles.yellowElevatedButtonStyle,
                        onPressed: () {
                          // _controller.getIncidentReportList(
                          //     _controller.facilityId,
                          //     _controller.formattedTodate,
                          //     _controller.formattedFromdate,
                          //     false);
                          //  Get.offAllNamed(Routes.createMrs, arguments: {"jcId": jcId![0]});
                          Get.offAllNamed(Routes.auditTask,
                              arguments: {'type': type});
                          Get.back();
                        },
                        child: const Text('Audit list'),
                      )
                    : type == 4
                        ? ElevatedButton(
                            style: Styles.yellowElevatedButtonStyle,
                            onPressed: () {
                              // _controller.getIncidentReportList(
                              //     _controller.facilityId,
                              //     _controller.formattedTodate,
                              //     _controller.formattedFromdate,
                              //     false);
                              //  Get.offAllNamed(Routes.createMrs, arguments: {"jcId": jcId![0]});
                              Get.offAllNamed(
                                  Routes.moduleCleaningListExecution,
                                  arguments: {'type': type});
                              Get.back();
                            },
                            child: const Text('MC List'),
                          )
                        : type == 5
                            ? ElevatedButton(
                                style: Styles.yellowElevatedButtonStyle,
                                onPressed: () {
                                  // _controller.getIncidentReportList(
                                  //     _controller.facilityId,
                                  //     _controller.formattedTodate,
                                  //     _controller.formattedFromdate,
                                  //     false);
                                  //  Get.offAllNamed(Routes.createMrs, arguments: {"jcId": jcId![0]});
                                  Get.offAllNamed(Routes.vegExecutionListScreen,
                                      arguments: {'type': type});
                                  Get.back();
                                },
                                child: const Text('VEG List'),
                              )
                            : Dimens.box0,
                Dimens.boxWidth10,
                ElevatedButton(
                  style: Styles.blueElevatedButtonStyle,
                  onPressed: () {
                    controller.clearStoreData();
                    controller.clearTypeStoreData();
                    // _controller.getIncidentReportList(
                    //     _controller.facilityId,
                    //     _controller.formattedTodate,
                    //     _controller.formattedFromdate,
                    //     false);
                    //  Get.offAllNamed(Routes.createMrs, arguments: {"jcId": jcId![0]});
                    Get.offAllNamed(Routes.viewPermitScreen,
                        arguments: {"permitId": permitId, "type": type});

                    Get.back();
                  },
                  child: const Text('View Permit'),
                ),
                Spacer()
              ],
            ),
          ),
        ],
      );
    }));
  }
}
