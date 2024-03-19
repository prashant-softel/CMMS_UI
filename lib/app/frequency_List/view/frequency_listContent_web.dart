import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_swich_toggle.dart';
import '../frequency_list_controller.dart';

class FrequencyListContentWeb extends GetView<FrequencyListController> {
  FrequencyListContentWeb({Key? key}) : super(key: key);
  final FrequencyListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Obx(
        () => Container(
          color: Color.fromARGB(255, 234, 236, 238),
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(" / FREQUENCY NUMBER", style: Styles.greyLight14)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // varUserAccessModel.value.access_list!
                    //             .where((e) => e.feature_id == 5 && e.add == 0)
                    //             .length >
                    //         0
                    //     ?
                    // : Container(),
                    // varUserAccessModel.value.access_list!
                    //             .where((e) => e.feature_id == 5 && e.view == 0)
                    //             .length >
                    //         0
                    //     ?
                    Expanded(
                      child: Container(
                        width: Get.width * 7,
                        margin: EdgeInsets.only(left: 10, top: 20),
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
                                  "Frequency List",
                                  style: Styles.blackBold16,
                                ),
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
                                  //                 .frequencyList![0]
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
                              controller.frequencyList!.isEmpty
                                  ? Expanded(
                                      child: Obx(
                                        () => DataTable2(
                                          key: UniqueKey(),
                                          dataRowHeight: 50,
                                          columnSpacing: 10,
                                          border: TableBorder.all(
                                              color: Color.fromARGB(
                                                  255, 206, 229, 234)),
                                          columns: [
                                            DataColumn2(
                                                fixedWidth: 100,
                                                label: Text(
                                                  "Id",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            DataColumn2(
                                                // fixedWidth: 100,
                                                label: Text(
                                              "Name",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                // fixedWidth: 100,
                                                label: Text(
                                              "Days",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                // fixedWidth: 100,
                                                label: Text(
                                              "Status",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ],
                                          rows: List.generate(
                                            controller.frequencyList?.length ??
                                                0,
                                            (index) {
                                              return DataRow(
                                                cells: [
                                                  DataCell(Text('')),
                                                  DataCell(Text('')),
                                                  DataCell(Text('')),
                                                  DataCell(Text('')),
                                                ],
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: Obx(
                                        () => DataTable2(
                                          key: UniqueKey(),
                                          dataRowHeight: 50,
                                          columnSpacing: 10,
                                          border: TableBorder.all(
                                              color: Color.fromARGB(
                                                  255, 206, 229, 234)),
                                          columns: [
                                            DataColumn2(
                                                fixedWidth: 100,
                                                label: Text(
                                                  "Id",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            DataColumn2(
                                                // fixedWidth: 100,
                                                label: Text(
                                              "Name",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                // fixedWidth: 100,
                                                label: Text(
                                              "Days",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                // fixedWidth: 100,
                                                label: Text(
                                              "Status",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ],
                                          rows: List.generate(
                                            controller.frequencyList?.length ??
                                                0,
                                            (index) {
                                              var frequencyListModelListDetails =
                                                  controller
                                                      .frequencyList?[index];
                                              return DataRow(
                                                cells: [
                                                  DataCell(Text(
                                                      '${frequencyListModelListDetails?.id}')),
                                                  DataCell(Text(
                                                      '${frequencyListModelListDetails?.name}')),
                                                  DataCell(Text(
                                                      '${frequencyListModelListDetails?.days}')),
                                                  DataCell(Text(
                                                      '${frequencyListModelListDetails?.status}')),
                                                ],
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    )
                    // : Container()
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
