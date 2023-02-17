import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewWarrantyClaim extends StatelessWidget {
  const NewWarrantyClaim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      body: Container(
        margin: Dimens.edgeInsets60,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: 'newWarrantyClaim'.tr,
                backgroundColor: Colors.white,
              ),
              const Divider(),
              CustomTitleTextfield(
                  title: 'warrantyClaimTitle'.tr, isMandatory: true),
              Padding(
                padding: Dimens.edgeInsets20_10_20_10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitle(
                      title: 'warrantyBriefDescription'.tr,
                      isMandatory: true,
                    ),
                    Dimens.boxWidth30,
                    Container(
                      width: Get.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            spreadRadius: 10,
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        onTap: () {},
                        readOnly: false,
                        // controller: textController,
                        maxLines: 5,
                        cursorColor: Colors.blueAccent,
                        decoration: InputDecoration(
                          contentPadding: Dimens.edgeInsets16,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CustomTitleTextfield(
                      title: 'equipmentCategory'.tr, isMandatory: true),
                  CustomTitleTextfield(
                      title: 'equipmentName'.tr, isMandatory: true),
                ],
              ),
              Padding(
                padding: Dimens.edgeInsets20_10_20_10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitle(
                      title: 'affectedParts'.tr,
                      isMandatory: true,
                    ),
                    Dimens.boxWidth30,
                    Container(
                      padding: Dimens.edgeInsets0_16_0_16,
                      width: Get.width / 3,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 10,
                              blurRadius: 20,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: Dimens.edgeInsets22_0_22_0,
                            child: Text(
                              'affectedParts'.tr,
                              style: Styles.blackBold10,
                            ),
                          ),
                          const Divider(),
                          Dimens.boxHeight10,
                          Row(
                            children: [
                              CustomTextField(),
                              Icon(
                                Icons.remove_circle_rounded,
                                color: Colors.blue,
                              ),
                              Dimens.boxWidth5,
                              Icon(
                                Icons.add_circle_rounded,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          Dimens.boxHeight15,
                          Row(
                            children: [
                              CustomTextField(),
                              Icon(
                                Icons.remove_circle_rounded,
                                color: Colors.blue,
                              ),
                              Dimens.boxWidth5,
                              Icon(
                                Icons.add_circle_rounded,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: Dimens.edgeInsets20_10_20_10,
                child: Row(
                  children: [
                    CustomTitle(
                        title: 'failureDate&Time'.tr, isMandatory: true),
                    CustomTextField(
                      suffix: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.calendar_month_sharp)),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CustomTitleTextfield(
                      title: 'approximateDailyLoss'.tr, isMandatory: true),
                  CustomTitle(title: 'severity'.tr, isMandatory: true),
                ],
              ),
              CustomTitleTextfield(
                  title: 'equipmentSrNo'.tr, isMandatory: false),
              CustomTitleTextfield(
                  title: 'manufacturersName'.tr, isMandatory: false),
              CustomTitleTextfield(
                  title: 'orderContractReferenceNumber'.tr, isMandatory: false),
            ],
          ),
        ),
      ),
    );
  }
}
