import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_value.dart';
import '../../theme/dimens.dart';
import '../../theme/styles.dart';
import '../create_preventive_checklist_controller.dart';

class CreatePriventiveListScreen
    extends GetView<PreventiveCheckListController> {
  CreatePriventiveListScreen({Key? key}) : super(key: key);

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create CheckList Number'),
        centerTitle: true,
      ),
      body: Container(
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'CheckList Number: ',
                              style: Styles.blackBold16,
                              children: [
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    color: ColorsValue.orangeColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        LoginCustomTextfield(),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Equipment Category: ',
                              style: Styles.blackBold16,
                              children: [
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    color: ColorsValue.orangeColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        LoginCustomTextfield(),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Frequency: ',
                              style: Styles.blackBold16,
                              children: [
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    color: ColorsValue.orangeColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        LoginCustomTextfield(),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Manpower: ',
                              style: Styles.blackBold16,
                              children: [
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    color: ColorsValue.orangeColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        LoginCustomTextfield(),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Duration(in Minutes):',
                              style: Styles.blackBold16,
                              children: [
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    color: ColorsValue.orangeColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ),
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
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: Dimens.fourteen),
                                backgroundColor: ColorsValue.navyBlueColor,
                              ),
                              onPressed: () {
                                // controller.login();
                              },
                              child: const Text('Submit'),
                            ),
                          ),
                        ),
                      ]),
                )
                //
                )
            //
            ),
      ),
    );
  }
}
