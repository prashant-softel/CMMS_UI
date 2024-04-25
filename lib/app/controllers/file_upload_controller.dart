import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../domain/models/file_upload_model.dart';
import '../../domain/repositories/local_storage_keys.dart';
import '../../domain/repositories/repository.dart';
import '../utils/utility.dart';

class FileUploadController extends GetxController {
  ///
  var repository = Get.find<Repository>();

  ///
  final Uri apiUrl =
      Uri.parse('http://65.0.20.19/CMMS_API/api/FileUpload/UploadFile');
  // Uri.parse('http://172.20.43.9:83/api/FileUpload/UploadFile');

  Rx<bool> blnHiglight = false.obs;
  Rx<List<int>> progresses = Rx(<int>[]);
  Rx<int> progress = 0.obs;
  Rx<int> index = 0.obs;
  RxList<XFile> pickedFiles = <XFile>[].obs;
  Rx<bool> uploadingImage = false.obs;
  Rx<bool> showUploadButton = true.obs;
  var selectedEvent = FileUploadEvents.BEFORE.obs;
  var token = '';
  List<TextEditingController> descriptionCtrlrs = [];
  List<TextEditingController> newDescriptionCtrlrs = [];
  List<List<int>>? bytesDataList;
  Rx<double?> tileHeight = 0.0.obs;

  ///fileIDs
  List<dynamic> fileIds = [];

  ///
  @override
  void onInit() async {
    token = await repository.getSecuredValue(LocalKeys.authToken);
    super.onInit();
  }

  ///
  Future<List<XFile>> addFiles() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> newFiles = await picker.pickMultiImage();
    pickedFiles.addAll(newFiles);
    initializeDescriptionControllers(
        newFiles); // assuming this method takes a list of XFile
    return pickedFiles.value;
  }

  Future<void> uploadSingleFile(XFile file, List<int> bytesData, String token,
      int index, TextEditingController descriptionController,
      {required Function(double) uploadProgressCallback}) async {
    ///

    String boundary = '----${DateTime.now().millisecondsSinceEpoch}';
    var headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "multipart/form-data; boundary=$boundary",
      "Accept": "*/*",
    };

    var requestFields = {
      "facility_id": "380",
      "module_id": "1",
      "id": "3263",
      "description": descriptionController.text,
    };

    var fieldsData = requestFields.entries
        .map((entry) =>
            '--$boundary\r\nContent-Disposition: form-data; name="${entry.key}"\r\n\r\n${entry.value}\r\n')
        .join();

    var fieldsBytes = utf8.encode(fieldsData);

    var fileHeader =
        '--$boundary\r\nContent-Disposition: form-data; name="files"; filename="${file.name}"\r\n\r\n';
    var fileFooter = '\r\n--$boundary--\r\n';

    var fileHeaderBytes = utf8.encode(fileHeader);
    var fileFooterBytes = utf8.encode(fileFooter);

    var requestBody = <List<int>>[
      fieldsBytes,
      fileHeaderBytes,
      ...bytesData.map((e) => [e]),
      fileFooterBytes,
    ];

    var stream = http.ByteStream(Stream<List<int>>.fromIterable(requestBody));
    var length = requestBody.fold<int>(0, (sum, list) => sum + list.length);
    int totalSent = 0;

    StreamController<List<int>> streamController =
        StreamController<List<int>>();

    stream.transform(StreamTransformer<List<int>, List<int>>.fromHandlers(
      handleData: (data, sink) {
        totalSent += data.length;
        int progress = ((totalSent / length) * 100).round();
        uploadProgressCallback(progress.toDouble());
        sink.add(data);

        // Update the progress at the current index
        var updatedProgresses = List<int>.from(progresses.value);
        updatedProgresses[index] = progress;
        progresses.value = updatedProgresses;
      },
    )).listen((data) {
      streamController.add(data);
    }, onDone: () {
      streamController.close();
    }, onError: (e) {
      streamController.addError(e);
    });

    var newStream = streamController.stream;

    var request = http.StreamedRequest('POST', apiUrl)
      ..headers.addAll(headers)
      ..contentLength = length
      ..followRedirects = true
      ..maxRedirects = 5;

    newStream.listen((data) {
      request.sink.add(data);
    }, onDone: () {
      request.sink.close();
    }, onError: (e) {
      request.sink.addError(e);
    });

    var response = await request.send();
    print('File Upload Response:$response');

    if (response.statusCode == 200) {
      var respStr = await response.stream.bytesToString();
      var jsonResponse = json.decode(respStr);

      var id = jsonResponse['id'];
      print('File Id,${id[0]}');
      fileIds.addAll(jsonResponse['id']);
      print('Files uploaded successfully,$fileIds');
    } else {
      print('Failed to upload files: ${response.reasonPhrase}');
    }
  }

  Future<void> uploadFiles(List<XFile> files, List<List<int>> bytesDataList,
      String token, List<TextEditingController> descriptionCtrlrs,
      {required Function(double) uploadProgressCallback}) async {
    progresses.value = List<int>.filled(files.length, 0);

    for (int i = 0; i < files.length; i++) {
      await uploadSingleFile(
        files[i],
        bytesDataList[i],
        token,
        i,
        descriptionCtrlrs[i],
        uploadProgressCallback: (progress) {
          var updatedProgresses = List<int>.from(progresses.value);
          updatedProgresses[i] = progress.round();
          progresses.value = updatedProgresses;
        },
      );
    }
  } //

  void setSelectedEvent(FileUploadEvents event) {
    selectedEvent.value = event;
  }

  void initializeDescriptionControllers(List<XFile> files) {
    newDescriptionCtrlrs = List<TextEditingController>.generate(
      files.length,
      (index) => TextEditingController(),
    );
    descriptionCtrlrs.addAll(newDescriptionCtrlrs);
  }

  void removeFile(file) {
    try {
      // remove file
      List<XFile> fileList = List.from(pickedFiles);
      fileList.removeWhere((item) => item.name == file.name);
      pickedFiles.value = fileList; //new modified list

      // remove description controller
      List<TextEditingController> _descriptionCtrlrsList =
          List.from(descriptionCtrlrs);
      _descriptionCtrlrsList.removeAt(index.value);
      descriptionCtrlrs = _descriptionCtrlrsList;

      //remove progress indicator
      List<int> _progressList = List.from(progresses.value);
      _progressList.removeAt(index.value);
      progresses.value = _progressList;
      //update at the end
      index.value = pickedFiles.length - 1;
    } //
    catch (e) {
      print(e);
    }
  }

  selectFiles() async {
    try {
      pickedFiles.value = await addFiles();
      bytesDataList = [];

      for (var file in pickedFiles) {
        bytesDataList!.add(await file.readAsBytes());
      }

      if (pickedFiles.isEmpty || pickedFiles.length != bytesDataList!.length) {
        print('No files selected or failed to read bytes data');
        pickedFiles.clear();
        bytesDataList = null;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), ' selectFiles');
    }
  }

  uploadSelectedFiles() async {
    fileIds.clear();
    uploadingImage.value = true;
    showUploadButton.value = false;
    if (bytesDataList != null) {
      await uploadFiles(
        pickedFiles,
        bytesDataList!,
        token,
        descriptionCtrlrs,
        uploadProgressCallback: (progress) {
          print('Upload progress: $progress%');
        },
      );
      uploadingImage.value = false;
    } else {
      print('No files selected');
    }
  }

  ///
}
