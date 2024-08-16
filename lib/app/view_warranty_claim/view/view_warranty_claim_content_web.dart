import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_warranty_claim/view_warranty_claim_controller.dart';
import 'package:cmms/app/widgets/approve_wc_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/new_warranty_claim_dialog.dart';
import 'package:cmms/app/widgets/reject_wc_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ViewWarrantyClaimWeb extends GetView<ViewWarrantyClaimController> {
  ViewWarrantyClaimWeb({super.key});

  bool valuefirst = true;

  final ViewWarrantyClaimController _controller = Get.find();
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Obx(
          () => Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 450),
                margin: EdgeInsets.only(
                    left: homecontroller.menuButton.value ? 250.0 : 70.0),
                width: Get.width,
                height: Get.height,
                child: Row(
                  children: [
                    Responsive.isMobile(context) || Responsive.isTablet(context)
                        ? Dimens.box0
                        : Container(),
                    Expanded(
                      child: RepaintBoundary(
                        key: controller.printKey,
                        child: Container(
                          // margin: Dimens.edgeInsets16,
                          height: Get.height,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(.3)),
                          ),
                          constraints: BoxConstraints(
                            maxWidth: 1100,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                HeaderWidget(),
                                Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 227, 224, 224),
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 236, 234, 234)
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
                                          Get.offNamed(
                                              Routes.warrantyClaimList);
                                        },
                                        child: Text(
                                            " / Warranty Claim list"
                                                .toUpperCase(),
                                            style: Styles.greyMediumLight12),
                                      ),
                                      Text(
                                          " / View Warranty Claim"
                                              .toUpperCase(),
                                          style: Styles.greyMediumLight12)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                CustomAppBar(
                                  title: 'Warranty Claim Details'.tr,
                                  action: Text(
                                      "WC Id: ${controller.viewWarrantyClaimDetailsModel.value?.wc_id}"),
                                ),
                                Dimens.boxHeight10,
                                Wrap(
                                  children: [
                                    GetBuilder<ViewWarrantyClaimController>(
                                        id: 'block_field',
                                        builder: (controller) {
                                          return Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.75,
                                                        child: CustomTextField(
                                                          textController: controller
                                                              .categoryTextController,
                                                          readOnly: true,
                                                          hintText:
                                                              '${controller.viewWarrantyClaimDetailsModel.value?.equipment_category}',
                                                          label:
                                                              'Equipment Category',
                                                          suffixIcon: Icon(Icons
                                                              .arrow_drop_down),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                2.70,
                                                        child: CustomTextField(
                                                          textController: controller
                                                              .equipmentNameTextController,
                                                          readOnly: true,
                                                          hintText:
                                                              '${controller.viewWarrantyClaimDetailsModel.value?.equipment_name}',
                                                          label: 'Equipment Name',
                                                          suffixIcon: Icon(Icons
                                                              .arrow_drop_down),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.75,
                                                    child: CustomTextField(
                                                      textController: controller
                                                          .supplierNameTextController,
                                                      readOnly: true,
                                                      hintText:
                                                          '${controller.viewWarrantyClaimDetailsModel.value?.supplier_name}',
                                                      label: 'Supplier Name',
                                                      suffixIcon: Icon(Icons
                                                          .arrow_drop_down),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.72,
                                                    child: CustomTextField(
                                                      textController: controller
                                                          .equipmentSerialNoTextController,
                                                      readOnly: true,
                                                      hintText:
                                                          '${controller.viewWarrantyClaimDetailsModel.value?.equipment_sr_no}',
                                                      label: 'Equipment Sr.No.',
                                                    ),
                                                  )
                                                ],
                                              ),

                                              // Row(
                                              //   children: [
                                              //     SizedBox(
                                              //       width: 10,
                                              //     ),
                                              //     SizedBox(
                                              //       width:
                                              //           MediaQuery.of(context)
                                              //                   .size
                                              //                   .width /
                                              //               2.75,
                                              //       child: CustomTextField(
                                              //         readOnly: true,
                                              //         hintText: '',
                                              //         label:
                                              //             'Contact Person Name',
                                              //       ),
                                              //     ),
                                              //     SizedBox(
                                              //       width: 25,
                                              //     ),
                                              //     SizedBox(
                                              //       width:
                                              //           MediaQuery.of(context)
                                              //                   .size
                                              //                   .width /
                                              //               2.72,
                                              //       child: CustomTextField(
                                              //         readOnly: true,
                                              //         hintText: '',
                                              //         label:
                                              //             'Contact Person Email',
                                              //       ),
                                              //     )
                                              //   ],
                                              // ),
                                              // Row(
                                              //   children: [
                                              //     SizedBox(
                                              //       width: 10,
                                              //     ),
                                              //     SizedBox(
                                              //       width:
                                              //           MediaQuery.of(context)
                                              //                   .size
                                              //                   .width /
                                              //               1.33,
                                              //       child: CustomTextField(
                                              //         readOnly: true,
                                              //         hintText: '',
                                              //         label:
                                              //             'Supplier Address: ',
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),

                                              ///Additional Email
                                              Container(
                                                margin: Dimens.edgeInsets20,
                                                // height: Get.height,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey
                                                          .withOpacity(.3)),
                                                ),
                                                constraints: BoxConstraints(
                                                  maxWidth: 1100,
                                                ),
                                                child: SingleChildScrollView(
                                                  child: Obx(
                                                    () => Column(
                                                      children: [
                                                        CustomAppBar(
                                                          title:
                                                              'Employee Emails'
                                                                  .tr,
                                                        ),
                                                        Dimens.boxHeight10,
                                                        Wrap(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Text('Name'),
                                                                // SizedBox(
                                                                //   width: 2,
                                                                // ),
                                                                Text('Email'),
                                                                // SizedBox(
                                                                //   height: 10,
                                                                // ),
                                                              ],
                                                            ),
                                                            Container(
                                                              height: 0.25,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  1.2,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Colors
                                                                          .black),
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            Column(
                                                                children: []
                                                                  ..addAll(controller
                                                                      .additionalEmailEmployees!
                                                                      .map((data) =>
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              emails('${data!.name}', '${data.email}', context)
                                                                            ],
                                                                          ))))
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),

                                              ///Affected Part
                                              Container(
                                                margin: Dimens.edgeInsets20,
                                                // height: Get.height,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey
                                                          .withOpacity(.3)),
                                                ),
                                                constraints: BoxConstraints(
                                                  maxWidth: 1100,
                                                ),
                                                child: SingleChildScrollView(
                                                  child: Obx(
                                                    () => Column(
                                                      children: [
                                                        CustomAppBar(
                                                          title:
                                                              'Affected Parts'
                                                                  .tr,
                                                        ),
                                                        Dimens.boxHeight10,
                                                        Wrap(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  width: 50,
                                                                ),
                                                                Text(
                                                                    'Affected Parts'),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              height: 0.25,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  1.2,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Colors
                                                                          .black),
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left:
                                                                          100),
                                                              child: Column(
                                                                  children: []
                                                                    ..addAll(controller
                                                                        .affectedParts!
                                                                        .map((data) =>
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                affectedparts('${data!.name}', context)
                                                                              ],
                                                                            ))
                                                                        .toList())),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 80,
                                          child: CustomTextField(
                                            textController: controller
                                                .orderReferenceNoTextController,
                                            readOnly: true,
                                            hintText:
                                                '${controller.viewWarrantyClaimDetailsModel.value?.order_reference_number}',
                                            label:
                                                'Contract Reference Number: ',
                                            // readOnly: true,
                                            onTap: () {
                                              // controller.getEquipmentList(facilityId: '45');
                                              // Get.defaultDialog(
                                              //   title: 'Equipment List',
                                              //   content: GetBuilder<HomeController>(
                                              //     id: 'equipment_list',
                                              //     builder: (_controller) {
                                              //       if (controller.equipmentList.isEmpty) {
                                              //         return CircularProgressIndicator
                                              //             .adaptive();
                                              //       }
                                              //       return Container(
                                              //         height: Get.height * .4,
                                              //         decoration: BoxDecoration(
                                              //           borderRadius:
                                              //               BorderRadius.circular(8),
                                              //         ),
                                              //         child: SingleChildScrollView(
                                              //           child: Column(
                                              //             children: [
                                              //               ...List.generate(
                                              //                 controller.equipmentList.length,
                                              //                 (index) => ListTile(
                                              //                   onTap: () {
                                              //                     _controller.onSelectEquipment(
                                              //                         _controller
                                              //                                 .equipmentList[
                                              //                             index]);
                                              //                     Get.back();
                                              //                   },
                                              //                   title: Text(
                                              //                       '${_controller.equipmentList[index].name}'),
                                              //                 ),
                                              //               ).toList(),
                                              //             ],
                                              //           ),
                                              //         ),
                                              //       );
                                              //     },
                                              //   ),
                                              // );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 75,
                                          child: CustomTextField(
                                            // textController: controller
                                            //     .warrantyClaimTitleTextController,
                                            readOnly: true,
                                            hintText:
                                                '${controller.viewWarrantyClaimDetailsModel.value?.severity}',
                                            label: 'Severity: ',
                                            // maxLine: 2,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 75,
                                          child: CustomTextField(
                                            // textController: controller
                                            //     .warrantyClaimTitleTextController,
                                            readOnly: true,
                                            hintText:
                                                '${controller.viewWarrantyClaimDetailsModel.value?.approxdailyloss}',
                                            label: 'Approx. daily loss: ',
                                            // maxLine: 2,
                                          ),
                                        )
                                      ],
                                    ),
                                    Wrap(
                                      children: [
                                        Row(
                                          children: [
                                            CustomTextField(
                                              textController: controller
                                                  .failureDateTimeTextController,
                                              readOnly: true,
                                              hintText:
                                                  '${controller.viewWarrantyClaimDetailsModel.value?.failure_time}',
                                              label: 'Failure Date & Time: ',
                                              suffixIcon: Icon(
                                                Icons.calendar_month,
                                              ),
                                              // textController:
                                              //     controller.categoryTextController,

                                              // onTap: () {
                                              //   pickDateTime_web(context);
                                              // },
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.78,
                                              child: CustomTextField(
                                                textController: controller
                                                    .costOfReplacementTextController,
                                                readOnly: true,
                                                hintText:
                                                    '${controller.viewWarrantyClaimDetailsModel.value?.cost_of_replacement}',
                                                label: 'Cost Of Replacement: ',
                                                // textController:
                                                //     controller.categoryTextController,
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: 100,
                                            //   child: CustomTextField(
                                            //     readOnly: true,
                                            //     hintText: 'INR-IN',
                                            //     label: 'currency',
                                            //     suffixIcon: Icon(Icons.arrow_drop_down),
                                            //   ),
                                            // ),
                                          ],
                                        ),

                                        // Container(
                                        //   margin: Dimens.edgeInsets16,
                                        //   width: 100,
                                        //   color: Colors.black,
                                        //   child: ActionButton(
                                        //     label: 'Add',
                                        //     onPressed: () {},
                                        //     icon: Icons.add,
                                        //     color: Colors.blue,
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    // CustomTextField(
                                    //   textController: controller
                                    //       .warrantyStartDateTextController,
                                    //   readOnly: true,
                                    //   hintText: controller
                                    //               .viewWarrantyClaimDetailsModel
                                    //               .value
                                    //               ?.wstart_date !=
                                    //           null
                                    //       ? DateFormat('yyyy-MM-dd').format(
                                    //           controller
                                    //               .viewWarrantyClaimDetailsModel
                                    //               .value!
                                    //               .wstart_date!)
                                    //       : '',
                                    //   label: 'Warranty Start Date: ',
                                    //   suffixIcon: Icon(
                                    //     Icons.calendar_month,
                                    //   ),
                                    //   // onTap: () {
                                    //   //   pickDateTime2_web(context);
                                    //   // },
                                    // ),
                                    // CustomTextField(
                                    //   readOnly: true,
                                    //   hintText: controller
                                    //               .viewWarrantyClaimDetailsModel
                                    //               .value
                                    //               ?.wend_date !=
                                    //           null
                                    //       ? DateFormat('yyyy-MM-dd').format(
                                    //           controller
                                    //               .viewWarrantyClaimDetailsModel
                                    //               .value!
                                    //               .wend_date!)
                                    //       : '',
                                    //   label: 'Warranty End Date: ',
                                    //   textController:
                                    //       controller.startDateTimeCtrlr3,
                                    //   suffixIcon: Icon(
                                    //     Icons.calendar_month,
                                    //   ),
                                    //   // onTap: () {
                                    //   //   pickDateTime3_web(context);
                                    //   // },
                                    // ),
                                    CustomTextField(
                                      textController: controller
                                          .warrantyClaimTitleTextController,
                                      readOnly: true,
                                      hintText:
                                          '${controller.viewWarrantyClaimDetailsModel.value?.warranty_claim_title}',
                                      label: 'Warranty Claim Title: ',
                                      // maxLine: 2,
                                    ),
                                    // CustomTextField(
                                    //   label: 'Enter Multiplier: ',
                                    //   textController:
                                    //       controller.enterMultiplierTextController,
                                    // ),
                                    // Row(
                                    //   children: [
                                    //     Expanded(
                                    //       child: CustomTextField(
                                    //         label: 'Warranty Brief Description: *',
                                    //         maxLine: 6,
                                    //         textController:
                                    //             controller.assetDescpTextController,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            height: 80,
                                            child: CustomTextField(
                                              alignment: Alignment.topCenter,
                                              textController: controller
                                                  .warrantyBriefDescriptionTextController,
                                              readOnly: true,
                                              hintText:
                                                  '${controller.viewWarrantyClaimDetailsModel.value?.warranty_description}',
                                              label:
                                                  'Warranty Brief Description: ',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Wrap(
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              height: 80,
                                              child: CustomTextField(
                                                textController: controller
                                                    .correctiveActionByBuyerTextController,
                                                readOnly: true,
                                                hintText:
                                                    '${controller.viewWarrantyClaimDetailsModel.value?.corrective_action_by_buyer}',
                                                label:
                                                    'Immediate Corrective Action by Buyer: ',
                                                // maxLine: 6,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 210,
                                        ),
                                        CustomTextField(
                                          textController: controller
                                              .requestToSupplierTextController,
                                          readOnly: true,
                                          hintText:
                                              '${controller.viewWarrantyClaimDetailsModel.value?.request_to_supplier}',
                                          label: 'Request to Supplier: ',
                                          // maxLine: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 25),
                                          child: Row(
                                            children: [
                                              // SizedBox(
                                              //   width: 5,
                                              // ),
                                              // CustomRichText(
                                              //   title: 'Select Approver: '
                                              //   ),
                                              CustomTextField(
                                                textController: controller
                                                    .approverNametextController,
                                                readOnly: true,
                                                hintText:
                                                    '${controller.viewWarrantyClaimDetailsModel.value?.approver_name}',
                                                label: 'Select Approver',
                                                suffixIcon:
                                                    Icon(Icons.arrow_drop_down),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Container(
                                        margin: Dimens.edgeInsets20,
                                        // height: Get.height,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(.3)),
                                        ),
                                        constraints: BoxConstraints(
                                          maxWidth: 1100,
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              CustomAppBar(
                                                title: 'All Files Uploaded'.tr,
                                              ),
                                              Dimens.boxHeight10,
                                              Wrap(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text('Sr.No'),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      Text('View'),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('File Name'),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('File Size'),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('Status'),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('Description'),
                                                      SizedBox(
                                                        height: 30,
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 0.25,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.2,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      Text('No Attachments'),
                                                      // SizedBox(width: 50,),
                                                      // Text('Warranty Claim has Been created'),
                                                      // SizedBox(width: 50,),
                                                      // Text('Amit Purchase Manager'),
                                                      // SizedBox(width: 50,),
                                                      // Text('2012-12-03 16:19'),
                                                      // SizedBox(width: 100,),
                                                      // Text('Created'),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    ///Schedule of Supplier Action
                                    SizedBox(
                                      height: 250,
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      child: Center(
                                        child: Container(
                                          margin: Dimens.edgeInsets16,
                                          height: Get.height,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(.3)),
                                          ),
                                          constraints: BoxConstraints(
                                            maxWidth: 1100,
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                CustomAppBar(
                                                  title:
                                                      'Schedule of Supplier Actions'
                                                          .tr,
                                                  // action: ActionButton(
                                                  //   icon: Icons.add,
                                                  //   label: 'Add',
                                                  //   // onPress:
                                                  //   //     () async {},
                                                  //   color: Colors.blue,
                                                  //   onPressed: () {},
                                                  // ),
                                                ),
                                                Dimens.boxHeight10,
                                                Wrap(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 40,
                                                        ),
                                                        Text('#'),
                                                        SizedBox(
                                                          width: 25,
                                                        ),
                                                        Text('Supplier Action'),
                                                        SizedBox(
                                                          width: 205,
                                                        ),
                                                        Text('Required'),
                                                        SizedBox(
                                                          width: 190,
                                                        ),
                                                        Text(
                                                            'Required by Date'),
                                                      ],
                                                    ),
                                                    Column(
                                                        children: []
                                                          ..addAll(controller
                                                              .supplierActionsList!
                                                              .map((element) =>
                                                                  Row(
                                                                    children: [
                                                                      supplierActionData(
                                                                        '${element?.srNumber}',
                                                                        '${element?.name}',
                                                                        '${element?.required_by_date}',
                                                                        context,
                                                                      ),
                                                                    ],
                                                                  ))))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),

                                    ///Warranty Claim History

                                    Container(
                                      margin: Dimens.edgeInsets20,
                                      height:
                                          ((controller.historyList?.length ??
                                                      0) *
                                                  50) +
                                              125,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorValues
                                              .lightGreyColorWithOpacity35,
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorValues
                                                .appBlueBackgroundColor,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Warranty Claim History ",
                                                  style: Styles.blue700,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: ColorValues.greyLightColour,
                                          ),
                                          Expanded(
                                            child: DataTable2(
                                              border: TableBorder.all(
                                                  color: Color.fromARGB(
                                                      255, 206, 229, 234)),
                                              columns: [
                                                DataColumn(
                                                    label: Text(
                                                  "Time Stamp",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  "Posted By",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  "Comment",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  "Location",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  "Status",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ],
                                              rows: List<DataRow>.generate(
                                                controller
                                                        .historyList?.length ??
                                                    0,
                                                (index) => DataRow(cells: [
                                                  DataCell(
                                                    Text(
                                                      controller
                                                                  .historyList?[
                                                                      index]
                                                                  ?.createdAt
                                                                  ?.result !=
                                                              null
                                                          ? DateFormat(
                                                                  'yyyy-MM-dd HH:mm')
                                                              .format(controller
                                                                  .historyList![
                                                                      index]!
                                                                  .createdAt!
                                                                  .result!)
                                                          : '',
                                                    ),
                                                  ),
                                                  DataCell(Text(controller
                                                          .historyList?[index]
                                                          ?.createdByName
                                                          .toString() ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .historyList?[index]
                                                          ?.comment
                                                          .toString() ??
                                                      '')),
                                                  DataCell(Text('--')),
                                                  DataCell(Text(controller
                                                          .historyList?[index]
                                                          ?.status_name
                                                          .toString() ??
                                                      '')),
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 150,
                                        ),
                                        Container(
                                          height: 35,
                                          child: CustomElevatedButton(
                                            icon: Icons.print_outlined,
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            text: "Print",
                                            onPressed: () {
                                              // controller.printScreen();
                                            },
                                          ),
                                        ),

                                        ///Approve WC
                                        Dimens.boxWidth10,
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kWarrantyClaimFeatureId &&
                                                        e.approve ==
                                                            UserAccessConstants
                                                                .kHaveApproveAccess)
                                                    .length >
                                                0
                                            ? Container(
                                                height: 28,
                                                child: CustomElevatedButton(
                                                  backgroundColor:
                                                      ColorValues.appGreenColor,
                                                  text: "Approve",
                                                  icon: Icons.check,
                                                  onPressed: () {
                                                    Get.dialog(ApproveWCDialog(
                                                      id: controller.wc_id,
                                                    ));
                                                  },
                                                ),
                                              )
                                            : Dimens.box0,

                                        ///Reject WC Dialog
                                        Dimens.boxWidth10,
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kWarrantyClaimFeatureId &&
                                                        e.approve ==
                                                            UserAccessConstants
                                                                .kHaveApproveAccess)
                                                    .length >
                                                0
                                            ? Container(
                                                height: 28,
                                                child: CustomElevatedButton(
                                                  backgroundColor:
                                                      ColorValues.appRedColor,
                                                  text: "Reject",
                                                  icon: Icons.close,
                                                  onPressed: () {
                                                    Get.dialog(RejectWCDialog(
                                                      id: controller.wc_id,
                                                    ));
                                                  },
                                                ),
                                              )
                                            : Dimens.box0,
                                      ],
                                    ),

                                    // Wrap(
                                    //   children: [
                                    //     Row(
                                    //       mainAxisSize: MainAxisSize.min,
                                    //       children: [
                                    //         CustomTextField(
                                    //           label: 'Calibration remainder In: ',
                                    //           width: 300,
                                    //         ),
                                    //         Container(
                                    //           width: 100,
                                    //           child: TextField(
                                    //             decoration: InputDecoration(
                                    //               contentPadding:
                                    //                   Dimens.edgeInsets16_0_16_0,
                                    //               focusedBorder: OutlineInputBorder(
                                    //                 borderSide: BorderSide(width: .2),
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(2),
                                    //               ),
                                    //               enabledBorder: OutlineInputBorder(
                                    //                 borderSide: BorderSide(width: .2),
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(2),
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //     Container(
                                    //       margin: Dimens.edgeInsets16,
                                    //       child: Row(
                                    //         mainAxisSize: MainAxisSize.min,
                                    //         children: [
                                    //           Text('Calibration cirtificate'),
                                    //           Dimens.boxWidth10,
                                    //           ActionButton(
                                    //             label: 'Upload cirtification file',
                                    //             onPressed: () {},
                                    //             icon: Icons.file_upload_outlined,
                                    //             color: Colors.blue,
                                    //           )
                                    //         ],
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                    // Container(
                                    //   margin: Dimens.edgeInsets16,
                                    //   decoration: BoxDecoration(
                                    //     border: Border.all(
                                    //       width: 1,
                                    //       color: Colors.grey.withOpacity(.3),
                                    //     ),
                                    //   ),
                                    //   child: DefaultTabController(
                                    //     length: 3,
                                    //     child: Column(
                                    //       children: [
                                    //         Container(
                                    //           color: Colors.grey.withOpacity(.2),
                                    //           child: TabBar(
                                    //             tabs: [
                                    //               Container(
                                    //                 height: 40,
                                    //                 child: Center(
                                    //                   child: Text('Warranties'),
                                    //                 ),
                                    //               ),
                                    //               Container(
                                    //                 height: 40,
                                    //                 child: Center(
                                    //                   child: Text('Purchasing'),
                                    //                 ),
                                    //               ),
                                    //               Container(
                                    //                 height: 40,
                                    //                 child: Center(
                                    //                   child: Text('Files'),
                                    //                 ),
                                    //               ),
                                    //             ],
                                    //           ),
                                    //         ),
                                    //         Container(
                                    //           height: 400,
                                    //           child: TabBarView(
                                    //             children: [
                                    //               WarrantyTab(),
                                    //               ManufacturarTab(),
                                    //               Files(),
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                  child: HomeDrawer(), duration: Duration(milliseconds: 450))
            ],
          ),
        ),
      );

  ///Alert Dialog
  static void showAlertDialog({
    int? facility_id,
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(NewWarrantyClaimDialog());
  }

  /// For Failure Date Time
  Future pickDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedDateTimeWeb.value;
    final date = await pickDate_web(context);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    controller.selectedDateTimeWeb.value = dateTime;
    controller.startDateTimeCtrlrWeb
      ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.startDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedDateTimeWeb.value;
    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime_web(BuildContext context) async {
    DateTime dateTime = controller.selectedDateTimeWeb.value;
    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }

////Warranty Start Date
  Future pickDateTime2_web(BuildContext context) async {
    var dateTime = controller.selectedBreakdownTime2.value;
    final date = await pickDate_web(context);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    controller.selectedBreakdownTime2.value = dateTime;
    controller.startDateTimeCtrlr2Web
      ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.startDateTimeCtrlr2Web.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate2_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedBreakdownTime2.value;
    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime2_web(BuildContext context) async {
    DateTime dateTime = controller.selectedBreakdownTime2.value;
    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }

////Warranty End Date
  Future pickDateTime3_web(BuildContext context) async {
    var dateTime = controller.selectedBreakdownTime3.value;
    final date = await pickDate_web(context);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    controller.selectedBreakdownTime3.value = dateTime;
    controller.startDateTimeCtrlr3
      ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.startDateTimeCtrlr3.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate3_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedBreakdownTime3.value;
    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime3_web(BuildContext context) async {
    DateTime dateTime = controller.selectedBreakdownTime3.value;
    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }

  supplierActionData(
      String? title, String? title2, String? title3, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$title'),
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Container(
                child: Container(
              height: 30,
              width: 40,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 206, 204, 204)),
              child: Center(child: Text('$title2')),
            )),
          ),
          Checkbox(
              value: valuefirst,
              onChanged: (bool? value) {
                this.valuefirst = value!;
              }),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3.2,
            child: CustomTextField(
              readOnly: true,
              hintText: '$title3',
              label: '',
            ),
          ),
          // position == 1 || position == 2 || position == 3
          // ?
          // ActionButton(
          //   icon: Icons.remove,
          //   label: 'Delete',
          //   // onPress:
          //   //     () async {},
          //   color: Colors.red,
          //   onPressed: () {},
          // )
          // : Text('data')
        ],
      ),
    );
  }

  emails(String? title, String? title2, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$title'),
          SizedBox(
            width: 10,
          ),
          Text('$title2'),
        ],
      ),
    );
  }

  affectedparts(String? title, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$title'),
        ],
      ),
    );
  }
}
