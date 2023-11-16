import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_observation/create_observation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateObservationMobile extends GetView<CreateObservationController> {
  CreateObservationMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [Text("data")],
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorValues.navyBlueColor,
        child: Icon(
          Icons.add,
          color: ColorValues.whiteColor,
        ),
      ),
    );
  }
}
