import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_vegetation_plan/view_veg_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquipmentBottomSheet extends GetView<ViewVegPlanController> {
  EquipmentBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Plan on Day ${controller.selectedSchedules?.cleaningDay ?? ""}",
            style: Styles.appDarkBlue13,
          ),
          Dimens.boxHeight5,
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.selectedSchedules?.equipments?.length,
              itemBuilder: (context, index) {
                final selectedEquipment =
                    controller.selectedSchedules?.equipments![index];
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
                        Row(
                          children: [
                            Text('Equipment Name: ',
                                style: Styles.appDarkGrey12),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                '${selectedEquipment?.equipmentName}',
                                style: Styles.appDarkBlue12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Parent Name: ', style: Styles.appDarkGrey12),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                selectedEquipment?.parentName ?? '',
                                style: Styles.appDarkBlue12,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text('Cleaning Day: ', style: Styles.appDarkGrey12),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                "${selectedEquipment?.noOfPlanDay ?? ''}",
                                style: Styles.appDarkBlue12,
                              ),
                            )
                          ],
                        ),
                      ],
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
