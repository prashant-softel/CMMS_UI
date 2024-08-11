import 'package:cmms/domain/models/doc_upload_list_model.dart';

import '../../domain/usecases/document_manager_usecase.dart';

class DocumentManagerPresenter {
  DocumentManagerPresenter(this.documentManagerUsecase);
  DocumentManagerUsecase documentManagerUsecase;

  Future<List<GetDocUploadListModel>> getDocUploadList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return documentManagerUsecase.getDocUploadList(
        isLoading: isLoading,
        facility_id: facility_id,
        start_date: start_date,
        end_date: end_date,
        isExport: isExport);
  }
    void clearValue() async => documentManagerUsecase.clearValue();
  

}
