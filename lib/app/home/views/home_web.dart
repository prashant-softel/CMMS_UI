import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';

class DashBoardHomeWeb extends StatefulWidget {
  DashBoardHomeWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoardHomeWeb> createState() => _DashBoardHomeWebState();
}

class _DashBoardHomeWebState extends State<DashBoardHomeWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return
            // Obx(
            //   () =>
            Scaffold(
          body: Container(
            color: Color.fromARGB(255, 234, 236, 238),
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                AppBarDashboard(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                          height: Get.height,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 248, 250),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [Text("data")],
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    padding: EdgeInsets.only(left: 20, top: 10),
                                    decoration: BoxDecoration(
                                      color: ColorValues.lightBlueColor,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    height: 300,
                                    width: 400,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Overview"),
                                          Dimens.boxHeight20,
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Total"),
                                                ],
                                              ),
                                              Dimens.boxWidth10,
                                              Column(
                                                children: [
                                                  Text("50"),
                                                ],
                                              )
                                            ],
                                          ),
                                          Divider(
                                            color: ColorValues.greyLightColour,
                                          ),
                                          Dimens.boxHeight10,
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Completed"),
                                                ],
                                              ),
                                              Dimens.boxWidth10,
                                              Column(
                                                children: [
                                                  Text("35"),
                                                ],
                                              )
                                            ],
                                          ),
                                          Divider(
                                            color: ColorValues.greyLightColour,
                                          ),
                                          Dimens.boxHeight10,
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Pending"),
                                                ],
                                              ),
                                              Dimens.boxWidth10,
                                              Column(
                                                children: [
                                                  Text("15"),
                                                ],
                                              )
                                            ],
                                          ),
                                          Divider(
                                            color: ColorValues.greyLightColour,
                                          ),
                                        ]),
                                  ),
                                  Container(
                                    height: 300,
                                    width: 400,
                                    color: Color.fromARGB(255, 124, 30, 161),
                                  ),
                                  Container(
                                    width: 400,
                                    height: 300,
                                    color: Color.fromARGB(255, 158, 97, 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        // floatingActionButton: Obx(() => varUserAccessModel
        //             .value.access_list!
        //             .where((e) =>
        //                 e.feature_id ==
        //                     UserAccessConstants.kGoodsFeatureId &&
        //                 e.add == UserAccessConstants.kHaveAddAccess)
        //             .length >
        //         0
        //     ? Row(
        //         children: [
        //           Spacer(),
        //           Container(
        //             height: 40,
        //             child: CustomElevatedButton(
        //               backgroundColor: ColorValues.cancelColor,
        //               text: 'Cancel',
        //               onPressed: () {
        //                 Get.back();
        //               },
        //             ),
        //           ),
        //           Dimens.boxWidth15,
        //           Container(
        //               height: 40,
        //               child: CustomElevatedButton(
        //                 backgroundColor: ColorValues.submitColor,
        //                 text: 'Submit',
        //                 onPressed: () {
        //                   // controller.createGoodsOrder();
        //                 },
        //               )),
        //           Container(
        //             height: 40,
        //             child: CustomElevatedButton(
        //               backgroundColor: ColorValues.submitColor,
        //               text: 'Update',
        //               onPressed: () {
        //                 // controller.updateGoodsOrder();
        //               },
        //             ),
        //           ),
        //           Spacer()
        //         ],
        //       )
        //     : Dimens.box0));

        // );
      },
    );
  }
}

class AppBarDashboard extends StatelessWidget {
  const AppBarDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 227, 224, 224),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.home,
            color: ColorValues.greyLightColor,
          ),
          Text(
            "DASHBOARD",
            style: Styles.greyLight14,
          ),
        ],
      ),
    );
  }
}
