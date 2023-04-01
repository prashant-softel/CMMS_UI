// import 'dart:html';
import 'dart:typed_data';
import 'package:cmms/domain/services/file_upload_service.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:get/get.dart';
import '../../domain/repositories/local_storage_keys.dart';

class DropzoneController extends GetxController {
  ///
  var repository = Get.find<Repository>();

  ///
  // RxList<File> files = RxList<File>([]);
  List<int>? selectedFile;
  Uint8List? bytesData;
  Rx<bool> blnHiglight = false.obs;
  Rx<double> progress = 0.0.obs;
  // late File? file;

  var token = '';
  final url =
      Uri.parse('http://3.111.196.218/CMMS_API/api/FileUpload/UploadFile');

  ///
  @override
  void onInit() async {
    token = await repository.getSecureValue(LocalKeys.authToken);
    super.onInit();
  }

  // addFiles() async {
  //   try {
  //     final uploadInput = FileUploadInputElement();
  //     uploadInput.multiple = true;
  //     uploadInput.draggable = true;
  //     uploadInput.click();
  //     uploadInput.onChange.listen((event) {
  //       files.value = uploadInput.files!;
  //     });
  //   } //
  //   catch (e) {
  //     print(e);
  //   }
  // }

  // void uploadFiles() {
  //   try {
  //     var requestFields = {
  //       "facility_id": "380",
  //       "module_id": "1",
  //       "id": "3263",
  //     };
  //     final fileUploadService = FileUploadService(
  //       url: 'http://3.111.196.218/CMMS_API/api/FileUpload/UploadFile',
  //       token: token,
  //       files: files.toList(),
  //       requestFields: requestFields,
  //     );
  //     fileUploadService.upload();
  //     fileUploadService.uploadProgress.listen((_progress) {
  //       progress.value = _progress.toDouble();
  //       print("File upload progress: ${progress.value}%");
  //     });
  //   } //
  //   catch (e) {
  //     print(e);
  //   }
  // }

  ///
}
