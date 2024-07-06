import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/view_mc_plan/view/mc_equipment_bottomsheet.dart';
import 'package:cmms/app/view_mc_plan/view_mc_planning_controller.dart';
import 'package:cmms/app/widgets/view_mc_eqp_dialog_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewMcPlanMobile extends StatefulWidget {
  const ViewMcPlanMobile({Key? key}) : super(key: key);

  @override
  _ViewMcPlanMobileState createState() => _ViewMcPlanMobileState();
}

class _ViewMcPlanMobileState extends State<ViewMcPlanMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewMcPlaningController>(
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
                    child: (controller.mcPlanDetailsModel.value != null)
                        ? SingleChildScrollView(
                            child: Container(
                              height: Get.height * 0.8,
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
                                                  "${controller.mcPlanDetailsModel.value?.planId}",
                                            ),
                                            JobDetailField(
                                              title: 'Site Name: ',
                                              value:
                                                  "${controller.mcPlanDetailsModel.value?.siteName}",
                                            ),
                                            JobDetailField(
                                              title: 'Start Date',
                                              value:
                                                  "${controller.mcPlanDetailsModel.value?.startDate}",
                                            ),
                                            JobDetailField(
                                              title: 'Frequency: ',
                                              value:
                                                  "${controller.mcPlanDetailsModel.value?.frequency}",
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
                                                  "${controller.mcPlanDetailsModel.value?.title}",
                                            ),
                                            JobDetailField(
                                              title: 'Planned By: ',
                                              value:
                                                  "${controller.mcPlanDetailsModel.value?.createdBy}",
                                            ),
                                            JobDetailField(
                                              title: 'Assigned To: ',
                                              value:
                                                  "${controller.mcPlanDetailsModel.value?.assignedTo}",
                                            ),
                                            JobDetailField(
                                              title: 'Status: ',
                                              value:
                                                  "${controller.mcPlanDetailsModel.value?.status_short}",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                    "Schedule",
                                    style: Styles.blue700,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.mcPlanDetailsModel
                                          .value?.schedules.length,
                                      itemBuilder: (context, index) {
                                        final scheduleModel = controller
                                            .mcPlanDetailsModel
                                            .value
                                            ?.schedules[index];
                                        return InkWell(
                                          onTap: () {
                                            controller.selectedSchedules =
                                                scheduleModel;
                                            if (controller.selectedSchedules !=
                                                null) {
                                              showModalBottomSheet<void>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
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
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Cleaning Day: ',
                                                        style: Styles
                                                            .appDarkGrey12,
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
                                                        'No Of SMBs: ',
                                                        style: Styles
                                                            .appDarkGrey12,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          scheduleModel?.smbs
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
                                                        'Cleaning Area : ',
                                                        style: Styles
                                                            .appDarkGrey12,
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
                                                  Row(
                                                    //
                                                    children: [
                                                      Spacer(),
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller
                                                                  .selectedSchedules =
                                                              scheduleModel;
                                                          if (controller
                                                                  .selectedSchedules !=
                                                              null) {
                                                            showModalBottomSheet<
                                                                void>(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return McEquipmentBottomsheet();
                                                              },
                                                            );
                                                          }
                                                        },
                                                        child: Container(
                                                          padding: Dimens
                                                              .edgeInsets8_2_8_2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ColorValues
                                                                .viewColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                          child: Text(
                                                            'View',
                                                            style: Styles
                                                                .white10
                                                                .copyWith(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      var selectedEqp = [];
                                      controller
                                          .mcPlanDetailsModel.value!.schedules
                                          .forEach((schedule) {
                                        schedule.equipments?.forEach((element) {
                                          var ee = element;
                                          ee!.cleaningDay =
                                              schedule.cleaningDay;
                                          ;
                                          selectedEqp.add(element);
                                          print(element?.toJson());
                                        });
                                      });
                                      selectedEqp.forEach((element) {
                                        try {
                                          var selectedParentIndex = controller
                                              .equipmentList
                                              .indexWhere((eqp) =>
                                                  eqp?.invId ==
                                                  element.parentId);
                                          print({
                                            "selectedParentIndex":
                                                selectedParentIndex
                                          });
                                          if (selectedParentIndex > -1) {
                                            var selectedChildIndex = controller
                                                    .equipmentList[
                                                        selectedParentIndex]!
                                                    .smbs
                                                    .indexWhere((smb) =>
                                                        smb.smbId ==
                                                        element.id);

                                            if (selectedChildIndex > -1) {
                                              var ss = controller
                                                  .equipmentList[
                                                      selectedParentIndex]!
                                                  .smbs[selectedChildIndex];
                                              ss.selectedDay =
                                                  "${element.cleaningDay}";
                                              controller
                                                      .equipmentList[
                                                          selectedParentIndex]!
                                                      .smbs[
                                                  selectedChildIndex] = ss;
                                            }
                                            print({
                                              "selectedChildIndex":
                                                  selectedChildIndex
                                            });
                                          }
                                        } catch (e) {
                                          print({"eadfds": e});
                                        }
                                      });
                                      Get.dialog(
                                          ViewMcEqpDialogMobile());
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: ColorValues.addNewColor,
                                        border: Border.all(
                                          color: ColorValues
                                              .lightGreyColorWithOpacity35,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Set Equipments",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
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
