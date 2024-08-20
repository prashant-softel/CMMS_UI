import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/user_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/table_action_button.dart';
import '../user_list_controller.dart';

class UserListContentWeb extends StatefulWidget {
  UserListContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<UserListContentWeb> createState() => _UserListContentWebState();
}

class _UserListContentWebState extends State<UserListContentWeb> {
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserListController>(
        id: 'user_list',
        builder: (controller) {
          return SelectionArea(
            child: Obx(() {
              final dataSource = UserDataSource(controller);

              return Column(
                children: [
                  HeaderWidget(),
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
                            Get.offNamed(Routes.masterDashboard);
                          },
                          child: Text(" / MASTER", style: Styles.greyLight14),
                        ),
                        Text(" / USER LIST", style: Styles.greyLight14),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: SingleChildScrollView(
                        child: Container(
                          width: Get.width * 7,
                          margin: EdgeInsets.all(10),
                          height: Get.height * .84,
                          child: Card(
                            color: Color.fromARGB(255, 245, 248, 250),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "User List ",
                                          style: Styles.blackBold16,
                                        ),
                                        Spacer(),
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kUserFeatureId &&
                                                        e.add ==
                                                            UserAccessConstants
                                                                .kHaveAddAccess)
                                                    .length >
                                                0
                                            ? ActionButton(
                                                icon: Icons.add,
                                                label: "Add New",
                                                onPressed: () {
                                                  controller.clearStoreData();

                                                  Get.toNamed(Routes.addUser);
                                                },
                                                color: ColorValues.addNewColor,
                                              )
                                            : Dimens.box0
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Row(
                                    children: [
                                      PopupMenuButton<String>(
                                        tooltip: "",
                                        elevation: 25.0,
                                        child: Container(
                                          height: 35,
                                          margin: EdgeInsets.only(left: 10),
                                          padding: EdgeInsets.only(
                                              top: 4,
                                              bottom: 4,
                                              right: 8,
                                              left: 8),
                                          decoration: BoxDecoration(
                                              color:
                                                  ColorValues.appLightBlueColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  offset:
                                                      const Offset(4.0, 2.0),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0,
                                                ),
                                              ]),
                                          child: Text(
                                            'Column Visibility',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry<String>>[]..addAll(
                                                  controller.columnVisibility
                                                      .value.entries
                                                      .map((e) {
                                                return PopupMenuItem<String>(
                                                    child:
                                                        ValueListenableBuilder(
                                                            valueListenable:
                                                                controller
                                                                    .columnVisibility,
                                                            builder: (context,
                                                                value, child) {
                                                              return Row(
                                                                children: [
                                                                  Checkbox(
                                                                    value: value[
                                                                        e.key],
                                                                    onChanged:
                                                                        (newValue) {
                                                                      controller.setColumnVisibility(
                                                                          e.key,
                                                                          newValue!);
                                                                    },
                                                                  ),
                                                                  Text(e.key),
                                                                ],
                                                              );
                                                            }));
                                              })),
                                        onSelected: (String value) {
                                          // Handle column selection
                                        },
                                      ),
                                      // Container(
                                      //   height: 35,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //     backgroundColor:
                                      //         ColorValues.appLightBlueColor,
                                      //     onPressed: () {},
                                      //     text: 'Column Visibility',
                                      //   ),
                                      // ),
                                      // Container(
                                      //   height: 35,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //       backgroundColor:
                                      //           ColorValues.appLightBlueColor,
                                      //       onPressed: () {},
                                      //       text: 'Copy'),
                                      // ),
                                      Container(
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: const Offset(2.0, 1.0),
                                            blurRadius: 5.0,
                                            spreadRadius: 1.0,
                                          )
                                        ]),
                                        height: 35,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {
                                              controller.export();
                                            },
                                            text: 'Excel'),
                                      ),
                                      // Container(
                                      //   height: 35,
                                      //   margin: EdgeInsets.only(left: 10),
                                      //   child: CustomElevatedButton(
                                      //       backgroundColor:
                                      //           ColorValues.appLightBlueColor,
                                      //       onPressed: () {},
                                      //       text: 'PDF'),
                                      // ),
                                      Spacer(),
                                      Container(
                                        width: 300,
                                        height: 40,
                                        // margin: Dimens.edgeInsets0_0_16_0,
                                        margin: EdgeInsets.only(right: 5),
                                        child: TextField(
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 16.0,
                                                height: 1.0,
                                                color: Colors.black),
                                          ),
                                          onChanged: (value) =>
                                              controller.search(value),
                                          decoration: InputDecoration(
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 0.0,
                                              ),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 0.0,
                                              ),
                                            ),
                                            contentPadding:
                                                Dimens.edgeInsets05_10,
                                            hintText: 'search'.tr,
                                            hintStyle: Styles.grey16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  controller.userList.isEmpty == true &&
                                          controller.isLoading == false
                                      ? Center(child: Text('No data'))
                                      : controller.isLoading.value == true
                                          ? Center(
                                              child: Text("Data Loading......"))
                                          : Expanded(
                                              child: ValueListenableBuilder(
                                                  valueListenable: controller
                                                      .columnVisibility,
                                                  builder:
                                                      (context, value, child) {
                                                    final dataSource =
                                                        UserDataSource(
                                                            controller);

                                                    return PaginatedDataTable2(
                                                      // fixedLeftColumns: 1,
                                                      // dataRowHeight: Get.height * 0.12,
                                                      columnSpacing: 10,
                                                      source:
                                                          dataSource, // Custom DataSource class
                                                      // headingRowHeight:
                                                      //     Get.height * 0.12,
                                                      minWidth: Get.width * 1.2,
                                                      showCheckboxColumn: false,
                                                      rowsPerPage:
                                                          10, // Number of rows per page
                                                      availableRowsPerPage: [
                                                        10,
                                                        20,
                                                        30,
                                                        50
                                                      ],
                                                      columns: [
                                                        for (var entry
                                                            in value.entries)
                                                          if (entry.value)
                                                            buildDataColumn(
                                                              entry.key,
                                                              controller
                                                                      .filterText[
                                                                  entry.key]!,
                                                              controller
                                                                      .columnwidth[
                                                                  entry.key],
                                                            ),
                                                        buildDataColumn(
                                                          'Actions',
                                                          controller
                                                              .userDateFilterText,
                                                          150,
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                            )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          );
        });
  }

  DataColumn2 buildDataColumn(
    // String columnName,
    String header,

    /// ColumnSize columnSize,
    RxString filterText,
    double? fixedWidth,
    //  {required Function(String) onSearchCallBack}
  ) {
    return //
        DataColumn2(
      // size: columnSize,
      fixedWidth: fixedWidth,

      label: //
          Column(
              mainAxisAlignment: MainAxisAlignment.center, //
              children: [
            // SizedBox(
            //   height: Get.height * 0.05,
            //   child: TextField(
            //     style: GoogleFonts.lato(
            //       textStyle: TextStyle(
            //           fontSize: 16.0, height: 1.0, color: Colors.black),
            //     ),
            //     onChanged: (value) {
            //       filterText.value = value;
            //       //   onSearchCallBack(value);
            //     },
            //     textAlign: TextAlign.left,
            //     decoration: InputDecoration(
            //       hintText: 'Filter',
            //       contentPadding: EdgeInsets.fromLTRB(
            //           5, 0, 5, 0), // Reduced vertical padding
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //     ),
            //   ),
            // ),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                header,
                style: Styles.black15W600,
              ),
            ),
          ]),
      // ),
    );
  }
}

class UserDataSource extends DataTableSource {
  final UserListController controller;

  late List<UserListModel?> filteredUserList;

  UserDataSource(this.controller) {
    filterUsers();
  }

  ///
  void filterUsers() {
    filteredUserList = <UserListModel?>[];
    filteredUserList = controller.userList.where((User) {
      return (User.id ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.idFilterText.value.toLowerCase()) &&
          (User.name ?? '')
              .toLowerCase()
              .contains(controller.userLoginIdFilterText.value.toLowerCase()) &&
          (User.role_name ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.userRoleFilterText.value.toLowerCase()) &&
          (User.contact_no ?? '')
              .toLowerCase()
              .contains(controller.contractFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredUserList": filteredUserList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final UserDetails = filteredUserList[index];
    String facilitiesAsString =
        UserDetails?.facilities?.map((f) => f.name ?? '').join(', ') ?? '';

    controller.userId.value = UserDetails?.id ?? 0;
    var cellsBuffer = [
      "Profile_Img", // '${UserDetails?.id ?? ''}',
      '${UserDetails?.name ?? ''}',
      '${UserDetails?.role_name ?? ''}',
      '${UserDetails?.designation ?? ''}',
      '${UserDetails?.contact_no ?? ''}',
      "${UserDetails?.created_at ?? ''}",
      "${UserDetails?.updated_at ?? ''}",
      facilitiesAsString,
      'Actions',
    ];
    var cells = [];
    int i = 0;

    for (var entry in controller.columnVisibility.value.entries) {
      // print({"entry.value entry": entry});
      if (entry.key == "search") {
        return null;
      }
      if (entry.value) {
        // print({"entry.value removed": entry.key});
        cells.add(cellsBuffer[i]);
      }
      i++;
    }
    cells.add('Actions');

    // print({"cell": cells});
    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: (value == 'Actions')
                ? Wrap(
                    children: [
                      // varUserAccessModel.value.access_list!
                      //             .where((e) => e.feature_id == 40 && e.view == 1)
                      //             .length >
                      //         0
                      //     ?

                      TableActionButton(
                        color: ColorValues.viewColor,
                        icon: Icons.remove_red_eye_outlined,
                        message: 'View',
                        onPress: () {
                          controller.clearStoreData();

                          // final _flutterSecureStorage =
                          //     const FlutterSecureStorage();

                          // _flutterSecureStorage.delete(key: "userId");
                          int userId = UserDetails?.id ?? 0;
                          if (userId != 0) {
                            Get.toNamed(Routes.viewUserDetail,
                                arguments: {'userId': userId});
                          }
                        },
                      ),
                      varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants.kUserFeatureId &&
                                      e.edit ==
                                          UserAccessConstants.kHaveEditAccess)
                                  .length >
                              0
                          ? TableActionButton(
                              color: ColorValues.editColor,
                              icon: Icons.edit,
                              message: 'Edit',
                              onPress: () {
                                controller.clearStoreData();

                                // final _flutterSecureStorage =
                                //     const FlutterSecureStorage();

                                // _flutterSecureStorage.delete(key: "userId");
                                int userId = UserDetails?.id ?? 0;
                                if (userId != 0) {
                                  Get.toNamed(Routes.addUser,
                                      arguments: {'userId': userId});
                                }
                              },
                            )
                          : Dimens.box0,
                      varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants.kUserFeatureId &&
                                      e.delete ==
                                          UserAccessConstants.kHaveDeleteAccess)
                                  .length >
                              0
                          ? TableActionButton(
                              color: ColorValues.deleteColor,
                              icon: Icons.delete,
                              message: 'Delete',
                              onPress: () {
                                controller.isDeleteDialog(
                                    user_id: controller.userList[index].id
                                        .toString(),
                                    user: controller.userList[index].full_name);
                              },
                            )
                          : Dimens.box0,
                    ],
                  )
                : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        controller.clearStoreData();

        // final _flutterSecureStorage = const FlutterSecureStorage();

        // _flutterSecureStorage.delete(key: "UserId");
        Get.toNamed(Routes.viewUserDetail,
            arguments: {'userId': UserDetails?.id});
      },
    );
  }

  @override
  int get rowCount => filteredUserList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
