import 'package:cmms/app/add_vegetation_plan/add_vegetation_plan_controller.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegSetEquipment extends GetView {
  int? estimateDurationDays;
  VegSetEquipment({required this.estimateDurationDays});
  final AddVegetationPlanController controller = Get.find();

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
              "Set Equipments $estimateDurationDays",
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
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Blocks",
                            style: TextStyle(color: Color(0xff31576D)),
                          ),
                        ),
                        Expanded(
                          child: Text("Grass Cutting Area",
                              style: TextStyle(color: Color(0xff31576D))),
                        ),
                        Expanded(
                            child: Text("Select Day",
                                style: TextStyle(color: Color(0xff31576D)))),
                      ],
                    ),
                  )
                ]..addAll(controller.equipmentList.value.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
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
                                            "${e?.blockName}",
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
                                      "${e.area}",
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
                                          e.invs!.forEach((element) {
                                            element.selectedDay = newValue;
                                          });
                                        });
                                      },
                                      items: controller.days
                                          .map(
                                            (map) => DropdownMenuItem(
                                              child: Text(map.name.toString()),
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
                                          e.invs.map(
                                            (invs) {
                                              return Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                          invs.invName ?? "")),
                                                  Expanded(
                                                      child:
                                                          Text("${invs.area}")),
                                                  Expanded(
                                                    child:
                                                        DropdownButton<String>(
                                                      value: invs.selectedDay,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          invs.selectedDay =
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
              ));
        }),
        actions: [
          controller.id == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      child: CustomElevatedButton(
                        backgroundColor: ColorValues.greenColor,
                        text: 'Submit',
                        onPressed: () {
                          controller.createVegPlan();
                        },
                      ),
                    ),
                    Dimens.boxWidth20,
                    Container(
                      height: 35,
                      child: CustomElevatedButton(
                        backgroundColor: ColorValues.redColor,
                        text: "Cancel",
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                )
              : varUserAccessModel.value.access_list!
                          .where((e) =>
                              e.feature_id ==
                                  UserAccessConstants
                                      .kModuleCleaningFeatureId &&
                              e.add == UserAccessConstants.kHaveAddAccess)
                          .length >
                      0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.redColor,
                            text: "Cancel",
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                        Dimens.boxWidth20,
                        Container(
                          height: 35,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.greenColor,
                            text: 'Update',
                            onPressed: () {
                              // controller.updateMcPlan();
                            },
                          ),
                        ),
                      ],
                    )
                  : Dimens.box0
        ],
      );
    }));
  }
}
