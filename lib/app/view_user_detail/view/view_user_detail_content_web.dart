import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_user_detail/view_user_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../navigators/app_pages.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textField.dart';

class ViewUserDetailContentWeb extends GetView<ViewUserDetailController> {
  ViewUserDetailContentWeb({Key? key}) : super(key: key);
  // final ViewUserDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child:
                        Text(" / USER LIST", style: Styles.greyMediumLight12)),
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
                              Text(
                                'Access Group: ',
                                style: Styles.black17,
                              ),
                            ],
                          ),
                          Dimens.boxWidth15,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("sujit@softeltech.in", style: Styles.blue17),
                              Text("Sujit", style: Styles.blue17),
                              Text("Male", style: Styles.blue17),
                              Text("1234556789", style: Styles.blue17),
                              Text("India", style: Styles.blue17),
                              Text("Mumbai", style: Styles.blue17),
                              Text("Admin", style: Styles.blue17),
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
                              Text("sujit@softeltech.in", style: Styles.blue17),
                              Text("Kumar", style: Styles.blue17),
                              Text("1994-04-05", style: Styles.blue17),
                              Text("1935464763", style: Styles.blue17),
                              Text("Maharastra", style: Styles.blue17),
                              Text("User", style: Styles.blue17),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      child: Column(
                        children: [
                          Wrap(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: DefaultTabController(
                                      length: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10)),
                                              color: Color.fromARGB(
                                                  255, 245, 248, 250),
                                            ),
                                            child: TabBar(
                                              labelPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              labelColor: Colors.black,
                                              indicator: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  color: Colors.white),
                                              unselectedLabelColor:
                                                  Colors.black,
                                              tabs: [
                                                Tab(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(Icons
                                                          .analytics_outlined),
                                                      Dimens.boxWidth5,
                                                      Text('Plant Access'),
                                                    ],
                                                  ),
                                                ),
                                                Tab(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(Icons
                                                          .account_tree_outlined),
                                                      Dimens.boxWidth5,
                                                      Text(
                                                        'Access Level',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Tab(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(Icons.notifications),
                                                      Dimens.boxWidth5,
                                                      Text(
                                                        'Notification',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 250,
                                            child: TabBarView(children: [
                                              ///First TabBar View
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .whiteColor),
                                                  child: Column(
                                                    children: [
                                                      Text('first Tab')
                                                    ],
                                                  )),

                                              ////Second TabBar View
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .whiteColor),
                                                  child: Column(
                                                    children: [Text('2 Tab')],
                                                  )),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .whiteColor),
                                                  child: Column(
                                                    children: [Text('3 Tab')],
                                                  )),
                                            ]),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              /// Employee
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
