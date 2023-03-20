import 'dart:io';

import 'package:cmms/domain/models/file_model.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../job_card_details/views/widgets/multi_part_request.dart';

class DropzoneController extends GetxController {
  Rx<bool> blnHiglight = false.obs;
  Rx<FileModel> droppedFile = FileModel().obs;
  RxList<FileModel> droppedFiles = <FileModel>[].obs;
  Rx<double> progress = 0.0.obs;

  ///
  void uploadFile(
    dynamic event,
    DropzoneViewController dzvController,
    onDroppedFiles,
  ) async {
    try {
      final fileName = event.name;
      final mime = await dzvController.getFileMIME(event);
      final bytes = await dzvController.getFileSize(event);
      final url = await dzvController.createFileUrl(event);
      droppedFile.value = FileModel(
        url: url,
        fileName: fileName,
        mime: mime,
        bytes: bytes,
      );
      onDroppedFiles(droppedFiles);
      print(fileName);
    } //
    catch (e) {
      print(e);
    }
  }

  void uploadFiles(String filePath) async {
    try {
      //final url = 'https://fakestoreapi.com/products';
      for (var file in droppedFiles) {
        var _file = File(filePath);
        var stream = new http.ByteStream(_file.openRead());
        stream.cast();
        var length = await _file.length();
        var uri = Uri.parse('https://fakestoreapi.com/products');

        //var request = new http.MultipartRequest('POST', uri);
        final request = MultipartRequest(
          'POST',
          uri,
          onProgress: (int bytes, int total) {
            final progress = bytes / total;
            print('progress: $progress ($bytes/$total)');
          },
        );
        request.fields['title'] = "Static title";

        var multiport = new http.MultipartFile('image', stream, length);

        request.files.add(multiport);

        var response = await request.send();
        request.headers['HeaderKey'] = 'header_value';
        request.fields['form_key'] = 'form_value';
        request.files.add(
          await http.MultipartFile.fromPath(
            'field_name',
            'path/to/file',
            contentType: MediaType('application', 'x-tar'),
          ),
        );

        final streamedResponse = await request.send();
      }
    } //
    catch (e) {
      print(e);
    }
  }

  Future acceptFiles(
    List<dynamic>? events,
    DropzoneViewController dzvController,
    onDroppedFiles,
  ) async {
    var url = '';
    List<FileModel> droppedFiles = <FileModel>[];
    for (var event in events ?? []) {
      final name = event.name;
      final mime = await dzvController.getFileMIME(event);
      final byte = await dzvController.getFileSize(event);
      url = await dzvController.createFileUrl(event);

      print('Name : $name');
      print('Mime: $mime');

      print('Size : ${byte / (1024 * 1024)}');
      print('URL: $url');

      final droppedFile =
          FileModel(fileName: name, mime: mime, bytes: byte, url: url);
      droppedFiles.add(droppedFile);
    }
    onDroppedFiles(droppedFiles);

    blnHiglight.value = false;

    ///
    uploadFiles(url);
  }

  ///
}
