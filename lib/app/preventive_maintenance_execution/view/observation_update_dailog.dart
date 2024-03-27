import 'package:cmms/app/app.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/preventive_maintenance_execution/preventive_maintenance_execution_controller.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_textfield.dart';

class ObservationUpdateDialog extends GetView {
  ObservationUpdateDialog();
  final PreventiveMaintenanceExecutionController controller = Get.find();

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
              shrinkWrap: true,
              itemCount: controller.rowItemobs.value.length,
              itemBuilder: (context, index) {
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
                      children:
                          controller.rowItemobs.value[index].map<Widget>((map) {
                        return Column(
                          children: [
                            (map['key'] == "observation")
                                ? Row(
                                    children: [
                                      Text(
                                        "Observation",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: LoginCustomTextfield(
                                          width: Get.width / 1.8,
                                          textController:
                                              new TextEditingController(
                                                  text: map["value"] ?? ''),
                                          onChanged: (txt) {
                                            map["value"] = txt;
                                          },
                                          maxLine: 5,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(children: [
                                    Text('${map['key']!}: ',
                                        style: Styles.appDarkGrey12),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                          '${map['value']!}'
                                          '',
                                          style: Styles.appDarkBlue12),
                                    ),
                                  ]),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
