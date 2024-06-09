import 'dart:async';

import 'package:cmms/app/document_upload/document_upload_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentUploadController extends GetxController {
  DocumentUploadController(this.documentUploadPresenter);
  HomeController homeController = Get.find();
  DocumentUploadPresenter documentUploadPresenter;

  Rx<int> facilityId = 0.obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  bool openUploadDocDateTcDatePicker = false;
  bool isLoading = true;
  var uploadDocDateTc = TextEditingController();

  @override
  void onInit() async {
    try {
      facilityIdStreamSubscription = homeController.facilityId$.listen(
        (event) async {
          facilityId.value = event;
          // await getEmployeeList(facilityId.value);
        },
      );

      super.onInit();
    } catch (e) {
      print(e);
    }
  }
}
