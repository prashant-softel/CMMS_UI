import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_swich_toggle.dart';
import '../country_list_controller.dart';

class CountryListContentWeb extends GetView<CountryListController> {
  CountryListContentWeb({Key? key}) : super(key: key);
  final CountryListController controller = Get.find();

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
                    child: Text(
                      " / MASTERS",
                      style: Styles.greyLight14,
                    ),
                  ),
                  Text(
                    " / COUNTRY LIST ",
                    style: Styles.greyLight14,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: Get.width * 0.2,
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
                                "country List",
                                style: Styles.blackBold16,
                              ),
                            ),
                            Divider(
                              color: ColorValues.greyLightColour,
                            ),
                            Row(
                              children: [],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            controller.countryList!.isEmpty
                                ? Expanded(
                                    child: ScrollableTableView(
                                      columns: ["Id", "Country ", "Action"]
                                          .map((column) {
                                        return TableViewColumn(
                                          label: column,
                                          minWidth: Get.width * 0.36,
                                        );
                                      }).toList(),
                                      rows: [
                                        ...List.generate(
                                          controller.countryList?.length ?? 0,
                                          (index) {
                                            return [
                                              '',
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
                                      columns: ["Id", "Country ", "Action"]
                                          .map((column) {
                                        return TableViewColumn(
                                          minWidth: Get.width * 0.36,
                                          label: column,
                                        );
                                      }).toList(),
                                      rows: [
                                        ...List.generate(
                                          controller.countryList?.length ?? 0,
                                          (index) {
                                            var countryListDetails =
                                                controller.countryList?[index];
                                            return [
                                              '${countryListDetails?.id}',
                                              '${countryListDetails?.name}',
                                              "Action"
                                            ];
                                          },
                                        ),
                                      ].map((_moduleList) {
                                        return TableViewRow(
                                            height: 60,
                                            cells: _moduleList.map((value) {
                                              return TableViewCell(
                                                  child: (value == 'No')
                                                      ? CustomSwitchTroggle(
                                                          value: value == 'No'
                                                              ? true
                                                              : false,
                                                          onChanged: (value) {},
                                                        )
                                                      : (value == "Action")
                                                          ? Row(children: [
                                                              TableActionButton(
                                                                color: ColorValues
                                                                    .appLightBlueColor,
                                                                icon:
                                                                    Icons.edit,
                                                                message: 'Edit',
                                                                onPress: () {
                                                                  controller.selectedItem = controller
                                                                      .countryList!
                                                                      .firstWhere((element) =>
                                                                          "${element?.id}" ==
                                                                          _moduleList[
                                                                              0]);
                                                                },
                                                              ),
                                                              TableActionButton(
                                                                color: ColorValues
                                                                    .appRedColor,
                                                                icon: Icons
                                                                    .delete,
                                                                message:
                                                                    'Delete',
                                                                onPress: () {
                                                                  print(
                                                                      _moduleList[
                                                                          0]);
                                                                  controller.isDeleteDialog(
                                                                      module_id:
                                                                          _moduleList[
                                                                              0],
                                                                      module:
                                                                          _moduleList[
                                                                              1]);
                                                                },
                                                              ),
                                                              TableActionButton(
                                                                color: ColorValues
                                                                    .facebookButtonColor,
                                                                icon: Icons
                                                                    .navigation_sharp,
                                                                message:
                                                                    'Go To States',
                                                                onPress: () {
                                                                  controller
                                                                      .goToStatesScreen();
                                                                },
                                                              )
                                                            ])
                                                          : Text(
                                                              value,
                                                            ));
                                            }).toList());
                                      }).toList(),
                                    ),
                                  ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
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
                                            Icons.arrow_back_ios_new_rounded,
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
                                            Icons.arrow_forward_ios_rounded,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
