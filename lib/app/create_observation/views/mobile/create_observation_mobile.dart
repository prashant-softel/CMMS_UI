import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_observation/create_observation_controller.dart';
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
                    CustomRichText(title: 'Location of Observation'),
                    SizedBox(
                      height: 10,
                    ),
                    // SizedBox(
                    //   height: 100,
                    //   child: DropdownWebStock(
                    //     width: MediaQuery.of(context).size.width,
                    //     dropdownList: [],
                    //     onValueChanged: (p0, p1) {},
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
