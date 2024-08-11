import 'package:cmms/domain/models/documentmaster_model.dart';
import 'package:cmms/domain/usecases/document_upload_usecase.dart';

class DocumentUploadPresenter {
  DocumentUploadPresenter(this.documentUploadUsecase);
  DocumentUploadUsecase documentUploadUsecase;
  Future<List<DocumentMasterModel?>?> getDocumentMaster({
    required bool isLoading,
  }) async {
    return documentUploadUsecase.getDocumentMaster(isLoading: isLoading);
  }

  Future<Map<String, dynamic>?> uploadDocumentNew({
    uploadDocument,
    required bool isLoading,
  }) async {
    return documentUploadUsecase.uploadDocumentNew(
      uploadDocument: uploadDocument,
      isLoading: isLoading,
    );
  }
}
