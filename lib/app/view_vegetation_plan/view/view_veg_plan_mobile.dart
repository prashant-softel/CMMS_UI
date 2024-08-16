import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_mc_plan/view/mc_equipment_bottomsheet.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/mc_approve_dialog.dart';
import 'package:cmms/app/widgets/mc_reject_dialog.dart';
import 'package:cmms/app/widgets/veg_approve_dialog.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:cmms/app/view_vegetation_plan/view_veg_plan_controller.dart";

class ViewVegPlanMobile extends StatefulWidget {
  const ViewVegPlanMobile({Key? key}) : super(key: key);

  @override
  _ViewVegPlanMobileState createState() => _ViewVegPlanMobileState();
}

class _ViewVegPlanMobileState extends State<ViewVegPlanMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewVegPlanController>(
      id: "view-vegetation-plan-mobile",
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: <Widget>[
                  Dimens.boxHeight5,
                  HeaderWidgetMobile(),
                  Padding(
                    padding: Dimens.edgeInsets10,
                    child: (controller.vegPlanDetailsModel.value != null)
                        ? SingleChildScrollView(
                            child: Container(
                              height: Get.height,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            JobDetailField(
                                              title: 'Plan ID: ',
                                              value:
                                                  "${controller.vegPlanDetailsModel.value?.planId}",
                                            ),
                                            JobDetailField(
                                              title: 'Site Name: ',
                                              value:
                                                  "${controller.vegPlanDetailsModel.value?.siteName}",
                                            ),
                                            JobDetailField(
                                              title: 'Planning Date & Time',
                                              value:
                                                  "${controller.vegPlanDetailsModel.value?.createdAt}",
                                            ),
                                            JobDetailField(
                                              title: 'Frequency: ',
                                              value:
                                                  "${controller.vegPlanDetailsModel.value?.frequency}",
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            JobDetailField(
                                              title: 'Plan Name: ',
                                              value:
                                                  "${controller.vegPlanDetailsModel.value?.title}",
                                            ),
                                            JobDetailField(
                                              title: 'Planned By: ',
                                              value:
                                                  "${controller.vegPlanDetailsModel.value?.createdBy}",
                                            ),
                                            JobDetailField(
                                              title: 'Assigned To: ',
                                              value:
                                                  "${controller.vegPlanDetailsModel.value?.assignedTo}",
                                            ),
                                            JobDetailField(
                                              title: 'Status: ',
                                              value:
                                                  "${controller.vegPlanDetailsModel.value?.statusShort}",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Dimens.boxHeight10,
                                  Row(
                                    children: [
                                      Text(
                                        "Schedule",
                                        style: Styles.blue700,
                                      ),
                                      Spacer(),
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     var selectedEqp = [];
                                      //     controller.vegPlanDetailsModel.value
                                      //         ?.schedules
                                      //         .forEach((schedule) {
                                      //       schedule.equipments
                                      //           ?.forEach((element) {
                                      //         var ee = element;
                                      //         ee!.cleaningDay =
                                      //             schedule.cleaningDay;
                                      //         ;
                                      //         selectedEqp.add(element);
                                      //         print(element?.toJson());
                                      //       });
                                      //     });
                                      //     selectedEqp.forEach((element) {
                                      //       try {
                                      //         var selectedParentIndex =
                                      //             controller.equipmentList.value
                                      //                 .indexWhere((eqp) =>
                                      //                     eqp?.invId ==
                                      //                     element.parentId);
                                      //         print({
                                      //           "selectedParentIndex":
                                      //               selectedParentIndex
                                      //         });
                                      //         if (selectedParentIndex > -1) {
                                      //           var selectedChildIndex = controller
                                      //                   .equipmentList
                                      //                   .value[
                                      //                       selectedParentIndex]
                                      //                   ?.smbs
                                      //                   .indexWhere((smb) =>
                                      //                       smb.smbId ==
                                      //                       element.id) ??
                                      //               -1;

                                      //           if (selectedChildIndex > -1) {
                                      //             var ss = controller
                                      //                 .equipmentList
                                      //                 .value[
                                      //                     selectedParentIndex]
                                      //                 ?.smbs[selectedChildIndex];
                                      //             ss?.selectedDay =
                                      //                 "${element.cleaningDay}";
                                      //             controller
                                      //                     .equipmentList
                                      //                     .value[
                                      //                         selectedParentIndex]
                                      //                     ?.smbs[
                                      //                 selectedChildIndex] = ss!;
                                      //           }
                                      //           print({
                                      //             "selectedChildIndex":
                                      //                 selectedChildIndex
                                      //           });
                                      //         }
                                      //       } catch (e) {
                                      //         print({"eadfds": e});
                                      //       }
                                      //     });
                                      //     // controller
                                      //     //     .equipmentList
                                      //     //     .value
                                      //     //     .forEach(
                                      //     //         (element) {

                                      //     //         });

                                      //     // print(
                                      //     //     'MC plan Detail:${controller.schedules.toJson()}');
                                      //     Get.dialog(ViewSetEquipmentDialog(
                                      //       estimateDurationDays: int.tryParse(
                                      //           '${controller.durationInDayCtrlr.text}'),
                                      //     ));
                                      //   },
                                      //   // color: ColorValues.appDarkBlueColor,
                                      //   // onTap: () {
                                      //   //   controller.addRowItem();
                                      //   // },
                                      //   child: Container(
                                      //     height: 30,
                                      //     // width: 150,
                                      //     decoration: BoxDecoration(
                                      //       color: ColorValues.addNewColor,
                                      //       border: Border.all(
                                      //         color: ColorValues
                                      //             .lightGreyColorWithOpacity35,
                                      //         width: 1,
                                      //       ),
                                      //       borderRadius: BorderRadius.all(
                                      //           Radius.circular(5)),
                                      //     ),
                                      //     child: Center(
                                      //       child: Padding(
                                      //         padding: const EdgeInsets.only(
                                      //             left: 8.0, right: 8.0),
                                      //         child: Text(
                                      //           "Set Equipments",
                                      //           style: TextStyle(
                                      //               fontSize: 13,
                                      //               fontWeight: FontWeight.w100,
                                      //               color: Colors.white),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.vegPlanDetailsModel
                                        .value?.schedules!.length,
                                    itemBuilder: (context, index) {
                                      final scheduleModel = controller
                                          .vegPlanDetailsModel
                                          .value
                                          ?.schedules![index];
                                      return InkWell(
                                        onTap: () {
                                          controller.selectedSchedules =
                                              scheduleModel;
                                          if (controller.selectedSchedules !=
                                              null) {
                                            showModalBottomSheet<void>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return McEquipmentBottomsheet();
                                              },
                                            );
                                          }
                                        },
                                        child: Card(
                                          color: Colors.lightBlue.shade50,
                                          elevation: 10,
                                          shadowColor: Colors.black87,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Day: ',
                                                      style:
                                                          Styles.appDarkGrey12,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        '${scheduleModel?.cleaningDay}'
                                                        '',
                                                        style: Styles
                                                            .appDarkBlue12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  //
                                                  children: [
                                                    Text(
                                                      'No Of Inverters: ',
                                                      style:
                                                          Styles.appDarkGrey12,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        scheduleModel?.invs
                                                                .toString() ??
                                                            '',
                                                        style: Styles
                                                            .appDarkBlue12,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  //
                                                  children: [
                                                    Text(
                                                      'No Of Blocks: ',
                                                      style:
                                                          Styles.appDarkGrey12,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        scheduleModel?.blocks
                                                                .toString() ??
                                                            '',
                                                        style: Styles
                                                            .appDarkBlue12,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'No of Inverters : ',
                                                      style:
                                                          Styles.appDarkGrey12,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "${scheduleModel?.invs ?? ''}",
                                                        style: Styles
                                                            .appDarkBlue12,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Area : ',
                                                      style:
                                                          Styles.appDarkGrey12,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "${scheduleModel?.scheduledArea ?? ''}",
                                                        style: Styles
                                                            .appDarkBlue12,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  controller.historyList!.isEmpty
                                      ? Dimens.box0
                                      : Text(
                                          "VC History ",
                                          style: Styles.blue700,
                                        ),
                                  controller.historyList!.isEmpty
                                      ? Dimens.box0
                                      : ListView.builder(
                                          //physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: controller.historyList! !=
                                                  null
                                              ? controller.historyList!.length
                                              : 0,
                                          itemBuilder: (context, index) {
                                            final pmTaskHistoryModel =
                                                (controller.historyList! !=
                                                        null)
                                                    ? controller
                                                        .historyList![index]
                                                    : HistoryModel();
                                            return Card(
                                              color: Colors.lightBlue.shade50,
                                              elevation: 10,
                                              shadowColor: Colors.black87,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(children: [
                                                        Text('Time Stamp: ',
                                                            style: Styles
                                                                .appDarkGrey12),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                              '${pmTaskHistoryModel?.createdAt?.result}'
                                                              '',
                                                              style: Styles
                                                                  .appDarkBlue12),
                                                        ),
                                                      ]),
                                                      Row(//
                                                          children: [
                                                        Text('Posted By: ',
                                                            style: Styles
                                                                .appDarkGrey12),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                              pmTaskHistoryModel
                                                                      ?.createdByName ??
                                                                  '',
                                                              style: Styles
                                                                  .appDarkBlue12),
                                                        )
                                                      ]),
                                                      Row(children: [
                                                        Text('Comments: ',
                                                            style: Styles
                                                                .appDarkGrey12),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                              "${pmTaskHistoryModel?.comment ?? ''}",
                                                              style: Styles
                                                                  .appDarkBlue12),
                                                        )
                                                      ]),
                                                      Row(children: [
                                                        Text('Status: ',
                                                            style: Styles
                                                                .appDarkGrey12),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                              "${pmTaskHistoryModel?.status_name ?? ''}",
                                                              style: Styles
                                                                  .appDarkBlue12),
                                                        )
                                                      ]),
                                                    ]),
                                              ),
                                            );
                                          }),
                                  Dimens.boxHeight10,
                                  controller.vegPlanDetailsModel.value
                                                  ?.status ==
                                              702 &&
                                          varUserAccessModel.value.access_list!
                                                  .where((e) =>
                                                      e.feature_id ==
                                                          UserAccessConstants
                                                              .kModuleCleaningplanFeatureId &&
                                                      e.approve ==
                                                          UserAccessConstants
                                                              .kHaveApproveAccess)
                                                  .length >
                                              0
                                      ? Row(
                                          children: [
                                            Spacer(),

                                            Container(
                                              height: 35,
                                              child: CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.rejectColor,
                                                text: "Reject",
                                                icon: Icons.close,
                                                onPressed: () {
                                                  Get.dialog(ApproveVegPlan(
                                                    id: controller
                                                        .vegPlanDetailsModel
                                                        .value!
                                                        .planId,
                                                  ));
                                                },
                                              ),
                                            ),
                                            Dimens.boxWidth10,

                                            Container(
                                              height: 35,
                                              child: CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.approveColor,
                                                text: "Approve",
                                                icon: Icons.check,
                                                onPressed: () {
                                                  Get.dialog(ApproveVegPlan(
                                                    id: controller
                                                        .vegPlanDetailsModel
                                                        .value!
                                                        .planId,
                                                  ));
                                                },
                                              ),
                                            ),

                                            // : Dimens.box0,
                                            Spacer(),
                                          ],
                                        )
                                      : Dimens.box0,
                                  Dimens.boxHeight5
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
