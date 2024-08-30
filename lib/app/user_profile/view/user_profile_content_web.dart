import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/user_profile/user_profile_controller.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class UserProfileContentWeb extends GetView<UserProfileController> {
  UserProfileContentWeb({Key? key}) : super(key: key);
  final UserProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Obx(() => Scaffold(
            body: Container(
              color: Color.fromARGB(255, 234, 236, 238),
              width: Get.width,
              height: Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeaderWidgetAllDash(),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 227, 224, 224),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 236, 234, 234)
                              .withOpacity(0.5),
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
                        InkWell(
                          onTap: () {
                            Get.offNamed(Routes.home);
                          },
                          child: Text(
                            "DASHBOARD",
                            style: Styles.greyLight14,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.offNamed(Routes.setting);
                          },
                          child: Text(" / SETTING", style: Styles.greyLight14),
                        ),
                        Text(" / PROFILE", style: Styles.greyLight14)
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
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 5,
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Profile",
                                  style: Styles.blackBold16,
                                ),
                              ),
                            ),
                            Divider(
                              color: ColorValues.greyLightColour,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20, right: 70, top: 0, bottom: 0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                  // Dimens.boxWidth30,
                                  SizedBox(width: 30),
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
                                        'Date of Joining: ',
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
                                        'State: ',
                                        style: Styles.black17,
                                      ),
                                      // Text(
                                      //   'Access Group: ',
                                      //   style: Styles.black17,
                                      // ),
                                    ],
                                  ),
                                  // Dimens.boxWidth15,
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          controller.userDetailModel.value
                                                  ?.user_name ??
                                              "",
                                          style: Styles.blue17),
                                      Text(
                                          controller.userDetailModel.value
                                                  ?.first_name ??
                                              "",
                                          style: Styles.blue17),
                                      Text(
                                          controller.userDetailModel.value
                                                  ?.joiningDate ??
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
                                        'City: ',
                                        style: Styles.black17,
                                      ),
                                      Text(
                                        'Role: ',
                                        style: Styles.black17,
                                      ),
                                      Text(
                                        'Designation: ',
                                        style: Styles.black17,
                                      ),
                                    ],
                                  ),
                                  // Dimens.boxWidth15,
                                  SizedBox(width: 15),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 350,
                                        child: Text(
                                          controller.userDetailModel.value
                                                  ?.user_name ??
                                              "",
                                          style: Styles.blue17,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                          controller.userDetailModel.value
                                                  ?.last_name ??
                                              "",
                                          style: Styles.blue17),
                                      Text(
                                          controller
                                                  .userDetailModel.value?.dob ??
                                              "",
                                          style: Styles.blue17),
                                      Text(
                                          controller.userDetailModel.value
                                                  ?.landline_number ??
                                              "",
                                          style: Styles.blue17),
                                      Text(
                                          controller.userDetailModel.value
                                                  ?.city_name ??
                                              "",
                                          style: Styles.blue17),
                                      Text(
                                          controller.userDetailModel.value
                                                  ?.role_name ??
                                              "",
                                          style: Styles.blue17),
                                      Text(
                                          controller.userDetailModel.value
                                                  ?.designation_name ??
                                              "",
                                          style: Styles.blue17),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              // width: MediaQuery.of(context).size.width / 2,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Wrap(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            child: DefaultTabController(
                                              length: 3,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 45,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(40),
                                                              topRight: Radius
                                                                  .circular(
                                                                      40)),
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
                                                                topLeft: Radius
                                                                    .circular(
                                                                        40),
                                                                topRight: Radius
                                                                    .circular(
                                                                        40)),
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            offset:
                                                                const Offset(
                                                              1.0,
                                                              1.0,
                                                            ),
                                                            blurRadius: 5.0,
                                                          ),
                                                          BoxShadow(
                                                            color: ColorValues
                                                                .whiteColor,
                                                            offset:
                                                                const Offset(
                                                                    0.0, 0.0),
                                                            blurRadius: 0.0,
                                                            spreadRadius: 0.0,
                                                          ),
                                                        ],
                                                      ),
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
                                                              // Dimens.boxWidth5,
                                                              SizedBox(
                                                                  width: 5),
                                                              Text(
                                                                  'Plant Access'),
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
                                                              // Dimens.boxWidth5,
                                                              SizedBox(
                                                                  width: 5),
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
                                                              Icon(Icons
                                                                  .notifications),
                                                              // Dimens.boxWidth5,
                                                              SizedBox(
                                                                  width: 5),
                                                              Text(
                                                                'Notification',
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: Get.height + 50,

                                                    //  height: 500,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(40),
                                                              topRight: Radius
                                                                  .circular(
                                                                      40)),
                                                      color: Color.fromARGB(
                                                          255, 245, 248, 250),
                                                    ),
                                                    child: TabBarView(
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Container(
                                                                  color: ColorValues
                                                                      .whiteColor,
                                                                  child: Container(
                                                                      height: Get.height,
                                                                      margin: Dimens.edgeInsets15,
                                                                      // margin: EdgeInsets.only(right:15 ),
                                                                      decoration: BoxDecoration(
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              ColorValues.lightGreyColorWithOpacity35,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                ColorValues.appBlueBackgroundColor,
                                                                            spreadRadius:
                                                                                2,
                                                                            blurRadius:
                                                                                5,
                                                                            offset:
                                                                                Offset(0, 2),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      child: controller.plantListModel.length > 0
                                                                          ? SizedBox(
                                                                              height: Get.height * 0.6,
                                                                              child: DataTable2(
                                                                                dataRowHeight: 70,
                                                                                // border: TableBorder.all(
                                                                                //     color:
                                                                                //         Colors.black),
                                                                                columns: [
                                                                                  DataColumn2(
                                                                                    label: Text("Facility ID"),
                                                                                    size: ColumnSize.S,
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: Text("Facility Name"),
                                                                                    size: ColumnSize.S,
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: Text("Is Employee"),
                                                                                    size: ColumnSize.S,
                                                                                  ),
                                                                                  DataColumn2(
                                                                                    label: Text("Location"),
                                                                                    size: ColumnSize.L,
                                                                                  ),
                                                                                ],
                                                                                rows: controller.plantListModel
                                                                                    .map(
                                                                                      (facility) => DataRow(
                                                                                        cells: [
                                                                                          DataCell(
                                                                                            Text("${facility?.id}"),
                                                                                          ),
                                                                                          DataCell(
                                                                                            Text("${facility?.name}"),
                                                                                          ),
                                                                                          DataCell(
                                                                                            Checkbox(
                                                                                              value: facility?.isEmployees,
                                                                                              onChanged: null,
                                                                                            ),
                                                                                          ),
                                                                                          DataCell(
                                                                                            Text("${facility?.location}"),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    )
                                                                                    .toList(),
                                                                              ),
                                                                            )

                                                                          // DataTable2(
                                                                          //     dataRowHeight: 40,
                                                                          //     columnSpacing: 50,
                                                                          //     columns: [
                                                                          //       DataColumn2(
                                                                          //           size: ColumnSize.L,
                                                                          //           // fixedWidth: 180,
                                                                          //           // columnWidth: FlexColumnWidth(3),
                                                                          //           label: Text(
                                                                          //             "Plant Name",
                                                                          //             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                          //           )),
                                                                          //       DataColumn2(
                                                                          //           size: ColumnSize.M,
                                                                          //           // fixedWidth: 100,
                                                                          //           // columnWidth: FlexColumnWidth(3),
                                                                          //           label: Text(
                                                                          //             "SPV",
                                                                          //             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                          //           )),
                                                                          //       DataColumn2(
                                                                          //           size: ColumnSize.S,
                                                                          //           // fixedWidth: 180,
                                                                          //           // columnWidth: FlexColumnWidth(3),
                                                                          //           label: Text(
                                                                          //             "Location",
                                                                          //             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                          //           )),
                                                                          //     ].toList(),
                                                                          //     rows: controller.plantListModel.map<DataRow>((plants) {
                                                                          //       return DataRow(
                                                                          //         cells: [
                                                                          //           DataCell(Text("${plants?.name ?? ""}")),
                                                                          //           DataCell(Text("${plants?.spv ?? ""}")),
                                                                          //           DataCell(Text("${plants?.location ?? ""}")),
                                                                          //         ],
                                                                          //         // Additional properties can be set for each DataRow if needed
                                                                          //       );
                                                                          //     }).toList(),
                                                                          //   )

                                                                          : Container())),
                                                            ],
                                                          ),
                                                          Container(
                                                              color: ColorValues
                                                                  .whiteColor,
                                                              child: Container(
                                                                height:
                                                                    Get.height -
                                                                        30,
                                                                margin: Dimens
                                                                    .edgeInsets15,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: ColorValues
                                                                        .lightGreyColorWithOpacity35,
                                                                    width: 1,
                                                                  ),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: ColorValues
                                                                          .appBlueBackgroundColor,
                                                                      spreadRadius:
                                                                          2,
                                                                      blurRadius:
                                                                          5,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              2),
                                                                    ),
                                                                  ],
                                                                ),
                                                                child:
                                                                    DataTable2(
                                                                  dataRowHeight:
                                                                      30,
                                                                  columnSpacing:
                                                                      10,
                                                                  columns: [
                                                                    DataColumn2(
                                                                        fixedWidth:
                                                                            180,
                                                                        // columnWidth: FlexColumnWidth(3),
                                                                        label:
                                                                            Text(
                                                                          "Module Name",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                          ),
                                                                        )),
                                                                    DataColumn2(
                                                                        // fixedWidth: 75,
                                                                        label:
                                                                            Text(
                                                                      "Add",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                    )),
                                                                    DataColumn2(
                                                                        // fixedWidth: 75,
                                                                        label:
                                                                            Text(
                                                                      "Edit",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                    )),
                                                                    DataColumn2(
                                                                        // fixedWidth: 75,
                                                                        label:
                                                                            Text(
                                                                      "Delete",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                    )),
                                                                    DataColumn2(
                                                                        // fixedWidth: 75,
                                                                        label:
                                                                            Text(
                                                                      "View",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                    )),
                                                                    DataColumn2(
                                                                        // fixedWidth: 75,
                                                                        label:
                                                                            Text(
                                                                      "Self View",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                    )),
                                                                    DataColumn2(
                                                                        // fixedWidth: 75,
                                                                        label:
                                                                            Text(
                                                                      "Issue",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                    )),
                                                                    DataColumn2(
                                                                      // fixedWidth: 75,
                                                                      label:
                                                                          Text(
                                                                        "Approve",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                  rows: controller
                                                                      .accessList
                                                                      .map(
                                                                          (getAccesslevelDetails) {
                                                                    return DataRow(
                                                                      cells: [
                                                                        DataCell(
                                                                            Text("${getAccesslevelDetails?.feature_name ?? ""}")),
                                                                        DataCell(_rowItem(getAccesslevelDetails
                                                                            ?.add
                                                                            .value)),
                                                                        DataCell(_rowItem(getAccesslevelDetails
                                                                            ?.edit
                                                                            .value)),
                                                                        DataCell(_rowItem(getAccesslevelDetails
                                                                            ?.delete
                                                                            .value)),
                                                                        DataCell(_rowItem(getAccesslevelDetails
                                                                            ?.view
                                                                            .value)),
                                                                        DataCell(_rowItem(getAccesslevelDetails
                                                                            ?.selfView
                                                                            .value)),
                                                                        DataCell(_rowItem(getAccesslevelDetails
                                                                            ?.issue
                                                                            .value)),
                                                                        DataCell(_rowItem(getAccesslevelDetails
                                                                            ?.approve
                                                                            .value)),
                                                                      ],
                                                                    );
                                                                  }).toList(),
                                                                ),
                                                              )),
                                                          Column(
                                                            children: [
                                                              Container(
                                                                  color: ColorValues
                                                                      .whiteColor,
                                                                  child: Container(
                                                                      height: Get.height - 30,
                                                                      // margin: Dimens.edgeInsets15,
                                                                      margin: EdgeInsets.only(right: 15),
                                                                      decoration: BoxDecoration(
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              ColorValues.lightGreyColorWithOpacity35,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                ColorValues.appBlueBackgroundColor,
                                                                            spreadRadius:
                                                                                2,
                                                                            blurRadius:
                                                                                5,
                                                                            offset:
                                                                                Offset(0, 2),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      child: controller.notificationListByUserId.length > 0
                                                                          ? ScrollableTableView(
                                                                              columns: [
                                                                                "Notifications",
                                                                                "Default Value",
                                                                                "Can Override",
                                                                                "User Preference",
                                                                              ].map((column) {
                                                                                return TableViewColumn(
                                                                                  label: column,
                                                                                  minWidth: Get.width * 0.12,
                                                                                );
                                                                              }).toList(),
                                                                              rows: true
                                                                                  ? controller.notificationListByUserId
                                                                                      .map((getNotificationDetails) => TableViewRow(height: 50, cells: [
                                                                                            TableViewCell(child: Text("${getNotificationDetails?.feature_name}" " " "${getNotificationDetails?.notification_name.value}")),
                                                                                            TableViewCell(
                                                                                              child: Obx(() {
                                                                                                return _rowItem(
                                                                                                  getNotificationDetails?.default_flag.value,
                                                                                                );
                                                                                              }),
                                                                                            ),
                                                                                            TableViewCell(
                                                                                              child: Obx(() {
                                                                                                return _rowItem(getNotificationDetails?.can_change.value);
                                                                                              }),
                                                                                            ),
                                                                                            TableViewCell(child: Obx(() {
                                                                                              return _rowItem(getNotificationDetails?.default_flag.value);
                                                                                            })),
                                                                                          ]))
                                                                                      .toList()
                                                                                  : [],
                                                                            )
                                                                          : Container())),
                                                            ],
                                                          ),
                                                        ]),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Dimens.boxHeight15
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: varUserAccessModel.value.access_list!
                        .where((e) =>
                            e.feature_id ==
                                UserAccessConstants.kUserFeatureId &&
                            e.edit == UserAccessConstants.kHaveEditAccess)
                        .length >
                    0
                ? Container(
                    height: 45,
                    child: CustomElevatedButton(
                      backgroundColor: ColorValues.appDarkBlueColor,
                      text: 'Edit Profile',
                      onPressed: () {
                        controller.editProfile();
                        //  controller.saveAccessLevel();
                      },
                    ),
                  )
                : Dimens.box0,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          )),
    );
  }

  _rowItem(
    int? defaultValue,
  ) {
    return Checkbox(
        tristate: false,
        value: defaultValue == 1 ? true : false,
        checkColor: Colors.white,
        activeColor: defaultValue == 1 ? ColorValues.greyLightColor : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(
            width: 2.0,
            color: ColorValues.greyLightColor,
          ),
        ),
        mouseCursor: SystemMouseCursors.none,
        onChanged: (val) {});
  }
}
