import 'package:cmms/app/Statutory/statutory_controller.dart';

import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatutoryMobile extends GetView<StatutoryController> {
  StatutoryMobile({Key? key}) : super(key: key);

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
