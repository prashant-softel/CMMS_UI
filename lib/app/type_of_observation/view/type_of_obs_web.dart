import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_swich_toggle.dart';
import '../type_of_obs_controller.dart';
// import '../preventive_list_controller.dart';

class TypeOfObsWeb extends GetView<TypeOfObsController> {
  TypeOfObsWeb({Key? key}) : super(key: key);
  final TypeOfObsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Obx(
        () => Container(
          color: Color.fromARGB(255, 234, 236, 238),
          width: Get.width,
          height: Get.height,
          child: Column(
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
                        Get.offNamed(Routes.misDashboard);
                      },
                      child: Text(" / MIS", style: Styles.greyLight14),
                    ),
                    Text(" / OBSERVATION LIST", style: Styles.greyLight14),
                    // Text(" / CREATE CHECKLIST NUMBER",
                    //     style: Styles.greyMediumLight12)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    varUserAccessModel.value.access_list!
                                .where((e) => e.feature_id == 5 && e.add == 0)
                                .length >
                            0
                        ? Container(
                            width: (Get.width * .3),
                            margin: EdgeInsets.only(left: 30, top: 30),
                            height: Get.height / 2.5,
                            child: Card(
                              color: Color.fromARGB(255, 251, 252, 253),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  // Text(
                                  //     '${varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.add == 1).length}'),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10, top: 10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Create Observation Type",
                                            style: Styles.blackBold16,
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Visibility(
                                            visible: controller.isSuccess.value,
                                            child: Center(
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    controller.selectedItem ==
                                                            null
                                                        ? "ObservationList added Successfully in the List."
                                                        : "ObservationList updated Successfully in the List.",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Color.fromARGB(
                                                            255, 24, 243, 123)),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: CustomRichText(
                                                    title: 'Observation Name: '),
                                              ),
                                              SizedBox(
                                                width: 70,
                                              ),
                                              Expanded(
                                                child: Container(
                                                    width: (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2) -
                                                        30,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          offset: const Offset(
                                                            5.0,
                                                            5.0,
                                                          ),
                                                          blurRadius: 5.0,
                                                          spreadRadius: 1.0,
                                                        ),
                                                        BoxShadow(
                                                          color: ColorValues
                                                              .whiteColor,
                                                          offset: const Offset(
                                                              0.0, 0.0),
                                                          blurRadius: 0.0,
                                                          spreadRadius: 0.0,
                                                        ),
                                                      ],
                                                      color:
                                                          ColorValues.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: LoginCustomTextfield(
                                                      textController: controller
                                                          .modulelistNumberCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: CustomRichText(
                                                    title: 'Description: '),
                                              ),
                                              SizedBox(
                                                width: 70,
                                              ),
                                              Expanded(
                                                child: Container(
                                                    width: (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2) -
                                                        30,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          offset: const Offset(
                                                            5.0,
                                                            5.0,
                                                          ),
                                                          blurRadius: 5.0,
                                                          spreadRadius: 1.0,
                                                        ),
                                                        BoxShadow(
                                                          color: ColorValues
                                                              .whiteColor,
                                                          offset: const Offset(
                                                              0.0, 0.0),
                                                          blurRadius: 0.0,
                                                          spreadRadius: 0.0,
                                                        ),
                                                      ],
                                                      color:
                                                          ColorValues.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: LoginCustomTextfield(
                                                      textController:
                                                          controller.featureCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CustomRichText(
                                                    title: 'Status: '),
                                              ),
                                              Expanded(
                                                child: Checkbox(
                                                  value: controller
                                                      .isCheckedRequire.value,
                                                  onChanged: (bool? value) {
                                                    controller
                                                        .requiretoggleCheckbox();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                        ]),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 40,
                                          width: (Get.width * .1),
                                          child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appRedColor,
                                              onPressed: () {
                                                controller.cleardata();
                                              },
                                              text: 'Cancel')),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          height: 40,
                                          width: (Get.width * .2) - 70,
                                          child: controller.selectedItem == null
                                              ? CustomElevatedButton(
                                                  backgroundColor: ColorValues
                                                      .appDarkBlueColor,
                                                  onPressed: () {
                                                    controller
                                                        .createModuleListNumber()
                                                        .then((value) {
                                                      print("value,$value");
                                                      if (value == true)
                                                        controller
                                                            .issuccessCreatemodulelist();
                                                    });
                                                  },
                                                  text: 'Create Type Observation')
                                              : CustomElevatedButton(
                                                  backgroundColor: ColorValues
                                                      .appDarkBlueColor,
                                                  onPressed: () {
                                                    controller
                                                        .updateModulelistNumber(
                                                            controller
                                                                .selectedItem?.id)
                                                        .then((value) {
                                                      print("value,$value");
                                                      if (value == true)
                                                        controller
                                                            .issuccessCreatemodulelist();
                                                    });
                                                  },
                                                  text: 'Update')),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    varUserAccessModel.value.access_list!
                                .where((e) => e.feature_id == 5 && e.view == 1)
                                .length >
                            0
                        ? Expanded(
                            child: Container(
                              width: Get.width * 7,
                              margin: EdgeInsets.only(left: 10, top: 30),
                              height: Get.height,
                              child: Card(
                                color: Color.fromARGB(255, 251, 252, 253),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Observation List",
                                        style: Styles.blackBold16,
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
                                        //       backgroundColor:
                                        //           ColorValues.appLightBlueColor,
                                        //       onPressed: () {
                                        //         FlutterClipboard.copy(controller
                                        //                 .moduleList![0]
                                        //                 .toString())
                                        //             .then((value) {
                                        //           print("copy data");
                                        //         });
                                        //       },
                                        //       text: 'Copy'),
                                        // ),
                                        // Container(
                                        //   height: 35,
                                        //   margin: EdgeInsets.only(left: 10),
                                        //   child: CustomElevatedButton(
                                        //       backgroundColor:
                                        //           ColorValues.appLightBlueColor,
                                        //       onPressed: () {},
                                        //       text: 'Excel'),
                                        // ),
                                        // Container(
                                        //   height: 35,
                                        //   margin: EdgeInsets.only(left: 10),
                                        //   child: CustomElevatedButton(
                                        //       backgroundColor:
                                        //           ColorValues.appLightBlueColor,
                                        //       onPressed: () {},
                                        //       text: 'PDF'),
                                        // ),
                                        // Container(
                                        //   height: 35,
                                        //   margin: EdgeInsets.only(left: 10),
                                        //   child: CustomElevatedButton(
                                        //     backgroundColor:
                                        //         ColorValues.appLightBlueColor,
                                        //     onPressed: () {},
                                        //     text: 'columnVisibility'.tr,
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    controller.moduleList!.isEmpty
                                        ? Expanded(
                                            child: ScrollableTableView(
                                              columns: [
                                                "Id",
                                                "Observation Name ",
                                                "Description ",
                                                "Action"
                                              ].map((column) {
                                                return TableViewColumn(
                                                  label: column,
                                                  minWidth: Get.width * 0.16,
                                                );
                                              }).toList(),
                                              rows: [
                                                ...List.generate(
                                                  controller.moduleList?.length ??
                                                      0,
                                                  (index) {
                                                    return [
                                                      '',
                                                      '',
                                                      // '',
      
                                                      '',
                                                    ];
                                                  },
                                                ),
                                              ].map((record) {
                                                return TableViewRow(
                                                  height: 60,
                                                  cells: record.map((value) {
                                                    return TableViewCell(
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                );
                                              }).toList(),
                                            ),
                                          )
                                        : Expanded(
                                            child: ScrollableTableView(
                                              paginationController:
                                                  controller.paginationController,
                                              columns: [
                                                "Id",
                                                "Observation Name ",
                                                "Description ",
                                                // "Menu Image ",
      
                                                "Action"
                                              ].map((column) {
                                                return TableViewColumn(
                                                  minWidth: Get.width * 0.12,
                                                  label: column,
                                                );
                                              }).toList(),
                                              rows: //
                                                  [
                                                ...List.generate(
                                                  controller.moduleList?.length ??
                                                      0,
                                                  (index) {
                                                    var moduleListDetails =
                                                        controller
                                                            .moduleList?[index];
                                                    return [
                                                      '${moduleListDetails?.id}',
                                                      '${moduleListDetails?.name}',
                                                      // "No", //'${preventiveCheckListModelListDetails?.status ?? ''}',
                                                      '${moduleListDetails?.featureName}',
                                                      // '${moduleListDetails?.menuImage}',
                                                      "Action"
                                                    ];
                                                  },
                                                ),
                                              ].map((_moduleList) {
                                                return TableViewRow(
                                                    height: 45,
                                                    cells:
                                                        _moduleList.map((value) {
                                                      return TableViewCell(
                                                          child: (value == 'No')
                                                              ? CustomSwitchTroggle(
                                                                  value: value ==
                                                                          'No'
                                                                      ? true
                                                                      : false,
                                                                  onChanged:
                                                                      (value) {},
                                                                )
                                                              : (value ==
                                                                      "Action")
                                                                  ? Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                          // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.edit == 1).length >
                                                                          //     0
                                                                          //     ?
                                                                          TableActionButton(
                                                                            color:
                                                                                ColorValues.editColor,
                                                                            icon:
                                                                                Icons.edit,
                                                                            message:
                                                                                'Edit',
                                                                            onPress:
                                                                                () {
                                                                              controller.selectedItem = controller.moduleList!.firstWhere((element) =>
                                                                                  "${element?.id}" ==
                                                                                  _moduleList[0]);
      
                                                                              controller.modulelistNumberCtrlr.text =
                                                                                  controller.selectedItem?.name ?? '';
                                                                              controller.featureCtrlr.text =
                                                                                  controller.selectedItem?.featureName ?? '';
      
                                                                              // controller.durationCtrlr.text = "${controller.selectedItem?.featureName}";
                                                                              // // controller.manpowerCtrlr.text = "${controller.selectedItem?.menuImage}";
                                                                              // // controller.selectedfrequency.value = controller.selectedItem?.frequency_name ?? "";
                                                                              // // controller.selectedequipment.value = controller.selectedItem?.category_name ?? "";
                                                                              // controller.selectedEquipmentId = controller.selectedItem?.add ?? 0;
                                                                              // controller.selectedfrequencyId = controller.selectedItem?.edit ?? 0;
                                                                              // controller.selectedfrequencyId = controller.selectedItem?.delete ?? 0;
                                                                              // controller.selectedfrequencyId = controller.selectedItem?.view ?? 0;
                                                                              // controller.selectedfrequencyId = controller.selectedItem?.approve ?? 0;
                                                                              // controller.selectedfrequencyId = controller.selectedItem?.issue ?? 0;
                                                                              // controller.selectedfrequencyId = controller.selectedItem?.selfView ?? 0;
                                                                            },
                                                                          ),
                                                                          //     : Container(),
                                                                          // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.delete == 1).length >
                                                                          //     0
                                                                          //     ?
                                                                          TableActionButton(
                                                                            color:
                                                                                ColorValues.deleteColor,
                                                                            icon:
                                                                                Icons.delete,
                                                                            message:
                                                                                'Delete',
                                                                            onPress:
                                                                                () {
                                                                              print(_moduleList[0]);
                                                                              controller.isDeleteDialog(
                                                                                  module_id: _moduleList[0],
                                                                                  module: _moduleList[1]);
                                                                            },
                                                                          )
                                                                          // : Container()
                                                                        ])
                                                                  : Text(
                                                                      value,
                                                                    ));
                                                    }).toList());
                                              }).toList(),
                                            ),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: ValueListenableBuilder(
                                          valueListenable:
                                              controller.paginationController,
                                          builder: (context, value, child) {
                                            return Row(children: [
                                              Text(
                                                  "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
                                              Row(children: [
                                                IconButton(
                                                  onPressed: controller
                                                              .paginationController
                                                              .currentPage <=
                                                          1
                                                      ? null
                                                      : () {
                                                          controller
                                                              .paginationController
                                                              .previous();
                                                        },
                                                  iconSize: 20,
                                                  splashRadius: 20,
                                                  icon: Icon(
                                                    Icons
                                                        .arrow_back_ios_new_rounded,
                                                    color: controller
                                                                .paginationController
                                                                .currentPage <=
                                                            1
                                                        ? Colors.black26
                                                        : Theme.of(context)
                                                            .primaryColor,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: controller
                                                              .paginationController
                                                              .currentPage >=
                                                          controller
                                                              .paginationController
                                                              .pageCount
                                                      ? null
                                                      : () {
                                                          controller
                                                              .paginationController
                                                              .next();
                                                        },
                                                  iconSize: 20,
                                                  splashRadius: 20,
                                                  icon: Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    color: controller
                                                                .paginationController
                                                                .currentPage >=
                                                            controller
                                                                .paginationController
                                                                .pageCount
                                                        ? Colors.black26
                                                        : Theme.of(context)
                                                            .primaryColor,
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
                          )
                        : Container()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
