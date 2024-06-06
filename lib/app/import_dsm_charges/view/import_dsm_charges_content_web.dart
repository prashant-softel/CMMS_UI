import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/import_dsm_charges/import_dsm_charges_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';

class ImportDsmChargesContentWeb extends StatefulWidget {
  ImportDsmChargesContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ImportDsmChargesContentWeb> createState() =>
      _ImportDsmChargesContentWebState();
}

class _ImportDsmChargesContentWebState
    extends State<ImportDsmChargesContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImportDsmChargesController>(
        id: 'user_list',
        builder: (controller) {
          // return Obx(() {

          return SelectionArea(
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
                          Get.offNamed(Routes.dsmDashboardScreen);
                        },
                        child: Text(" / MASTER", style: Styles.greyLight14),
                      ),
                      Text(" / IMPORT F&S DSM CHARGES",
                          style: Styles.greyLight14),
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
                                  child: Text(
                                    "IMPORT F&S DSM CHARGES",
                                    style: Styles.blackBold16,
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Dimens.boxHeight10,
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Site name :",
                                                  style: Styles.black15,
                                                ),
                                                Dimens.boxWidth5,
                                                DropdownWebStock(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      6,
                                                  dropdownList:
                                                      controller.siteName,
                                                  // selectedValue: ,
                                                  onValueChanged: (wasteData,
                                                      selectedValue) {},
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Year :",
                                                  style: Styles.black15,
                                                ),
                                                Dimens.boxWidth5,
                                                DropdownWebStock(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      6,
                                                  dropdownList: controller.year,
                                                  onValueChanged: (wasteData,
                                                      selectedValue) {},
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Month :",
                                                  style: Styles.black15,
                                                ),
                                                Dimens.boxWidth5,
                                                DropdownWebStock(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      6,
                                                  dropdownList:
                                                      controller.month,
                                                  // selectedValue: ,
                                                  onValueChanged: (wasteData,
                                                      selectedValue) {},
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight20,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            height: 25,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appDarkBlueColor,
                                              onPressed: () {},
                                              text: 'BROWSE',
                                            ),
                                          ),
                                          Dimens.boxWidth10,
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              child: LoginCustomTextfield(
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2),
                                              )),
                                        ],
                                      ),
                                      Dimens.boxHeight20,
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        height: 30,
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.approveColor,
                                          onPressed: () {},
                                          text: 'Upload',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Dimens.boxHeight10,
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
  //);
}
