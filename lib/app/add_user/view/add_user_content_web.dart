import 'package:cmms/app/add_user/add_user_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../navigators/app_pages.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textField.dart';

class AddUserContentWeb extends StatefulWidget {
  AddUserContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<AddUserContentWeb> createState() => _AddUserContentWebState();
}

class _AddUserContentWebState extends State<AddUserContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddUserController>(
        id: 'stock_Mangement',
        builder: (controller) {
          return SelectionArea(
            child: Container(
                color: Color.fromARGB(255, 234, 236, 238),
                width: Get.width,
                height: Get.height,
                child: Stack(children: [
                  Column(
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
                                final _flutterSecureStorage =
                                    const FlutterSecureStorage();

                                _flutterSecureStorage.delete(key: "userId");

                                Get.offNamed(Routes.masterDashboard);
                              },
                              child:
                                  Text(" / MASTER", style: Styles.greyLight14),
                            ),
                            InkWell(
                                onTap: () {
                                  final _flutterSecureStorage =
                                      const FlutterSecureStorage();

                                  _flutterSecureStorage.delete(key: "userId");

                                  Get.offNamed(Routes.userList);
                                },
                                child: Text(" / USER LIST",
                                    style: Styles.greyLight14)),
                            Obx(
                              () => Text(
                                  controller.userId.value == 0
                                      ? " / ADD USER"
                                      : " / EDIT USER",
                                  style: Styles.greyLight14),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Obx(
                            () => Container(
                              //   margin: Dimens.edgeInsets20,
                              color: Color.fromARGB(255, 245, 248, 250),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          controller.userId.value == 0
                                              ? "Add User "
                                              : "Edit User",
                                          style: Styles.blackBold16,
                                        ),
                                        Spacer(),
                                        ActionButton(
                                          icon: Icons.menu,
                                          label: "User List",
                                          onPressed: () {
                                            final _flutterSecureStorage =
                                                const FlutterSecureStorage();

                                            _flutterSecureStorage.delete(
                                                key: "userId");

                                            Get.offNamed(Routes.userList);
                                          },
                                          color: ColorValues.addNewColor,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 210,
                                          child: Stack(
                                            children: [
                                              controller.selectedImagePath.value
                                                      .isNotEmpty
                                                  ? GestureDetector(
                                                      onTap: () => controller
                                                          .getImage(ImageSource
                                                              .gallery),
                                                      child: Container(
                                                        height: controller
                                                            .thumbnailSize,
                                                        width: controller
                                                            .thumbnailSize,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          child: Image.memory(
                                                            controller
                                                                .selectedImageBytes
                                                                .value,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      height: controller
                                                          .thumbnailSize,
                                                      width: controller
                                                          .thumbnailSize,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 195, 192, 192),
                                                        border: Border.all(
                                                          color: ColorValues
                                                              .appLightGreyColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.image,
                                                            size: 70,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    215,
                                                                    192,
                                                                    141),
                                                          ),
                                                          // Dimens.boxHeight10,
                                                          SizedBox(height: 10),
                                                          Text("Upload Photo",
                                                              style: Styles
                                                                  .greyMediumLight12)
                                                        ],
                                                      ),
                                                    ),
                                              Positioned(
                                                top: 150,
                                                left: 100,
                                                right: 0,
                                                child: Center(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.getImage(
                                                          ImageSource.gallery);
                                                    },
                                                    child: Container(
                                                      height: 45,
                                                      width: 45,
                                                      decoration: BoxDecoration(
                                                        color: ColorValues
                                                            .appDarkBlueColor,
                                                        border: Border.all(
                                                          color: ColorValues
                                                              .appDarkBlueColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          size: 40,
                                                          color: ColorValues
                                                              .whiteColor,
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
                                        // Dimens.boxWidth30,
                                        SizedBox(width: 30),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Login ID: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 227, 224, 224),
                                                        width: 1,
                                                      ),
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
                                                    ),
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    child: LoginCustomTextfield(
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .deny(RegExp(
                                                                  r'\s')),
                                                        ],
                                                        ishint:
                                                            'Enter Email ID',
                                                        textController:
                                                            controller
                                                                .loginIdCtrlr,
                                                        //validation
                                                        errorController: controller
                                                                .isLoginIDInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .isLoginIDInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isLoginIDInvalid
                                                                .value = true;
                                                          }
                                                        })),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'First Name: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 227, 224, 224),
                                                        width: 1,
                                                      ),
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
                                                    ),
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    child: LoginCustomTextfield(
                                                        ishint:
                                                            'Enter First Name',
                                                        textController:
                                                            controller
                                                                .firstNameCtrlr,
                                                        //validation
                                                        errorController: controller
                                                                .isFirstNameInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .isFirstNameInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isFirstNameInvalid
                                                                .value = true;
                                                          }
                                                        })),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Secondary E-mail: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 227, 224, 224),
                                                        width: 1,
                                                      ),
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
                                                    ),
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    child: LoginCustomTextfield(
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .deny(RegExp(
                                                                  r'\s')),
                                                        ],
                                                        ishint:
                                                            'Enter Email ID',
                                                        textController: controller
                                                            .secandoryIdCtrlr,

                                                        //validation
                                                        errorController: controller
                                                                .isSecondaryEmailInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .isSecondaryEmailInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isSecondaryEmailInvalid
                                                                .value = true;
                                                          }
                                                        })),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Gender: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  height: 35,
                                                  child: DropdownWebWidget(
                                                    controller: controller,
                                                    dropdownList:
                                                        controller.genderList,
                                                    isValueSelected: controller
                                                        .isSelectedGender.value,
                                                    selectedValue: controller
                                                        .selectedGender.value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                  //   DropdownButtonHideUnderline(
                                                  //     child: DropdownButton<String>(
                                                  //       isExpanded: true,
                                                  //       value:
                                                  //           controller.gender.value,
                                                  //       onChanged: (value) =>
                                                  //           controller.updateGender(
                                                  //               value!),
                                                  //       items: <String>[
                                                  //         'Select Gender',
                                                  //         'Male',
                                                  //         'Female',
                                                  //         'Other'
                                                  //       ].map<
                                                  //               DropdownMenuItem<
                                                  //                   String>>(
                                                  //           (String value) {
                                                  //         return DropdownMenuItem<
                                                  //             String>(
                                                  //           value: value,
                                                  //           child: Container(
                                                  //             margin:
                                                  //                 EdgeInsets.only(
                                                  //                     left: 10),
                                                  //             child: Text(
                                                  //               value,
                                                  //               style:
                                                  //                   Styles.black12,
                                                  //             ),
                                                  //           ),
                                                  //         );
                                                  //       }).toList(),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                ),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Mobile Number: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 227, 224, 224),
                                                        width: 1,
                                                      ),
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
                                                    ),
                                                    width: (MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        .2),
                                                    child: LoginCustomTextfield(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: <TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        ishint:
                                                            'Enter Mobile Number',
                                                        textController:
                                                            controller
                                                                .mobileNoCtrlr,
                                                        //validation
                                                        errorController: controller
                                                                .isMobileNumberInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .isMobileNumberInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isMobileNumberInvalid
                                                                .value = true;
                                                          }
                                                        })),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Country: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: DropdownWebWidget(
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
                                                    controller: controller,
                                                    dropdownList:
                                                        controller.countryList,
                                                    isValueSelected: controller
                                                        .isSelectedCountry
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedCountry.value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),

                                            Row(
                                              children: [
                                                CustomRichText(title: 'City: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: DropdownWebWidget(
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
                                                    controller: controller,
                                                    dropdownList:
                                                        controller.cityList,
                                                    isValueSelected: controller
                                                        .isSelectedCity.value,
                                                    selectedValue: controller
                                                        .selectedCity.value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                CustomRichText(title: 'Role: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: DropdownWebWidget(
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
                                                    controller: controller,
                                                    dropdownList:
                                                        controller.roleList,
                                                    isValueSelected: controller
                                                        .isSelectedRole.value,
                                                    selectedValue: controller
                                                        .selectedRole.value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Company Name: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: DropdownWebWidget(
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
                                                    controller: controller,
                                                    dropdownList:
                                                        controller.businessList,
                                                    isValueSelected: controller
                                                        .isBusinessListSelected
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedIBusinessList
                                                        .value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Spacer(),

                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Password: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 227, 224, 224),
                                                        width: 1,
                                                      ),
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
                                                    ),
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    child: LoginCustomTextfield(
                                                      widget: MouseRegion(
                                                        onEnter: (_) {
                                                          if (!controller
                                                              .isPasswordVisible
                                                              .value) {
                                                            controller
                                                                .togglePasswordVisibility();
                                                          }
                                                        },
                                                        onExit: (_) {
                                                          if (controller
                                                              .isPasswordVisible
                                                              .value) {
                                                            controller
                                                                .togglePasswordVisibility();
                                                          }
                                                        },
                                                        child: IconButton(
                                                          icon: Icon(
                                                              controller
                                                                      .isPasswordVisible
                                                                      .value
                                                                  ? Icons
                                                                      .visibility
                                                                  : Icons
                                                                      .visibility_off,
                                                              color:
                                                                  Colors.grey),
                                                          onPressed: () {
                                                            controller
                                                                .togglePasswordVisibility();
                                                          },
                                                        ),
                                                      ),
                                                      obscureText: !controller
                                                          .isPasswordVisible
                                                          .value,
                                                      ishint: 'Enter Password',
                                                      textController: controller
                                                          .passwordCtrlr,
                                                      //validation
                                                      errorController: controller
                                                              .isPasswordInvalid
                                                              .value
                                                          ? "Required field"
                                                          : null,

                                                      onChanged: (value) {
                                                        if (value
                                                                .trim()
                                                                .length >
                                                            0) {
                                                          controller
                                                              .isPasswordInvalid
                                                              .value = false;
                                                        } else {
                                                          controller
                                                              .isPasswordInvalid
                                                              .value = true;
                                                        }
                                                      },

                                                      // onChanged: (value) {
                                                      //   // controller.validatePassword(value);
                                                      // },
                                                      autofillHints: const [],
                                                    )),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Last Name: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 227, 224, 224),
                                                        width: 1,
                                                      ),
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
                                                    ),
                                                    width: (MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        .2),
                                                    child: LoginCustomTextfield(
                                                        ishint:
                                                            'Enter Last Name',
                                                        textController:
                                                            controller
                                                                .lastNameCtrlr,
                                                        //validation
                                                        errorController: controller
                                                                .isLastNameInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .isLastNameInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isLastNameInvalid
                                                                .value = true;
                                                          }
                                                        })),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),

                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Date of Birth: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
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
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                      ishint: 'select DOB',
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      widget: Icon(
                                                        Icons.calendar_month,
                                                        color: ColorValues
                                                            .greyLightColor,
                                                      ),
                                                      ontap: () {
                                                        controller
                                                                .openDobDatePicker =
                                                            !controller
                                                                .openDobDatePicker;
                                                        controller.update([
                                                          'stock_Mangement'
                                                        ]);
                                                      },
                                                      textController:
                                                          controller.dobCtrlr,
                                                      //validation
                                                      errorController:
                                                          controller
                                                                  .isdobInvalid
                                                                  .value
                                                              ? "Required field"
                                                              : null,
                                                      onChanged: (value) {
                                                        if (value
                                                                .trim()
                                                                .length >
                                                            0) {
                                                          controller
                                                              .isdobInvalid
                                                              .value = false;
                                                        } else {
                                                          controller
                                                              .isdobInvalid
                                                              .value = true;
                                                        }
                                                      }),
                                                ),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Date of Joining: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 227, 224, 224),
                                                        width: 1,
                                                      ),
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
                                                    ),
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    child: LoginCustomTextfield(
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                r'^\d+\.?\d{0,2}'))
                                                      ],
                                                      ishint:
                                                          'Enter Date of Joining',
                                                      textController: controller
                                                          .joingdateCtrlr,
                                                      //validation
                                                      errorController: controller
                                                              .isDateofJoiningInvalid
                                                              .value
                                                          ? "Required field"
                                                          : null,

                                                      onChanged: (value) {
                                                        if (value
                                                                .trim()
                                                                .length >
                                                            0) {
                                                          controller
                                                              .isDateofJoiningInvalid
                                                              .value = false;
                                                        } else {
                                                          controller
                                                              .isDateofJoiningInvalid
                                                              .value = true;
                                                        }
                                                      },
                                                      ontap: () {
                                                        controller
                                                                .openDoJDatePicker =
                                                            !controller
                                                                .openDoJDatePicker;
                                                        controller.update([
                                                          'stock_Mangement'
                                                        ]);
                                                      },
                                                      widget: Icon(
                                                        Icons.calendar_month,
                                                        color: ColorValues
                                                            .greyLightColor,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Text(
                                                  'Landline: ',
                                                  style: TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: Dimens.sixteen,
                                                  ),
                                                ),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 227, 224, 224),
                                                        width: 1,
                                                      ),
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
                                                    ),
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    child: LoginCustomTextfield(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: <TextInputFormatter>[
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      ishint:
                                                          'Enter Landline Number',
                                                      textController: controller
                                                          .landlineCtrlr,
                                                      //validation
                                                      //          errorController: controller
                                                      //         .isLandlineInvalid
                                                      //         .value
                                                      //     ? "Required field"
                                                      //     : null,

                                                      // onChanged: (value) {
                                                      //   if (value.trim().length >
                                                      //       0) {
                                                      //     controller
                                                      //         .isLandlineInvalid
                                                      //         .value = false;
                                                      //   } else {
                                                      //     controller
                                                      //         .isLandlineInvalid
                                                      //         .value = true;
                                                      //   }
                                                      // },
                                                    )),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'State: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: DropdownWebWidget(
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
                                                    controller: controller,
                                                    dropdownList:
                                                        controller.stateList,
                                                    isValueSelected: controller
                                                        .isSelectedState.value,
                                                    selectedValue: controller
                                                        .selectedState.value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(children: [
                                              CustomRichText(
                                                  title: 'Zip Code: '),
                                              // Dimens.boxWidth10,
                                              SizedBox(width: 10),
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
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
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    ishint: 'Enter Zip Code',
                                                    textController:
                                                        controller.zipcodeCtrlr,
                                                    //validation
                                                    errorController: controller
                                                            .isZipCodeInvalid
                                                            .value
                                                        ? "Required field"
                                                        : null,

                                                    onChanged: (value) {
                                                      if (value.trim().length >
                                                          0) {
                                                        controller
                                                            .isZipCodeInvalid
                                                            .value = false;
                                                      } else {
                                                        controller
                                                            .isZipCodeInvalid
                                                            .value = true;
                                                      }
                                                    },
                                                  )),
                                            ]),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Blood Group: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: DropdownWebWidget(
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
                                                    controller: controller,
                                                    dropdownList:
                                                        controller.bloodList,
                                                    isValueSelected: controller
                                                        .isSelectedBlood.value,
                                                    selectedValue: controller
                                                        .selectedBlood.value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Dimens.boxHeight8,
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Designation: '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                        255,
                                                        227,
                                                        224,
                                                        224,
                                                      ),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                  ),
                                                  height: 35,
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: DropdownWebStock(
                                                    controller: controller,
                                                    dropdownList: controller
                                                        .designationList,
                                                    isValueSelected: controller
                                                        .isDesignationSelected
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedDesignation
                                                        .value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    // width: MediaQuery.of(context).size.width / 2,
                                    child: Column(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        40),
                                                                topRight: Radius
                                                                    .circular(
                                                                        40)),
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    245,
                                                                    248,
                                                                    250),
                                                          ),
                                                          child: TabBar(
                                                            labelPadding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10.0),
                                                            labelColor:
                                                                Colors.black,
                                                            indicator:
                                                                BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          40),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          40)),
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black26,
                                                                  offset:
                                                                      const Offset(
                                                                    1.0,
                                                                    1.0,
                                                                  ),
                                                                  blurRadius:
                                                                      5.0,
                                                                ),
                                                                BoxShadow(
                                                                  color: ColorValues
                                                                      .whiteColor,
                                                                  offset:
                                                                      const Offset(
                                                                          0.0,
                                                                          0.0),
                                                                  blurRadius:
                                                                      0.0,
                                                                  spreadRadius:
                                                                      0.0,
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
                                                                    // Dimens
                                                                    //     .boxWidth5,
                                                                    SizedBox(
                                                                        width:
                                                                            5),
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
                                                                    // Dimens
                                                                    //     .boxWidth5,
                                                                    SizedBox(
                                                                        width:
                                                                            5),

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
                                                                    // Dimens
                                                                    //     .boxWidth5,
                                                                    SizedBox(
                                                                        width:
                                                                            5),
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
                                                          height:
                                                              Get.height + 50,

                                                          //  height: 500,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        40),
                                                                topRight: Radius
                                                                    .circular(
                                                                        40)),
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    245,
                                                                    248,
                                                                    250),
                                                          ),
                                                          child: TabBarView(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                      color: ColorValues
                                                                          .whiteColor,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            Get.height,
                                                                        margin:
                                                                            Dimens.edgeInsets15,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                ColorValues.lightGreyColorWithOpacity35,
                                                                            width:
                                                                                1,
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
                                                                            Container(
                                                                          width:
                                                                              Get.width,
                                                                          height:
                                                                              Get.height,
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Spacer(),
                                                                                    Text("Select Facility: "),
                                                                                    Obx(
                                                                                      () => Container(
                                                                                        width: Get.width * .2,
                                                                                        height: 35,
                                                                                        child: DropdownWebWidget(
                                                                                          controller: controller,
                                                                                          dropdownList: controller.facilityNameList,
                                                                                          isValueSelected: controller.isFacilitySelected.value,
                                                                                          selectedValue: controller.selectedFacility.value,
                                                                                          onValueChanged: controller.onValueChanged,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Spacer(),
                                                                                    Text("Is Employee"),
                                                                                    Checkbox(
                                                                                      value: controller.isEmployee.value,
                                                                                      onChanged: (bool? value) {
                                                                                        controller.toggleIsEmployee();
                                                                                      },
                                                                                    ),
                                                                                    Spacer(),
                                                                                    CustomElevatedButton(
                                                                                      text: "Add",
                                                                                      onPressed: () {
                                                                                        controller.updateFacilityList(
                                                                                          id: controller.selectedFacilityId.value,
                                                                                          name: controller.selectedFacility.value,
                                                                                          address: controller.address.value,
                                                                                          isEmployee: controller.isEmployee.value,
                                                                                        );
                                                                                        controller.selectedFacilityId.value = 0;
                                                                                        controller.selectedFacility.value = "";
                                                                                        controller.address.value = "";
                                                                                        controller.isEmployee.value = false;
                                                                                      },
                                                                                    ),
                                                                                    Spacer(),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: Get.height * 0.7,
                                                                                child: DataTable2(
                                                                                  dataRowHeight: 60,
                                                                                  border: TableBorder.all(color: Colors.black),
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
                                                                                    DataColumn2(
                                                                                      label: Text("Action"),
                                                                                      size: ColumnSize.S,
                                                                                    ),
                                                                                  ],
                                                                                  rows: controller.isEmployeeFacilityList
                                                                                      .map(
                                                                                        (facility) => DataRow(
                                                                                          cells: [
                                                                                            DataCell(
                                                                                              Text("${facility.id}"),
                                                                                            ),
                                                                                            DataCell(
                                                                                              Text("${facility.name}"),
                                                                                            ),
                                                                                            DataCell(
                                                                                              Checkbox(
                                                                                                value: facility.isEmployee,
                                                                                                onChanged: null,
                                                                                              ),
                                                                                            ),
                                                                                            DataCell(
                                                                                              Text("${facility.address}"),
                                                                                            ),
                                                                                            DataCell(
                                                                                              Wrap(
                                                                                                children: [
                                                                                                  TableActionButton(
                                                                                                    message: 'delete',
                                                                                                    color: ColorValues.deleteColor,
                                                                                                    icon: Icons.delete_outlined,
                                                                                                    onPress: () {
                                                                                                      controller.isEmployeeFacilityList.remove(facility);
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      )
                                                                                      .toList(),
                                                                                ),
                                                                              ),
                                                                              // SizedBox(
                                                                              //   width: MediaQuery.of(context).size.width / 9,
                                                                              //   child: ActionButton(
                                                                              //     label: 'Add Facility',
                                                                              //     icon: Icons.add,
                                                                              //     onPressed: () {
                                                                              //       Get.dialog<void>(controller.AddfacilityListAlertBox());

                                                                              //       //     void>(
                                                                              //       // AddfacilityListAlertBox());
                                                                              //     },
                                                                              //     color: Colors.green,
                                                                              //   ),
                                                                              // ),
                                                                              // Container(
                                                                              //   width: MediaQuery.of(context).size.height * 1.5,
                                                                              //   height: Get.height - 70,
                                                                              //   child: Column(
                                                                              //     //
                                                                              //     children: [
                                                                              //       Expanded(
                                                                              //         child: ScrollableTableView(
                                                                              //           columns: [
                                                                              //             "Facility Id",
                                                                              //             'Facility name',
                                                                              //             'Location',
                                                                              //           ].map((column) {
                                                                              //             return TableViewColumn(minWidth: Get.width * 0.20, label: column);
                                                                              //           }).toList(),
                                                                              //           rows: //
                                                                              //               [
                                                                              //             ...List.generate(
                                                                              //               controller.filteredfacilityNameList.length,
                                                                              //               (index) {
                                                                              //                 var facilityNameDetails = controller.filteredfacilityNameList[index];

                                                                              //                 return [
                                                                              //                   '${facilityNameDetails?.id ?? ''}',
                                                                              //                   '${facilityNameDetails?.name ?? ''}',
                                                                              //                   '${facilityNameDetails?.address ?? ''}',
                                                                              //                 ];
                                                                              //               },
                                                                              //             ),
                                                                              //           ].map(
                                                                              //             (_inventoryDetailList) {
                                                                              //               return TableViewRow(
                                                                              //                 onTap: () => {
                                                                              //                   //  print('ZERO = ${_inventoryDetailList[0]}')
                                                                              //                 },
                                                                              //                 height: 60,
                                                                              //                 cells: _inventoryDetailList.map(
                                                                              //                   (value) {
                                                                              //                     return TableViewCell(
                                                                              //                       //key: ,
                                                                              //                       child: Text(value.toString()),
                                                                              //                     );
                                                                              //                   },
                                                                              //                 ).toList(),
                                                                              //               );
                                                                              //             },
                                                                              //           ).toList(),
                                                                              //         ),
                                                                              //       ),
                                                                              //       Dimens.boxHeight10,
                                                                              //     ],
                                                                              //   ),
                                                                              // ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                        color: ColorValues
                                                                            .whiteColor,
                                                                        child: controller.accesslevel.length >
                                                                                0
                                                                            ? Container(
                                                                                height: Get.height - 30,
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
                                                                                child: controller.accesslevel.length > 0
                                                                                    ? ScrollableTableView(
                                                                                        columns: [
                                                                                          "Module Name",
                                                                                          "Add",
                                                                                          "Edit",
                                                                                          "Delete",
                                                                                          "View",
                                                                                          "Self View",
                                                                                          "Issue",
                                                                                          "Approve"
                                                                                        ].map((column) {
                                                                                          return TableViewColumn(
                                                                                            label: column,
                                                                                            // width:
                                                                                            //     115, // Set the width of the column to 100

                                                                                            minWidth: Get.width * 0.08,
                                                                                          );
                                                                                        }).toList(),
                                                                                        rows: true
                                                                                            ? controller.accesslevel
                                                                                                .map((getAccesslevelDetails) => TableViewRow(height: 40, cells: [
                                                                                                      TableViewCell(
                                                                                                        child: Obx(() {
                                                                                                          return Row(
                                                                                                            children: [
                                                                                                              // Checkbox(
                                                                                                              //     value: controller.isCheckedmodule.value,
                                                                                                              //     checkColor: Colors.white,
                                                                                                              //     activeColor: ColorValues.blackColor,
                                                                                                              //     shape: RoundedRectangleBorder(
                                                                                                              //       borderRadius: BorderRadius.circular(2.0),
                                                                                                              //     ),
                                                                                                              //     side: MaterialStateBorderSide.resolveWith(
                                                                                                              //       (states) => BorderSide(
                                                                                                              //         width: 1.0,
                                                                                                              //         color: ColorValues.blackColor,
                                                                                                              //       ),
                                                                                                              //     ),
                                                                                                              //     onChanged: (val) {
                                                                                                              //       controller.accesslevel.firstWhere((e) => e?.feature_name == getAccesslevelDetails?.feature_name);
                                                                                                              //       controller.isCheckedmodule.value = val!;

                                                                                                              //       controller.update();
                                                                                                              //     }),
                                                                                                              // Dimens.boxWidth5,
                                                                                                              SizedBox(width: 5),
                                                                                                              Expanded(child: Text("${getAccesslevelDetails?.feature_name}"))
                                                                                                            ],
                                                                                                          );
                                                                                                        }),
                                                                                                      ),
                                                                                                      TableViewCell(
                                                                                                        child: Obx(() {
                                                                                                          return controller.rowItem(getAccesslevelDetails?.add.value, onCheck: (val) {
                                                                                                            getAccesslevelDetails?.add.value = val == true ? 1 : 0;
                                                                                                          });
                                                                                                        }),
                                                                                                      ),
                                                                                                      TableViewCell(
                                                                                                        child: Obx(() {
                                                                                                          return controller.rowItem(getAccesslevelDetails?.edit.value, onCheck: (val) {
                                                                                                            getAccesslevelDetails?.edit.value = val == true ? 1 : 0;
                                                                                                          });
                                                                                                        }),
                                                                                                      ),
                                                                                                      TableViewCell(child: Obx(() {
                                                                                                        return controller.rowItem(getAccesslevelDetails?.delete.value, onCheck: (val) {
                                                                                                          getAccesslevelDetails?.delete.value = val == true ? 1 : 0;
                                                                                                        });
                                                                                                      })),
                                                                                                      TableViewCell(child: Obx(() {
                                                                                                        return controller.rowItem(getAccesslevelDetails?.view.value, onCheck: (val) {
                                                                                                          getAccesslevelDetails?.view.value = val == true ? 1 : 0;
                                                                                                        });
                                                                                                      })),
                                                                                                      TableViewCell(child: Obx(() {
                                                                                                        return controller.rowItem(getAccesslevelDetails?.selfView.value, onCheck: (val) {
                                                                                                          getAccesslevelDetails?.selfView.value = val == true ? 1 : 0;
                                                                                                        });
                                                                                                      })),
                                                                                                      TableViewCell(child: Obx(() {
                                                                                                        return controller.rowItem(getAccesslevelDetails?.issue.value, onCheck: (val) {
                                                                                                          getAccesslevelDetails?.issue.value = val == true ? 1 : 0;
                                                                                                        });
                                                                                                      })),
                                                                                                      TableViewCell(child: Obx(() {
                                                                                                        return controller.rowItem(getAccesslevelDetails?.approve.value, onCheck: (val) {
                                                                                                          getAccesslevelDetails?.approve.value = val == true ? 1 : 0;
                                                                                                        });
                                                                                                      })),
                                                                                                    ]))
                                                                                                .toList()
                                                                                            : [],
                                                                                      )
                                                                                    : Container())
                                                                            : Container())
                                                                  ],
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                        color: ColorValues
                                                                            .whiteColor,
                                                                        child: controller.notificationList.length >
                                                                                0
                                                                            ? Container(
                                                                                height: Get.height - 30,
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
                                                                                child: controller.notificationList.length > 0
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
                                                                                            ? controller.notificationList
                                                                                                .map((getnotificationListDetails) => TableViewRow(height: 60, cells: [
                                                                                                      TableViewCell(child: Text("${getnotificationListDetails?.feature_name}" " " "${getnotificationListDetails?.notification_name.value}")),
                                                                                                      TableViewCell(
                                                                                                        child: IgnorePointer(
                                                                                                          ignoring: true,
                                                                                                          child: Obx(() {
                                                                                                            return controller.rowItem(getnotificationListDetails?.default_flag.value, onCheck: (val) {
                                                                                                              if (getnotificationListDetails?.can_change.value == 1) {
                                                                                                                getnotificationListDetails?.default_flag.value = val == true ? 1 : 0;
                                                                                                              }
                                                                                                            });
                                                                                                          }),
                                                                                                        ),
                                                                                                      ),
                                                                                                      TableViewCell(
                                                                                                        child: IgnorePointer(
                                                                                                          ignoring: true,
                                                                                                          child: Obx(() {
                                                                                                            return controller.rowItem(getnotificationListDetails?.can_change.value, onCheck: (val) {
                                                                                                              getnotificationListDetails?.can_change.value = val == true ? 1 : 0;
                                                                                                            });
                                                                                                          }),
                                                                                                        ),
                                                                                                      ),
                                                                                                      TableViewCell(child: Obx(() {
                                                                                                        return controller.rowItem(getnotificationListDetails?.user_flag.value, onCheck: (val) {
                                                                                                          if (getnotificationListDetails?.can_change.value == 1) {
                                                                                                            // Ensure can_change is 1 before changing default_flag
                                                                                                            getnotificationListDetails?.user_flag.value = val == true ? 1 : 0;
                                                                                                          } //  getnotificationListDetails?.default_flag.value = val == true ? 1 : 0;
                                                                                                        });
                                                                                                      })),
                                                                                                    ]))
                                                                                                .toList()
                                                                                            : [],
                                                                                      )
                                                                                    : Container())
                                                                            : Container())
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
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: 40, top: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        controller.userId.value == 0
                                            ? Container(
                                                height: 35,
                                                child: CustomElevatedButton(
                                                  backgroundColor:
                                                      ColorValues.greenColor,
                                                  text: 'Submit',
                                                  onPressed: () async {
                                                    try {
                                                      controller.isFormInvalid
                                                          .value = false;
                                                      await controller
                                                          .addUser();
                                                      //  .then((value) {
                                                      // Get.toNamed(
                                                      // Routes.userList);
                                                      // if (value == true) {
                                                      //   // controller.userId.value = 0;
                                                      //   controller
                                                      //       .saveAccessLevel();
                                                      //   //   controller.saveNotification();
                                                      // }
                                                      //  });
                                                    } catch (e) {
                                                      Fluttertoast.showToast(
                                                          msg: e.toString(),
                                                          fontSize: 16.0);
                                                    }
                                                    //  controller.saveAccessLevel();
                                                  },
                                                ),
                                              )
                                            : Container(
                                                height: 35,
                                                child: CustomElevatedButton(
                                                  backgroundColor: ColorValues
                                                      .appDarkBlueColor,
                                                  text: 'Update',
                                                  onPressed: () {
                                                    controller.updateUser();
                                                    // .then((value) {
                                                    // Get.toNamed(
                                                    // Routes.userList);
                                                    // if (value == true) {
                                                    // controller.userId.value = 0;
                                                    // controller
                                                    //     .saveAccessLevel(0);
                                                    // controller
                                                    //     .saveNotification(
                                                    //         0);
                                                    // }
                                                    // });
                                                    //  controller.saveAccessLevel();
                                                  },
                                                ),
                                              ),
                                        // Dimens.boxWidth20,
                                        SizedBox(width: 20),
                                        Container(
                                          height: 35,
                                          child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.redColor,
                                            text: "Cancel",
                                            onPressed: () {
                                              final _flutterSecureStorage =
                                                  const FlutterSecureStorage();

                                              _flutterSecureStorage.delete(
                                                  key: "userId");

                                              Get.back();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (controller.openDobDatePicker)
                    Positioned(
                      right: 35,
                      top: 260,
                      child: DatePickerWidget(
                        minDate: DateTime(DateTime.now().year),
                        maxDate: DateTime(DateTime.now().year, 13,
                            0), // last date of this year
                        controller: DateRangePickerController(),
                        selectionChanges: (p0) {
                          print('po valu ${p0.value.toString()}');
                          controller.dobCtrlr.text =
                              DateFormat('yyyy-MM-dd').format(p0.value);
                          controller.openDobDatePicker =
                              !controller.openDobDatePicker;
                          controller.isdobInvalid.value = false;
                          controller.update(['stock_Mangement']);
                        },
                        onCancel: () {
                          controller.openDobDatePicker = false;
                          controller.update(['stock_Mangement']);
                        },
                      ),
                    ),
                  if (controller.openDoJDatePicker)
                    Positioned(
                      right: 35,
                      top: 300,
                      child: DatePickerWidget(
                        minDate: DateTime(DateTime.now().year),
                        maxDate: DateTime(DateTime.now().year, 13,
                            0), // last date of this year
                        controller: DateRangePickerController(),
                        selectionChanges: (p0) {
                          print('po valu ${p0.value.toString()}');
                          controller.joingdateCtrlr.text =
                              DateFormat('yyyy-MM-dd').format(p0.value);
                          controller.openDoJDatePicker =
                              !controller.openDoJDatePicker;
                          controller.isDateofJoiningInvalid.value = false;
                          controller.update(['stock_Mangement']);
                        },
                        onCancel: () {
                          controller.openDoJDatePicker = false;
                          controller.update(['stock_Mangement']);
                        },
                      ),
                    ),
                ])),
          );
        });
  }
}
