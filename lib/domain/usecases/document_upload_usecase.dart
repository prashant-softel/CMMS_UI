import 'package:cmms/domain/models/documentmaster_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class DocumentUploadUsecase {
  DocumentUploadUsecase(this.repository);
  Repository repository;

  Future<List<DocumentMasterModel?>?> getDocumentMaster({
    bool isLoading = true,
  }) async =>
      await repository.getDocumentMaster(
        isLoading: isLoading,
      );
}
