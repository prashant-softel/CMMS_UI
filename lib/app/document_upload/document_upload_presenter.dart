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
}
