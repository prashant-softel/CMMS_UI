import 'package:clipboard/clipboard.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../../domain/models/business_list_model.dart';
import '../../../domain/models/modulelist_model.dart';
import '../../preventive_List/preventive_list_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_swich_toggle.dart';
import '../../widgets/dropdown.dart';
import '../business_list_controller.dart';
// import '../preventive_list_controller.dart';

class BusinessListContentWeb
    extends GetView<BusinessListController> {
  RxList<BusinessListModel?> businessList =
      <BusinessListModel>[].obs;
  Rx<String> selectedBusiness = ''.obs;

  Rx<bool> isSelectedBusiness = true.obs;

  int selectedBusinessId = 1;


  BusinessListContentWeb({Key? key}) : super(key: key);
  final BusinessListController controller = Get.find();


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
                  Text(
                    "DASHBOARD",
                    style: Styles.greyLight14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(" / BUSINESS LIST",
                        style: Styles.greyMediumLight12),
                  ),
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
                    height: Get.height ,
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
                          Expanded(
                            child:
                            ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10, top: 10),
                                    child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Create Business List",
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
                                                        ? "Businesslist added Successfully in the List."
                                                        : "Businesslist updated Successfully in the List.",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Color.fromARGB(
                                                            255, 24, 243, 123)),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                            children: [
                                              Expanded(
                                                child: CustomRichText(
                                                    title: 'Business Type: '),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      .2) -
                                                      35,
                                                  child: DropdownWidget(
                                                    controller: controller,
                                                    dropdownList: controller
                                                        .businessCategoryList,
                                                    isValueSelected: controller
                                                        .isSelectedBusinessType
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedBusinessType.value,
                                                    onValueChanged:
                                                    controller.onValueChanged,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: CustomRichText(title: 'Business Name: ')),
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
                                                          .businesslistNumberCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),                                  //Business Name
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: CustomRichText(title: 'Email: ')),

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
                                                          .emailCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),                                    // Email
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: CustomRichText(title: 'Contact Person: ')),
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
                                                          .contactpersonCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),                                            //Contact Person
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: CustomRichText(title: 'Contact Number: ')),
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
                                                          .contactnumberCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),                                            //Contact Number
                                          SizedBox(height: 10,),
                                          Row(                                                     // Website
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: CustomRichText(title: 'Website: ')),
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
                                                          .websiteCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),                                            // Website
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: CustomRichText(title: 'Location: ')),
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
                                                          .locationCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),                                          //Location
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: CustomRichText(title: 'Address: ')),
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
                                                          .addressCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),                                          //Address
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: CustomRichText(title: 'Country: ')),
                                              Expanded(
                                                child: Container(
                                                  width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      .2) -
                                                      35,
                                                  child: DropdownWidget(
                                                    controller: controller,
                                                    dropdownList: controller
                                                        .countryList,
                                                    isValueSelected: controller
                                                        .isSelectedCountryType
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedCountry.value,
                                                    onValueChanged:
                                                    controller.onValueChanged,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),                                          //Coutry
                                          //Address
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: CustomRichText(title: 'State: ')),
                                              Expanded(
                                                child: Container(
                                                  width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      .2) -
                                                      35,
                                                  child: DropdownWidget(
                                                    controller: controller,
                                                    dropdownList: controller
                                                        .stateList,
                                                    isValueSelected: controller
                                                        .isSelectedStateType
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedState.value,
                                                    onValueChanged:
                                                    controller.onValueChanged,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),                                          //State
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: CustomRichText(title: 'City: ')),
                                              Expanded(
                                                child: Container(
                                                  width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      .2) -
                                                      35,
                                                  child: DropdownWidget(
                                                    controller: controller,
                                                    dropdownList: controller
                                                        .cityList,
                                                    isValueSelected: controller
                                                        .isSelectedCityType
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedCity.value,
                                                    onValueChanged:
                                                    controller.onValueChanged,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),                                          //City
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: CustomRichText(title: 'Zip: ')),
                                              Expanded (
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
                                                          .zipCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),                                          //zip
                                          SizedBox(height: 10,),
                                          SizedBox(
                                            height: 30,
                                          ),
                                        ]),

                                ),
                              ],
                            ),
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
                                      onPressed: () {},
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
                                            .createBusinessListNumber()
                                            .then((value) {
                                          print("value,$value");
                                          if (value == true)
                                            controller
                                                .issuccessCreatebusinesslist();
                                        });
                                      },
                                      text: 'Create Business List')
                                      : CustomElevatedButton(
                                      backgroundColor: ColorValues
                                          .appDarkBlueColor,
                                      onPressed: () {
                                        controller
                                            .updateBusinesslistNumber(
                                            controller
                                                .selectedItem?.id , controller.selectedItem?.status , controller.selectedItem?.addedAt
                                        )
                                            .then((value) {
                                          print("value,$value");
                                          if (value == true)
                                            controller
                                                .issuccessCreatebusinesslist();
                                        });
                                      },
                                      text: 'Update')),
                            ],
                          ),                //Cancell Nd Create Buttom
                        ],
                      ),
                    ),
                  )
                      : Container(),
                  varUserAccessModel.value.access_list!
                      .where((e) => e.feature_id == 5 && e.view == 0)
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
                                "Business List",
                                style: Styles.blackBold16,
                              ),
                            ),
                            Divider(
                              color: ColorValues.greyLightColour,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 45,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                      backgroundColor:
                                      ColorValues.appLightBlueColor,
                                      onPressed: () {
                                        FlutterClipboard.copy(controller
                                            .moduleList![0]
                                            .toString())
                                            .then((value) {
                                          print("copy data");
                                        });
                                      },
                                      text: 'Copy'),
                                ),
                                Container(
                                  height: 45,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                      backgroundColor:
                                      ColorValues.appLightBlueColor,
                                      onPressed: () {},
                                      text: 'Excel'),
                                ),
                                Container(
                                  height: 45,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                      backgroundColor:
                                      ColorValues.appLightBlueColor,
                                      onPressed: () {},
                                      text: 'PDF'),
                                ),
                                Container(
                                  height: 45,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                    backgroundColor:
                                    ColorValues.appLightBlueColor,
                                    onPressed: () {},
                                    text: 'columnVisibility'.tr,
                                  ),
                                )
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
                                  " Name ",
                                  "Email ",
                                  "Contact Person",
                                  "Contact Number",
                                  "Website",
                                  "Location",
                                  "Address",
                                  "City",
                                  "State",
                                  "Country",
                                  "Zip",
                                  "Type",
                                  "Status",
                                  "Action"
                                ].map((column) {
                                  return TableViewColumn(
                                    label: column,
                                    minWidth: Get.width * 0.16,
                                  );
                                }).toList(),
                                rows: [
                                  ...List.generate(
                                    controller.moduleList
                                        ?.length ??
                                        0,
                                        (index) {
                                      return [
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
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
                                columns: [
                                  "Id",
                                  "Name ",
                                  "Email ",
                                  "Contact Person",
                                  "Contact Number",
                                  "Website",
                                  "Location",
                                  "Address",
                                  "City",
                                  "State",
                                  "Country",
                                  "Zip",
                                  "Type",
                                  "Status",
                                  // "Added At"
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
                                    controller.moduleList
                                        ?.length ??
                                        0,
                                        (index) {
                                      var moduleListDetails =
                                      controller
                                          .moduleList?[
                                      index];
                                      return [
                                        '${moduleListDetails?.id}',
                                        '${moduleListDetails?.name}',
                                        '${moduleListDetails?.email}',
                                        '${moduleListDetails?.contactPerson}',
                                        '${moduleListDetails?.contactnumber}',
                                        '${moduleListDetails?.website}',
                                        '${moduleListDetails?.location}',
                                        '${moduleListDetails?.address}',
                                        '${moduleListDetails?.city}',
                                        '${moduleListDetails?.state}',
                                        '${moduleListDetails?.country}',
                                        '${moduleListDetails?.zip}',
                                        '${moduleListDetails?.type}',
                                        '${moduleListDetails?.status}',

                                        "Action",
                                      ];
                                    },
                                  ),
                                ].map((_businessList) {
                                  return TableViewRow(
                                      height: 60,
                                      cells: _businessList
                                          .map((value) {
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
                                                children: [
                                                  // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.edit == 1).length >
                                                  //     0
                                                  //     ?
                                                  TableActionButton(
                                                    color: ColorValues.appLightBlueColor,
                                                    icon: Icons.edit,
                                                    label: 'Edit',
                                                    onPress: () {
                                                      controller.selectedItem = controller.moduleList!.firstWhere((element) => "${element?.id}" == _businessList[0]);
                                                      controller.selectedBusinessType.value = controller.onFetchNameBusinessTypeFromId(controller.selectedItem?.type)!;
                                                      // print(controller.selectedBusinessType.value);
                                                      // print(controller.onFetchNameFromId(controller.selectedItem?.type)!);
                                                      controller.businesslistNumberCtrlr.text = controller.selectedItem?.name ?? '';
                                                      controller.emailCtrlr.text = controller.selectedItem?.email ?? '';
                                                      controller.contactpersonCtrlr.text = controller.selectedItem?.contactPerson ?? '';
                                                      controller.contactnumberCtrlr.text = controller.selectedItem?.contactnumber ?? '';
                                                      controller.websiteCtrlr.text = controller.selectedItem?.website ?? '';
                                                      controller.locationCtrlr.text = controller.selectedItem?.location ?? '';
                                                      controller.addressCtrlr.text = controller.selectedItem?.address ?? '';
                                                      controller.zipCtrlr.text = controller.selectedItem?.zip ?? '';

                                                      controller.selectedCountry.value = controller.selectedItem?.country ?? '';
                                                      controller.selectedState.value = controller.selectedItem?.state ?? '';
                                                      controller.selectedCity.value = controller.selectedItem?.city ?? '';

                                                    },
                                                  ),
                                                  //     : Container(),
                                                  // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.delete == 1).length >
                                                  //     0
                                                  //     ?
                                                  TableActionButton(
                                                    color: ColorValues.appRedColor,
                                                    icon: Icons.delete,
                                                    label: 'Delete',
                                                    onPress: () {
                                                      controller.isDeleteDialog(business_id: _businessList[0], business: _businessList[1]);

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
    );
  }
}