import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_elevated_button.dart';
import '../create_preventive_checklist_controller.dart';

class CreatePriventiveListScreen
    extends GetView<PreventiveCheckListController> {
  CreatePriventiveListScreen({Key? key}) : super(key: key);
  final PreventiveCheckListController controller = Get.find();

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create CheckList Number'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (Responsive.isMobile(context))
            Container(
              margin: EdgeInsets.all(10),
              child: Card(
                  color: Colors.lightBlue.shade50,
                  elevation: 20,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: Dimens.edgeInsets10,
                      child: SingleChildScrollView(
                        child: Obx(
                          () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomRichText(title: 'CheckList Number: '),
                                SizedBox(
                                  height: 5,
                                ),
                                LoginCustomTextfield(),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomRichText(title: 'Equipment Category: '),
                                SizedBox(
                                  height: 5,
                                ),
                                // Container(
                                //   width: MediaQuery.of(context).size.width,
                                //   decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     borderRadius: BorderRadius.circular(5),
                                //   ),
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(left: 4),
                                //     child: CustomDropDownButton(
                                //       value: controller.selectedequipment.value,
                                //       onChange: (String? selectedValue) {
                                //         controller.isSelectedequipment.value =
                                //             true;
                                //         controller.selectedequipment.value =
                                //             selectedValue ?? '';
                                //       },
                                //       item: controller.equipmentCategoryList
                                //           .map<DropdownMenuItem<String>>(
                                //               (facility) {
                                //         return DropdownMenuItem<String>(
                                //           value: facility?.name ?? '',
                                //           child: Text(facility?.name ?? ''),
                                //         );
                                //       }).toList(),
                                //     ),
                                //   ),
                                // ),

                                SizedBox(
                                  height: 10,
                                ),
                                CustomRichText(title: 'Frequency: '),
                                SizedBox(
                                  height: 5,
                                ),
                                LoginCustomTextfield(),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomRichText(title: 'Manpower: '),
                                SizedBox(
                                  height: 5,
                                ),
                                LoginCustomTextfield(),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomRichText(title: 'Duration(in Minutes): '),
                                SizedBox(
                                  height: 5,
                                ),
                                LoginCustomTextfield(),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Container(
                                      height: 45,
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorsValue.navyBlueColor,
                                        text: "Submit",
                                        onPressed: () {
                                          controller.createCheckList();
                                        },
                                      )),
                                ),
                              ]),
                        ),
                      )
                      //
                      )
                  //
                  ),
            ),
        ],
      ),
    );
  }
}
