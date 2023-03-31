import 'dart:html';
import 'dart:typed_data';
import 'package:cmms/domain/services/file_upload_service.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/file_upload_model.dart';
import '../../domain/repositories/local_storage_keys.dart';

class FileUploadController extends GetxController {
  ///
  var repository = Get.find<Repository>();

  ///
  RxList<File> files = RxList<File>([]);
  List<int>? selectedFile;
  var progress = Rx<double>(0);
  Uint8List? bytesData;
  Rx<bool> blnHiglight = false.obs;
  RxList<int> progresses = <int>[].obs;
  late File? file;
  int index = 0;
  var selectedEvent = FileUploadEvents.BEFORE.obs;
  var token = '';
  final url =
      Uri.parse('http://3.111.196.218/CMMS_API/api/FileUpload/UploadFile');
  List<TextEditingController> descriptionCtrlrs = [];

  ///
  @override
  void onInit() async {
    token = await repository.getSecuredValue(LocalKeys.authToken);

    super.onInit();
  }

  addFiles() async {
    try {
      final uploadInput = FileUploadInputElement();
      uploadInput.multiple = true;
      uploadInput.draggable = true;
      uploadInput.click();
      uploadInput.onChange.listen((event) {
        files.value = uploadInput.files!;

        onFilesAdded();
      });
    } //
    catch (e) {
      print(e);
    }
  }

  void onFilesAdded() {
    progresses.value = List<int>.filled(files.length, 0);
    descriptionCtrlrs.length = files.length;
    index = files.length - 1;
  }

  void uploadFiles() async {
    try {
      var requestFields = {
        "facility_id": "380",
        "module_id": "1",
        "id": "3263",
      };
      for (var i = 0; i < files.length; i++) {
        final fileUploadService = FileUploadService(
          url: 'http://3.111.196.218/CMMS_API/api/FileUpload/UploadFile',
          token: token,
          files: files,
          requestFields: requestFields,
        );
        await fileUploadService.uploadProgress.listen((double _progress) {
          progresses[i] = _progress.toInt();
          print("File upload progress for file $i: ${progresses[i]}%");
        });
        await fileUploadService.upload(i);
      }
      // final fileUploadService = FileUploadService(
      //   url: 'http://3.111.196.218/CMMS_API/api/FileUpload/UploadFile',
      //   token: token,
      //   files: files.toList(),
      //   requestFields: requestFields,
      // );
      // fileUploadService.uploadProgress.listen((double _progress) {
      //   progresses[index.toInt()] = _progress.toInt();
      //   print("File upload progress: ${progress}%");
      // });
      // fileUploadService.upload();
    } //
    catch (e) {
      print(e);
    }
  }

  void setSelectedEvent(FileUploadEvents event) {
    selectedEvent.value = event;
  }

  void removeFile(file) {
    try {
      // remove file
      List<File> fileList = List.from(files);
      fileList.removeWhere((item) => item.name == file.name);
      files.value = fileList; //new modified list

      // remove description controller
      List<TextEditingController> _descriptionCtrlrsList =
          List.from(descriptionCtrlrs);
      _descriptionCtrlrsList.removeAt(index);
      descriptionCtrlrs = _descriptionCtrlrsList;

      //remove progress indicator
      List<int> _progressList = List.from(progresses);
      _progressList.removeAt(index);
      progresses.value = _progressList;
      //update at the end
      index = files.length - 1;
    } //
    catch (e) {
      print(e);
    }
  }

  ///
}
