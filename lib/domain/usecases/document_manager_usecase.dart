import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/doc_upload_list_model.dart';

class DocumentManagerUsecase {
  final Repository repository;

  DocumentManagerUsecase(this.repository);

  Future<List<GetDocUploadListModel>> getDocUploadList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return repository.getDocUploadList(
        isLoading: isLoading,
        facility_id: facility_id,
        start_date: start_date,
        end_date: end_date,
        isExport: isExport);
  }

  void clearValue() async => repository.clearData(LocalKeys.docUploadId);
}
