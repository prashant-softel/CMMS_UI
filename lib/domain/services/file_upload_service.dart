import 'dart:async';
import 'dart:html';
import 'package:http/http.dart' as http;

class FileUploadService {
  final String url;
  final String token;
  final List<File> files;
  final Map<String, String>? requestFields;

  final StreamController<double> _uploadProgressController =
      StreamController<double>.broadcast();
  Stream<double> get uploadProgress => _uploadProgressController.stream;

  FileUploadService({
    required this.url,
    required this.token,
    required this.files,
    this.requestFields,
  });

  ///
  // final StreamController<int> _uploadProgressController =
  //     StreamController<int>.broadcast();
  // Stream<double> get uploadProgress => _uploadProgressController.stream;

  ///
  // Future<void> upload() async {
  //   for (var i = 0; i < files.length; i++) {
  //     final file = files[i];
  //     final completer = Completer<List<int>>();
  //     final reader = FileReader();
  Future<void> upload(int index) async {
    try {
      final file = files[index];
      final completer = Completer<List<int>>();
      final reader = FileReader();

      //     reader.onLoad.listen((event) {
      //       final bytesData = reader.result as List<int>;
      //       completer.complete(bytesData);
      //     });

      //     reader.readAsArrayBuffer(file);
      //     final bytesData = await completer.future;
      //     final request = http.MultipartRequest("POST", Uri.parse(url));
      //     final headers = {
      //       "Authorization": "Bearer $token",
      //       "Content-Type": "multipart/form-data",
      //       "Content-Length": bytesData.length.toString(),
      //       "Accept": "*/*",
      //     };
      //     request.headers.addAll(headers);
      //     if (requestFields != null) {
      //       request.fields.addAll(requestFields!);
      //     }
      //     request.files.add(http.MultipartFile.fromBytes(
      //       'files',
      //       bytesData,
      //       filename: file.name,
      //     ));
      //     final response = await request.send();
      //     handleResponse(response);
      //   }
      // }
      reader.readAsArrayBuffer(file);
      final bytesData = await completer.future;
      final request = http.MultipartRequest("POST", Uri.parse(url));
      final headers = {
        "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data",
        "Content-Length": bytesData.length.toString(),
        "Accept": "*/*",
      };
      request.headers.addAll(headers);
      if (requestFields != null) {
        request.fields.addAll(requestFields!);
      }
      request.files.add(http.MultipartFile.fromBytes(
        'files',
        bytesData,
        filename: file.name,
      ));
      final response = await request.send();
      await handleResponse(response, index);
    } catch (e) {
      print(e);
    }
  }

  Future<void> handleResponse(http.StreamedResponse response, int index) async {
    try {
      final completer = Completer<void>();
      final total = response.contentLength ?? -1;
      var bytesUploaded = 0;
      var progress = 0.0;

      response.stream.listen((List<int> chunk) {
        bytesUploaded += chunk.length;
        final newProgress = ((bytesUploaded / total) * 100);

        if (newProgress > progress) {
          progress = newProgress;
          _uploadProgressController.sink.add(progress);
        }
      }, onDone: () {
        _uploadProgressController.sink.add(100.0);
        completer.complete();
      }, onError: (error) {
        completer.completeError(error);
      });

    await completer.future;
  } catch(error){

  }

    ///
  }
}
