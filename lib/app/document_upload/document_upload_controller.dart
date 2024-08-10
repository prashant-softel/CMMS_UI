import 'dart:async';

import 'package:cmms/app/document_upload/document_upload_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/documentmaster_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentUploadController extends GetxController {
  DocumentUploadController(this.documentUploadPresenter);
  HomeController homeController = Get.find();
  DocumentUploadPresenter documentUploadPresenter;

  Rx<int> facilityId = 0.obs;
  RxList<DocumentMasterModel?> documentNameType = <DocumentMasterModel>[].obs;
  Rx<String> selectedDocumentNameType = ''.obs;
  Rx<bool> isSelectedDocumentNameType = true.obs;
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
          await getDocumentMaster();
        },
      );

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getDocumentMaster() async {
    documentNameType.clear();
    final list = await documentUploadPresenter.getDocumentMaster(
      isLoading: isLoading,
    );
    if (list != null) {
      isLoading = false;
      for (var _spvList in list) {
        documentNameType.add(_spvList);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print("$value");
    switch (list.runtimeType) {
      case const (RxList<DocumentMasterModel>):
        {
          if (value != "Please Select") {
            int documentTypeNameIndex =
                documentNameType.indexWhere((x) => x?.name == value);
            selectedDocumentNameType.value =
                (documentNameType[documentTypeNameIndex]?.id ?? 0).toString();
            print(
                "selectedBusinessTypeId: ${selectedDocumentNameType.value} \n ${selectedDocumentNameType.value}");
          }
        }
        break;
    }
  }
}
