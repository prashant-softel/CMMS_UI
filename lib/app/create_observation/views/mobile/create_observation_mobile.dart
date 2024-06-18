import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_observation/create_observation_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateObservationMobile extends GetView<CreateObservationController> {
  CreateObservationMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
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
                        CustomRichText(title: 'Type of Observation'),
                        Dimens.boxHeight10,
                        SizedBox(
                          height: 45,
                          child: Obx(
                            () => DropdownWebStock(
                              width: MediaQuery.of(context).size.width,
                              dropdownList: [],
                              // isValueSelected:
                              //     controller.isSelectedBusinessType.value,
                              // selectedValue:
                              //     controller.selectedBusinessType.value,
                              onValueChanged: (p0, p1) {},
                            ),
                          ),
                        ),

                        Dimens.boxHeight10,
                        CustomRichText(title: 'Location of Observation'),
                        Dimens.boxHeight10,
                        TextField(
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16.0,
                                height: 1.0,
                                color: Colors.black),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter Location of Observation',
                            alignLabelWithHint: true,
                          ),
                        ),
                        Dimens.boxHeight10,

                        CustomRichText(title: 'Contractor Name'),
                        Dimens.boxHeight10,
                        SizedBox(
                          height: 45,
                          child: Obx(
                            () => DropdownWebStock(
                              width: MediaQuery.of(context).size.width,
                              dropdownList: [],
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ),

                        Dimens.boxHeight10,
                        CustomRichText(title: 'Source of Observation'),
                        Dimens.boxHeight10,
                        SizedBox(
                          height: 45,
                          child: Obx(
                            () => DropdownWebStock(
                              width: MediaQuery.of(context).size.width,
                              dropdownList: [],
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ),
                        Dimens.boxHeight10,
                        CustomRichText(title: 'Risk Type'),
                        Dimens.boxHeight10,
                        SizedBox(
                          height: 45,
                          child: Obx(
                            () => DropdownWebStock(
                              width: MediaQuery.of(context).size.width,
                              dropdownList: [],
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ),
                        // Dimens.boxHeight10,
                        // CustomRichText(title: 'Observation Description'),
                        // Dimens.boxHeight10,
                        // TextField(
                        //   style: TextStyle(
                        //     fontSize: 15.0,
                        //     height: 0.1,
                        //     color: Colors.black,
                        //   ),
                        //   decoration: InputDecoration(
                        //     hintText: 'Enter Observation Description',
                        //     alignLabelWithHint: true,
                        //   ),
                        // ),
                        Dimens.boxHeight10,
                        CustomRichText(title: 'Corrective/Preventive Action'),
                        Dimens.boxHeight10,
                        TextField(
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16.0,
                                height: 1.0,
                                color: Colors.black),
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
                        Dimens.boxHeight10,
                        TextField(
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16.0,
                                height: 1.0,
                                color: Colors.black),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter Responsible Person',
                            alignLabelWithHint: true,
                          ),
                        ),
                        Dimens.boxHeight10,
                        CustomRichText(title: 'Contact Number'),
                        Dimens.boxHeight10,
                        TextField(
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16.0,
                                height: 1.0,
                                color: Colors.black),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter Contact Number*',
                            alignLabelWithHint: true,
                          ),
                        ),
                        Dimens.boxHeight10,
                        CustomRichText(title: 'Target Date'),
                        Dimens.boxHeight10,
                        TextField(
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16.0,
                                height: 1.0,
                                color: Colors.black),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter Target Date',
                            alignLabelWithHint: true,
                          ),
                        ),
                        Dimens.boxHeight10,
                        CustomRichText(title: 'Action Taken'),
                        Dimens.boxHeight10,
                        TextField(
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16.0,
                                height: 1.0,
                                color: Colors.black),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter Action Taken',
                            alignLabelWithHint: true,
                          ),
                        ),
                        Dimens.boxHeight10,
                        CustomRichText(title: 'Cost Type*'),
                        Dimens.boxHeight10,

                        SizedBox(
                          height: 45,
                          child: Obx(
                            () => DropdownWebStock(
                              width: MediaQuery.of(context).size.width,
                              dropdownList: [],
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ),
                        Dimens.boxHeight10,
                        CustomRichText(title: 'Observation Description'),
                        Dimens.boxHeight10,
                        TextField(
                          style: TextStyle(
                            fontSize: 15.0,
                            height: 5,
                            color: Colors.black,
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
      ),
    );
  }
}
