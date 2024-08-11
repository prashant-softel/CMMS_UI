import 'dart:async';

import 'package:cmms/app/doc_upload/doc_upload_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/create_document_upload_model.dart';
import 'package:cmms/domain/models/documentmaster_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentUploadController extends GetxController {
  DocumentUploadController(this.documentUploadPresenter);
  HomeController homeController = Get.find();
  DocumentUploadPresenter documentUploadPresenter;

  int facilityId = 0;
  RxList<DocumentMasterModel?> documentNameType = <DocumentMasterModel>[].obs;

  Rx<bool> isSelectedDocumentNameType = true.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  bool openrenewDateTcDatePicker = false;
  bool isLoading = true;
  var renewDateTc = TextEditingController();
  var remark = TextEditingController();
  var subDocName = TextEditingController();

  Rx<bool> isSelecteddocumentNameType = true.obs;
  Rx<String> selecteddocumentNameType = ''.obs;
  int selectedDocumentId = 0;
  @override
  void onInit() async {
    try {
      facilityIdStreamSubscription = homeController.facilityId$.listen(
        (event) async {
          facilityId = event;
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

  void uploadDocumentNew() async {
    try {
      String _renewDateTc = renewDateTc.text.trim();
      String _remarkDateTc = remark.text.trim();
      String _subDocNameDateTc = subDocName.text.trim();

      UploadDocumentModel uploadDocumentModel = UploadDocumentModel(
          is_renew: 0,
          docMasterId: selectedDocumentId,
          fileId: 2,
          facility_id: facilityId,
          remarks: _remarkDateTc,
          renewDate: _renewDateTc,
          subDocName: _subDocNameDateTc);
      var uploadDocumenModelJsonString = uploadDocumentModel.toJson();
      Map<String, dynamic>? responseUploadDocument =
          await documentUploadPresenter.uploadDocumentNew(
        uploadDocument: uploadDocumenModelJsonString,
        isLoading: true,
      );
      if (responseUploadDocument == null) {}
    } catch (e) {
      print(e);
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print("$value");
    switch (list.runtimeType) {
      case const (RxList<DocumentMasterModel>):
        {
          if (value != "Please Select") {
            int documentIndex =
                documentNameType.indexWhere((x) => x!.name == value);
            selectedDocumentId = documentNameType[documentIndex]?.id ?? 0;

            selecteddocumentNameType.value = value;
            isSelecteddocumentNameType.value = true;
          } else {
            selectedDocumentId = 0;
          }
        }
        break;
    }
  }
}
