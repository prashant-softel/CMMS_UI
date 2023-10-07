import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:cmms/domain/models/submit_purchase_order_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/dimens.dart';
import '../theme/styles.dart';

class SetEquipmentDialog extends GetView {
  SetEquipmentDialog();

  final ModuleCleaningPlanningController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets0_0_10_0,
        title: Row(
          children: [
            Text(
              "Set Equipments",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Spacer(),
            Container(
              width: 150,
              height: 25,
              margin: Dimens.edgeInsets0_0_16_0,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  contentPadding: Dimens.edgeInsets10_0_0_0,
                  hintText: 'search'.tr,
                  hintStyle: Styles.grey12,
                ),
              ),
            ),
          ],
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: ColorValues.lightGreyColorWithOpacity35,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorValues.appBlueBackgroundColor,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              // padding: EdgeInsets.only(right: 120, top: 10),
              height: height / 1.5,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                    children: [
                  Row(
                    children: [
                      Expanded(child: Text("Assets")),
                      Expanded(child: Text("Modules")),
                      Expanded(child: Text("Select Day")),
                    ],
                  )
                ]..addAll(controller.equipmentList.value.map((e) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          e!.isExpanded = !e.isExpanded;
                                        },
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "${e?.invName}",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(e!.isExpanded
                                            ? Icons.arrow_drop_down
                                            : Icons.arrow_drop_up)
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "${e?.moduleQuantity}",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: DropdownButton<String>(
                                    value: e.selectedDay,
                                    onChanged: (newValue) {
                                      setState(() {
                                        e.selectedDay = newValue!;
                                        e.smbs.forEach((element) {
                                          element.selectedDay = newValue;
                                        });
                                      });
                                    },
                                    items: controller.days
                                        .map(
                                          (map) => DropdownMenuItem(
                                            child: Text(map.name),
                                            value: map.id,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                            e.isExpanded
                                ? Column(
                                    children: []..addAll(
                                        e.smbs!.map(
                                          (smbItems) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                          smbItems.smbName ??
                                                              "")),
                                                  Expanded(
                                                      child: Text(
                                                          "${smbItems.moduleQuantity}")),
                                                  Expanded(
                                                    child:
                                                        DropdownButton<String>(
                                                      value:
                                                          smbItems.selectedDay,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          smbItems.selectedDay =
                                                              newValue!;
                                                        });
                                                      },
                                                      items: controller.days
                                                          .map(
                                                            (map) =>
                                                                DropdownMenuItem(
                                                              child: Text(
                                                                  map.name),
                                                              value: map.id,
                                                            ),
                                                          )
                                                          .toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                  )
                                : Dimens.box0
                          ],
                        );
                      }))),
              ));
        }),
      );
    }));
  }
}
