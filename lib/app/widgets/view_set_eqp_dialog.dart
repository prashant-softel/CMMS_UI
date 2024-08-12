import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/view_mc_plan/view_mc_planning_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/dimens.dart';

class ViewSetEquipmentDialog extends GetView {
  int? estimateDurationDays;
  ViewSetEquipmentDialog({required this.estimateDurationDays});
  final ViewMcPlaningController controller = Get.find();

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
              "View Set Equipments $estimateDurationDays",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            // Spacer(),
            // Container(
            //   width: 150,
            //   height: 25,
            //   margin: Dimens.edgeInsets0_0_16_0,
            //   child: TextField(
            //     decoration: InputDecoration(
            //       enabledBorder: const OutlineInputBorder(
            //         borderSide:
            //             const BorderSide(color: Colors.grey, width: 0.0),
            //       ),
            //       focusedBorder: const OutlineInputBorder(
            //         borderSide:
            //             const BorderSide(color: Colors.grey, width: 0.0),
            //       ),
            //       contentPadding: Dimens.edgeInsets10_0_0_0,
            //       hintText: 'search'.tr,
            //       hintStyle: Styles.grey12,
            //     ),
            //   ),
            // ),
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
              width: Get.width * 0.5,
              child: SingleChildScrollView(
                child: Column(
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Assets",
                            style: TextStyle(color: Color(0xff31576D)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text("Modules",
                              style: TextStyle(color: Color(0xff31576D))),
                        ),
                        Expanded(
                            flex: 2,
                            child: Text("Select Day",
                                style: TextStyle(color: Color(0xff31576D)))),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  )
                ]..addAll(controller.equipmentList.value.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 4,
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
                                    flex: 2,
                                    child: Text(
                                      "${e.moduleQuantity}",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: IgnorePointer(
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
                                                      flex: 4,
                                                      child: Text(
                                                          smbItems.smbName ??
                                                              "")),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                          "${smbItems.moduleQuantity}")),
                                                  Expanded(
                                                    flex: 2,
                                                    child: IgnorePointer(
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
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                    )
                                  : Dimens.box0,
                              Divider(
                                thickness: 1,
                              )
                            ],
                          ),
                        );
                      }))),
              ));
        }),
      );
    }));
  }
}
