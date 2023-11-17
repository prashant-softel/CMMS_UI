import 'package:cmms/app/check_list_of_observation/checklist_of_observation_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckListOfObservationMobile
    extends GetView<CheckListOfObservationController> {
  CheckListOfObservationMobile({Key? key}) : super(key: key);

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
                      CustomRichText(title: 'Checklist Name'),
                      Dimens.boxHeight10,
                      TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 0.1,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter Checklist Name',
                          alignLabelWithHint: true,
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'SOP Number'),
                      Dimens.boxHeight10,
                      TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 0.1,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter SOP Number',
                          alignLabelWithHint: true,
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Frequency'),
                      Dimens.boxHeight10,
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
                      CustomRichText(title: 'Inspection Status'),
                      Dimens.boxHeight10,
                      SizedBox(
                        height: 45,
                        child: Obx(
                          () => DropdownWebStock(
                            width: MediaQuery.of(context).size.width / 2,
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
                      CustomRichText(title: 'Date of Inspection'),
                      Dimens.boxHeight10,
                      TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 0.1,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Select The Date',
                          alignLabelWithHint: true,
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Checklist Attachment: '),
                      Dimens.boxHeight10,
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: TextField(
                              cursorHeight: 20,
                              style: TextStyle(
                                fontSize: 15.0,
                                height: 4,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 5),
                                  child: Image.asset(
                                    'assets/files/galary.png',
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.camera_alt),
                                      Expanded(
                                        child: Container(
                                          child: Text("Add Photo",
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'No of Unsafe Observation'),
                      Dimens.boxHeight10,
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          cursorHeight: 20,
                          style: TextStyle(
                            fontSize: 15.0,
                            height: 4,
                            color: Colors.black,
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
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
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
