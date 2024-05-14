import 'package:cmms/app/app.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObservationViewDialog extends GetView {
  ObservationViewDialog();
  final PreventiveMaintenanceTaskViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Observation of  ${controller.selectedItem?.name ?? ""}",
            style: Styles.appDarkBlue13,
          ),
          Dimens.boxHeight5,
          Text(
            "  ${controller.selectedItem?.checklist_name ?? ""}",
            style: Styles.appDarkBlue13,
          ),
          Dimens.boxHeight5,
          Expanded(
            child: ListView.builder(
                //physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                    controller.selectedItem!.checklist_observation != null
                        ? controller.selectedItem!.checklist_observation!.length
                        : 0,
                itemBuilder: (context, index) {
                  final pmTaskModel =
                      (controller.selectedItem!.checklist_observation != null)
                          ? controller
                              .selectedItem!.checklist_observation![index]
                          : ChecklistObservation();
                  return Card(
                    color: Colors.lightBlue.shade50,
                    elevation: 10,
                    shadowColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text('Checkpoint Id: ',
                                  style: Styles.appDarkGrey12),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                    'CP${pmTaskModel.check_point_id}'
                                    '',
                                    style: Styles.appDarkBlue12),
                              ),
                            ]),
                            Row(//
                                children: [
                              Text('CheckPoint: ', style: Styles.appDarkGrey12),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(pmTaskModel.check_point_name ?? '',
                                    style: Styles.appDarkBlue12),
                              )
                            ]),
                            Row(children: [
                              Text('Requirement: ',
                                  style: Styles.appDarkGrey12),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text("${pmTaskModel.requirement ?? ''}",
                                    style: Styles.appDarkBlue12),
                              )
                            ]),
                            Row(children: [
                              Text('Weightage: ', style: Styles.appDarkGrey12),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                    "${pmTaskModel.failure_waightage ?? ''}",
                                    style: Styles.appDarkBlue12),
                              )
                            ]),
                            Row(children: [
                              Text('CP ok?: ', style: Styles.appDarkGrey12),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: controller
                                            .selectedItem
                                            ?.checklist_observation?[index]
                                            .cp_ok ==
                                        1
                                    ? Text("${'OK'}",
                                        style: Styles.appDarkBlue12)
                                    : Text("${'Not OK'}",
                                        style: Styles.appDarkBlue12),
                              )
                            ]),
                            Row(children: [
                              Text('Type: ', style: Styles.appDarkGrey12),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: controller
                                              .selectedItem
                                              ?.checklist_observation?[index]
                                              .check_point_type ==
                                          1
                                      ? Text(
                                          "${controller.selectedItem?.checklist_observation?[index].type_text}",
                                          style: Styles.appDarkBlue12)
                                      : controller
                                                  .selectedItem
                                                  ?.checklist_observation?[
                                                      index]
                                                  .check_point_type ==
                                              2
                                          ? Column(
                                              children: [
                                                Text(
                                                    "${controller.selectedItem?.checklist_observation?[index].type_text}"),
                                                Row(
                                                  children: [
                                                    Text(
                                                        "min:${controller.selectedItem?.checklist_observation?[index].min_range}"),
                                                    Dimens.boxWidth12,
                                                    Text(
                                                        "Max:${controller.selectedItem?.checklist_observation?[index].max_range}")
                                                  ],
                                                )
                                              ],
                                            )
                                          : Text('Text',
                                              style: Styles.appDarkBlue12))
                            ]),
                            Row(children: [
                              Text('Observation: ',
                                  style: Styles.appDarkGrey12),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text("${pmTaskModel.observation ?? ''}",
                                    style: Styles.appDarkBlue12),
                              )
                            ]),
                            Row(children: [
                              Text('Job ID: ', style: Styles.appDarkGrey12),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                    "${pmTaskModel.linked_job_id ?? ''}",
                                    style: Styles.appDarkBlue12),
                              )
                            ]),
                          ]),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
