import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/view_mc_plan/view_mc_planning_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/dimens.dart';

class ViewMcEqpDialogMobile extends GetView<ViewMcPlaningController> {
  const ViewMcEqpDialogMobile({Key? key}) : super(key: key);

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
          ],
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;
          return IgnorePointer(
            ignoring: false,
            child: Container(
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
                width: Get.width * .95,
                child: SingleChildScrollView(
                  child: Column(
                      children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Assets",
                              style: TextStyle(color: Color(0xff31576D)),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("Modules",
                                style: TextStyle(color: Color(0xff31576D))),
                          ),
                          Expanded(
                              flex: 1,
                              child: Text("Select Day",
                                  style: TextStyle(color: Color(0xff31576D)))),
                        ],
                      ),
                    )
                  ]..addAll(controller.equipmentList.map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              e.isExpanded = !e.isExpanded;
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
                                      flex: 1,
                                      child: Text(
                                        "${e.moduleQuantity}",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
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
                                                child:
                                                    Text(map.name.toString()),
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
                                            e.smbs.map(
                                              (smbItems) {
                                                return Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                            smbItems.smbName ??
                                                                "")),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                            "${smbItems.moduleQuantity}")),
                                                    Expanded(
                                                      flex: 1,
                                                      child: DropdownButton<
                                                          String>(
                                                        value: smbItems
                                                            .selectedDay,
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
                                                                child: Text(map
                                                                    .name
                                                                    .toString()),
                                                                value: map.id,
                                                              ),
                                                            )
                                                            .toList(),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                      )
                                    : Dimens.box0
                              ],
                            ),
                          );
                        }))),
                )),
          );
        }),
      );
    }));
  }
}
