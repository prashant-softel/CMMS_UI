import 'package:cmms/app/dsm_charges/dsm_charges_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';

class DsmChargesListContentWeb extends StatefulWidget {
  DsmChargesListContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<DsmChargesListContentWeb> createState() =>
      _DsmChargesListContentWebState();
}

final List<Map<String, dynamic>> statutoryData = [
  {
    "Site name": "Alote",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Aurad",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Barod",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Bellary",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Alote",
    'WO number': '123456',
    'WO description': 'Corrective maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Aurad",
    'WO number': '123456',
    'WO description': 'Corrective maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Alote",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Alote",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Alote",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Alote",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Alote",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
];

class _DsmChargesListContentWebState extends State<DsmChargesListContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DsmChargesListController>(
        id: 'user_list',
        builder: (controller) {
          // return Obx(() {

          return Column(
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
                      color:
                          Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                        Get.offNamed(Routes.masterDashboard);
                      },
                      child: Text(" / MASTER", style: Styles.greyMediumLight12),
                    ),
                    Text(" / DSM CHARAGES LIST",
                        style: Styles.greyMediumLight12),
                  ],
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    child: Container(
                      width: Get.width * 7,
                      margin: EdgeInsets.all(10),
                      height: Get.height,
                      child: Card(
                        color: Color.fromARGB(255, 245, 248, 250),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "F&S DSM CHARGES",
                                      style: Styles.blackBold16,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appLightBlueColor,
                                      onPressed: () {},
                                      text: 'Column Visibility',
                                    ),
                                  ),
                                  Container(
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () {},
                                        text: 'Copy'),
                                  ),
                                  Container(
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () {},
                                        text: 'Excel'),
                                  ),
                                  Container(
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () {},
                                        text: 'PDF'),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 300,
                                    height: 40,
                                    margin: Dimens.edgeInsets0_0_16_0,
                                    child: TextField(
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 16.0,
                                            height: 1.0,
                                            color: Colors.black),
                                      ),
                                      onChanged: (value) {},
                                      // =>
                                      // controller.search(value),
                                      decoration: InputDecoration(
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 0.0,
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 0.0,
                                          ),
                                        ),
                                        contentPadding: Dimens.edgeInsets05_10,
                                        hintText: 'search'.tr,
                                        hintStyle: Styles.grey16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
  //);
}
