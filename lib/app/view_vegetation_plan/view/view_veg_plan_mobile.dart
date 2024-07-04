import "package:cmms/app/home/widgets/mobile_header_widget.dart";
import "package:cmms/app/job_details/views/widgets/job_detail_field.dart";
import "package:cmms/app/theme/color_values.dart";
import "package:cmms/app/theme/dimens.dart";
import "package:cmms/app/theme/styles.dart";
import "package:cmms/app/view_vegetation_plan/view/equipment_bottomsheet.dart";
import "package:cmms/app/view_vegetation_plan/view_veg_plan_controller.dart";
import "package:cmms/app/widgets/view_veg_eqp_dialoag_mobile.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

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
                                                  "${controller.vegPlanDetailsModel.value?.planId}",
                                            ),
                                            JobDetailField(
                                              title: 'Site Name: ',
                                              value:
                                                  "${controller.vegPlanDetailsModel.value?.siteName}",
                                            ),
                                            JobDetailField(
                                              title: 'Start Date',
                                              value:
                                                  "${controller.vegPlanDetailsModel.value?.startDate}",
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
                                  Text(
                                    "Schedule",
                                    style: Styles.blue700,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.vegPlanDetailsModel
                                          .value?.schedules?.length,
                                      itemBuilder: (context, index) {
                                        final scheduleModel = controller
                                            .vegPlanDetailsModel
                                            .value
                                            ?.schedules?[index];
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
                                                  return EquipmentBottomSheet();
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
                                                                return EquipmentBottomSheet();
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
                                          .vegPlanDetailsModel.value!.schedules
                                          ?.forEach((schedule) {
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
                                              .vegEquipmentList
                                              .indexWhere((eqp) =>
                                                  eqp?.invId ==
                                                  element.parentId);
                                          print({
                                            "selectedParentIndex":
                                                selectedParentIndex
                                          });
                                          if (selectedParentIndex > -1) {
                                            var selectedChildIndex = controller
                                                    .vegEquipmentList[
                                                        selectedParentIndex]!
                                                    .smbs
                                                    ?.indexWhere((smb) =>
                                                        smb.smbId ==
                                                        element.id) ??
                                                -1;

                                            if (selectedChildIndex > -1) {
                                              var ss = controller
                                                  .vegEquipmentList[
                                                      selectedParentIndex]!
                                                  .smbs?[selectedChildIndex];
                                              ss?.selectedDay =
                                                  "${element.cleaningDay}";
                                              controller
                                                      .vegEquipmentList[
                                                          selectedParentIndex]!
                                                      .smbs?[
                                                  selectedChildIndex] = ss!;
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
                                          ViewVegSetEquipmentDialogMobile());
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
