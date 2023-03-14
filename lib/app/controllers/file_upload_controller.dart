import 'package:cmms/domain/models/dropped_file.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../job_card_details/views/widgets/multi_part_request.dart';

class DropzoneController extends GetxController {
  //var files = <dynamic>[].obs;
  Rx<DroppedFile> droppedFile = DroppedFile().obs;
  RxList<DroppedFile> droppedFiles = <DroppedFile>[].obs;

  ///
  void acceptFile(dynamic event, DropzoneViewController dzvController) async {
    try {
      final fileName = event.name;
      final mime = await dzvController.getFileMIME(event);
      final bytes = await dzvController.getFileSize(event);
      final url = await dzvController.createFileUrl(event);
      droppedFile.value = DroppedFile(
        url: url,
        fileName: fileName,
        mime: mime,
        bytes: bytes,
      );
      print(fileName);
    } //
    catch (e) {
      print(e);
    }
  }

  void acceptFiles(
      List<dynamic> events, DropzoneViewController dzvController) async {
    for (var event in events) {
      final fileName = event.name;
      final mime = await dzvController.getFileMIME(event);
      final bytes = await dzvController.getFileSize(event);
      final url = await dzvController.createFileUrl(event);
      droppedFile.value = DroppedFile(
        url: url,
        fileName: fileName,
        mime: mime,
        bytes: bytes,
      );
      droppedFiles.add(droppedFile.value);
      uploadFile();
    }
  }

  void uploadFile() async {
    final url = 'https://...';
    final request = MultipartRequest(
      'POST',
      Uri.parse(url),
      onProgress: (int bytes, int total) {
        final progress = bytes / total;
        print('progress: $progress ($bytes/$total)');
      },
    );

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

  ///
}
