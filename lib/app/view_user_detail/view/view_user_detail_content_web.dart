import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_user_detail/view_user_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../navigators/app_pages.dart';

class ViewUserDetailContentWeb extends GetView<ViewUserDetailController> {
  ViewUserDetailContentWeb({Key? key}) : super(key: key);
  final ViewUserDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Color.fromARGB(255, 234, 236, 238),
        width: Get.width,
        height: Get.height,
        child: Column(
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
                    color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                    child: Text(" / SETTING", style: Styles.greyMediumLight12),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(" / USER LIST",
                          style: Styles.greyMediumLight12)),
                  Text(" / VIEW USER", style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  //   margin: Dimens.edgeInsets20,
                  color: Color.fromARGB(255, 245, 248, 250),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              "View User ",
                              style: Styles.blackBold16,
                            ),
                            Spacer(),
                            ActionButton(
                              icon: Icons.menu,
                              label: "User List",
                              onPressed: () {
                                Get.offNamed(Routes.userList);
                              },
                              color: ColorValues.greenlightColor,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: ColorValues.greyLightColour,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 70, top: 20, bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 190,
                              width: 190,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 195, 192, 192),
                                border: Border.all(
                                  color: ColorValues.appLightGreyColor,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    height: 185,
                                    width: 185,
                                    'assets/files/proimg.png',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //     margin: Dimens.edgeInsets30_0_0_0,
                            //     child:
                            Dimens.boxWidth30,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Login ID:',
                                  style: Styles.black17,
                                ),
                                Text(
                                  'First Name:',
                                  style: Styles.black17,
                                ),
                                Text(
                                  'Gender: ',
                                  style: Styles.black17,
                                ),
                                Text(
                                  'Mobile Number: ',
                                  style: Styles.black17,
                                ),
                                Text(
                                  'Country: ',
                                  style: Styles.black17,
                                ),
                                Text(
                                  'City: ',
                                  style: Styles.black17,
                                ),
                                // Text(
                                //   'Access Group: ',
                                //   style: Styles.black17,
                                // ),
                              ],
                            ),
                            Dimens.boxWidth15,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    controller
                                            .userDetailModel.value?.user_name ??
                                        "",
                                    style: Styles.blue17),
                                Text(
                                    controller.userDetailModel.value
                                            ?.first_name ??
                                        "",
                                    style: Styles.blue17),
                                Text(
                                    controller.userDetailModel.value
                                            ?.gender_name ??
                                        "",
                                    style: Styles.blue17),
                                Text(
                                    controller.userDetailModel.value
                                            ?.contact_no ??
                                        "",
                                    style: Styles.blue17),
                                Text(
                                    controller.userDetailModel.value
                                            ?.country_name ??
                                        "",
                                    style: Styles.blue17),
                                Text(
                                    controller.userDetailModel.value
                                            ?.state_name ??
                                        "",
                                    style: Styles.blue17),
                                // Text("Admin", style: Styles.blue17),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Secandory E-mail: ',
                                  style: Styles.black17,
                                ),
                                Text(
                                  'Last Name: ',
                                  style: Styles.black17,
                                ),
                                Text(
                                  'Date of Birth: ',
                                  style: Styles.black17,
                                ),
                                Text(
                                  'Landline: ',
                                  style: Styles.black17,
                                ),
                                Text(
                                  'State: ',
                                  style: Styles.black17,
                                ),
                                Text(
                                  'Role: ',
                                  style: Styles.black17,
                                ),
                              ],
                            ),
                            Dimens.boxWidth15,

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    controller
                                            .userDetailModel.value?.user_name ??
                                        "",
                                    style: Styles.blue17),
                                Text(
                                    controller
                                            .userDetailModel.value?.last_name ??
                                        "",
                                    style: Styles.blue17),
                                Text(
                                    controller.userDetailModel.value?.dob ?? "",
                                    style: Styles.blue17),
                                Text(
                                    controller.userDetailModel.value
                                            ?.contact_no ??
                                        "",
                                    style: Styles.blue17),
                                Text(
                                    controller
                                            .userDetailModel.value?.city_name ??
                                        "",
                                    style: Styles.blue17),
                                Text(
                                    controller
                                            .userDetailModel.value?.role_name ??
                                        "",
                                    style: Styles.blue17),
                              ],
                            )
                          ],
                        ),
                      ),
                      // Column(
                      //   children: [
                      //     Wrap(
                      //       children: [
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             SizedBox(
                      //               width:
                      //                   MediaQuery.of(context).size.width / 1.5,
                      //               child: DefaultTabController(
                      //                 length: 3,
                      //                 child: Column(
                      //                   children: [
                      //                     Container(
                      //                       height: 45,
                      //                       decoration: BoxDecoration(
                      //                         boxShadow: [
                      //                           BoxShadow(
                      //                             color: Colors.white,
                      //                             blurRadius:
                      //                                 15.0, // soften the shadow
                      //                             spreadRadius:
                      //                                 5.0, //extend the shadow
                      //                             offset: Offset(
                      //                               5.0,
                      //                               5.0,
                      //                             ),
                      //                           )
                      //                         ],
                      //                         borderRadius: BorderRadius.only(
                      //                             topLeft: Radius.circular(40),
                      //                             topRight: Radius.circular(40)),
                      //                         color: Color.fromARGB(
                      //                             255, 245, 248, 250),
                      //                       ),
                      //                       child: TabBar(
                      //                         labelPadding: EdgeInsets.symmetric(
                      //                             horizontal: 10.0),
                      //                         labelColor: Colors.black,
                      //                         indicator: BoxDecoration(
                      //                           borderRadius: BorderRadius.only(
                      //                               topLeft: Radius.circular(40),
                      //                               topRight:
                      //                                   Radius.circular(40)),
                      //                           color: Colors.white,
                      //                           boxShadow: [
                      //                             BoxShadow(
                      //                               color: Colors.black26,
                      //                               offset: const Offset(
                      //                                 5.0,
                      //                                 5.0,
                      //                               ),
                      //                               blurRadius: 5.0,
                      //                               spreadRadius: 1.0,
                      //                             ),
                      //                             BoxShadow(
                      //                               color: ColorValues.whiteColor,
                      //                               offset:
                      //                                   const Offset(0.0, 0.0),
                      //                               blurRadius: 0.0,
                      //                               spreadRadius: 0.0,
                      //                             ),
                      //                           ],
                      //                         ),
                      //                         unselectedLabelColor: Colors.black,
                      //                         tabs: [
                      //                           Tab(
                      //                             child: Row(
                      //                               mainAxisAlignment:
                      //                                   MainAxisAlignment.center,
                      //                               children: [
                      //                                 Icon(Icons
                      //                                     .analytics_outlined),
                      //                                 Dimens.boxWidth5,
                      //                                 Text('Plant Access'),
                      //                               ],
                      //                             ),
                      //                           ),
                      //                           Tab(
                      //                             child: Row(
                      //                               mainAxisAlignment:
                      //                                   MainAxisAlignment.center,
                      //                               children: [
                      //                                 Icon(Icons
                      //                                     .account_tree_outlined),
                      //                                 Dimens.boxWidth5,
                      //                                 Text(
                      //                                   'Access Level',
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ),
                      //                           Tab(
                      //                             child: Row(
                      //                               mainAxisAlignment:
                      //                                   MainAxisAlignment.center,
                      //                               children: [
                      //                                 Icon(Icons.notifications),
                      //                                 Dimens.boxWidth5,
                      //                                 Text(
                      //                                   'Notification',
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                     SizedBox(
                      //                       height: 250,
                      //                       child: Expanded(
                      //                         child: TabBarView(children: [
                      //                           ///First TabBar View
                      //                           Container(
                      //                               decoration: BoxDecoration(
                      //                                   color: ColorValues
                      //                                       .whiteColor),
                      //                               child: Column(
                      //                                 children: [
                      //                                   Text('first Tab')
                      //                                 ],
                      //                               )),

                      //                           ////Second TabBar View
                      //                           Container(
                      //                               decoration: BoxDecoration(
                      //                                   color: ColorValues
                      //                                       .whiteColor),
                      //                               child: Column(
                      //                                 children: [Text('2 Tab')],
                      //                               )),
                      //                           Container(
                      //                               decoration: BoxDecoration(
                      //                                   color: ColorValues
                      //                                       .whiteColor),
                      //                               child: Column(
                      //                                 children: [Text('3 Tab')],
                      //                               )),
                      //                         ]),
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),

                      //         /// Employee
                      //       ],
                      //     ),
                      //   ],
                      // ),

                      Dimens.boxHeight15
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
