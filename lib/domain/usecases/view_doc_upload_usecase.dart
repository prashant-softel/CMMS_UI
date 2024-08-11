import 'package:cmms/domain/models/view_doc_upload.dart';
import 'package:cmms/domain/models/water_data_month.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ViewDocUploadUsecase {
  Repository repository;

  ViewDocUploadUsecase(this.repository);

  void saveValue({String? docUploadId}) async =>
      repository.saveValue(LocalKeys.docUploadId, docUploadId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.docUploadId);
  void clearValue() async => repository.clearData(LocalKeys.docUploadId);
  Future<List<ViewDocUpload?>?> getDocuementListById({
    String? start_date,
    required String end_date,
    required int docUploadId,
    required int facilityID,
    bool? isLoading,
  }) async =>
      await repository.getDocuementListById(
        start_date: start_date,
        end_date: end_date,
        docUploadId: docUploadId,
        facilityID: facilityID,
        isLoading: isLoading ?? false,
      );
}
