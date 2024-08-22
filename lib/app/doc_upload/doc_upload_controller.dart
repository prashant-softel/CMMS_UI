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
  Rx<bool> isFormInvalid = false.obs;
  Rx<bool> isSubDocInvalid = false.obs;
  Rx<bool> isRenewDateTcInvalid = false.obs;
  Rx<bool> isReamrkInvalid = false.obs;

  Rx<bool> isSelectedDocumentNameType = true.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  bool openrenewDateTcDatePicker = false;
  bool isLoading = true;
  var renewDateTc = TextEditingController();

  var remark = TextEditingController();
  var subDocName = TextEditingController();

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
      checkForm();
      if (isFormInvalid.value) {
        return;
      }
      String _renewDateTc = renewDateTc.text.trim();
      String _remarkDateTc = remark.text.trim();
      String _subDocNameDateTc = subDocName.text.trim();

      if (fileIds == null || fileIds.isEmpty) {
        showAlertDialog(
          title: "Upload Failed",
          message:
              "No file has been selected for upload. Please select a file and try again.",
        );
        return;
      }

      UploadDocumentModel uploadDocumentModel = UploadDocumentModel(
        is_renew: 0,
        docuemnt_id: 0,
        docMasterId: selectedDocumentId,
        fileId: fileIds[0],
        facility_id: facilityId,
        remarks: _remarkDateTc,
        renewDate: _renewDateTc,
        subDocName: _subDocNameDateTc,
      );

      var uploadDocumenModelJsonString = uploadDocumentModel.toJson();
      Map<String, dynamic>? responseUploadDocument =
          await documentUploadPresenter.uploadDocumentNew(
        uploadDocument: uploadDocumenModelJsonString,
        isLoading: true,
      );

      if (responseUploadDocument == null) {
        // Show alert dialog if the upload fails
        showAlertDialog(
          title: "Upload Failed",
          message: "The document upload failed. Please try again.",
        );
      } else {
        // Handle success case if needed
        print("Upload successful");
      }
    } catch (e) {
      print(e);
      showAlertDialog(
        title: "Error",
        message: "An unexpected error occurred: ${e.toString()}",
      );
    }
  }

  void checkForm() {
    if (selectedDocumentId == 0) {
      isSelectedDocumentNameType.value = false;
      isFormInvalid.value = true;
    }
    if (subDocName.text.trim().length == 0) {
      isSubDocInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (renewDateTc.text.trim().length == 0) {
      isRenewDateTcInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (remark.text.trim().length == 0) {
      isReamrkInvalid.value = true;
      isFormInvalid.value = true;
    }
  }

  void checkRenewForm() {
    if (renewDateTc.text.trim().length == 0) {
      isRenewDateTcInvalid.value = true;
      isFormInvalid.value = true;
    }
    if (remark.text.trim().length == 0) {
      isReamrkInvalid.value = true;
      isFormInvalid.value = true;
    }
  }

  void showAlertDialog({required String title, required String message}) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Color(0xFF002147),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontFamily: 'Arial',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF002147),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
        elevation: 24.0,
        contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        actionsPadding: EdgeInsets.only(right: 16.0, bottom: 8.0),
      ),
    );
  }

  void reNewUploadDocumentNew({dynamic fileIds}) async {
    try {
      checkRenewForm();
      if (isFormInvalid.value) {
        return;
      }
      String _renewDateTc = renewDateTc.text.trim();
      String _remarkDateTc = remark.text.trim();
      String _subDocNameDateTc = subDocName.text.trim();
      dynamic fileIdToUse = selectedItem?.fileId ?? fileIds[0];
      int docMasterIdToUse = selectedItem?.doc_master_id ?? selectedDocumentId;
      int docIdToUse = selectedItem?.id ?? selectedDocumentId;

      if (fileIds == null || fileIds.isEmpty) {
        showAlertDialog(
          title: "Upload Failed",
          message:
              "No file has been selected for upload. Please select a file and try again.",
        );
        return;
      }
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
        showAlertDialog(
          title: "Upload Failed",
          message: "The document upload failed. Please try again.",
        );
      }
    } catch (e) {
      print(e);
      showAlertDialog(
        title: "Error",
        message: "An unexpected error occurred: ${e.toString()}",
      );
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
            isSelectedDocumentNameType.value = true;
          } else {
            selectedDocumentId = 0;
          }
        }
        break;
    }
  }
}
