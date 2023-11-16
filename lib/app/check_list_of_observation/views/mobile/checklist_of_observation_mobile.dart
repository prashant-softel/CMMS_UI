import 'package:cmms/app/check_list_of_observation/checklist_of_observation_controller.dart';
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
                      Text("data"),
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
