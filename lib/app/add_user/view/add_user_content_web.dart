import 'package:cmms/app/add_user/add_user_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../navigators/app_pages.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textField.dart';

class AddUserContentWeb extends GetView<AddUserController> {
  AddUserContentWeb({Key? key}) : super(key: key);
  // final AddUserController controller = Get.find();

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
                Text(" / ADD USER", style: Styles.greyMediumLight12)
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
                            "Add User ",
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
                      margin: Dimens.edgeInsets20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 210,
                            child: Stack(
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
                                      Icon(
                                        Icons.image,
                                        size: 70,
                                        color:
                                            Color.fromARGB(255, 215, 192, 141),
                                      ),
                                      Dimens.boxHeight10,
                                      Text("Upload Photo",
                                          style: Styles.greyMediumLight12)
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 150,
                                  left: 100,
                                  right: 0,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                          color: ColorValues.appDarkBlueColor,
                                          border: Border.all(
                                            color: ColorValues.appDarkBlueColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 40,
                                            color: ColorValues.whiteColor,
                                          ), //Circ
                                        ),
                                      ),
                                    ),
                                  ),
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
                              Row(
                                children: [
                                  CustomRichText(title: 'Login ID: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        ishint: 'Enter Email ID',
                                      )),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'First Name: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        ishint: 'Enter First Name',
                                      )),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'Gender: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        ishint: 'Select Gender',
                                      )),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'Mobile Number: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        ishint: 'Enter Mobile Number',
                                      )),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'Country: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        ishint: 'Select Country',
                                      )),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'City: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        ishint: 'Select City',
                                      )),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(children: [
                                CustomRichText(title: 'Access Group: '),
                                Dimens.boxWidth10,
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 227, 224, 224),
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(255, 236, 234, 234)
                                                  .withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    width: (MediaQuery.of(context).size.width *
                                        .2),
                                    child: LoginCustomTextfield(
                                      ishint: 'Select Access Group',
                                    )),
                              ]),
                            ],
                          ),
                          Spacer(),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  CustomRichText(title: 'Secandory E-mail: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        ishint: 'Enter Email ID',
                                      )),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'Last Name: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        ishint: 'Enter Last Name',
                                      )),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'Date of Birth: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        ishint: 'Enter Birth Date',
                                      )),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'Landline: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        ishint: 'Enter Landline Number',
                                      )),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'State: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        ishint: 'Select State',
                                      )),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  CustomRichText(title: 'Role: '),
                                  Dimens.boxWidth10,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        ishint: 'Select Role',
                                      )),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 400,
                      // width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        children: [
                          Wrap(
                            children: [
                              Column(
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
