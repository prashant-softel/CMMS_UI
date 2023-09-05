import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/domain/models/user_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/custom_elevated_button.dart';
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
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserListController>(
        id: 'user_list',
        builder: (controller) {
          return Obx(() {
            final dataSource = UserDataSource(controller);

            return Column(
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
                        child:
                            Text(" / MASTER", style: Styles.greyMediumLight12),
                      ),
                      Text(" / USER LIST", style: Styles.greyMediumLight12),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: Get.width * 7,
                      margin: EdgeInsets.all(10),
                      height: Get.height,
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
                                    ActionButton(
                                      icon: Icons.add,
                                      label: "Add New",
                                      onPressed: () {
                                        Get.toNamed(Routes.addUser);
                                      },
                                      color: ColorValues.greenlightColor,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appLightBlueColor,
                                      onPressed: () {},
                                      text: 'columnVisibility'.tr,
                                    ),
                                  ),
                                  Container(
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () {},
                                        text: 'Copy'),
                                  ),
                                  Container(
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () {},
                                        text: 'Excel'),
                                  ),
                                  Container(
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () {},
                                        text: 'PDF'),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 200,
                                    height: 35,
                                    margin: Dimens.edgeInsets0_0_16_0,
                                    child: TextField(
                                      onChanged: (value) =>
                                          controller.search(value),
                                      decoration: InputDecoration(
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 0.0),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 0.0),
                                        ),
                                        contentPadding:
                                            Dimens.edgeInsets10_0_0_0,
                                        hintText: 'search'.tr,
                                        hintStyle: Styles.grey12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              controller.userList.isEmpty == true
                                  ? Center(child: Text('No data'))
                                  : Expanded(
                                      child: PaginatedDataTable2(
                                        // fixedLeftColumns: 1,
                                        // dataRowHeight: Get.height * 0.12,
                                        columnSpacing: 10,
                                        source:
                                            dataSource, // Custom DataSource class
                                        headingRowHeight: Get.height * 0.12,
                                        minWidth: Get.width * 1.2,
                                        showCheckboxColumn: false,
                                        rowsPerPage:
                                            10, // Number of rows per page
                                        availableRowsPerPage: [10, 20, 30, 50],
                                        columns: [
                                          buildDataColumn(
                                            'Profile',
                                            'Profile',
                                            //  ColumnSize.S,
                                            controller.idFilterText,
                                            100,
                                          ),
                                          buildDataColumn(
                                              "UserLoginID",
                                              "User Login ID",
                                              // ColumnSize.M,
                                              controller.userLoginIdFilterText,
                                              400),
                                          buildDataColumn(
                                              "UserRole",
                                              "User Role", // ColumnSize.L,
                                              controller.userRoleFilterText,
                                              150),
                                          buildDataColumn(
                                              "ContactNumber",
                                              "Contact Number",
                                              // ColumnSize.L,
                                              controller.contractFilterText,
                                              170),
                                          buildDataColumn(
                                              "CreatedOn",
                                              "Created On",
                                              // ColumnSize.L,
                                              controller.createdOnFilterText,
                                              170),
                                          buildDataColumn(
                                              "UpdatedOn",
                                              "Updated On",
                                              // ColumnSize.L,
                                              controller.updatedOnFilterText,
                                              150),
                                          buildDataColumn(
                                              'action'.tr,
                                              'Actions',
                                              // ColumnSize.L,
                                              controller.userDateFilterText,
                                              150),
                                        ],
                                      ),
                                    )
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }

  DataColumn2 buildDataColumn(
    String columnName,
    String header,

    /// ColumnSize columnSize,
    RxString filterText,
    double? fixedWidth,
  ) {
    return //
        DataColumn2(
      // size: columnSize,
      fixedWidth: fixedWidth,

      label: //
          Column(
              mainAxisAlignment: MainAxisAlignment.center, //
              children: [
            SizedBox(
              height: Get.height * 0.05,
              child: TextField(
                onChanged: (value) {
                  filterText.value = value;
                },
                textAlign: TextAlign.left,
                style: TextStyle(height: 1.0),
                decoration: InputDecoration(
                  hintText: 'Filter',
                  contentPadding: EdgeInsets.fromLTRB(
                      5, 0, 5, 0), // Reduced vertical padding
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                header,
                style: Styles.black16W500,
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
      return (User?.id ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.idFilterText.value.toLowerCase()) &&
          (User?.name ?? '')
              .toLowerCase()
              .contains(controller.userLoginIdFilterText.value.toLowerCase()) &&
          (User?.role_name ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.userRoleFilterText.value.toLowerCase()) &&
          (User?.contact_no ?? '')
              .toLowerCase()
              .contains(controller.contractFilterText.value.toLowerCase());
      // (User?.status ?? '')
      //     .toString()
      //     .toLowerCase()
      //     .contains(controller.statusFilterText.value.toLowerCase());
      // Add other filter conditions as needed
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    final UserDetails = filteredUserList[index];

    controller.userId.value = UserDetails?.id ?? 0;

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Image.asset(
            height: 45,
            width: 45,
            'assets/files/proimg.png',
            fit: BoxFit.cover,
          ),
        ),
        ...[
          '${UserDetails?.name ?? ''}',
          '${UserDetails?.role_name ?? ''}',
          '${UserDetails?.contact_no ?? ''}',
          "2023-03-26",
          "2023-05-26",
          'Actions',
        ].map((value) {
          return DataCell(
            Padding(
              padding: EdgeInsets.zero,
              child: (value == 'Actions')
                  ? Wrap(children: [
                      TableActionButton(
                        color: ColorValues.viewColor,
                        icon: Icons.remove_red_eye_outlined,
                        message: 'view',
                        onPress: () {
                          final _flutterSecureStorage =
                              const FlutterSecureStorage();

                          _flutterSecureStorage.delete(key: "userId");
                          // controller.selectedItem = controller.filteredData
                          //     .firstWhere(
                          //         (element) => "${element?.name}" == value[1]);
                          int userId = UserDetails?.id ?? 0;
                          if (userId != 0) {
                            Get.toNamed(Routes.viewUserDetail,
                                arguments: {'userId': userId});
                          }
                        },
                      ),
                      TableActionButton(
                        color: ColorValues.editColor,
                        icon: Icons.edit,
                        message: 'Edit',
                        onPress: () {
                          final _flutterSecureStorage =
                              const FlutterSecureStorage();

                          _flutterSecureStorage.delete(key: "userId");
                          // controller.selectedItem = controller.filteredData
                          //     .firstWhere(
                          //         (element) => "${element?.name}" == value[1]);
                          int userId = UserDetails?.id ?? 0;
                          if (userId != 0) {
                            Get.toNamed(Routes.addUser,
                                arguments: {'userId': userId});
                          }
                        },
                      ),
                      TableActionButton(
                        color: ColorValues.deleteColor,
                        icon: Icons.delete,
                        message: 'Delete',
                        onPress: () {},
                      )
                    ])
                  : Text(value.toString()),
            ),
          );
        }).toList(),
      ],
      onSelectChanged: (_) {
        final _flutterSecureStorage = const FlutterSecureStorage();

        _flutterSecureStorage.delete(key: "UserId");
        Get.toNamed(Routes.viewUserDetail,
            arguments: {'userId': UserDetails?.id});
        //  controller.goToUserDetailsScreen(int.tryParse('${UserDetails?.id}'));
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
