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
              CustomTitleTextfield(
                  title: 'warrantyBriefDescription'.tr, isMandatory: true),
              CustomTitleTextfield(
                  title: 'equipmentCategory'.tr, isMandatory: true),
              CustomTitleTextfield(
                  title: 'equipmentName'.tr, isMandatory: true),
              CustomTitleTextfield(
                  title: 'affectedParts'.tr, isMandatory: true),
              CustomTitleTextfield(
                  title: 'failureDate&Time'.tr, isMandatory: true),
              CustomTitleTextfield(
                  title: 'approximateDailyLoss'.tr, isMandatory: true),
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
