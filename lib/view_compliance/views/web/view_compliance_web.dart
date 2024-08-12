import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_course/view/view_course_web.dart';
import 'package:cmms/app/widgets/compliance_approve_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/view_compliance/view_compliance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';

class ViewComplianceWeb extends StatefulWidget {
  ViewComplianceWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewComplianceWeb> createState() => _ViewComplianceWebState();
}

class _ViewComplianceWebState extends State<ViewComplianceWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewComplianceController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Obx(() => SelectionArea(
              child: Scaffold(
                  body: Container(
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
                                  Get.offNamed(Routes.statutory);
                                },
                                child: Text(" / STATUTORY LIST",
                                    style: Styles.greyLight14),
                              ),
                              Text(
                                " / VIEW STATUTORY COMPLIANCE",
                                style: Styles.greyLight14,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              width: Get.width * 7,
                              margin:
                                  EdgeInsets.only(left: 10, top: 10, right: 10),
                              child: Card(
                                margin: Dimens.edgeInsets12,
                                color: ColorValues.cardColor,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "View Statutory Compliance Report",
                                            style: Styles.blackBold18,
                                          ),
                                          Spacer(),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: ColorValues.approveColor,
                                                width: 1,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: ColorValues
                                                        .approveColor),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${controller.getStatutoryById.value!.status_short == null ? "" : controller.getStatutoryById.value!.status_short}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: ColorValues.greyLightColour,
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 60,
                                        vertical: 30,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    TitleAndInfo(
                                                      "ID:",
                                                      "${controller.getStatutoryById.value!.id == null ? "" : controller.getStatutoryById.value!.id}",
                                                    ),
                                                    Dimens.boxHeight10,
                                                    TitleAndInfo(
                                                      "Compliance:",
                                                      "${controller.getStatutoryById.value!.compilanceName == null ? "" : controller.getStatutoryById.value!.compilanceName}",
                                                    ),
                                                    Dimens.boxHeight10,
                                                    TitleAndInfo(
                                                      "Activation Status:",
                                                      "${controller.getStatutoryById.value!.activation_status == null ? "" : controller.getStatutoryById.value!.activation_status}",
                                                    ),
                                                    Dimens.boxHeight10,
                                                    TitleAndInfo(
                                                      "Validity In Month:",
                                                      "${controller.getStatutoryById.value!.validity_month == null ? "" : controller.getStatutoryById.value!.validity_month}",
                                                    ),
                                                    TitleAndInfo(
                                                      "description:",
                                                      "${controller.getStatutoryById.value!.description == null ? "" : controller.getStatutoryById.value!.description}",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    TitleAndInfo(
                                                      "Re-New Date:",
                                                      "${controller.getStatutoryById.value!.renew_from == null ? "" : controller.getStatutoryById.value!.renew_from}",
                                                    ),
                                                    Dimens.boxHeight10,
                                                    TitleAndInfo(
                                                      "Issue Date:",
                                                      "${controller.getStatutoryById.value!.created_at == null ? "" : controller.getStatutoryById.value!.created_at}",
                                                    ),
                                                    Dimens.boxHeight10,
                                                    TitleAndInfo(
                                                      "Expires on:",
                                                      "${controller.getStatutoryById.value!.end_date == null ? "" : controller.getStatutoryById.value!.end_date}",
                                                    ),
                                                    Dimens.boxHeight10,
                                                    TitleAndInfo(
                                                      "Days Left:",
                                                      "${controller.getStatutoryById.value!.daysLeft == null ? "" : controller.getStatutoryById.value!.daysLeft}",
                                                    ),
                                                    TitleAndInfo(
                                                      "Status Of Aplication:",
                                                      "${controller.getStatutoryById.value!.status_of_application == null ? "" : controller.getStatutoryById.value!.status_of_application}",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                          Dimens.boxHeight20,
                                          (controller.historyList != null &&
                                                  controller
                                                      .historyList!.isNotEmpty)
                                              ? Container(
                                                  margin: Dimens.edgeInsets20,
                                                  height: ((controller
                                                                  .historyList
                                                                  ?.length ??
                                                              0) *
                                                          40) +
                                                      120,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: ColorValues
                                                          .lightGreyColorWithOpacity35,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: //
                                                      Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Statutory Compliance History ",
                                                              style: Styles
                                                                  .blue700,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child:
                                                            HistoryTableWidgetWeb(
                                                          historyList:
                                                              controller
                                                                  .historyList,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Dimens.box0,
                                        ],
                                      ),
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
                  floatingActionButton: Obx(() => varUserAccessModel
                                  .value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants.kGoodsFeatureId &&
                                      e.add ==
                                          UserAccessConstants.kHaveAddAccess)
                                  .length >
                              0 &&
                          controller.getStatutoryById.value!.status_id != 507
                      ? Row(
                          children: [
                            Spacer(),
                            Container(
                              height: 45,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appGreenColor,
                                text: "Approve",
                                icon: Icons.check,
                                onPressed: () {
                                  Get.dialog(ComplianceApprovedDialog(
                                    id: controller.srId.value,
                                    position: 1,
                                  ));
                                },
                              ),
                            ),
                            Dimens.boxWidth10,
                            Container(
                              height: 45,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.rejectColor,
                                text: "Reject",
                                icon: Icons.close,
                                onPressed: () {
                                  Get.dialog(ComplianceApprovedDialog(
                                    id: controller.srId.value,
                                    position: 2,
                                  ));
                                },
                              ),
                            ),
                            Spacer(),
                          ],
                        )
                      : Dimens.box0)),
            ));
      },
    );
  }
}
