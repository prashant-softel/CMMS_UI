import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../../domain/models/document_manager_model.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/table_action_button.dart';
import '../document_manager_controller.dart';

class DocumentManagerWeb extends GetView<DocumentManagerController> {
  DocumentManagerWeb({super.key});

  ///
  var controller = Get.find<DocumentManagerController>();
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Obx(
        () => Column(
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
                    child: Text(" / MASTERS", style: Styles.greyLight14),
                  ),
                  Text(" / DOCUMENT MANAGER", style: Styles.greyLight14),
                ],
              ),
            ),
            Flexible(
              child: Container(
                width: Get.width * 7,
                margin: EdgeInsets.only(left: 10, top: 30),
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
                              "Document List ",
                              style: Styles.blackBold16,
                            ),
                            Spacer(),
                            ActionButton(
                              icon: Icons.add,
                              label: "Upload Document",
                              onPressed: () {
                                Get.offNamed(Routes.addUser);
                              },
                              color: ColorValues.addNewColor,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: ColorValues.greyLightColour,
                      ),
                      Row(
                        children: [
                          // Container(
                          //   height: 35,
                          //   margin: EdgeInsets.only(left: 10),
                          //   child: CustomElevatedButton(
                          //     backgroundColor: ColorValues.appLightBlueColor,
                          //     onPressed: () {},
                          //     text: 'columnVisibility'.tr,
                          //   ),
                          // ),
                          // Container(
                          //   height: 35,
                          //   margin: EdgeInsets.only(left: 10),
                          //   child: CustomElevatedButton(
                          //       backgroundColor: ColorValues.appLightBlueColor,
                          //       onPressed: () {},
                          //       text: 'Copy'),
                          // ),
                          // Container(
                          //   height: 35,
                          //   margin: EdgeInsets.only(left: 10),
                          //   child: CustomElevatedButton(
                          //       backgroundColor: ColorValues.appLightBlueColor,
                          //       onPressed: () {},
                          //       text: 'Excel'),
                          // ),
                          // Container(
                          //   height: 35,
                          //   margin: EdgeInsets.only(left: 10),
                          //   child: CustomElevatedButton(
                          //       backgroundColor: ColorValues.appLightBlueColor,
                          //       onPressed: () {},
                          //       text: 'PDF'),
                          // ),
                          Spacer(),
                          Container(
                            width: 200,
                            height: 35,
                            margin: Dimens.edgeInsets0_0_16_0,
                            child: TextField(
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 16.0,
                                    height: 1.0,
                                    color: Colors.black),
                              ),
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                contentPadding: Dimens.edgeInsets10_0_0_0,
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
                      Expanded(
                        child: Container(
                            width: Get.width,
                            margin: Dimens.edgeInsets15,
                            decoration: BoxDecoration(
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
                            child:
                                controller.userList!.isEmpty == true &&
                                        controller.isLoading == false
                                    ? Center(
                                        child: Text(
                                          "No data Found.....",
                                        ),
                                      )
                                    : controller.isLoading.value == true
                                        ? Center(
                                            child: Text("Data Loading......"))
                                        : ScrollableTableView(
                                            paginationController:
                                                controller.paginationController,
                                            columns: [
                                              "Document ID ",
                                              "Site Name",
                                              "Category Name",
                                              "Status",
                                              "Action"
                                            ].map((column) {
                                              if (column == "Action") {
                                                return TableViewColumn(
                                                  minWidth: 300,
                                                  label: column,
                                                );
                                              } else {
                                                return TableViewColumn(
                                                  minWidth: 200,
                                                  label: column,
                                                );
                                              }
                                            }).toList(),
                                            rows: //
                                                [
                                              ...List.generate(
                                                controller.userList?.length ??
                                                    0,
                                                (index) {
                                                  var userListModelListDetails =
                                                      controller
                                                          .userList?[index];
                                                  return [
                                                    '${userListModelListDetails?.user_name}',
                                                    '${userListModelListDetails?.role_name}',
                                                    '${userListModelListDetails?.contact_no}',
                                                    '${userListModelListDetails?.status}',
                                                    "Action"
                                                  ];
                                                },
                                              ),
                                            ].map((_userList) {
                                              return TableViewRow(
                                                  onTap: () {
                                                    controller.selectedItem = controller
                                                        .userList!
                                                        .firstWhere((element) =>
                                                            "${element?.user_name}" ==
                                                            _userList[1]);
                                                    int userId = controller
                                                            .selectedItem?.id ??
                                                        0;
                                                    if (userId != 0) {
                                                      Get.offNamed(
                                                          Routes.viewUserDetail,
                                                          arguments: userId);
                                                    }
                                                  },
                                                  height: 60,
                                                  cells: _userList.map((value) {
                                                    return TableViewCell(
                                                        child: (value ==
                                                                "Profile_Img")
                                                            ? controller
                                                                        .userList!
                                                                        .firstWhere(
                                                                          (e) =>
                                                                              "${e?.photoPath}" ==
                                                                              _userList[0],
                                                                          orElse: () =>
                                                                              DocumentManagerModel(id: 000),
                                                                        )
                                                                        ?.photoPath !=
                                                                    null
                                                                ? Container(
                                                                    height: 45,
                                                                    width: 45,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          171,
                                                                          38,
                                                                          38),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            134,
                                                                            78,
                                                                            78),
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100),
                                                                    ),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {},
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .person,
                                                                          size:
                                                                              25,
                                                                          color:
                                                                              ColorValues.appBlueBackgroundColor,
                                                                        ),
                                                                      ), //Circ
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    height: 45,
                                                                    width: 45,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: ColorValues
                                                                          .appDarkGreyColor,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: ColorValues
                                                                            .appDarkGreyColor,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100),
                                                                    ),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {},
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .person,
                                                                          size:
                                                                              25,
                                                                          color:
                                                                              ColorValues.appBlueBackgroundColor,
                                                                        ),
                                                                      ), //Circ
                                                                    ),
                                                                  )
                                                            : (value ==
                                                                    "Action")
                                                                ? Wrap(
                                                                    children: [
                                                                        TableActionButton(
                                                                          color:
                                                                              ColorValues.appDarkBlueColor,
                                                                          icon:
                                                                              Icons.remove_red_eye_outlined,
                                                                          message:
                                                                              'view',
                                                                          onPress:
                                                                              () {
                                                                            controller.selectedItem = controller.userList!.firstWhere((element) =>
                                                                                "${element?.user_name}" ==
                                                                                _userList[1]);
                                                                            int userId =
                                                                                controller.selectedItem?.id ?? 0;
                                                                            if (userId !=
                                                                                0) {
                                                                              Get.offNamed(Routes.viewUserDetail, arguments: userId);
                                                                            }
                                                                          },
                                                                        ),
                                                                        TableActionButton(
                                                                          color:
                                                                              ColorValues.appYellowColor,
                                                                          icon:
                                                                              Icons.download,
                                                                          message:
                                                                              'Edit',
                                                                          onPress:
                                                                              () {
                                                                            controller.selectedItem = controller.userList!.firstWhere((element) =>
                                                                                "${element?.user_name}" ==
                                                                                _userList[1]);
                                                                            int userId =
                                                                                controller.selectedItem?.id ?? 0;
                                                                            if (userId !=
                                                                                0) {
                                                                              Get.offNamed(Routes.addUser, arguments: userId);
                                                                            }
                                                                          },
                                                                        ),
                                                                        TableActionButton(
                                                                          color:
                                                                              ColorValues.appGreenColor,
                                                                          icon:
                                                                              Icons.check,
                                                                          message:
                                                                              'Edit',
                                                                          onPress:
                                                                              () {
                                                                            controller.selectedItem = controller.userList!.firstWhere((element) =>
                                                                                "${element?.user_name}" ==
                                                                                _userList[1]);
                                                                            int userId =
                                                                                controller.selectedItem?.id ?? 0;
                                                                            if (userId !=
                                                                                0) {
                                                                              Get.offNamed(Routes.addUser, arguments: userId);
                                                                            }
                                                                          },
                                                                        ),
                                                                        TableActionButton(
                                                                          color:
                                                                              ColorValues.appRedColor,
                                                                          icon:
                                                                              Icons.close,
                                                                          message:
                                                                              'Edit',
                                                                          onPress:
                                                                              () {
                                                                            controller.selectedItem = controller.userList!.firstWhere((element) =>
                                                                                "${element?.user_name}" ==
                                                                                _userList[1]);
                                                                            int userId =
                                                                                controller.selectedItem?.id ?? 0;
                                                                            if (userId !=
                                                                                0) {
                                                                              Get.offNamed(Routes.addUser, arguments: userId);
                                                                            }
                                                                          },
                                                                        ),
                                                                        TableActionButton(
                                                                          color:
                                                                              ColorValues.skyBlueColor,
                                                                          icon:
                                                                              Icons.send,
                                                                          message:
                                                                              'Delete',
                                                                          onPress:
                                                                              () {},
                                                                        )
                                                                      ])
                                                                : Expanded(
                                                                    child: Text(
                                                                      value,
                                                                    ),
                                                                  ));
                                                  }).toList());
                                            }).toList(),
                                          )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: ValueListenableBuilder(
                            valueListenable: controller.paginationController,
                            builder: (context, value, child) {
                              return Row(children: [
                                Text(
                                    "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
                                Row(children: [
                                  IconButton(
                                    onPressed: controller.paginationController
                                                .currentPage <=
                                            1
                                        ? null
                                        : () {
                                            controller.paginationController
                                                .previous();
                                          },
                                    iconSize: 20,
                                    splashRadius: 20,
                                    icon: Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: controller.paginationController
                                                  .currentPage <=
                                              1
                                          ? Colors.black26
                                          : Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: controller.paginationController
                                                .currentPage >=
                                            controller
                                                .paginationController.pageCount
                                        ? null
                                        : () {
                                            controller.paginationController
                                                .next();
                                          },
                                    iconSize: 20,
                                    splashRadius: 20,
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: controller.paginationController
                                                  .currentPage >=
                                              controller.paginationController
                                                  .pageCount
                                          ? Colors.black26
                                          : Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ]),
                              ]);
                            }),
                      ),
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
