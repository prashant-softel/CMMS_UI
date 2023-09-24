import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_pm_plan/view_pm_plan_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class ViewPmPlanWeb extends StatefulWidget {
  ViewPmPlanWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewPmPlanWeb> createState() => _ViewPmPlanWebState();
}

class _ViewPmPlanWebState extends State<ViewPmPlanWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewPmPlanController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorValues.cardColor,
          body: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 227, 224, 224),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: ColorValues.greyLightColor,
                    ),
                    Text(
                      "DASHBOARD",
                      style: Styles.greyLight14,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(" / PREVENTIVE MAINTENANCE",
                          style: Styles.greyMediumLight12),
                    ),
                    Text(" / VIEW PM PLAN", style: Styles.greyMediumLight12)
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 1.2,
                        width: Get.width * 7,
                        margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                        // height: Get.height,
                        child: Card(
                          color: ColorValues.cardColor,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 10, left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 10, left: 10),
                                      child: Text(
                                        " View PM Plan",
                                        style: Styles.blackBold14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              Dimens.boxHeight15,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          ' Plan Title : ',
                                          style: Styles.black17,
                                        ),
                                        Text(
                                          'Equipment Category : ',
                                          style: Styles.black17,
                                        ),
                                        Text(
                                          'Start Date : ',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Block 2 all Inverter maintenance plan",
                                            style: Styles.blue17),
                                        Text("Inverter", style: Styles.blue17),
                                        Text("2023 - 05 - 12",
                                            style: Styles.blue17),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Frequency : ',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text("Monthly", style: Styles.blue17),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Dimens.boxHeight25,
                              Dimens.boxHeight15,
                              Row(
                                children: [
                                  Spacer(),
                                  Container(
                                    height: 45,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.printColor,
                                      text: "Print",
                                      icon: Icons.print,
                                      onPressed: () {
                                        // Get.dialog(
                                        //     GoodsOrderApprovedDialog(
                                        //   id: controller.id,
                                        // ));
                                      },
                                    ),
                                  ),
                                  Dimens.boxWidth10,
                                  Container(
                                    height: 45,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appGreenColor,
                                      text: "Approve",
                                      icon: Icons.add,
                                      onPressed: () {
                                        // Get.dialog(
                                        //     GoodsOrderApprovedDialog(
                                        //   id: controller.id,
                                        // ));
                                      },
                                    ),
                                  ),
                                  Dimens.boxWidth10,
                                  Container(
                                    height: 45,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.rejectColor,
                                      text: "Reject",
                                      icon: Icons.close,
                                      onPressed: () {
                                        // Get.dialog(
                                        //     GoodsOrderRejectDialog(
                                        //   id: controller.id,
                                        // ));
                                      },
                                    ),
                                  ),
                                  Spacer()
                                ],
                              ),
                              Dimens.boxHeight15,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Dimens.boxHeight40,
            ],
          ),
        );
      },
    );
  }
}
