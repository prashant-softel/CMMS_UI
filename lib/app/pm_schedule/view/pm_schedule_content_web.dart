import 'package:cmms/app/app.dart';
import 'package:cmms/app/pm_schedule/pm_schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/dropdown.dart';

class PmScheduleContentWeb extends GetView<PmScheduleController> {
  PmScheduleContentWeb({Key? key}) : super(key: key);
  final PmScheduleController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 234, 236, 238),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color.fromARGB(255, 227, 224, 224),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                Text(
                  "Dashboard",
                  style: Styles.greyLight14,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(" / Preventive Maintenance",
                      style: Styles.greyMediumLight12),
                ),
                Text(" / PM Schedule", style: Styles.greyMediumLight12)
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ColorValues.whiteColor,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: ColorValues.greyBorderColor,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Obx(
                () => Column(children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    //color: ColorValues.greyLightColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PM Schedule",
                          style: Styles.blackBold16,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            CustomRichText(title: 'Select Equipment Type: '),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width * .3),
                              child: DropdownWidget(
                                controller: controller,
                                dropdownList: controller.equipmentCategoryList,
                                isValueSelected:
                                    controller.isSelectedequipment.value,
                                selectedValue:
                                    controller.selectedequipment.value,
                                onValueChanged: controller.onValueChanged,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: 'Note: ',
                                      style: TextStyle(
                                        color: ColorValues.blueColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              'Date Should be ${'"YYYY-MM-DD"'} Format in Excel File',
                                          style: TextStyle(
                                            color: ColorValues.appRedColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: ColorValues.yellowColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorValues.yellowColor,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "PM Execution will be scheduled for mapped frequencies only",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            ActionButton(
                              icon: Icons.upload,
                              label: 'Import Schedule',
                              onPressed: () {},
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width:
                                  (MediaQuery.of(context).size.width * .1) - 70,
                              margin: EdgeInsets.only(left: 10),
                              child: CustomElevatedButton(
                                  backgroundColor: Colors.blue,
                                  onPressed: () {},
                                  text: 'Copy'),
                            ),
                            Container(
                              height: 40,
                              width:
                                  (MediaQuery.of(context).size.width * .1) - 70,
                              margin: EdgeInsets.only(left: 10),
                              child: CustomElevatedButton(
                                  backgroundColor: Colors.blue,
                                  onPressed: () {},
                                  text: 'Excel'),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width * .1) - 80,
                              height: 40,
                              margin: EdgeInsets.only(left: 10),
                              child: CustomElevatedButton(
                                  backgroundColor: Colors.blue,
                                  onPressed: () {},
                                  text: 'PDF'),
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width * .2) -
                                  137,
                              height: 40,
                              margin: EdgeInsets.only(left: 10),
                              child: CustomElevatedButton(
                                  backgroundColor: Colors.blue,
                                  onPressed: () {},
                                  text: 'Column Visibility'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
