

import 'package:cmms/domain/models/documentmaster_model.dart';
import 'package:cmms/domain/usecases/document_master_usecase.dart';

class DocumentMasterPresenter {
  DocumentMasterPresenter(this.documentMasterUsecase);
  DocumentMasterUsecase documentMasterUsecase;


  Future<List<DocumentMasterModel>> getDocumentMaster({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return documentMasterUsecase.getDocumentMaster(
        isLoading: isLoading, job_type_id: job_type_id);
  }

  Future<bool> createDocumentMaster({
    DocumentMasterJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create Facility type function.");
    documentMasterUsecase.createDocumentMaster(
      DocumentMasterJsonString: DocumentMasterJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteDocumentMaster(String? DocumentMaster_id, {required bool isLoading}) async =>
      await documentMasterUsecase.deleteDocumentMaster(
        DocumentMaster_id: DocumentMaster_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateDocumentMaster(
      {DocumentMasterJsonString, required bool isLoading}) async {
    print("presenter");
    documentMasterUsecase.updateDocumentMaster(
      DocumentMasterJsonString: DocumentMasterJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
