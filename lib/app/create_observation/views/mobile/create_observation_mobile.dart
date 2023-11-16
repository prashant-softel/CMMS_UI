import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_observation/create_observation_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateObservationMobile extends GetView<CreateObservationController> {
  CreateObservationMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Contractor Name'),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 0.1,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter Contractor Name',
                          alignLabelWithHint: true,
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Location of Observation'),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 0.1,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter Location of Observation',
                          alignLabelWithHint: true,
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Type of Observation'),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        child: Obx(
                          () => DropdownWebStock(
                            width: MediaQuery.of(context).size.width,
                            dropdownList: controller.ownerList,
                            isValueSelected:
                                controller.isSelectedBusinessType.value,
                            selectedValue:
                                controller.selectedBusinessType.value,
                            onValueChanged: controller.onValueChanged,
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Source of Observation'),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        child: Obx(
                          () => DropdownWebStock(
                            width: MediaQuery.of(context).size.width,
                            dropdownList: controller.ownerList,
                            isValueSelected:
                                controller.isSelectedBusinessType.value,
                            selectedValue:
                                controller.selectedBusinessType.value,
                            onValueChanged: controller.onValueChanged,
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Risk Type'),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        child: Obx(
                          () => DropdownWebStock(
                            width: MediaQuery.of(context).size.width,
                            dropdownList: controller.ownerList,
                            isValueSelected:
                                controller.isSelectedBusinessType.value,
                            selectedValue:
                                controller.selectedBusinessType.value,
                            onValueChanged: controller.onValueChanged,
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Observation Description'),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 0.1,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter Observation Description',
                          alignLabelWithHint: true,
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Corrective/Preventive Action'),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 0.1,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter Corrective',
                          alignLabelWithHint: true,
                        ),
                      ),
                      // Dimens.boxHeight10,
                      // CustomRichText(title: 'Corrective/Preventive Action'),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // TextField(
                      //   style: TextStyle(
                      //     fontSize: 15.0,
                      //     height: 0.1,
                      //     color: Colors.black,
                      //   ),
                      //   decoration: InputDecoration(
                      //     hintText: 'Enter Risk Type',
                      //     alignLabelWithHint: true,
                      //   ),
                      // ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Responsible Person'),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 0.1,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter Responsible Person',
                          alignLabelWithHint: true,
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Contact Number'),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 0.1,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter Contact Number*',
                          alignLabelWithHint: true,
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Target Date'),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 0.1,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter Target Date',
                          alignLabelWithHint: true,
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Action Taken'),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 0.1,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter Action Taken',
                          alignLabelWithHint: true,
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Cost Type*'),
                      SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 45,
                        child: Obx(
                          () => DropdownWebStock(
                            width: MediaQuery.of(context).size.width,
                            dropdownList: controller.ownerList,
                            isValueSelected:
                                controller.isSelectedBusinessType.value,
                            selectedValue:
                                controller.selectedBusinessType.value,
                            onValueChanged: controller.onValueChanged,
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                      Center(
                        child: Container(
                            height: 40,
                            child: CustomElevatedButton(
                              backgroundColor: ColorValues.submitColor,
                              text: 'Submit',
                              onPressed: () {
                                // controller.createGoodsOrder();
                              },
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
