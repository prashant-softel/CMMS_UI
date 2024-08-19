import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/doc_upload/doc_upload_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/create_document_upload_model.dart';
import 'package:cmms/domain/models/doc_upload_list_model.dart';
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

  GetDocUploadListModel? selectedItem;

  @override
  void onInit() async {
    try {
      await setData();

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

  Future<void> setData() async {
    try {
      GetDocUploadListModel? selectedItemDoc;

      final _selectedItem = await documentUploadPresenter.getValue();
      if (_selectedItem.isNotEmpty) {
        final jobdetaildata = jsonDecode(_selectedItem);
        selectedItemDoc = GetDocUploadListModel.fromJson(jobdetaildata);
      }
      if (_selectedItem == null ||
          _selectedItem == '' ||
          _selectedItem == "null") {
        var dataFromPreviousScreen = Get.arguments;
        selectedItem = dataFromPreviousScreen['selectedItem'];
      } else {
        selectedItem = selectedItemDoc;
      }

      if (selectedItem != null) {
        selecteddocumentNameType.value =
            selectedItem!.doc_master_name.toString();
        subDocName.text = selectedItem!.subDocName ?? '';
        remark.text = selectedItem!.remarks ?? '';
      }
    } catch (e) {
      print(e.toString() + 'userId');
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

  void uploadDocumentNew({dynamic fileIds}) async {
    try {
      String _renewDateTc = renewDateTc.text.trim();
      String _remarkDateTc = remark.text.trim();
      String _subDocNameDateTc = subDocName.text.trim();

      UploadDocumentModel uploadDocumentModel = UploadDocumentModel(
          is_renew: 0,
          docuemnt_id: 0,
          docMasterId: selectedDocumentId,
          fileId: fileIds[0],
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

  void reNewUploadDocumentNew({dynamic fileIds}) async {
    try {
      String _renewDateTc = renewDateTc.text.trim();
      String _remarkDateTc = remark.text.trim();
      String _subDocNameDateTc = subDocName.text.trim();
      dynamic fileIdToUse = selectedItem?.fileId ?? fileIds[0];
      int docMasterIdToUse = selectedItem?.doc_master_id ?? selectedDocumentId;
      int docIdToUse = selectedItem?.id ?? selectedDocumentId;

      UploadDocumentModel uploadDocumentModel = UploadDocumentModel(
          is_renew: 1,
          docMasterId: docMasterIdToUse,
          fileId: fileIds[0], // fileIdToUse,
          facility_id: facilityId,
          remarks: _remarkDateTc,
          renewDate: _renewDateTc,
          subDocName: _subDocNameDateTc,
          docuemnt_id: docIdToUse);

      var uploadDocumenModelJsonString = uploadDocumentModel.toJson();
      Map<String, dynamic>? responseUploadDocument =
          await documentUploadPresenter.uploadDocumentNew(
        uploadDocument: uploadDocumenModelJsonString,
        isLoading: true,
      );
      if (responseUploadDocument == null) {
        // Handle the case where the response is null
      }
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
