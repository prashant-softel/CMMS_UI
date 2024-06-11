import 'package:cmms/app/Statutory/statutory_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewComplianceMobile extends GetView<StatutoryController> {
  ViewComplianceMobile({Key? key}) : super(key: key);

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
                      CustomRichText(title: 'Compliance'),
                      Dimens.boxHeight10,
                      TextField(
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 16.0, height: 1.0, color: Colors.black),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter Checklist Name',
                          alignLabelWithHint: true,
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Status Of Application'),
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
                      CustomRichText(title: 'Date of received '),
                      Dimens.boxHeight10,
                      TextField(
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 16.0, height: 1.0, color: Colors.black),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Select The received Date',
                          alignLabelWithHint: true,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              // Handle the tap on the suffix icon (e.g., show a date picker).
                              // Add your logic here.
                            },
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors
                                  .grey, // You can customize the color as needed.
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Date of Expiry'),
                      Dimens.boxHeight10,
                      TextField(
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 16.0, height: 1.0, color: Colors.black),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Select The expiry Date',
                          alignLabelWithHint: true,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              // Handle the tap on the suffix icon (e.g., show a date picker).
                              // Add your logic here.
                            },
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors
                                  .grey, // You can customize the color as needed.
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                      CustomRichText(title: 'Validity (In months)'),
                      Dimens.boxHeight10,
                      TextField(
                        readOnly: true,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 16.0, height: 1.0, color: Colors.black),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter Checklist Name',
                          alignLabelWithHint: true,
                        ),
                      ),
                      Dimens.boxHeight20,
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
