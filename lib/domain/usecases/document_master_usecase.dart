

import 'package:cmms/domain/models/documentmaster_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class DocumentMasterUsecase {
  DocumentMasterUsecase(this.repository);
  Repository repository;

  Future<List<DocumentMasterModel>> getDocumentMaster(
      {required bool isLoading, required int? job_type_id}) async {
    return repository.getDocumentMaster(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }


  deleteDocumentMaster(
      {required Object DocumentMaster_id, required bool isLoading}) async =>
      await repository.deleteDocumentMaster(
        DocumentMaster_id,
        isLoading,
      );
  Future<bool> updateDocumentMaster({
    DocumentMasterJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateDocumentMaster(
        isLoading: isLoading,
        DocumentMasterJsonString: DocumentMasterJsonString,
      );

  Future<bool> createDocumentMaster({
    DocumentMasterJsonString,
    bool? isLoading,
  }) async =>
      await repository.createDocumentMaster(
          isLoading: isLoading, DocumentMasterJsonString: DocumentMasterJsonString);

}
